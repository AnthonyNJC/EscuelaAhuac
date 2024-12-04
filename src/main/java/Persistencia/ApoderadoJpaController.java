/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Persistencia;

import Logica.Apoderado;
import java.io.Serializable;
import javax.persistence.Query;
import javax.persistence.EntityNotFoundException;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import Logica.Estudiante;
import Persistencia.exceptions.NonexistentEntityException;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

/**
 *
 * @author Yo
 */
public class ApoderadoJpaController implements Serializable {

    public ApoderadoJpaController(EntityManagerFactory emf) {
        this.emf = emf;
    }
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }
    public ApoderadoJpaController(){
        emf=Persistence.createEntityManagerFactory("Proyecto_EscuelaAhuac_PU");
    }

    public void create(Apoderado apoderado) {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            Estudiante estudiante = apoderado.getEstudiante();
            if (estudiante != null) {
                estudiante = em.getReference(estudiante.getClass(), estudiante.getId());
                apoderado.setEstudiante(estudiante);
            }
            em.persist(apoderado);
            if (estudiante != null) {
                Apoderado oldApoderadoOfEstudiante = estudiante.getApoderado();
                if (oldApoderadoOfEstudiante != null) {
                    oldApoderadoOfEstudiante.setEstudiante(null);
                    oldApoderadoOfEstudiante = em.merge(oldApoderadoOfEstudiante);
                }
                estudiante.setApoderado(apoderado);
                estudiante = em.merge(estudiante);
            }
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(Apoderado apoderado) throws NonexistentEntityException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            Apoderado persistentApoderado = em.find(Apoderado.class, apoderado.getId());
            Estudiante estudianteOld = persistentApoderado.getEstudiante();
            Estudiante estudianteNew = apoderado.getEstudiante();
            if (estudianteNew != null) {
                estudianteNew = em.getReference(estudianteNew.getClass(), estudianteNew.getId());
                apoderado.setEstudiante(estudianteNew);
            }
            apoderado = em.merge(apoderado);
            if (estudianteOld != null && !estudianteOld.equals(estudianteNew)) {
                estudianteOld.setApoderado(null);
                estudianteOld = em.merge(estudianteOld);
            }
            if (estudianteNew != null && !estudianteNew.equals(estudianteOld)) {
                Apoderado oldApoderadoOfEstudiante = estudianteNew.getApoderado();
                if (oldApoderadoOfEstudiante != null) {
                    oldApoderadoOfEstudiante.setEstudiante(null);
                    oldApoderadoOfEstudiante = em.merge(oldApoderadoOfEstudiante);
                }
                estudianteNew.setApoderado(apoderado);
                estudianteNew = em.merge(estudianteNew);
            }
            em.getTransaction().commit();
        } catch (Exception ex) {
            String msg = ex.getLocalizedMessage();
            if (msg == null || msg.length() == 0) {
                int id = apoderado.getId();
                if (findApoderado(id) == null) {
                    throw new NonexistentEntityException("The apoderado with id " + id + " no longer exists.");
                }
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void destroy(int id) throws NonexistentEntityException {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            Apoderado apoderado;
            try {
                apoderado = em.getReference(Apoderado.class, id);
                apoderado.getId();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The apoderado with id " + id + " no longer exists.", enfe);
            }
            Estudiante estudiante = apoderado.getEstudiante();
            if (estudiante != null) {
                estudiante.setApoderado(null);
                estudiante = em.merge(estudiante);
            }
            em.remove(apoderado);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public List<Apoderado> findApoderadoEntities() {
        return findApoderadoEntities(true, -1, -1);
    }

    public List<Apoderado> findApoderadoEntities(int maxResults, int firstResult) {
        return findApoderadoEntities(false, maxResults, firstResult);
    }

    private List<Apoderado> findApoderadoEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(Apoderado.class));
            Query q = em.createQuery(cq);
            if (!all) {
                q.setMaxResults(maxResults);
                q.setFirstResult(firstResult);
            }
            return q.getResultList();
        } finally {
            em.close();
        }
    }

    public Apoderado findApoderado(int id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(Apoderado.class, id);
        } finally {
            em.close();
        }
    }

    public int getApoderadoCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<Apoderado> rt = cq.from(Apoderado.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
}

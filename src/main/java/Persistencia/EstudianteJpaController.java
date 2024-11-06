/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Persistencia;

import java.io.Serializable;
import javax.persistence.Query;
import javax.persistence.EntityNotFoundException;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import Logica.Apoderado;
import Logica.Estudiante;
import Persistencia.exceptions.NonexistentEntityException;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

/**
 *
 * @author VR_LISA
 */
public class EstudianteJpaController implements Serializable {

    public EstudianteJpaController(EntityManagerFactory emf) {
        this.emf = emf;
    }
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }
    public EstudianteJpaController() {
        emf=Persistence.createEntityManagerFactory("Proyecto_EscuelaAhuac_PU");
    }

    public void create(Estudiante estudiante) {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            Apoderado apoderado = estudiante.getApoderado();
            if (apoderado != null) {
                apoderado = em.getReference(apoderado.getClass(), apoderado.getId());
                estudiante.setApoderado(apoderado);
            }
            em.persist(estudiante);
            if (apoderado != null) {
                Estudiante oldEstudianteOfApoderado = apoderado.getEstudiante();
                if (oldEstudianteOfApoderado != null) {
                    oldEstudianteOfApoderado.setApoderado(null);
                    oldEstudianteOfApoderado = em.merge(oldEstudianteOfApoderado);
                }
                apoderado.setEstudiante(estudiante);
                apoderado = em.merge(apoderado);
            }
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(Estudiante estudiante) throws NonexistentEntityException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            Estudiante persistentEstudiante = em.find(Estudiante.class, estudiante.getId());
            Apoderado apoderadoOld = persistentEstudiante.getApoderado();
            Apoderado apoderadoNew = estudiante.getApoderado();
            if (apoderadoNew != null) {
                apoderadoNew = em.getReference(apoderadoNew.getClass(), apoderadoNew.getId());
                estudiante.setApoderado(apoderadoNew);
            }
            estudiante = em.merge(estudiante);
            if (apoderadoOld != null && !apoderadoOld.equals(apoderadoNew)) {
                apoderadoOld.setEstudiante(null);
                apoderadoOld = em.merge(apoderadoOld);
            }
            if (apoderadoNew != null && !apoderadoNew.equals(apoderadoOld)) {
                Estudiante oldEstudianteOfApoderado = apoderadoNew.getEstudiante();
                if (oldEstudianteOfApoderado != null) {
                    oldEstudianteOfApoderado.setApoderado(null);
                    oldEstudianteOfApoderado = em.merge(oldEstudianteOfApoderado);
                }
                apoderadoNew.setEstudiante(estudiante);
                apoderadoNew = em.merge(apoderadoNew);
            }
            em.getTransaction().commit();
        } catch (Exception ex) {
            String msg = ex.getLocalizedMessage();
            if (msg == null || msg.length() == 0) {
                int id = estudiante.getId();
                if (findEstudiante(id) == null) {
                    throw new NonexistentEntityException("The estudiante with id " + id + " no longer exists.");
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
            Estudiante estudiante;
            try {
                estudiante = em.getReference(Estudiante.class, id);
                estudiante.getId();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The estudiante with id " + id + " no longer exists.", enfe);
            }
            Apoderado apoderado = estudiante.getApoderado();
            if (apoderado != null) {
                apoderado.setEstudiante(null);
                apoderado = em.merge(apoderado);
            }
            em.remove(estudiante);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public List<Estudiante> findEstudianteEntities() {
        return findEstudianteEntities(true, -1, -1);
    }

    public List<Estudiante> findEstudianteEntities(int maxResults, int firstResult) {
        return findEstudianteEntities(false, maxResults, firstResult);
    }

    private List<Estudiante> findEstudianteEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(Estudiante.class));
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

    public Estudiante findEstudiante(int id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(Estudiante.class, id);
        } finally {
            em.close();
        }
    }

    public int getEstudianteCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<Estudiante> rt = cq.from(Estudiante.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
}

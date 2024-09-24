/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Persistencia;

import Logica.Docente;
import java.io.Serializable;
import javax.persistence.Query;
import javax.persistence.EntityNotFoundException;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import Logica.Usuario;
import Logica.Grado;
import Persistencia.exceptions.NonexistentEntityException;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

/**
 *
 * @author VR_LISA
 */
public class DocenteJpaController implements Serializable {

    public DocenteJpaController(EntityManagerFactory emf) {
        this.emf = emf;
    }
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }
    public DocenteJpaController() {
        emf=Persistence.createEntityManagerFactory("Proyecto_EscuelaAhuac_PU");
    }

    public void create(Docente docente) {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            Usuario usuario = docente.getUsuario();
            if (usuario != null) {
                usuario = em.getReference(usuario.getClass(), usuario.getIdUsuario());
                docente.setUsuario(usuario);
            }
            Grado grado = docente.getGrado();
            if (grado != null) {
                grado = em.getReference(grado.getClass(), grado.getIdGrado());
                docente.setGrado(grado);
            }
            em.persist(docente);
            if (usuario != null) {
                Docente oldDocenteOfUsuario = usuario.getDocente();
                if (oldDocenteOfUsuario != null) {
                    oldDocenteOfUsuario.setUsuario(null);
                    oldDocenteOfUsuario = em.merge(oldDocenteOfUsuario);
                }
                usuario.setDocente(docente);
                usuario = em.merge(usuario);
            }
            if (grado != null) {
                Docente oldDocenteOfGrado = grado.getDocente();
                if (oldDocenteOfGrado != null) {
                    oldDocenteOfGrado.setGrado(null);
                    oldDocenteOfGrado = em.merge(oldDocenteOfGrado);
                }
                grado.setDocente(docente);
                grado = em.merge(grado);
            }
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(Docente docente) throws NonexistentEntityException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            Docente persistentDocente = em.find(Docente.class, docente.getId());
            Usuario usuarioOld = persistentDocente.getUsuario();
            Usuario usuarioNew = docente.getUsuario();
            Grado gradoOld = persistentDocente.getGrado();
            Grado gradoNew = docente.getGrado();
            if (usuarioNew != null) {
                usuarioNew = em.getReference(usuarioNew.getClass(), usuarioNew.getIdUsuario());
                docente.setUsuario(usuarioNew);
            }
            if (gradoNew != null) {
                gradoNew = em.getReference(gradoNew.getClass(), gradoNew.getIdGrado());
                docente.setGrado(gradoNew);
            }
            docente = em.merge(docente);
            if (usuarioOld != null && !usuarioOld.equals(usuarioNew)) {
                usuarioOld.setDocente(null);
                usuarioOld = em.merge(usuarioOld);
            }
            if (usuarioNew != null && !usuarioNew.equals(usuarioOld)) {
                Docente oldDocenteOfUsuario = usuarioNew.getDocente();
                if (oldDocenteOfUsuario != null) {
                    oldDocenteOfUsuario.setUsuario(null);
                    oldDocenteOfUsuario = em.merge(oldDocenteOfUsuario);
                }
                usuarioNew.setDocente(docente);
                usuarioNew = em.merge(usuarioNew);
            }
            if (gradoOld != null && !gradoOld.equals(gradoNew)) {
                gradoOld.setDocente(null);
                gradoOld = em.merge(gradoOld);
            }
            if (gradoNew != null && !gradoNew.equals(gradoOld)) {
                Docente oldDocenteOfGrado = gradoNew.getDocente();
                if (oldDocenteOfGrado != null) {
                    oldDocenteOfGrado.setGrado(null);
                    oldDocenteOfGrado = em.merge(oldDocenteOfGrado);
                }
                gradoNew.setDocente(docente);
                gradoNew = em.merge(gradoNew);
            }
            em.getTransaction().commit();
        } catch (Exception ex) {
            String msg = ex.getLocalizedMessage();
            if (msg == null || msg.length() == 0) {
                int id = docente.getId();
                if (findDocente(id) == null) {
                    throw new NonexistentEntityException("The docente with id " + id + " no longer exists.");
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
            Docente docente;
            try {
                docente = em.getReference(Docente.class, id);
                docente.getId();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The docente with id " + id + " no longer exists.", enfe);
            }
            Usuario usuario = docente.getUsuario();
            if (usuario != null) {
                usuario.setDocente(null);
                usuario = em.merge(usuario);
            }
            Grado grado = docente.getGrado();
            if (grado != null) {
                grado.setDocente(null);
                grado = em.merge(grado);
            }
            em.remove(docente);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public List<Docente> findDocenteEntities() {
        return findDocenteEntities(true, -1, -1);
    }

    public List<Docente> findDocenteEntities(int maxResults, int firstResult) {
        return findDocenteEntities(false, maxResults, firstResult);
    }

    private List<Docente> findDocenteEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(Docente.class));
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

    public Docente findDocente(int id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(Docente.class, id);
        } finally {
            em.close();
        }
    }

    public int getDocenteCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<Docente> rt = cq.from(Docente.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
}

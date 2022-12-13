package com.example.macnss.services;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.Persistence;

import java.util.function.Consumer;

public class JpaService {
    private static EntityManagerFactory emf;

    static {
        if (emf == null)
            emf = Persistence.createEntityManagerFactory("default");
    }

    public static EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public static void executeInsideTransaction(Consumer<EntityManager> action) {
        EntityManager em = getEntityManager();
        EntityTransaction tx = em.getTransaction();

        tx.begin();
        boolean ok = false;
        try {
            action.accept(em);
            ok = true;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ok)
                tx.commit();
            else
                tx.rollback();
        }
    }
}
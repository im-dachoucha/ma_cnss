package com.example.macnss.dao;

import com.example.macnss.entities.Agent;
import com.example.macnss.services.JpaService;
import jakarta.persistence.EntityManager;

import java.util.List;

public class Dao<T> {

    private Class<?> type;
    private EntityManager em = JpaService.getEntityManager();

    public Dao(Class<?> clazz){
        this.type = clazz;
    }

    public void setType(Class<?> type){
        this.type = type;
    }

    public T get(long id){
        return (T) em.find(type, id);
    }

    public List<T> getAll(){
        return em.createQuery("select e from " + type.getSimpleName() + " e ").getResultList();
    }
}

package com.example.macnss.entities;


import jakarta.persistence.*;

import java.util.Collection;

@Entity
@Table(name = "patient")
public class Patient {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private long id;

    @Column(name = "fullname")
    private String fullname;

    @Column(name = "cin", unique = true)
    private String cin;

    @Column(name = "email", unique = true)
    private String email;

    @OneToMany(mappedBy = "patient")
    private Collection<MedicalFile> medicalFiles;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getCin() {
        return cin;
    }

    public void setCin(String cin) {
        this.cin = cin;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Collection<MedicalFile> getMedicalFiles() {
        return medicalFiles;
    }

    public void setMedicalFiles(Collection<MedicalFile> medicalFiles) {
        this.medicalFiles = medicalFiles;
    }

    //    todo conjoints/enfants
}
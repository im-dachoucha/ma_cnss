package com.example.macnss.entities;

import jakarta.persistence.*;

import java.util.Collection;

@Entity
@Table(name = "medication")
public class Medication {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @Column(name = "entitled")
    private String entitled;

    @Column(name = "public_price")
    private double publicPrice;

    @Column(name = "repayment_price")
    private double repaymentPrice;

    @ManyToMany(mappedBy = "medications")
    private Collection<MedicalFile> medicalFiles;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getEntitled() {
        return entitled;
    }

    public void setEntitled(String entitled) {
        this.entitled = entitled;
    }

    public double getPublicPrice() {
        return publicPrice;
    }

    public void setPublicPrice(double publicPrice) {
        this.publicPrice = publicPrice;
    }

    public double getRepaymentPrice() {
        return repaymentPrice;
    }

    public void setRepaymentPrice(double repaymentPrice) {
        this.repaymentPrice = repaymentPrice;
    }

    public Collection<MedicalFile> getMedicalFiles() {
        return medicalFiles;
    }

    public void setMedicalFiles(Collection<MedicalFile> medicalFiles) {
        this.medicalFiles = medicalFiles;
    }
}
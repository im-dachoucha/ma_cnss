package com.example.macnss.entities;

import jakarta.persistence.*;

@Entity
@Table(name = "attachment")
public class Attachment {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private long id;

    private String type;

    @Column(name = "medical_file_id", insertable = false, updatable = false)
    private Long medicalFileId;

    private double price;

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    @ManyToOne
    @JoinColumn(name = "medical_file_id")
    private MedicalFile medicalFile;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public Long getMedicalFileId() {
        return medicalFileId;
    }

    public void setMedicalFileId(Long medicalFileId) {
        this.medicalFileId = medicalFileId;
    }

    public MedicalFile getMedicalFile() {
        return medicalFile;
    }

    public void setMedicalFile(MedicalFile medicalFile) {
        this.medicalFile = medicalFile;
    }
}

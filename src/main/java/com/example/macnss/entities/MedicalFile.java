package com.example.macnss.entities;

import jakarta.persistence.*;

import java.util.Collection;
import java.util.Date;

@Entity
@Table(name = "medical_file")
public class MedicalFile {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @Column(name = "created_at")
    private Date createdAt;

    @Column(name = "patient_id")
    private long patientId;

    @ManyToOne
    @JoinColumn(name = "patient_id", insertable = false, updatable = false)
    private Patient patient;

    @ManyToMany
    @JoinTable(
            name = "prescription",
            joinColumns = {@JoinColumn(name = "medical_file_id")},
            inverseJoinColumns = {@JoinColumn(name = "medication_id")}
    )
    private Collection<Medication> medications;

    @OneToMany(mappedBy = "medicalFile")
    private Collection<Attachment> attachments;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }

    public long getPatientId() {
        return patientId;
    }

    public void setPatientId(long patientId) {
        this.patientId = patientId;
    }

    public Patient getPatient() {
        return patient;
    }

    public void setPatient(Patient patient) {
        this.patient = patient;
    }

    public Collection<Medication> getMedications() {
        return medications;
    }

    public void setMedications(Collection<Medication> medications) {
        this.medications = medications;
    }

    public Collection<Attachment> getAttachments() {
        return attachments;
    }

    public void setAttachments(Collection<Attachment> attachments) {
        this.attachments = attachments;
    }
}

package com.example.macnss.controllers;

import com.example.macnss.dao.Dao;
import com.example.macnss.entities.Attachment;
import com.example.macnss.entities.MedicalFile;
import com.example.macnss.entities.Medication;
import com.example.macnss.services.JpaService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ConcurrentModel;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.time.Instant;
import java.util.ArrayList;
import java.util.Date;

@Controller
public class MedicalFileController {

//    private HttpSession session;
//
//    @Autowired
//    public MedicalFileController(HttpSession session) {
//        this.session = session;
//    }

    @PostMapping("/medical_file/add")
    public String add(@RequestParam("patient_id") long patientId,
                            @RequestParam("medication") long medicationId,
                            @RequestParam("attachment") String attachmentType,
                            @RequestParam("attachment_price") double attachmentPrice){
        MedicalFile medicalFile = new MedicalFile();

        medicalFile.setCreatedAt(Date.from(Instant.now()));
        medicalFile.setPatientId(patientId);
        medicalFile.setStatus("pending");

        Dao<Medication> medicationDao = new Dao<>(Medication.class);
        ArrayList<Medication> medications = new ArrayList<Medication>();
        medications.add(medicationDao.get(medicationId));
        medicalFile.setMedications(medications);

        Dao<Attachment> attachmentDao = new Dao<>(Attachment.class);
        Attachment attachment = new Attachment();
        attachment.setType(attachmentType);
        attachment.setPrice(attachmentPrice);
        JpaService.executeInsideTransaction(em -> em.persist(attachment));

        ArrayList<Attachment> attachments = new ArrayList<>();
        attachments.add(attachment);
        medicalFile.setAttachments(attachments);

        JpaService.executeInsideTransaction(em -> em.persist(medicalFile));

        attachment.setMedicalFile(medicalFile);
        JpaService.executeInsideTransaction(em -> em.merge(attachment));

        return "redirect:/agent";
    }

    @PostMapping("/medical_file/change_status")
    public String changeStatus(
            @RequestParam("med_file_id") long medFileId,
            @RequestParam("status") String status
    ){
        Dao<MedicalFile> medicalFileDao = new Dao<>(MedicalFile.class);
        MedicalFile medicalFile = medicalFileDao.get(medFileId);
        medicalFile.setStatus(status);
        JpaService.executeInsideTransaction(em -> em.merge(medicalFile));
        System.out.println(medFileId);
        System.out.println(status);
        return "redirect:/agent";
    }
}

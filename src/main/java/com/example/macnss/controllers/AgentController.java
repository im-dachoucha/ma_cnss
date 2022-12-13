package com.example.macnss.controllers;

import com.example.macnss.Security.BCrypt;
import com.example.macnss.dao.Dao;
import com.example.macnss.entities.Agent;
import com.example.macnss.entities.MedicalFile;
import com.example.macnss.entities.Medication;
import com.example.macnss.entities.Patient;
import com.example.macnss.services.JpaService;
import com.google.gson.Gson;
import jakarta.persistence.EntityManager;
import jakarta.persistence.Query;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;


@Controller
public class AgentController {

    private HttpSession session;

    @Autowired
    public AgentController(HttpSession session) {
        this.session = session;
    }

    @GetMapping("/agent/login")
    public String login() {
        if (session.getAttribute("agent") != null)
            return "redirect:/agent";

        return "/agent/login";
    }

    @PostMapping("/agent/login")
    public String login(@RequestParam("email") String email, @RequestParam("password") String password) {
        try {
            EntityManager em = JpaService.getEntityManager();
            Query query = em.createNamedQuery("agent.by.email", Agent.class);
            query.setParameter("email", email);

            Agent agent = (Agent) query.getSingleResult();

            if (agent == null)
                return "redirect:/agent/login";

            if (!BCrypt.checkpw(password, agent.getPassword()))
                return "redirect:/agent/login";

            session.setAttribute("agent", agent);
            return "redirect:/agent";
        } catch (Exception e) {
            e.printStackTrace();
            return "redirect:/agent/login";
        }
    }

    @GetMapping("/agent")
    public ModelAndView home() {
        if (session.getAttribute("agent") == null)
            return new ModelAndView("redirect:/agent/login");

        Dao<Medication> medicationDao = new Dao<Medication>(Medication.class);

        List<Medication> medications = medicationDao.getAll();
        medications.forEach(med -> med.setMedicalFiles(null));

        Gson gson = new Gson();

        String meds = gson.toJson(medications);
//        new GsonBuilder().create().toJson(medications);

        ModelAndView mav = new ModelAndView();

        mav.addObject("medications", meds);

        Dao<MedicalFile> medicalFileDao = new Dao<>(MedicalFile.class);
        List<MedicalFile> medicalFiles = medicalFileDao.getAll();
        mav.addObject("medicalFiles", medicalFiles);

        mav.setViewName("/agent/home");

        return mav;
    }
}

package pl.coderslab.charity.controller;

import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.coderslab.charity.entity.Category;
import pl.coderslab.charity.entity.Donation;
import pl.coderslab.charity.entity.Institution;
import pl.coderslab.charity.repository.CategoryRepository;
import pl.coderslab.charity.repository.DonationRepository;
import pl.coderslab.charity.repository.InstitutionRepository;

import java.util.List;


@Controller
@AllArgsConstructor
public class DonationController {

    private final CategoryRepository categoryRepository;
    private final InstitutionRepository institutionRepository;
    private final DonationRepository donationRepository;

    @ModelAttribute("categories")
    public List<Category> categories(){
        return categoryRepository.findAll();
    }

    @ModelAttribute("institutions")
    public List<Institution> institutions(){
        return institutionRepository.findAll();
    }

    @GetMapping("/donate")
    public String donationForm(Model model) {
        model.addAttribute("donation", new Donation());
        return "donationForm";
    }

    @GetMapping("/donateComplete")
    public String donateComplete(){
        return "donationComplete";
    }

    @PostMapping("/donate")
    public String donationFormHandle(@ModelAttribute("donation") Donation donation){
        donation.setFulfilled(1);
        donationRepository.save(donation);
        return "redirect:/donateComplete";
    }
}
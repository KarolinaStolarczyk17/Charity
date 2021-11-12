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
import pl.coderslab.charity.service.CategoryService;
import pl.coderslab.charity.service.DonationService;
import pl.coderslab.charity.service.InstitutionService;

import java.util.List;


@Controller
@AllArgsConstructor
public class DonationController {

    public final DonationService donationService;
    public final CategoryService categoryService;
    public final InstitutionService institutionService;


    @ModelAttribute("categories")
    public List<Category> categories(){

        return categoryService.getCategories();
    }

    @ModelAttribute("institutions")
    public List<Institution> institutions(){
        return institutionService.getInstitutions();
    }

    @GetMapping("/donate")
    public String donationForm(Model model) {
        model.addAttribute("donation", new Donation());
        return "donationForm";
    }
//
//    @GetMapping("/donateComplete")
//    public String donateComplete(){
//        return "donationComplete";
//    }
//
//    @PostMapping("/donate")
//    public String donationFormHandle(@ModelAttribute("donation") Donation donation){
//        donation.setFulfilled(1);
//        donationService.save(donation);
//        return "redirect:/donateComplete";
//    }

    @PostMapping("/donation")
    public String saveDonation(Donation donation) {
        donationService.addDonations(donation);
        return "redirect:/";
    }
}
package pl.coderslab.charity.controller;

import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.coderslab.charity.service.DonationService;
import pl.coderslab.charity.service.InstitutionService;


//@Controller
//public class HomeController {
//
//
//    @RequestMapping("/")
//    public String homeAction(Model model){
//        return "index";
//    }
//}

@Controller
@AllArgsConstructor
public class HomeController {
    private InstitutionService institutionService;
    private DonationService donationService;

    @RequestMapping("/")
    public String homeAction(Model model){
        model.addAttribute("institutions", institutionService.getInstitutions());
        model.addAttribute("sumOfBags", donationService.sumOfBags());
        model.addAttribute("sumOfDonations", donationService.sumOfDonations());
        return "index";
    }

}

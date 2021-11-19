package pl.coderslab.charity.controller;

import lombok.AllArgsConstructor;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import pl.coderslab.charity.entity.ChangePassword;
import pl.coderslab.charity.entity.Donation;
import pl.coderslab.charity.entity.User;
import pl.coderslab.charity.repository.DonationRepository;
import pl.coderslab.charity.repository.UserRepository;
import pl.coderslab.charity.service.UserService;

@Controller
@AllArgsConstructor
public class UserController {

    private UserService userService;
    private UserRepository userRepository;
    private DonationRepository donationRepository;

    @GetMapping("/register")
    private String registerUser(Model model) {
        User user = new User();
        model.addAttribute("user", user);
        return "register";
    }

    @PostMapping("/register")
    private String registerUserHandle(@ModelAttribute User user) {
        userService.saveUser(user);
        return "redirect:/login";
    }

    @GetMapping("/login")
    public String login(Model model) {
        model.addAttribute("user", new User());
        return "login";
    }

    @PostMapping("/login")
    public String loginHandle() {
        return "redirect:/profile";
    }

    @GetMapping("/profile")
    public String showProfile(Model model) {
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String login = ((UserDetails)principal).getUsername();
        model.addAttribute("user", userService.findByLogin(login));

        String username;
        if (principal instanceof UserDetails) {
            username = ((UserDetails)principal).getUsername();
        } else {
            username = principal.toString();
        }
        User loggedUser = userRepository.findByLogin(username);
        model.addAttribute("donations", donationRepository.selectAllByUserId(loggedUser.getId()));
        model.addAttribute("donation", new Donation());
        return "userProfile";
    }

    @GetMapping("/profile/editInfo")
    public String editUserInfo(Model model) {
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String login;
        if (principal instanceof UserDetails) {
            login = ((UserDetails)principal).getUsername();
        } else {
            login = principal.toString();
        }
        model.addAttribute("user", userService.findByLogin(login));
        return "userProfileUpdate";
    }

    @PostMapping("/profile/editInfo")
    public String handleUserInfo(@ModelAttribute User user) {
        userRepository.save(user);
        return "redirect:/profile";
    }

    @GetMapping("/profile/editPassword")
    public String editPassword(Model model) {
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String login;
        if (principal instanceof UserDetails) {
            login = ((UserDetails)principal).getUsername();
        } else {
            login = principal.toString();
        }
        model.addAttribute("user", userService.findByLogin(login));
        model.addAttribute("editPassword", new ChangePassword());
        return "userProfileUpdatePassword";
    }

    @PostMapping("/profile/editPassword")
    public String handleEditPassword(@ModelAttribute ChangePassword changePassword, @ModelAttribute User user) {

        if (!changePassword.getPassword().equals(changePassword.getRePassword())) {
            System.out.println("Trace 1");
            return "redirect:/profile/editPassword";
        }
        if (!changePassword.getPassword().equals(user.getPassword())) {
            System.out.println("Trace 2");
            return "redirect:/profile/editPassword";
        }

        user.setPassword(changePassword.getPassword());
        userService.saveUser(user);
        return "redirect:/profile";
    }

    @GetMapping("/profile/donation/{id}")
    private String switchFulfill(@PathVariable long id){
        Donation toSave = donationRepository.findById(id).get();
        if (toSave.getFulfilled() == 0) {
            toSave.setFulfilled(1);
        } else {
            toSave.setFulfilled(0);
        }
        donationRepository.save(toSave);
        return "redirect:/profile";
    }
}

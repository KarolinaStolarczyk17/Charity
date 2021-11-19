package pl.coderslab.charity.controller;

import lombok.AllArgsConstructor;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.charity.entity.Institution;
import pl.coderslab.charity.entity.User;
import pl.coderslab.charity.repository.InstitutionRepository;
import pl.coderslab.charity.repository.RoleRepository;
import pl.coderslab.charity.repository.UserRepository;
import pl.coderslab.charity.service.DonationService;
import pl.coderslab.charity.service.InstitutionService;
import pl.coderslab.charity.service.UserService;

import java.util.List;


@Controller
@AllArgsConstructor
public class AdminController {

    private UserService userService;
    private InstitutionRepository institutionRepository;
    private UserRepository userRepository;
    private RoleRepository roleRepository;

    @ModelAttribute("institutions")
    public List<Institution> returnAllInstitutions(){
        return institutionRepository.findAll();
    }

    @ModelAttribute("admins")
    public List<User> returnAllAdmins(){
        return userRepository.selectAllAdmins();
    }

    @ModelAttribute("users")
    public List<User> returnAllUsers() { return userRepository.selectAllUsers(); }

//    @GetMapping("/admin/login")
//    public String adminLogin(Model model) {
//        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
//        String login = ((UserDetails)principal).getUsername();
//        model.addAttribute("user", userService.findByLogin(login));
//
//        return "loginAdmin";
//    }
//
//    @PostMapping("/admin/login")
//    public String adminLoginHandle() {
//        return "redirect:/admin/profile";
//    }

    @GetMapping("/admin/profile")
    public String showAdminProfile() {
        return "adminProfile";
    }

    @GetMapping("/admin/listInstitutions")
    public String showListInstitutions(Model model) {
        model.addAttribute("institution", new Institution());
        return "adminListInstitutions";
    }

    @PostMapping("/admin/listInstitutions")
    public String institutionFormHandle(@ModelAttribute Institution institution) {
        institutionRepository.save(institution);
        return "redirect:/admin/listInstitutions";
    }

    @GetMapping("/admin/editInstitution/{id}")
    public String editInstitution(@PathVariable long id, Model model) {
        model.addAttribute("institution", institutionRepository.findById(id).get());
        return "adminEditInstitution";
    }

    @PostMapping("/admin/updateInstitution")
    public String updateInstitution(@ModelAttribute Institution institution) {
        institutionRepository.save(institution);
        return "redirect:/admin/listInstitutions";
    }

    @GetMapping("/admin/deleteInstitution/{id}")
    private String deleteInstitution(@PathVariable long id) {
        institutionRepository.deleteById(id);
        return "redirect:/admin/listInstitutions";
    }

    @GetMapping("/admin/listAdmins")
    public String showAdmins(Model model) {
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String login = ((UserDetails)principal).getUsername();
        model.addAttribute("userLog", userService.findByLogin(login));
        model.addAttribute("user", new User());
        return "adminListAdmins";
    }

    @PostMapping("/admin/listAdmins")
    public String adminFormHandle(@ModelAttribute User user) {
        userService.saveAdmin(user);
        return "redirect:/admin/listAdmins";
    }

    @GetMapping("/admin/editAdmin/{id}")
    public String editAdmin(@PathVariable long id, Model model) {
        model.addAttribute("user", userRepository.findById(id).get());
        return "adminEditAdmin";
    }

    @PostMapping("/admin/updateAdmin")
    public String updateAdmin(@ModelAttribute User user){
        userRepository.save(user);
        return "redirect:/admin/listAdmins";
    }

    @GetMapping("/admin/deleteAdmin/{id}")
    private String deleteAdmin(@PathVariable long id){
        userRepository.deleteById(id);
        return "redirect:/admin/listAdmins";
    }

    @GetMapping("/admin/listUsers")
    public String showUsers(Model model) {
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String login = ((UserDetails)principal).getUsername();
        model.addAttribute("userLog", userService.findByLogin(login));
        model.addAttribute("user", new User());
        return "adminListUsers";
    }

    @GetMapping("/admin/editUser/{id}")
    public String editUser(@PathVariable long id, Model model) {
        model.addAttribute("user", userRepository.findById(id).get());
        model.addAttribute("roles", roleRepository.findAll());
        return "adminEditUser";
    }

    @PostMapping("/admin/updateUser")
    public String updateUser(@ModelAttribute User user){
        userRepository.save(user);
        return "redirect:/admin/listUsers";
    }

    @GetMapping("/admin/deleteUser/{id}")
    private String deleteUser(@PathVariable long id){
        userRepository.deleteById(id);
        return "redirect:/admin/listUsers";
    }

//    @GetMapping("/admin/blockUser/{id}")
//    private String blockUser(@PathVariable long id){
//        User blocked = userRepository.findById(id).get();
//        if (blocked.getBlocked() == 0) {
//            blocked.setBlocked(1);
//        } else {
//            blocked.setBlocked(0);
//        }
//        userRepository.save(blocked);
//        return "redirect:/admin/listUsers";
//    }
}

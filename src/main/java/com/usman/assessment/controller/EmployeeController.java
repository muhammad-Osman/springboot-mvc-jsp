package com.usman.assessment.controller;

import com.usman.assessment.model.Employee;
import com.usman.assessment.service.EmployeeService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.Optional;

@Controller
public class EmployeeController {

    private final EmployeeService employeeService;

    public EmployeeController(EmployeeService employeeService) {
        this.employeeService = employeeService;
    }

    @GetMapping({"/", "/viewEmployeeList"})
    public String viewEmployeeList(@ModelAttribute("message") String message, Model model) {
        model.addAttribute("employeeList", employeeService.fetchAllEmployees());
        model.addAttribute("message", message);
        return "ViewEmployeeList";
    }

    @GetMapping("/addEmployee")
    public String addEmployee(@ModelAttribute("message") String message, Model model) {
        model.addAttribute("employee", new Employee());
        model.addAttribute("message", message);
        return "AddEmployee";
    }

    @PostMapping("/saveEmployee")
    public String saveEmployee(Employee employee, RedirectAttributes redirectAttributes){
        if(employeeService.saveOrUpdateEmployee(employee)) {
            redirectAttributes.addFlashAttribute("message", "Save Successfully!");
            return "redirect:/viewEmployeeList";
        }

        redirectAttributes.addFlashAttribute("message", "Something went wrong!");
        return "redirect:/addEmployee";
    }

    @GetMapping("/updateEmployee/{id}")
    public String updateEmployee(@PathVariable Long id, Model model) {
        model.addAttribute("employee", employeeService.fetchEmployeeById(id));

        return "EditEmployee";
    }

    @PostMapping("/updateOrSaveEmployee")
    public String updateOrSaveEmployee(Employee employee, RedirectAttributes redirectAttributes){
        if(employeeService.saveOrUpdateEmployee(employee)) {
            redirectAttributes.addFlashAttribute("message", "Updated Successfully!");
            return "redirect:/viewEmployeeList";
        }

        redirectAttributes.addFlashAttribute("message", "Something went wrong!");
        return "redirect:/updateEmployee/" + employee.getId();
    }

    @GetMapping("/deleteEmployee/{id}")
    public String deleteEmployee(@PathVariable Long id, RedirectAttributes redirectAttributes) {
        if(employeeService.deleteEmployee(id)) {
            redirectAttributes.addFlashAttribute("message", "Deleted Successfully!");
        }

        redirectAttributes.addFlashAttribute("message", "Something went wrong!");
        return "redirect:/viewEmployeeList";
    }

}

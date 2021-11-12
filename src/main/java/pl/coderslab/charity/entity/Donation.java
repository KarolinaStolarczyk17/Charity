package pl.coderslab.charity.entity;

import lombok.Getter;
import lombok.Setter;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import javax.validation.constraints.Min;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.List;


@Entity
@Getter
@Setter
public class Donation {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
@Min(1)
    private Integer quantity;
@ManyToMany
    private List<Category> categories;
@ManyToOne
    private Institution institution;

    private String street;
    private String city;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate pickUpDate;

    @DateTimeFormat(pattern = "HH:mm")
    private LocalTime pickUpTime;

    private String pickUpComment;


//    private int Fulfilled;
}
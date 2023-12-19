package com.modern.office.domain;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

import javax.persistence.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "signinsheet")
@Data
@NoArgsConstructor
@Accessors(chain = true)
public class SigninRecord {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="ID")
    private Integer id;

    @Column(name="visitorname")
    private String visitorName;

    @Column(name="datetimein")
    private LocalDateTime dateTimeIn;

    @Column(name="datetimeout")
    private LocalDateTime dateTimeOut;

    @Column(name="signinimage")
    private String signinImage;

    @Column(name="tobeseenby")
    private String toBeSeenBy;
}

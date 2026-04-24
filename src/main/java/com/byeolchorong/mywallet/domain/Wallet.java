package com.byeolchorong.mywallet.domain;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.CreationTimestamp;

import java.time.LocalDate;
import java.time.LocalDateTime;

@Entity
@Getter
@Setter
public class Wallet {
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  
  private Long id;
  private String type;
  private String category;
  private Long amount;
  private String content;
  private LocalDate transactionDate;

  @CreationTimestamp
  @Column(updatable = false)
  private LocalDateTime createdAt;
}

package com.byeolchorong.mywallet.repository;

import com.byeolchorong.mywallet.domain.Wallet;
import org.springframework.data.jpa.repository.JpaRepository;

import java.time.LocalDate;
import java.util.List;

public interface WalletRepository extends JpaRepository<Wallet, Long> {
  List<Wallet> findByTransactionDateBetween(LocalDate start,  LocalDate end);
  List<Wallet> findByCategory(String category);
}

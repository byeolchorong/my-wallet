package com.byeolchorong.mywallet.service;

import com.byeolchorong.mywallet.domain.Wallet;
import com.byeolchorong.mywallet.repository.WalletRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDate;
import java.util.List;

@Service
@Transactional
public class WalletService {

private final WalletRepository walletRepository;

  public WalletService(WalletRepository walletRepository) {
    this.walletRepository = walletRepository;
  }
  
  // 등록
  public Wallet save(Wallet wallet) {
    return walletRepository.save(wallet);
  }
  // 전체 조회
  @Transactional(readOnly = true)
  public List<Wallet> findAll() {
    return walletRepository.findAll();
  }
  
  // ID로 조회
  @Transactional(readOnly = true)
  public Wallet findById(Long id) {
    return walletRepository.findById(id).orElse(null);
  }
  
  // 월별 조회
  @Transactional(readOnly = true)
  public List<Wallet> findByDateRange(LocalDate start, LocalDate end) {
    return walletRepository.findByTransactionDateBetween(start, end);
  }
  
  // 카테고리별 조회
  @Transactional(readOnly = true)
  public List<Wallet> findByCategory(String category) {
    return walletRepository.findByCategory(category);
  }

  // 수정
  public Wallet update(Long id, Wallet wallet) {
    Wallet findWallet = walletRepository.findById(id).orElse(null);
    
    if (findWallet == null) {
      return null;
    }
    
    findWallet.setType(wallet.getType());
    findWallet.setCategory(wallet.getCategory());
    findWallet.setAmount(wallet.getAmount());
    findWallet.setContent(wallet.getContent());
    findWallet.setTransactionDate(wallet.getTransactionDate());
    
    return walletRepository.save(findWallet);
  }

  // 삭제
  public void deleteById(Long id) {
    walletRepository.deleteById(id);
  }
  
}

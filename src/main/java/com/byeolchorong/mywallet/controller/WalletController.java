package com.byeolchorong.mywallet.controller;

import com.byeolchorong.mywallet.domain.Wallet;
import com.byeolchorong.mywallet.service.WalletService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/wallets")
public class WalletController {
  private final WalletService walletService;
  
  public WalletController(WalletService walletService) {
    this.walletService = walletService;
  }
  
  // 목록
  @GetMapping
  public String list(Model model) {
    List<Wallet> wallets = walletService.findAll();
    model.addAttribute("wallets", wallets);
    return "wallets";
  }
  
  // 등록
  @PostMapping
  @ResponseBody
  public Wallet save(@RequestBody Wallet wallet) {
    return walletService.save(wallet);
  }
  @GetMapping("/create")
  public String createForm() {
    return "wallets-create";
  }
  // ID 조회
  @GetMapping("/{id}")
  @ResponseBody
  public Wallet findById(@PathVariable Long id) {
    return walletService.findById(id);
  }
  
  // 수정
  @PutMapping("/{id}")
  @ResponseBody
  public Wallet update(@PathVariable Long id, @RequestBody Wallet wallet) {
    return walletService.update(id, wallet);
  }
  
  // 수정 화면
  @GetMapping("/edit/{id}")
  public String editForm(@PathVariable Long id, Model model) {
    Wallet wallet = walletService.findById(id);
    model.addAttribute("wallet", wallet);
    return "wallets-edit";
  }
  
  // 삭제
  @DeleteMapping("/{id}")
  @ResponseBody
  public void delete(@PathVariable Long id) {
    walletService.deleteById(id);
  }
}

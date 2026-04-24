## My Wallet

## 소개

수입과 지출을 기록하고 관리할 수 있는 가계부 프로젝트입니다.  
Spring MVC 구조(Controller → Service → Repository)의 흐름을 기반으로  
CRUD 기능을 구현하며 데이터 처리 과정을 이해하는 것을 목표로 제작했습니다.

---

## 기술 스택

- Backend: Java 17, Spring Boot
- Database: MySQL
- Frontend: JSP, JavaScript (Fetch API), Bootstrap

---

## 주요 기능

- 가계부 내역 등록
- 가계부 목록 조회
- 가계부 수정
- 가계부 삭제
- 수입 / 지출 구분 관리

---

## API 설계

| 기능 | Method | URL |
|------|------|------|
| 목록 조회 | GET | /wallets |
| 등록 | POST | /wallets |
| 단건 조회 | GET | /wallets/{id} |
| 수정 | PUT | /wallets/{id} |
| 삭제 | DELETE | /wallets/{id} |

※ JSP 기반 화면 이동을 위해 `/wallets/create`, `/wallets/edit/{id}` URL 추가 사용

---

## 핵심 구현 포인트

- Controller → Service → Repository 구조 분리
- RESTful API 설계 적용 (POST / PUT / DELETE)
- Fetch API를 활용한 비동기 요청 처리
- JSON 기반 데이터 통신 (@RequestBody / @ResponseBody)
- Bootstrap을 활용한 UI 구성

---

## 데이터 구조

```java
public class Wallet {
  private Long id;
  private String type; 
  private String category;
  private int amount;
  private String content;
  private LocalDate transactionDate;
  private LocalDateTime createdAt;
}

## DB 구조

```sql
CREATE TABLE wallet (
  id BIGINT AUTO_INCREMENT PRIMARY KEY,
  type VARCHAR(20) NOT NULL,
  category VARCHAR(100),
  amount INT NOT NULL,
  content VARCHAR(255),
  transaction_date DATE NOT NULL,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

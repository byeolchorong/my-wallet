<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>페이지 제목</title>

  <!-- Bootstrap -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<div class="container mt-5">
  <h1 class="mb-4">가계부 등록</h1>
  <!-- 등록 카드 -->
  <div class="card mb-4">
    <div class="card-body">
      <h5 class="card-title">내역 등록</h5>

      <form id="wallet-form" class="row g-3">
        <div class="col-md-2">
          <label class="form-label">타입</label>
          <select id="type" class="form-select">
            <option value="수입">수입</option>
            <option value="지출">지출</option>
          </select>
        </div>

        <div class="col-md-2">
          <label class="form-label">카테고리</label>
          <input type="text" id="category" class="form-control">
        </div>

        <div class="col-md-2">
          <label class="form-label">금액</label>
          <input type="number" id="amount" class="form-control">
        </div>

        <div class="col-md-3">
          <label class="form-label">내용</label>
          <input type="text" id="content" class="form-control">
        </div>

        <div class="col-md-2">
          <label class="form-label">날짜</label>
          <input type="date" id="transactionDate" class="form-control">
        </div>

        <div class="col-md-1 d-flex align-items-end">
          <button type="submit" class="btn btn-primary w-100">등록</button>
        </div>
      </form>
    </div>
  </div>

  <a href="/wallets" class="btn btn-secondary">목록으로</a>

</div>

<script src="/js/wallets.js"></script>

</body>
</html>
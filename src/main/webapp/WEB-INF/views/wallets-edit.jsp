<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>가계부 수정</title>

  <!-- Bootstrap -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container mt-5">

  <h1 class="mb-4">가계부 수정</h1>

  <div class="card">
    <div class="card-body">

      <form id="edit-form" class="row g-3">

        <input type="hidden" id="id" value="${wallet.id}">

        <div class="col-md-2">
          <label class="form-label">타입</label>
          <select id="type" class="form-select">
            <option value="수입" ${wallet.type == '수입' ? 'selected' : ''}>수입</option>
            <option value="지출" ${wallet.type == '지출' ? 'selected' : ''}>지출</option>
          </select>
        </div>

        <div class="col-md-2">
          <label class="form-label">카테고리</label>
          <input type="text" id="category" class="form-control" value="${wallet.category}">
        </div>

        <div class="col-md-2">
          <label class="form-label">금액</label>
          <input type="number" id="amount" class="form-control" value="${wallet.amount}">
        </div>

        <div class="col-md-3">
          <label class="form-label">내용</label>
          <input type="text" id="content" class="form-control" value="${wallet.content}">
        </div>

        <div class="col-md-2">
          <label class="form-label">날짜</label>
          <input type="date" id="transactionDate" class="form-control" value="${wallet.transactionDate}">
        </div>

        <div class="col-md-1 d-flex align-items-end">
          <button type="submit" class="btn btn-warning w-100">수정</button>
        </div>

      </form>

      <div class="mt-3">
        <a href="/wallets" class="btn btn-secondary">목록으로</a>
      </div>

    </div>
  </div>

</div>

<script src="/js/wallets.js"></script>

</body>
</html>
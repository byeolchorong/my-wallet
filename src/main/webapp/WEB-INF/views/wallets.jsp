<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>가계부</title>

  <!-- Bootstrap -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container mt-5">

  <h1 class="mb-4">가계부</h1>
  <a href="/wallets/create" class="btn btn-primary mb-3">등록</a>
  <!-- 목록 -->
  <div class="card">
    <div class="card-body">
      <h5 class="card-title">가계부 목록</h5>

      <table class="table table-bordered table-hover text-center align-middle">
        <thead class="table-dark">
        <tr>
          <th>번호</th>
          <th>타입</th>
          <th>카테고리</th>
          <th>금액</th>
          <th>내용</th>
          <th>날짜</th>
          <th>수정</th>
          <th>삭제</th>
        </tr>
        </thead>

        <tbody>
        <c:forEach var="wallet" items="${wallets}" varStatus="status">
          <tr>
            <td>${status.index + 1}</td>
            <td>${wallet.type}</td>
            <td>${wallet.category}</td>
            <td>${wallet.amount}</td>
            <td>${wallet.content}</td>
            <td>${wallet.transactionDate}</td>
            <td>
              <a href="/wallets/edit/${wallet.id}" class="btn btn-warning btn-sm">수정</a>
            </td>
            <td>
              <button class="btn btn-danger btn-sm"
                      onclick="deleteWallet(${wallet.id})">
                삭제
              </button>
            </td>
          </tr>
        </c:forEach>
        </tbody>
      </table>

    </div>
  </div>

</div>

<script src="/js/wallets.js"></script>

</body>
</html>
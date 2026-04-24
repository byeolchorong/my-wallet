const walletForm = document.getElementById('wallet-form');

if (walletForm !== null) {
  walletForm.addEventListener('submit', function (event) {
    event.preventDefault();

    const type = document.getElementById('type').value;
    const category = document.getElementById('category').value;
    const amount = document.getElementById('amount').value;
    const content = document.getElementById('content').value;
    const transactionDate = document.getElementById('transactionDate').value;

    fetch('/wallets', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify({
        type: type,
        category: category,
        amount: Number(amount),
        content: content,
        transactionDate: transactionDate
      })
    })
      .then(response => {
        if (!response.ok) {
          throw new Error('가계부 등록 실패');
        }
        return response.json();
      })
      .then(data => {
        location.href = '/wallets';
      })
      .catch(error => {
        alert('가계부 등록 중 오류가 발생했습니다.');
      });
  });
}

function deleteWallet(id) {
  if (!confirm('정말 삭제할까요?')) {
    return;
  }

  fetch('/wallets/' + id, {
    method: 'DELETE'
  })
    .then(response => {
      if (!response.ok) {
        throw new Error('가계부 삭제 실패');
      }

      location.reload();
    })
    .catch(error => {
      alert('가계부 삭제 중 오류가 발생했습니다.');
    });
}

const editForm = document.getElementById('edit-form');

if (editForm !== null) {
  editForm.addEventListener('submit', function (event) {
    event.preventDefault();

    const id = document.getElementById('id').value;
    const type = document.getElementById('type').value;
    const category = document.getElementById('category').value;
    const amount = document.getElementById('amount').value;
    const content = document.getElementById('content').value;
    const transactionDate = document.getElementById('transactionDate').value;

    fetch('/wallets/' + id, {
      method: 'PUT',
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify({
        type: type,
        category: category,
        amount: Number(amount),
        content: content,
        transactionDate: transactionDate
      })
    })
      .then(response => {
        if (!response.ok) {
          throw new Error('수정 실패');
        }
        return response.json();
      })
      .then(data => {
        alert('수정 완료');
        location.href = '/wallets';
      })
      .catch(error => {
        alert('수정 중 오류 발생');
      });
  });
}
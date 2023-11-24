document.addEventListener("DOMContentLoaded", function() {
  const startDateField = document.getElementById('start_date');
  const endDateField = document.getElementById('end_date');
  const totalPriceDiv = document.getElementById('total-price');
  const pricePerDay = startDateField.dataset.pricePerDay;

  function updateTotalPrice() {
    const startDate = new Date(startDateField.value);
    const endDate = new Date(endDateField.value);
    const timeDiff = endDate - startDate;
    const days = timeDiff / (1000 * 3600 * 24);
    if (days > 0) {
      const totalPrice = days * pricePerDay;
      totalPriceDiv.innerHTML = `${totalPrice.toFixed(2)} €`;
    }
  }

  startDateField.addEventListener('change', updateTotalPrice);
  endDateField.addEventListener('change', updateTotalPrice);
});

window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    console.log(inputValue);
    const feeRate = 0.1;
    const feeAmount = Math.floor(inputValue * feeRate);
    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = ` ${feeAmount} `;
    const profitDom = document.getElementById("profit");
    const profit = inputValue - feeAmount;
  });
});

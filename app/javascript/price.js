window.addEventListener('turbo:load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const tax = Math.floor(inputValue * 0.1);
    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = tax;
    const profit = Math.floor(inputValue - tax);
    const profitAmount = document.getElementById("profit");
    profitAmount.innerHTML = profit;
    console.log(priceInput);
  });
});
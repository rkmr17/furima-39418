const price_calculation = () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price")
    addTaxDom.innerHTML = Math.floor(inputValue / 10)
    const profitDom = document.getElementById("profit")
    profitDom.innerHTML = Math.ceil(inputValue - (inputValue / 10) )
  })
}

window.addEventListener("turbo:load", price_calculation);
window.addEventListener("turbo:render", price_calculation);
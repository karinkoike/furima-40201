const price = () => {
  const priceInput = document.getElementById("item-price");

  priceInput.addEventListener("input", () => {
    const inputPrice = priceInput.value;
    const fee = Math.floor(inputPrice * 0.1);
    const profit = inputPrice - fee;

    document.getElementById("add-tax-price").innerHTML = fee;
    document.getElementById("profit").innerHTML = profit;
  })
};

window.addEventListener("turbo:load", price);
window.addEventListener("turbo:render", price);
window.addEventListener('load', function(){

  const price = document.getElementById("item-price")
  const tax_price = document.getElementById("add-tax-price")
  const profit = document.getElementById("profit")

  price.addEventListener('input', function() {
  const tax = document.getElementById("item-price").value;
  tax_price.innerHTML = tax * 0.1

  const result = document.getElementById("profit").value;
  profit.innerHTML = tax - tax * 0.1

  })
})
// taxの要素を取得 get
// priceの値を取得する メソッドあり
// 計算
// innnerHTMLでtaxに代入する
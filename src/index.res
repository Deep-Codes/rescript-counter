@val external window: {..} = "window"
@val external document: {..} = "document"

let countText = document["getElementById"]("count")
let plusButton = document["getElementById"]("plus-one")
let minusButton = document["getElementById"]("minus-one")

let counter = ref(0)

let plusOperation = (~count) => {
  counter := counter.contents + count
  counter.contents
}
let minusOperation = (~count) => {
  counter := counter.contents - count
  counter.contents
}

let handleClass = (count: int): string => {
  if count > 0 {
    "count-positive"
  } else if count < 0 {
    "count-negative"
  } else {
    "count-zero"
  }
}

let renderCount = (count: int) => {
  countText["textContent"] = count
  countText["className"] = handleClass(count) ++ " count"
}

plusButton["addEventListener"]("click", () => {
  let plusVal = plusOperation(~count=1)
  renderCount(plusVal)
})
minusButton["addEventListener"]("click", () => {
  let minusVal = minusOperation(~count=1)
  renderCount(minusVal)
})

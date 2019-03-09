const clickNext1 = () => {
  const click_on_button1 = document.getElementById("next_button1");
click_on_button1.addEventListener("click", (event) => {
  // grab the divs
  console.log("click")
  const page_1 = document.getElementById("page1");
  const page_2 = document.getElementById("page2")
  // Hide page 1 and show page 2
  page_1.style.display = "none";
  page_2.style.display = "";
});
};
const clickNext2 = () => {
  const click_on_button2 = document.getElementById("next_button2");
click_on_button2.addEventListener("click", (event) => {
  // grab the div
  const page_2 = document.getElementById("page2");
  const page_3 = document.getElementById("page3")
  // Hide page 2 and show page 3
  page_2.style.display = "none";
  page_3.style.display = "";
});
};

export { clickNext1 };
export { clickNext2 };

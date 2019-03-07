const clickNext1 = () => {
  const click_on_button1 = document.getElementById("next_button1");
click_on_button1.addEventListener("click", (event) => {
  console.log(event);
  console.log(event.currentTarget);
  console.log("page 1 click")
  // grab the divs
  const page_1 = document.getElementById("page1");
  const page_2 = document.getElementById("page2")
  // Hide page 1 and show page 2
  page_1.style.display = "none";
  page_2.style.display = "";
  // hide page 1 button
  next_button1.style.display = "none";
  next_button2.style.display = "";
});
};
const clickNext2 = () => {
  const click_on_button2 = document.getElementById("next_button2");
click_on_button2.addEventListener("click", (event) => {
  console.log(event);
  console.log(event.currentTarget);
  console.log("page 2 click")
  // grab the div
  const page_2 = document.getElementById("page2");
  const page_3 = document.getElementById("page3")
  // Hide page 2 and show page 3
  page_2.style.display = "none";
  page_3.style.display = "";
  // hide page 2 button show page three
  next_button2.style.display = "none";
  next_button3.style.display = "";
});
};


export { clickNext1 };
export { clickNext2 };

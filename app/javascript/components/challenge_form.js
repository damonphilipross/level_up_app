const clickNext = () => {
  const click_on_button = document.getElementById("next_button");
next_button.addEventListener("click", (event) => {
  console.log(event);
  console.log(event.currentTarget);
});

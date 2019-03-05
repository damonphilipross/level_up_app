const clickNext = () => {
  const click_on_button = document.getElementById("next_button");
click_on_button.addEventListener("click", (event) => {
  console.log(event);
  console.log(event.currentTarget);
});

export { clickNext };

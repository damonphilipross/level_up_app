// Get the header


// Get the offset position of the navbar


// Add the sticky class to the header when you reach its scroll position. Remove "sticky" when you leave the scroll position

const stickyHeader = (header) => {

  const sticky = header.offsetTop;

  if (window.pageYOffset > sticky) {
    header.classList.add("sticky");
  } else {
    header.classList.remove("sticky");
  };
}

function headerCallback() {
  const header = document.getElementById("myCalendarHeader");

  if (header) {
    console.log(header, window)
    window.onscroll = function() {stickyHeader(header)};
  };
}
// When the user scrolls the page, execute myFunction
export { headerCallback };

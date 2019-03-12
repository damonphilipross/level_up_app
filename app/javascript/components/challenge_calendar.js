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


const editMode = () => {
  const edit_button = document.getElementById("edit-button");
  if (edit_button) {
    edit_button.addEventListener("click", (event) => {
      console.log("test");
      // grab the div
      const edit_bar = document.getElementById("edit-bar");
      // Hide page 2 and show page 3
      edit_bar.style.display = "";
      // page_3.style.display = "";
    });
  }
};

// When the user scrolls the page, execute myFunction
export { headerCallback };

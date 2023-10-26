
console.log("links.js")
let select = document.getElementById('icon').addEventListener('change', function handleChange(event) {
  console.log("event")
  console.log(document.querySelector('label#selected-icon').child) //.classList.remove("fa-*")
  // document.querySelector('#selected-icon > i').classList.add("fa-solid")
});
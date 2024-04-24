// Disable default HTML image draggable. 
let images = document.getElementsByTagName('img');

for (image of images) {
  image.draggable = false;
}

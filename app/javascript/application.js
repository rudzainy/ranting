// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import * as bootstrap from "bootstrap"
import "./custom/companion"

// https://discuss.rubyonrails.org/t/unable-to-import-font-awesome/82423
// importing core styling file
import "@fortawesome/fontawesome-free/js/fontawesome";

// our project needs Solid + Brands + Regular
import "@fortawesome/fontawesome-free/js/solid";
import "@fortawesome/fontawesome-free/js/brands";
import "@fortawesome/fontawesome-free/js/regular";

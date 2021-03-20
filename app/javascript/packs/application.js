// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import "channels"

import { Dropdown } from 'bootstrap';
import 'bootstrap/dist/css/bootstrap.min.css';

Rails.start()
Turbolinks.start()

document.addEventListener("turbolinks:load", function() {
        // $('[data-toggle="dropdown"]').dropdown()
        // $('[data-toggle="popover"]').popover()
    Array.from(document.querySelectorAll('.dropdown-toggle'))
        .forEach(dropdownNode => new Dropdown(dropdownNode))
})

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

// External imports
import "bootstrap";

import flatpickr from 'flatpickr';
// import 'flatpickr/dist/flatpickr.min.css';
import 'flatpickr/dist/themes/material_green.css';

import 'select2/dist/css/select2.css';
import { multipleSelect } from '../plugins/select.js';

document.addEventListener('turbolinks:load', () => {
  flatpickr(".datepicker", {
    altInput: true,
    allowInput: true,
    enableTime: true
  });
  const new_form = document.querySelector(".multiple-select");
  if (new_form) {
    multipleSelect();
  }
});

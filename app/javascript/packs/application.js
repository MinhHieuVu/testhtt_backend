// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.



import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import "trix"
import "@rails/actiontext"
import 'select2'
import 'select2/dist/css/select2.css'

Rails.start()
Turbolinks.start()
ActiveStorage.start()

// app/javascript/packs/application.js
require("bootstrap")
import "../stylesheets/application";
import "./custom"

$(document).on("turbolinks:load", function (event) {
    // $('#post_released_at').datetimepicker({
    //     locale: 'vi',
    //     date: new Date("<%= post.released_at.to_s %>")
    // });

    $('.select2').select2({
        theme: "bootstrap"
    })

    // // $('#post_tag_list').tagit();
    // new Taggle('tag', {
    //     tags: JSON.parse('<%= raw post.tags.collect(&:name) %>')
    // });
})

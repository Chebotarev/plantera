import { Alert } from 'bootstrap'

document.addEventListener("turbolinks:load", function() {
    var alertList = document.querySelectorAll('.alert')
    alertList.forEach(function (alert) {
        alert = new Alert(alert)
    })
})

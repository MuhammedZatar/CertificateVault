# config/importmap.rb

pin "application", preload: true # Pin the main application entry point
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true # Pin Turbo
pin "@hotwired/stimulus", to: "stimulus.min.js", preload: true # Pin Stimulus
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true # Pin Stimulus Loading
pin_all_from "app/javascript/controllers", under: "controllers" # Pin all controllers

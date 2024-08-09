// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
// require("@rails/ujs").start()
require("turbolinks")
require("@rails/activestorage").start()
require("channels")

import "controllers"
import "bootstrap"
import "@popperjs/core"
import "@hotwired/turbo-rails"

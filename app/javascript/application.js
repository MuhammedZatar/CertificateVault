// app/javascript/application.js

import "@hotwired/turbo-rails"; // Import Turbo
import { Application } from "@hotwired/stimulus"; // Import Stimulus


// Start Stimulus Application
const application = Application.start();
application.debug = false; // Disable debug in production
window.Stimulus = application; // Attach Stimulus to the window for debugging

export { application }; // Export the application for any additional controllers

import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ["drawer", "overlay"]

    open() {
        // Reveal the backdrop blur overlay
        this.overlayTarget.classList.remove("hidden", "pointer-events-none", "opacity-0")
        this.overlayTarget.classList.add("opacity-100")

        // Slide the ink panel into view from the right
        this.drawerTarget.classList.remove("translate-x-full")
        this.drawerTarget.classList.add("translate-x-0")
    }

    close() {
        // Slide the panel back off-screen
        this.drawerTarget.classList.remove("translate-x-0")
        this.drawerTarget.classList.add("translate-x-full")

        // Hide the backdrop overlay smoothly
        this.overlayTarget.classList.remove("opacity-100")
        this.overlayTarget.classList.add("opacity-0")

        // Add safety timeout to prevent click blocking after closure animation ends
        setTimeout(() => {
            this.overlayTarget.classList.add("hidden", "pointer-events-none")
        }, 300)
    }
}
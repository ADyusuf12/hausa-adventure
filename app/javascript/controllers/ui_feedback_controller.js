import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ["choiceButton", "sceneFrame"]

    connect() {
        // Stagger entry animations for narrative choice logs
        this.choiceButtonTargets.forEach((btn, idx) => {
            btn.style.opacity = "0"
            btn.style.transform = "translateY(8px)"
            setTimeout(() => {
                btn.style.transition = "all 400ms cubic-bezier(0.16, 1, 0.3, 1)"
                btn.style.opacity = "1"
                btn.style.transform = "translateY(0)"
            }, idx * 80)
        })
    }

    execute(event) {
        const targetButton = event.currentTarget

        // 1. Highlight selected choice with an immersive pulsing ink bleed effect
        targetButton.classList.add("border-amber-500/80", "bg-amber-950/20", "ring-1", "ring-amber-500/30")

        // 2. Lock down the interface during processing
        this.choiceButtonTargets.forEach(btn => {
            if (btn !== targetButton) {
                btn.classList.add("opacity-20", "pointer-events-none")
            }
        })

        // 3. Trigger haptic micro-vibrations if supported on mobile
        if (navigator.vibrate) navigator.vibrate(15)
    }
}
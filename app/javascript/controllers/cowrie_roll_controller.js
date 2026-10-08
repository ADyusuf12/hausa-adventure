import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ["shell", "sandbox", "button", "result"]

    connect() {
        this.executeImmersiveCast()
    }

    executeImmersiveCast() {
        // 1. Shake the ritual tray framework organically using physics-like boundaries
        this.sandboxTarget.classList.add("animate-tray-shake")

        // 2. Animate every single bone shell uniquely
        this.shellTargets.forEach((shell, index) => {
            const innerNode = shell.querySelector(".shell-inner")

            // Clear out older orientation tracks
            innerNode.style.transform = "none"

            // Inject random tumbling velocity metrics per cast
            const randomRotationsX = Math.floor(Math.random() * 3) + 4 // 4 to 6 full flips
            const randomRotationsY = Math.floor(Math.random() * 3) + 4
            const targetDegX = randomRotationsX * 360 + (Math.random() * 40 - 20)

            // Map the targeted final rotation vector based on server output payload state
            const isUp = shell.dataset.face === "true"
            const baselineY = isUp ? 180 : 0
            const targetDegY = (randomRotationsY * 360) + baselineY + (Math.random() * 30 - 15)

            // Apply complex kinetic tumbling properties
            innerNode.style.transition = `transform ${1500 + (index * 200)}ms cubic-bezier(0.25, 1, 0.5, 1)`

            requestAnimationFrame(() => {
                innerNode.style.transform = `rotateX(${targetDegX}deg) rotateY(${targetDegY}deg) translateY(${Math.random() * 20 - 10}px)`
            })

            // Synthesize an auditory bone tap sound right as the shell settles
            setTimeout(() => {
                this.playBoneTapSound()
            }, 1300 + (index * 200))
        })

        // 3. Bring in the text conclusions smoothly once the dust settles
        setTimeout(() => {
            this.sandboxTarget.classList.remove("animate-tray-shake")

            // Display the final outcome tracking cards
            this.resultTarget.classList.remove("opacity-0", "scale-95")
            this.resultTarget.classList.add("opacity-100", "scale-100")

            // Unlock operational routing links safely
            this.buttonTarget.classList.remove("opacity-0", "pointer-events-none", "translate-y-2")
            this.buttonTarget.classList.add("opacity-100", "translate-y-0")
        }, 2400)
    }

    // Pure Web Audio API synthesis—no external audio files or asset latency overhead required!
    playBoneTapSound() {
        try {
            const AudioContext = window.AudioContext || window.webkitAudioContext
            if (!AudioContext) return

            const ctx = new AudioContext()
            const osc = ctx.createOscillator()
            const gain = ctx.createGain()

            osc.type = "triangle"
            // Mimic high-pitched dense ivory impact frequency profiles
            osc.frequency.setValueAtTime(850 + (Math.random() * 300), ctx.currentTime)
            osc.frequency.exponentialRampToValueAtTime(120, ctx.currentTime + 0.04)

            gain.gain.setValueAtTime(0.15, ctx.currentTime)
            gain.gain.exponentialRampToValueAtTime(0.01, ctx.currentTime + 0.05)

            osc.connect(gain)
            gain.connect(ctx.destination)

            osc.start()
            osc.stop(ctx.currentTime + 0.06)
        } catch (e) {
            // Gracefully catch browser tab audio interactions exceptions
        }
    }
}
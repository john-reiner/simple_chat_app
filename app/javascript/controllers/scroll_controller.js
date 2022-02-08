import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    connect() {
        const messages = document.getElementById("messages-container")
        messages.addEventListener("DOMNodeInserted", () => {
            this.resetScroll(messages)
        })
        this.resetScroll(messages)
    }

    disconnect() {
        console.log("disconnected")
    }

    resetScroll(messages) {
        messages.scrollTop = messages.scrollHeight - messages.clientHeight;
    }
}
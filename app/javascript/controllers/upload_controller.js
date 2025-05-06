import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
  static targets = ['file', 'progressList']
  static values = {
    url: String
  }

  connect() {
    console.log('upload connected')
    this.list = []
  }

  upload(e) {
    const listContainer = this.progressListTarget
    for (let i = 0; i < e.target.files.length; i++) {
      const uid = Date.now()
      this.list.push({ uid: uid, status: 'pending', progress: 0, name: e.target.files[i].name })

      const child = document.createElement("div")
      child.setAttribute("data-uid", uid)
      child.textContent = e.target.files[i].name

      listContainer.appendChild(child)
      this.uploadFile(e.target.files[i], uid)
    }
    e.target.file = ''
  }

  uploadFile(file, id) {
    const listContainer = this.progressListTarget

    const token = document.querySelector('meta[name="csrf-token"]').getAttribute('content')
    let form = new FormData()
    form.append("file", file)
    form.append("authenticity_token", token)

    const request = new XMLHttpRequest()
    request.open('POST', this.urlValue)
    request.upload.addEventListener('progress', (e) => {
      let percent_completed = (e.loaded / e.total) * 100

      let index = this.list.findIndex(x => x.uid == id)
      this.list[index].progress = Math.round(percent_completed)

	    console.log(percent_completed)
      this.updateUI(this.list[index])
    })
    request.send(form)
  }

  updateUI(hash) {
    let node = this.progressListTarget.querySelector(`[data-uid='${hash.uid}']`)
    node.textContent = `Uploading ${hash.name} ${hash.progress}%`
  }
}
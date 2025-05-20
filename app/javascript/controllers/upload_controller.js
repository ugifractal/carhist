import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
  static targets = ['file', 'progressList', 'images']
  static values = {
    infoUrl: String,
    url: String
  }

  connect() {
    console.log('upload connected')
    this.list = []
  }

  triggerUpload(e) {
    e.preventDefault()
    this.fileTarget.click();
  }

  async upload(e) {
    const info = await this.info();
    const totalImagesInDB = info.car_maintenance_images.length;
    const totalToBeUploaded = e.target.files.length;
    if ((totalImagesInDB + totalToBeUploaded) > 10 ){
      console.log("cannt upload more than 10 images")
      return;
    }
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

  async info() {
    const response = await fetch(this.infoUrlValue);
    const json = await response.json();
    return json;
  }

  uploadFile(file, id) {
    const token = document.querySelector('meta[name="csrf-token"]').getAttribute('content');
    let form = new FormData();
    form.append('file', file);
    form.append('authenticity_token', token);

    const request = new XMLHttpRequest();
    request.open('POST', this.urlValue);
    request.upload.addEventListener('progress', (e) => {
      let percent_completed = (e.loaded / e.total) * 100;

      let index = this.list.findIndex(x => x.uid == id);
      this.list[index].progress = Math.round(percent_completed);
      this.updateUI(this.list[index]);
    });

    request.onload = () => {
      if (request.status === 200) {
        const response = JSON.parse(request.responseText);
        this.insertImage(response.history_image.url);
      }
    };

    request.send(form);
  }

  insertImage(imageUrl) {
    const imgElement = document.createElement('img');
    imgElement.src = imageUrl;
    imgElement.className = 'px-5 w-60 h-60 object-cover';
    this.imagesTarget.appendChild(imgElement);
  }

  updateUI(hash) {
    let node = this.progressListTarget.querySelector(`[data-uid='${hash.uid}']`)
    node.textContent = `Uploading ${hash.name} ${hash.progress}%`
  }
}
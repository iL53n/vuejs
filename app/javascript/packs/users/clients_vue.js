import Vue from 'vue'
import Clients from '../../clients.vue'

document.addEventListener('DOMContentLoaded', () => {
  const app = new Vue({
    render: h => h(Clients)
  }).$mount()
  document.body.appendChild(app.$el)

  console.log(app)
})
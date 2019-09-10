import Vue from 'vue'
import Staffs from '../../staffs.vue'

document.addEventListener('DOMContentLoaded', () => {
  const app = new Vue({
    render: h => h(Staffs)
  }).$mount()
  document.body.appendChild(app.$el)

  console.log(app)
})
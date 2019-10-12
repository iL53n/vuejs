import Vue from 'vue'
import Client from '../app/client.vue'

import '../app/styles/quasar.styl'
import iconSet from 'quasar/icon-set/fontawesome-v5.js'
import '@quasar/extras/fontawesome-v5/fontawesome-v5.css'
import {
  Quasar,
  QLayout,
  QHeader,
  QDrawer,
  QPageContainer,
  QPage,
  QToolbar,
  QToolbarTitle,
  QAvatar,
  QSpace,
  QBtn,
  QChip,
  QTable,
  QTh,
  QTr,
  QTd,
  QForm,
  QInput,
  QCard,
  QCardSection,
  QCardActions,
  QSpinner,
  QSpinnerTail,
  Loading,
  QSelect,
  QList,
  QItem,
  QItemSection,
  QItemLabel,
  QIcon,
  QScrollArea,
  QDialog,
  ClosePopup,
  Notify,
  Ripple
} from 'quasar'

Vue.use(Quasar, {
  config: {},
  components: {
    Quasar,
    QLayout,
    QHeader,
    QDrawer,
    QPageContainer,
    QPage,
    QToolbar,
    QToolbarTitle,
    QAvatar,
    QSpace,
    QBtn,
    QChip,
    QTable,
    QTh,
    QTr,
    QTd,
    QForm,
    QInput,
    QCard,
    QCardSection,
    QCardActions,
    QSpinner,
    QSpinnerTail,
    Loading,
    QSelect,
    QList,
    QItem,
    QItemSection,
    QItemLabel,
    QIcon,
    QScrollArea,
    QDialog,
    ClosePopup
  },
  directives: {
    Ripple
  },
  plugins: {
    Notify
  },
  iconSet: iconSet
});

document.addEventListener('DOMContentLoaded', () => {
  const app = new Vue({
    render: h => h(Client)
  }).$mount();
  document.body.appendChild(app.$el)
});
import Vue from 'vue'
import Staff from '../app/staff.vue'

import '../app/styles/quasar.styl'
import iconSet from 'quasar/icon-set/fontawesome-v5.js'
import '@quasar/extras/fontawesome-v5/fontawesome-v5.css'
import {
  Quasar,
  QLayout,
  QList,
  QItemSection,
  QItemLabel,
  QItem,
  QHeader,
  QFooter,
  QTab,
  QTabs,
  QTabPanel,
  QTabPanels,
  QDrawer,
  QPageContainer,
  QPage,
  QToolbar,
  QToolbarTitle,
  QBtn,
  QImg,
  QBadge,
  QBreadcrumbs,
  QBreadcrumbsEl,
  QIcon,
  QPageSticky,
  QPageScroller,
  QAvatar,
  QTable,
  QTh,
  QTr,
  QTd,
  QInput,
  QCard,
  QCardSection,
  QCardActions,
  QForm,
  QSlideTransition,
  QToggle,
  QSpinner,
  QField,
  QDialog,
  QEditor
} from 'quasar'

Vue.use(Quasar, {
  config: {},
  components: {
    Quasar,
    QLayout,
    QList,
    QItemSection,
    QItemLabel,
    QItem,
    QHeader,
    QFooter,
    QTab,
    QTabs,
    QTabPanel,
    QTabPanels,
    QDrawer,
    QPageContainer,
    QPage,
    QToolbar,
    QToolbarTitle,
    QBtn,
    QImg,
    QBadge,
    QBreadcrumbs,
    QBreadcrumbsEl,
    QIcon,
    QPageSticky,
    QPageScroller,
    QAvatar,
    QTable,
    QTh,
    QTr,
    QTd,
    QInput,
    QCard,
    QCardSection,
    QCardActions,
    QForm,
    QSlideTransition,
    QToggle,
    QSpinner,
    QField,
    QDialog,
    QEditor
  },
  directives: {
  },
  plugins: {
  },
  iconSet: iconSet
});

document.addEventListener('DOMContentLoaded', () => {
  const app = new Vue({
    render: h => h(Staff)
  }).$mount();
  document.body.appendChild(app.$el)
});
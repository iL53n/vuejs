// import Vue from 'vue'
// import App from '../app/App.vue'
//
// // import '../app/quasar'
// // import '../app/api/index' //backend
//
// import router from '../app/router'
// import store from '../app/store'
//
// import '../app/quasar/styles/quasar.styl'
// import iconSet from 'quasar/icon-set/fontawesome-v5.js'
// import '@quasar/extras/fontawesome-v5/fontawesome-v5.css'
// import {
//   Quasar,
//   QLayout,
//   QList,
//   QItemSection,
//   QItemLabel,
//   QItem,
//   QHeader,
//   QFooter,
//   QTab,
//   QTabs,
//   QRouteTab,
//   QTabPanel,
//   QTabPanels,
//   QDrawer,
//   QPageContainer,
//   QPage,
//   QToolbar,
//   QToolbarTitle,
//   QBtn,
//   QImg,
//   QBadge,
//   QBreadcrumbs,
//   QBreadcrumbsEl,
//   QIcon,
//   QPageSticky,
//   QPageScroller,
//   QAvatar,
//   QTable,
//   QTh,
//   QTr,
//   QTd,
//   QInput,
//   QCard,
//   QCardSection,
//   QCardActions,
//   QForm,
//   QSlideTransition,
//   QToggle,
//   QSpinner,
//   QField,
//   QDialog,
//   QEditor,
//   Notify,
//   Ripple
// } from 'quasar'
//
// Vue.use(Quasar, {
//   config: {},
//   components: {
//     Quasar,
//     QLayout,
//     QList,
//     QItemSection,
//     QItemLabel,
//     QItem,
//     QHeader,
//     QFooter,
//     QTab,
//     QTabs,
//     QRouteTab,
//     QTabPanel,
//     QTabPanels,
//     QDrawer,
//     QPageContainer,
//     QPage,
//     QToolbar,
//     QToolbarTitle,
//     QBtn,
//     QImg,
//     QBadge,
//     QBreadcrumbs,
//     QBreadcrumbsEl,
//     QIcon,
//     QPageSticky,
//     QPageScroller,
//     QAvatar,
//     QTable,
//     QTh,
//     QTr,
//     QTd,
//     QInput,
//     QCard,
//     QCardSection,
//     QCardActions,
//     QForm,
//     QSlideTransition,
//     QToggle,
//     QSpinner,
//     QField,
//     QDialog,
//     QEditor
//   },
//   directives: {
//     Ripple
//   },
//   plugins: {
//     Notify
//   },
//   iconSet: iconSet
// });
//
// document.addEventListener('DOMContentLoaded', () => {
//   const app = new Vue({
//     render: h => h(App),
//     router,
//     store
//   }).$mount();
//   document.body.appendChild(app.$el)
// });
<template lang="pug">
  div(class="q-pa-md")
    q-layout(view="lhh lpR lff" container style="height: 95vh" class="shadow-10 rounded-borders")
          header-component
          q-page-container
            q-page(padding style="padding-top: 66px")

              dashboard-organizations

            q-page-scroller(position="bottom")
              q-btn(fab icon="keyboard_arrow_up" color="red")
          footer-component
</template>

<script>
  import HeaderComponent from './components/common/header'
  import DashboardOrganizations from './components/dashboards/dashboard_organizations'
  import FooterComponent from './components/common/footer'

  export default {
    data () {
      return {
        loading: false,
        error: false,
        user: {},
        message: ''
      }
    },
    components: {
      HeaderComponent,
      DashboardOrganizations,
      FooterComponent
    }
  }
</script>

<style lang="scss">
</style>
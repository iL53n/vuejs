<template lang="pug">
  div(class="q-pa-md")
    q-layout(view="lhh lpR lff" container style="height: 95vh" class="shadow-10 rounded-borders")
          Header
          q-page-container
            q-page(padding style="padding-top: 66px")

              DashboardOrganizations

            q-page-scroller(position="bottom")
              q-btn(fab icon="keyboard_arrow_up" color="red")
          Footer
</template>

<script>
  import Header from './components/common/header'
  import DashboardOrganizations from './components/dashboards/dashboard_organizations'
  import Footer from './components/common/footer'

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
      Header,
      DashboardOrganizations,
      Footer
    }
  }
</script>

<style lang="scss">
</style>
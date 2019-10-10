<template lang="pug">
  div(class="q-pa-md")
    q-layout(view="lHh lpr lFf" container style="height: 1000px" class="shadow-2 rounded-borders")

      q-header(elevated class="bg-primary text-white")
        q-toolbar
          q-avatar
            img(src="../images/SC.jpg" alt="ServiseCentr" width="80")
          q-toolbar-title ЕВРОПРАКТИК
            q-badge(transparent align="middle" color="orange")
              | v1.0.0b
          q-btn(dense flat round icon="menu" @click="right = !right")

        q-tabs(align="left")
          q-tab(to="/" name="root" label="Главная")
          q-tab(name="organizations" label="Организации")
          q-tab(name="admin" label="Админка")

      q-drawer(show-if-above v-model="right" side="right" bordered)
        //| {{ user.email }}
        | ilsegribko@gmail.com
        a(class="button", :href="'/' + userClass + '/sign_out'" data-method="delete") SignOut

      q-page-container
        q-page(padding style="padding-top: 66px")
          DashboardOrganizations
          CreateOrganization
          q-page-sticky(expand position="top")
            q-toolbar(class="bg-secondary text-white")
              q-toolbar-title Организации

      q-footer
        q-toolbar
          q-toolbar-title 2019 Минск
</template>

<script>
  import DashboardOrganizations from './dashboard_organizations'
  import CreateOrganization from './create_organization'

  export default {
    data () {
      return {
        right: false
      }
    },
    components: {
      DashboardOrganizations,
      CreateOrganization
    }
  }
</script>
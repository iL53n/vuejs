<template lang="pug">
  div
    q-dialog(
      :value="true"
      @hide="afterShow()"
      :position="position"
      transition-show="flip-right"
    )
      form-organization(:organization="organization")
</template>

<script>
  import FormOrganization from './organization_form'

  export default {
    data() {
      return {
        organization: {
          title: '',
          form_of_owership: '',
          tax_number: '',
          reg_number: '',
          client_ids: [],
          clients: []
        },
        position: 'left',
      }
    },
    methods: {
      afterShow() {
        this.$router.push("/organizations");
        this.$emit('create-organization');
      },
    },
    components: {
      FormOrganization
    }
  }
</script>

<style lang="stylus" scoped>
</style>
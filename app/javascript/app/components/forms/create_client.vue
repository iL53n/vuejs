<template lang="pug">
  div
    q-dialog(:value="true" @hide="afterShow()" :position="position")
      form-client(:client="client")
</template>

<script>
  import FormClient from './client_form'

  export default {
    data() {
      return {
        client: {
          fullname: '',
          phone: '',
          email: '',
          organizations: []
        },
        position: 'left',
      }
    },
    methods: {
      afterShow() {
        this.$router.push("/clients");
        this.$emit('create-client');
      },
    },
    components: {
      FormClient
    }
  }
</script>

<style lang="stylus" scoped>
</style>
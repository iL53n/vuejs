<template lang="pug">
  div
    q-dialog(:value="true" @hide="afterShow()" :position="position"  transition-show="rotate")
      form-client(:client="client")
</template>

<script>
  import FormClient from './client_form'
  import { backendGet } from "../../api";

  export default {
    data() {
      return {
        client: this.getClient(),
        position: 'right'
      }
    },
    methods: {
      getClient() {
        backendGet(`/staff/clients/${this.$route.params.id}`)
          .then((response) => {
            this.client = response.data.client
          })
          .catch((error) => {
            console.log(error);
            this.errors = true
          })
          .finally(() => {
            this.loading = false
          });
      },
      afterShow() {
        this.$router.push("/clients");
        this.$emit('edit-client');
      },
    },
    components: {
      FormClient
    }
  }
</script>

<style lang="stylus" scoped>
</style>
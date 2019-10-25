<template lang="pug">
  div
    q-dialog(
      :value="true"
      @hide="afterShow()"
      :position="position"
      transition-show="rotate"
    )
      form-organization(:organization="organization")
</template>

<script>
  import FormOrganization from './organization_form'
  import { backendGet } from "../../../api";

  export default {
    data() {
      return {
        organization: this.getOrganization(),
        position: 'right'
      }
    },
    methods: {
      getOrganization() {
        backendGet(`/staff/organizations/${this.$route.params.id}`)
          .then((response) => {
            this.organization = response.data.organization
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
        this.$router.push("/organizations");
        this.$emit('edit-organization');
      },
    },
    components: {
      FormOrganization
    }
  }
</script>

<style lang="stylus" scoped>
</style>
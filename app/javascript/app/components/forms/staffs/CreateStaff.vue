<template lang="pug">
  div
    q-dialog(
      :value="true"
      @hide="afterShow()"
      :position="position"
      transition-show="flip-right"
    )
      form-staff(:staff="staff")
</template>

<script>
  import FormStaff from './StaffForm'

  export default {
    data() {
      return {
        staff: {
          email: '',
        },
        position: 'left',
      }
    },
    methods: {
      afterShow() {
        this.$router.push("/staffs");
        this.$emit('create-staff');
      },
    },
    components: {
      FormStaff
    }
  }
</script>

<style lang="stylus" scoped>
</style>
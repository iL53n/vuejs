<template lang="pug">
  div
    q-dialog(
      :value="true"
      @hide="afterShow()"
      :position="position"
      transition-show="flip-right"
    )
      form-equipment(:equipment="equipment")
</template>

<script>
  import FormEquipment from './equipment_form'

  export default {
    data() {
      return {
        equipment: {
          title: '',
          kind: '',
          serial_number: '',
          organization_id: '',
          organization: ''
        },
        position: 'left',
      }
    },
    methods: {
      afterShow() {
        this.$router.push("/equipments");
        this.$emit('create-equipment');
      },
    },
    components: {
      FormEquipment
    }
  }
</script>

<style lang="stylus" scoped>
</style>
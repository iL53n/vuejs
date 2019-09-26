<template lang="pug">
  div
    a(href="/")
      img(src="../images/LogoSC.png" alt="ServiseCentr" width="300")
    p {{ user.email }}
    button(@click="signOut") SignOut
</template>

<script>
  export default {
    props: ['user'],
    methods: {
      signOut() {
        this.$emit('sign-out')
      }
    }
  }
</script>

<style lang="scss">
  p {
      background: #5ac055; /*test*/
  }

</style>
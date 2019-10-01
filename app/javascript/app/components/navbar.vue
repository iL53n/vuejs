<template lang="pug">
  div
    ul
      li
        a(href="/")
          img(src="../images/LogoSC.png" alt="ServiseCentr" width="300")

      a {{ user.email }}
          br
          a(class="button", href="client/sign_out", data-method="delete") SignOut
</template>

<script>
  export default {
    props: ['user'],
    methods: {
    }
  }
</script>

<style lang="scss">
    ul {
        list-style-type: none;
        margin: 20px;
        padding: 20px;
        box-shadow: 0 0 10px royalblue;
    }

    li {
        float: left;
    }

    a {
        display: block;
        color: black;
        font-family: "Helvetica Neue", Arial, sans-serif;
        text-align: right;
        padding: 14px 16px;
        text-decoration: none;
    }

    .button {
        border: 2px solid royalblue;
        border-radius: 3px;
        background-color: white;
        color: royalblue;
        display: inline-block;
        padding: 8px;
        -webkit-transition-duration: 0.4s;
        transition-duration: 0.4s;
    }
    .button:hover {
        background-color: royalblue;
        color: white;
    }
</style>
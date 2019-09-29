<template lang="pug">
	fieldset
		legend
			b Create new client
		label
			br
			| Full name
			input(v-model="client.fullname", type="text" required="")
		label
			| Phone
			input(v-model="client.phone", type="text" required="")
		label
			| Email
			input(v-model="client.email", type="text" required="")
		label
			| Password
			input(v-model="client.password", type="text" required="")
		button(@click="addClient", class="button") Create new client
</template>

<script>
  import { backendPost } from '../api/index'

  export default {
    data() {
      return {
        client: {
          fullname: '',
          phone: '',
          email: '',
          password: '11111111'
        },
        errors: {}
      }
    },
    methods: {
      addClient() {
        let vm = this;
        backendPost('/staff/clients', vm.client)
					.then(response => {
						if (response.data.errors) {
							vm.errors = response.data.errors;
						} else {
							// this.$emit('reloadClientList');
							this.client = {};
							this.errors = {};
						}
					})
					// .catch(function (error) {
					// 	console.log(error);
					// });
      }
    }
  }
</script>

<style lang="scss">
	fieldset {
		list-style-type: none;
		margin: 20px;
		font-family: "Helvetica Neue", Arial, sans-serif;
		border-spacing: 2px;
		border: 1px solid #c6c7cc;
		border-radius: 5px;
		overflow: hidden;
		width: 140px;
	}

	input[type=text] {
		width: auto;
		padding: 10px;
		margin: 5px 0 12px 0;
		display: inline-block;
		border: none;
		background: #f1f1f1;
	}

	input[type=text]:focus {
		background-color: #ddd;
		outline: none;
	}
</style>
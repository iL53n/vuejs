const { environment } = require('@rails/webpacker')
const { VueLoaderPlugin } = require('vue-loader')

//loaders
const vue = require('./loaders/vue')
const pugConfig = require('./loaders/pug')
const stylus = require('./loaders/stylus')
const babelQuasar = require('./loaders/babel')

//utils
environment.loaders.append('stylus', stylus)
environment.loaders.append('js', babelQuasar)
environment.plugins.prepend('VueLoaderPlugin', new VueLoaderPlugin())
environment.loaders.prepend('vue', vue)
// environment.loaders.prepend('pug', pugConfig)
environment.config.merge(pugConfig)

module.exports = environment

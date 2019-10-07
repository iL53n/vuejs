const path = require('path')

// console.log(path.join(__dirname, '../../..', 'node_modules/quasar'))

module.exports = {
  test: /\.js$/,
  loaders: 'babel-loader',
  include: [path.join(__dirname, '../../..', 'node_modules/quasar')]
}
const { webpackConfig, merge } = require('@rails/webpacker')

const postCSS = require('./postcss')
const terserPlugin = require('./terser')

module.exports = merge(webpackConfig, postCSS, terserPlugin)

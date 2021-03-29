process.env.NODE_ENV = process.env.NODE_ENV || 'production'

const { merge } = require('@rails/webpacker')
const webpackConfig = require('./base')
let production = {}

const terserPlugin = require('./terser')
production = merge(production, terserPlugin)

module.exports = merge(webpackConfig, production)

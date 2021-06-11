process.env.NODE_ENV = process.env.NODE_ENV || 'production'

const { merge } = require('webpack-merge')
const webpackConfig = require('./base')
let production = merge({})

const terserPlugin = require('./terser')
webpackConfig.optimization.minimizer = []
production = merge(production, terserPlugin)

module.exports = merge(webpackConfig, production)

module.exports = {
  module: {
    rules: [{
      test: /\.(scss|css)$/,
      use: ['postcss-loader'],
    }, ],
  },
};

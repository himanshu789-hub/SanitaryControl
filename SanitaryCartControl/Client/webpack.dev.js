const { merge } = require('webpack-merge');
const common = require('./webpack.common.js');

module.exports = merge(common, {
	entry: {
		client: ['./src/js/dev/client.js'],
		cms: ['./src/js/dev/cms.js'],
	},
	mode: 'development',
	devtool: 'source-map',

});

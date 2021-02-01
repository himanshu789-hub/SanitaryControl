const { merge } = require('webpack-merge');
const common = require('./webpack.common.js');

module.exports = merge(common, {
	entry: {
		client: ['./src/js/prod/client.js'],
		cms: ['./src/js/prod/cms.js'],
	},
	mode: 'production',
	output: {
		filename: '[name].min.entry.js'
	}
});

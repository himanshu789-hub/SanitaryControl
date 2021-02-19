const path = require('path');
const webpack = require('webpack');

module.exports = {
	output: {
		filename: '[name].entry.js',
		path: path.resolve(__dirname, '..', 'wwwroot', 'dist'),
	},
	module: {
		rules: [
			{
				test: /\.js$/,
				exclude: '/node_modules',
				use: {
					loader: 'babel-loader',
					options: {
						presets: [['@babel/preset-env']],
					},
				},
			},
			{ test: /\.css$/, use: ['style-loader', 'css-loader'] },
			{ test: /\.eot(\?v=\d+\.\d+\.\d+)?$/, loader: 'file-loader' },
			{ test: /\.(woff|woff2)$/, loader: 'url-loader?prefix=font/&limit=5000' },
			{ test: /\.ttf(\?v=\d+\.\d+\.\d+)?$/, loader: 'url-loader?limit=10000&mimetype=application/octet-stream' },
			{ test: /\.svg(\?v=\d+\.\d+\.\d+)?$/, loader: 'url-loader?limit=10000&mimetype=image/svg+xml' },
		],
	},
};

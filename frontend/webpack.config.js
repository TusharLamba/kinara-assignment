const path = require("path");
const HtmlWebpackPlugin = require('html-webpack-plugin');

module.exports = {
    entry: "./src/index.js", // Entry point of your application
    output: {
        filename: "[name].js", // Output bundle file name
        path: path.resolve(__dirname, "dist"), // Output directory
    },
    devtool: 'inline-source-map',
    module: {
        rules: [
            {
                test: /\.(js|jsx)$/,
                exclude: /node_modules/,
                use: {
                    loader: "babel-loader",
                    options: {
                        presets: ['@babel/preset-env', '@babel/preset-react']
                    }
                },
            },
            {
                test: /\.css$/i,
                use: ["style-loader", "css-loader"],
            },
            {
                test: /\.s[ac]ss$/i,
                use: [
                // Creates `style` nodes from JS strings
                "style-loader",
                // Translates CSS into CommonJS
                "css-loader",
                // Compiles Sass to CSS
                "sass-loader"
                ],
            },
            {
                test: /\.(png|jp(e*)g|svg|gif|eot|ttf|woff|woff2)$/,
                use: [
                    {
                        loader: 'file-loader',
                        options: {
                            outputPath: 'images',
                        },
                    },
                ]
            },
        ],
    },
    plugins: [
        new HtmlWebpackPlugin({
            template: path.join(__dirname, "public", "index.html"),
            filename: 'index.html',
        }),
    ],
    resolve: {
        extensions: [".js", ".jsx"],
    },
    devServer: {
        static: './dist',
        hot: true,
        liveReload: true,
        client: {
            overlay: {
                errors: true,
                warnings: true,
                runtimeErrors: true,
            }
        },
        port: 8081, // Port for the development server
        open: true, // Open the default web browser when the server starts
    },
    optimization: {
        runtimeChunk: 'single',
    },
};
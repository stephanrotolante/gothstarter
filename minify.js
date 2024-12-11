const fs = require('fs');
const path = require('path');

const { minify } = require('terser');

// Define the config for how Terser should minify the code
// This is set to how you currently have this web tool configured
const config = {
    compress: {
        dead_code: true,
        drop_console: false,
        drop_debugger: true,
        keep_classnames: false,
        keep_fargs: true,
        keep_fnames: false,
        keep_infinity: false
    },
    mangle: {
        eval: false,
        keep_classnames: false,
        keep_fnames: false,
        toplevel: false,
        safari10: false
    },
    module: false,
    sourceMap: false,
    output: {
        comments: 'some'
    }
};


async function run() {
    console.log(__dirname);
    const files = fs.readdirSync(path.join(__dirname, "js"));

    for (var file of files) {
        console.log(`minifying ${file}`)
        // Load in your code to minify
        const code = fs.readFileSync(
            path.join(__dirname, "js", file),
            'utf8'
        );

        // Minify the code with Terser
        const minified = await minify(code, config);

        // Save the code!
        fs.writeFileSync(
            path.join(__dirname, "public", file),
            minified.code
        );
    }
}


run()
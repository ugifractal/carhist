import * as esbuild from 'esbuild'
import { stimulusPlugin } from 'esbuild-plugin-stimulus'


const entryPoints = ["app/javascript/application.js"]
const outdir = "app/assets/builds"
const plugins = [stimulusPlugin()]

if (process.argv.includes('--watch')){
  let context = await esbuild.context({
    entryPoints: entryPoints,
    outdir: outdir,
    bundle: true,
    plugins: plugins,
    sourcemap: true,
    publicPath: '/assets',
    logLevel: "info",
    loader: {
      ".png": "file"
    },
  })
  await context.watch();
  console.log('watching...')
}else{
  await esbuild.build({
    entryPoints: entryPoints,
    outdir: outdir,
    bundle: true,
    plugins: plugins,
    sourcemap: true,
    publicPath: '/assets',
    logLevel: "info",
    loader: {
      ".png": "file"
    },
  })
}
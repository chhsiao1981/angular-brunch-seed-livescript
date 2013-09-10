module.exports = (config) ->
  config.set do
    basePath: '../'
    files: [
      'vendor/scripts/jquery/jquery.js'
      'vendor/scripts/angular/angular.js'
      'vendor/scripts/angular-*/angular-*.js'
      'test/vendor/angular-mocks/angular-mocks.js'
      '_public/js/app.js'
      '_public/partials/app/nav.html'
      '_public/**/*.html'
      '_public/*.html'
      'test/unit/**/test1.js'
      'test/unit/**/test_*.ls'
    ]
    frameworks: <[ jasmine ]>
    exclude: []
    logLevel: config.LOG_DEBUG
    reportSlowerThan: 500
    autoWatch: true
    reporters: <[ progress ]>
    junitReporter: 
      outputFile: 'test/test-results.xml'
    port: 3334
    runnerPort: 9100
    browsers: <[ Chrome ]>
    captureTimeout: 5000
    colors: true
    singleRun: false
    urlRoot: '/__karma/'
    preprocessors: 
      '**/*.html': \html2js
      '**/*.ls': \live
    livePreprocessor: 
      options: 
        bare: true

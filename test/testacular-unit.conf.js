basePath = '../'

files = [
  JASMINE,
  JASMINE_ADAPTER,
  'vendor/scripts/jquery-1.8.3.js',
  'vendor/scripts/angular/angular.js',
  'vendor/scripts/angular/angular-*.js',
  'test/vendor/angular/angular-mocks.js',
  '_public/js/app.js',
  '_public/**/*.html',
  '_public/*.html',
  'test/unit/**/test_*.ls'
];

// list of files to exclude
exclude = [];

// level of logging
// possible values: LOG_DISABLE || LOG_ERROR || LOG_WARN || LOG_INFO || LOG_DEBUG
// CLI --log-level debug
logLevel = LOG_INFO;

// report which specs are slower than 500ms
// CLI --report-slower-than 500
reportSlowerThan = 500;

autoWatch = true;

// use dots reporter, as travis terminal does not support escaping sequences
// possible values: 'dots', 'progress', 'junit'
// CLI --reporters progress
reporters = ['progress', 'junit'];

junitReporter = {
  outputFile: 'test/test-results.xml'
};

// web server port
port = 3334;

// cli runner port
runnerPort = 9100;


// Start these browsers, currently available:
// - Chrome
// - ChromeCanary
// - Firefox
// - Opera
// - Safari (only Mac)
// - PhantomJS
// - IE (only Windows)
// CLI --browsers Chrome,Firefox,Safari
browsers = ["Chrome"];

// enable / disable colors in the output (reporters and logs)
colors = true;

singleRun = false;

urlRoot = '/__testacular/';


// compile coffee scripts
preprocessors = {
  '**/*.html': 'html2js',
  '**/*.ls': 'Live'
};


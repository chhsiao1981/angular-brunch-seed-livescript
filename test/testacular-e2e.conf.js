basePath = '../';

files = [
  ANGULAR_SCENARIO,
  ANGULAR_SCENARIO_ADAPTER,
  'app/test_e2e/test_*.ls',
  'app/partials/**/test_e2e/test_*.ls'
];

// list of files to exclude
exclude = [];

// level of logging
// possible values: LOG_DISABLE || LOG_ERROR || LOG_WARN || LOG_INFO || LOG_DEBUG
// CLI --log-level debug
logLevel = LOG_DEBUG;

// report which specs are slower than 500ms
// CLI --report-slower-than 500
reportSlowerThan = 500;

autoWatch = true;

// use dots reporter, as travis terminal does not support escaping sequences
// possible values: 'dots', 'progress', 'junit'
// CLI --reporters progress
reporters = ['progress'];

// Start these browsers, currently available:
// - Chrome
// - ChromeCanary
// - Firefox
// - Opera
// - Safari (only Mac)
// - PhantomJS
// - IE (only Windows)
// CLI --browsers Chrome,Firefox,Safari
browsers = ['Chrome', 'Firefox', 'Safari'];

// enable / disable colors in the output (reporters and logs)
colors = true;

singleRun = false;

urlRoot = '/__testacular/';

proxies = {
  '/': 'http://localhost:3333/'
};

// compile coffee scripts
preprocessors = {
  '**/*.ls': 'Live'
};

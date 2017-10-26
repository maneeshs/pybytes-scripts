const BASE_DIR = '/Users/ccastelli/pycom';

module.exports = {
  /**
   * Application configuration section : http://pm2.keymetrics.io/docs/usage/application-declaration/
   * - env: you'll need to use --env <envname> to tell pm2 to use specific environment defined inside a process file
   * - watch: enable watch & restart feature, if a file change in the folder or subfolder, your app will get reloaded
   * - cwd: the directory from which your app will be launched. Mandatory if the app is not in the same folder as this script
   * - ignore_watch: list of regex to ignore some file or folder names by the watch feature
   *
   * Use pm2 conf for log rotate configuration.
   */
  apps : [
    {
      name      : 'mqtt',
      script    : 'start.js',
      watch     : ["./"],
      watch_options : {
          cwd: `${BASE_DIR}/mqttserver`,
      },
      ignore_watch : ["node_modules", ".git"],
      kill_timeout : 3000,
      max_restarts: 3,
      cwd       : `${BASE_DIR}/mqttserver`,
      log_date_format : "YYYY-MM-DD HH:mm:ss",
      env: {
        PROCESS_FILE: 'mqtt',   // process title, useful for ps -fC name
        NODE_ENV: 'development',
      },
      env_production : {
        NODE_ENV: 'production'
      }
    },
    {
      name      : 'pyauth',
      script    : 'bin/www',
      watch     : ["./"],
      watch_options : {
          cwd: `${BASE_DIR}/pyauth`,
      },
      ignore_watch : ["node_modules", ".git"],
      kill_timeout : 3000,
      max_restarts: 3,
      cwd       : `${BASE_DIR}/pyauth`,
      log_date_format : "YYYY-MM-DD HH:mm:ss",
      env: {
        PORT: '3200',
        PROCESS_FILE: 'pyauth',   // process title, useful for ps -fC name
        NODE_ENV: 'development',
        DEBUG: 'pyauth:*'
      },
      env_production : {
        NODE_ENV: 'production'
      }
    },
    {
      name      : 'pybill',
      script    : 'start.js',
      watch     : ["./"],
      watch_options : {
          cwd: `${BASE_DIR}/pybill`,
      },
      ignore_watch : ["node_modules", ".git"],
      kill_timeout : 3000,
      max_restarts: 3,
      cwd       : `${BASE_DIR}/pybill`,
      log_date_format : "YYYY-MM-DD HH:mm:ss",
      env: {
        PROCESS_FILE: 'pybill',   // process title, useful for ps -fC name
        NODE_ENV: 'development',
      },
      env_production : {
        NODE_ENV: 'production'
      }
    },
    {
      name      : 'web-backend',
      script    : 'bin/www',
      watch     : ["./"],
      watch_options : {
          cwd: `${BASE_DIR}/pybytes-api`,
      },
      ignore_watch : ["node_modules", ".git"],
      cwd       : `${BASE_DIR}/pybytes-api`,
      log_date_format : "YYYY-MM-DD HH:mm:ss",
      max_restarts: 3,
      env: {
        PROCESS_FILE: 'web-backend',   // process title, useful for ps -fC name
        NODE_ENV: 'development',
        PORT: '3000',
        DEBUG: 'app:*,token:*'
      },
      env_production : {
        NODE_ENV: 'production'
      }
    },
    // no watch for this app, hot reloader takes care of this
    {
      name      : 'web-frontend',
      script    : 'scripts/start.js',
      args : 'start',
      watch: false,
      max_restarts: 3,
      cwd       : `${BASE_DIR}/pybytes-react`,
      log_date_format : "YYYY-MM-DD HH:mm:ss",
      env: {
        PROCESS_FILE: 'web-frontend',   // process title, useful for ps -fC name
        NODE_ENV: 'development',
        PORT: '3001'
      },
      env_production : {
        NODE_ENV: 'production'
      }
    },
  ],

  /**
   * Deployment section
   * http://pm2.keymetrics.io/docs/usage/deployment/

  deploy : {
    production : {
      user : 'node',
      host : '212.83.163.1',
      ref  : 'origin/master',
      repo : 'git@github.com:repo.git',
      path : '/var/www/production',
      'post-deploy' : 'npm install && pm2 reload ecosystem.config.js --env production'
    },
    dev : {
      user : 'node',
      host : '212.83.163.1',
      ref  : 'origin/master',
      repo : 'git@github.com:repo.git',
      path : '/var/www/development',
      'post-deploy' : 'npm install && pm2 reload ecosystem.config.js --env dev',
      env  : {
        NODE_ENV: 'dev'
      }
    }
  }   */
};

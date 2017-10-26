# Pybytes Scripts
Utility scripts for Pybytes microservices

For speeding up launching of all microservices in development (and also in
production) mode, we can use a configuration file (`ecosystem.config.js`) for
[PM2](http://pm2.keymetrics.io/), a process manager for Node.js.

Just open that file and rename the base directory's path to your local Pycom
workspace (assuming you've put all projects inside one directory). Then to
launch all microservices, just do `pm2 start ecosystem.config.js`.

**Note**: for all processes but pybytes-react is enabled watching feature, so
every change in these project's files triggers a restart of the application.
For pybytes-react is up to React Hot Loader module to synchronize changes to
your browser.

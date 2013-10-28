#This file requires and configures the Winston Module
#to use the default logger. Subsequent calls to the 
#Winston Module will automatically use this configured 
#logger

winston = require 'winston'

log_level       = 'debug'
colorize_logs   = true

winston.loggers.add 'gocoin-js',
  console :
    level : log_level
    colorize : colorize_logs
    label : 'GoCoin-JS'

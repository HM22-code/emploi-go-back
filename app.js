var createError = require('http-errors');
var express = require('express');
var path = require('path');
var cookieParser = require('cookie-parser');
var logger = require('morgan');
var { specs, swaggerUi } = require('./swagger');
const dotenv = require('dotenv')

// routers setup
var indexRouter = require('./routes/indexRouter');
var usersRouter = require('./routes/userRouter');
var markersRouter = require('./routes/markerRouter');

var app = express();

// global configuration access setup
dotenv.config()

// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'pug');

// middlewares setup
app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));
app.use('/api-docs', swaggerUi.serve, swaggerUi.setup(specs));
app.use('/', indexRouter);
app.use('/users', usersRouter);
app.use('/markers', markersRouter);

// catch 404 and forward to error handler
app.use(function(req, res, next) {
  next(createError(404));
});

// error handler
app.use(function(err, req, res, next) {
  // set locals, only providing error in development
  res.locals.message = err.message;
  res.locals.error = req.app.get('env') === 'development' ? err : {};
  // render the error page
  res.status(err.status || 500);
  res.render('error');
});

// log server port
const PORT = process.env.PORT || 3000;
console.log(`Server is running on port ${PORT}: http://localhost:${PORT}`);

module.exports = app;

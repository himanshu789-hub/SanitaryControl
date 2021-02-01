const gulp = require('gulp');
const cleanCSS = require('gulp-clean-css');
const gulpRename = require('gulp-rename');
const outputDirctory = './../wwwroot/dist';

gulp.task('minify', function () {
	return gulp
		.src('./src/css/*.css')
		.pipe(cleanCSS())
		.pipe(gulpRename({ suffix: '.min' }))
		.pipe(gulp.dest(outputDirctory));
});
gulp.task('copy', function () {
	return gulp.src('./src/css/*.css').pipe(gulp.dest(outputDirctory));
});

gulp.task('watch', function () {
	gulp.watch('./src/css/*.css', gulp.series(['copy', 'minify']));
});

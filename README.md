# pw-profile-striped
Responsive Travel Blog Template for the [ProcessWire](https://processwire.com) OpenSource CMS.

## Basics
This blog profile is built upon kongondo's blog module, but a lot of things have been changed, removed or extended. The layout was taken from the free [Striped](https://html5up.net/striped) responsive template at [html5up.net](https://html5up.net/). It used a small number of third party modules like justb3a's [Simple Contact Form](https://modules.processwire.com/modules/simple-contact-form/).

The target group for this site profile are travel bloggers that want to have a feature rich layout and the option to list and read posts in ascending chronological order (something that most blog designs, no matter on which platform, are sorely lacking).

![Screenshot](https://bitpoet.github.io/img/travel-blog-home.png)

## Installation

This is a complete ProcessWire site profile.

It requires ProcessWire version >= 3.0.82.

To install it, download a fresh copy of ProcessWire from the [download page](https://processwire.com/download/) and extract it into your web server folder (either root or a subdirectory, though don't forget to edit your .htaccess after installation in the latter case).

Download a [zipped copy of this repository](https://github.com/BitPoet/pw-profile-striped/archive/master.zip) and extract the site-blog-striped folder into the ProcessWire installation's root folder.

Point your web browser at the url of your installation and follow the wizard. Select "Striped Travel Blog Template (Responsive)" when prompted to select a profile.

## Setting up your blog

- Adjust the settings on the Settings page, this is where most of the generic settings that affect the whole blog are kept (title, copyright, color settings, logo, result limits, widgets, email for contact form etc.)
- You should create an extra user for blogging with blog-author and page-edit permissions (or multiple users). Put the name that should be displayed on the frontend in the Display name field
- Start blogging

## The Home page

The home page shows a three-column layout with images and teasers. The image shown is the first image (or a grey box if none found) for the post. You can sort the post's images in the backend page editor.

Posts have a "Blog Sticky Flag for Home" checkbox. Posts with this flag are always shown first on the home page, so if you check that box in too many posts, other, newer posts won't make their way onto the home page!

## The Search

The built-in search searches through title, summary and body of posts. If multiple terms are entered, all of them have to be found, but they may be spread over multiple fields.

## Post Lists

All post lists are limited to show only as many excerpts as configured in the Settings page at one and provide pagination. This pagination is built upon ProcessWire's built-in pagination modules but uses a bit of hackery behind the scenes to make it adhere to the styles provided with the Striped theme.

## Advanced

- You can sort the order of widgets in the settings page
- To create a new sidebar widget:
  * create a new php file blog-WIDGETNAME.php in site/templates
  * create a new template for that in the backend using the same fields as blog-widget-basic
  * edit your php file, it needs to return:
    - a wrapping tag "section" with css class "box"
    - inside that, a "header" tag (if you want to show a headline for your widget) with the h2 tag containing the label
    - the html for the widget content
    - you can look into the shipped widgets like blog-recent-posts.php, blog-recent-comments.php, blog-copyright.php etc. for inspiration
  * create a new page under Widgets with your template and publish it
  * add the new widget page to the widgets on the Settings page

## Files

Feel free to adapt the styles/blog.css and styles/blog.js files in the templates directory to your liking.

The "assets" dir inside templates comes from the HTML5 template used and was copied as-is.

## License

Feel free to use this blog profile as you like.

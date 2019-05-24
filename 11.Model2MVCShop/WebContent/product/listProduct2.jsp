<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html>

<head>
	<meta charset="EUC-KR">
			
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--   jQuery , Bootstrap CDN  -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
</head>

<body>
<div class="bs-docs-section" id="plugin-section">
    <button class="btn btn-default toggle" type="button">Toggle all</button>
    <h1 id="plugins" class="page-header">jQuery plugins</h1>

    <p class="lead">Choose which jQuery plugins should be included in your custom JavaScript files. Unsure what to include? Read the <a href="/docs/3.4/javascript/">JavaScript</a> page in the docs.</p>
    <div class="row">
      <div class="col-lg-6">
        <h4>Linked to components</h4>
        <div class="checkbox">
          <label>
            <input type="checkbox" checked value="alert.js">
            Alert dismissal
          </label>
        </div>
        <div class="checkbox">
          <label>
            <input type="checkbox" checked value="button.js">
            Advanced buttons
          </label>
        </div>
        <div class="checkbox">
          <label>
            <input type="checkbox" checked value="carousel.js">
            Carousel functionality
          </label>
        </div>
        <div class="checkbox">
          <label>
            <input type="checkbox" checked value="dropdown.js">
            Dropdowns
          </label>
        </div>
        <div class="checkbox">
          <label>
            <input type="checkbox" checked value="modal.js">
            Modals
          </label>
        </div>
        <div class="checkbox">
          <label>
            <input type="checkbox" checked value="tooltip.js">
            Tooltips
          </label>
        </div>
        <div class="checkbox">
          <label>
            <input type="checkbox" checked value="popover.js" data-dependencies="tooltip.js">
            Popovers <small>(requires Tooltips)</small>
          </label>
        </div>
        <div class="checkbox">
          <label>
            <input type="checkbox" checked value="tab.js">
            Togglable tabs
          </label>
        </div>
      </div>
      <div class="col-lg-6">
        <h4>Magic</h4>
        <div class="checkbox">
          <label>
            <input type="checkbox" checked value="affix.js">
            Affix
          </label>
        </div>
        <div class="checkbox">
          <label>
            <input type="checkbox" checked value="collapse.js">
            Collapse
          </label>
        </div>
        <div class="checkbox">
          <label>
            <input type="checkbox" checked value="scrollspy.js">
            Scrollspy
          </label>
        </div>
        <div class="checkbox">
          <label>
            <input type="checkbox" checked value="transition.js">
            Transitions <small>(required for any kind of animation)</small>
          </label>
        </div>
      </div>
    </div>
</body>
</html>
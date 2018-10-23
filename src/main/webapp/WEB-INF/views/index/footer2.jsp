<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

/* Footer */
#footer{
width:100%;
}
.footer1 { background: #232323; padding:30px 0 0 0;font-size: 12px; color: #999; width:100%;}
.footer1 a { color: #ccc; }
.footer1 a:hover {color: #fff; }
.footer1 .widget { margin-bottom:30px; }		
.footer1 .widget-title { font-size: 17px; font-weight: bold; color: #ccc; margin: 0 0 20px; }
.footer1 .entry-meta { border-top: 1px solid #ccc; border-bottom: 1px solid #ccc; margin: 0 0 35px 0; padding: 2px 0; color: #888888; font-size: 12px; font-size: 0.75rem; }
.footer1 .entry-meta a { color: #333333; }
.footer1 .entry-meta .meta-in { border-top: 1px solid #ccc; border-bottom: 1px solid #ccc; padding: 10px 0; }
.follow-me-icons { font-size:30px; }		
.follow-me-icons i { float:left; margin:0 10px 0 0; }		

.footer2 { background: #191919; padding: 15px 0; color: #777; font-size: 12px; width:100%}
.footer2 a { color: #aaa; }
.footer2 a:hover { color: #fff; }
.footer2 p { margin: 0; }
.widget-simplenav { margin-left:-5px; }		
.widget-simplenav a{ margin:0 5px; }	
	
</style>
</head>
<body>
<div id="footer">
	<div class="footer2">
			<div class="container">
				<div class="row">
					
					<div class="col-md-6 widget">
						<div class="widget-body">
							<p class="simplenav">
								<a href="#">Home</a> | 
								<a href="about.html">About</a> |
								<a href="sidebar-right.html">Sidebar</a> |
								<a href="contact.html">Contact</a> |
								<b><a href="signup.html">Sign up</a></b>
							</p>
						</div>
					</div>

					<div class="col-md-6 widget">
						<div class="widget-body">
							<p class="text-right">
								Copyright &copy; 2014, Your name. Designed by <a href="http://gettemplate.com/" rel="designer">gettemplate</a> 
							</p>
						</div>
					</div>

				</div> <!-- /row of widgets -->
			</div>
		</div>
		<div class="footer1">
			<div class="container">
				<div class="row">
					
					<div class="col-md-3 widget">
						<h3 class="widget-title">Contact</h3>
						<div class="widget-body">
							<p>+234 23 9873237<br>
								<a href="mailto:#">some.email@somewhere.com</a><br>
								<br>
								234 Hidden Pond Road, Ashland City, TN 37015
							</p>	
						</div>
					</div>

					<div class="col-md-3 widget">
						<h3 class="widget-title">Follow me</h3>
						<div class="widget-body">
							<p class="follow-me-icons">
								<a href=""><i class="fab fa-twitter"></i></a>
								<a href=""><i class="fab fa-dribbble"></i></a>
								<a href=""><i class="fab fa-github"></i></a>
								<a href=""><i class="fab fa-facebook-square"></i></a>
							</p>	
						</div>
					</div>

					<div class="col-md-6 widget">
						<h3 class="widget-title">Text widget</h3>
						<div class="widget-body">
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Excepturi, dolores, quibusdam architecto voluptatem amet fugiat nesciunt placeat provident cumque accusamus itaque voluptate modi quidem dolore optio velit hic iusto vero praesentium repellat commodi ad id expedita cupiditate repellendus possimus unde?</p>
							<p>Eius consequatur nihil quibusdam! Laborum, rerum, quis, inventore ipsa autem repellat provident assumenda labore soluta minima alias temporibus facere distinctio quas adipisci nam sunt explicabo officia tenetur at ea quos doloribus dolorum voluptate reprehenderit architecto sint libero illo et hic.</p>
						</div>
					</div>

				</div> <!-- /row of widgets -->
			</div>
		</div>
</div>
	


</body>
</html>
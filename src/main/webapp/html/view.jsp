<%@include file="init.jsp"%>

This is the <b>My Super Cool Portlet</b>.

<portlet:resourceURL var="nameResourceURL">
	<portlet:param name="javax.portlet.action" value="sayMyName" />
</portlet:resourceURL>

<portlet:resourceURL var="emailResourceURL">
	<portlet:param name="javax.portlet.action" value="sayMyEmail" />
</portlet:resourceURL>

<aui:form>
	<aui:input type="text" name="name" />
	<aui:input type="text" name="email" />

	<aui:button-row>
		<aui:button type="button" id="nameButton" value="ajax-say-my-name" />
		<aui:button type="button" id="emailButton" value="ajax-say-my-email" />
	</aui:button-row>
</aui:form>

<aui:layout id="feedback" />

<aui:script use="event, node, request">

	var nameButton = A.one("#nameButton");
	var emailButton = A.one("#emailButton");

	nameButton.on('click', function(event) {
		A.io.request('<%= nameResourceURL %>', {
			dataType : 'json',
			method : 'POST',
			data : {
				<portlet:namespace />name : A.one("#<portlet:namespace />name")
						.get('value'),
				<portlet:namespace />email : A.one(
						"#<portlet:namespace />email").get('value')
			},
			on : {
				success : function() {
					var data = this.get('responseData');
					var dataReceivedSuccess = data.dataReceivedMessage;
					var name = data.MyName;
					A.one("#feedback").html(
							'<p>Message: <strong>' + dataReceivedSuccess
									+ '</strong></p>'
									+ '<p>Your Name: <strong>' + name
									+ '</strong></p>');
				}
			}
		});
	});
	
	emailButton.on('click', function(event) {
		A.io.request('<%= emailResourceURL %>', {
			dataType : 'json',
			method : 'POST',
			data : {
				<portlet:namespace />name : A.one("#<portlet:namespace />name")
						.get('value'),
				<portlet:namespace />email : A.one(
						"#<portlet:namespace />email").get('value')
			},
			on : {
				success : function() {
					var data = this.get('responseData');
					var dataReceivedSuccess = data.dataReceivedMessage;
					var email = data.MyEmail;
					A.one("#feedback").html(
							'<p>Message: <strong>' + dataReceivedSuccess
									+ '</strong></p>'
									+ '<p>Your Email: <strong>' + email
									+ '</strong></p>');
				}
			}
		});
	});

	
</aui:script>
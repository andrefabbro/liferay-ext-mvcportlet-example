# Example of use of MVCPortlet Extension 

This project is an example of use for https://github.com/andrefabbro/liferay-ext-mvcportlet

## Setup

Build and install the [MVCPortlet Extension](https://github.com/andrefabbro/liferay-ext-mvcportlet) component.

Don't forget to set a profile in your maven settings (~/.m2/settings.xml) like follows:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<profiles>
	<profile>
	  <id>Liferay-Tomcat-7.0.62</id>
	  <properties>
	    <liferay.auto.deploy.dir>PATH_TO_YOUR_LIFERAY_INSTANCE/deploy</liferay.auto.deploy.dir>
	    <liferay.app.server.deploy.dir>PATH_TO_YOUR_LIFERAY_INSTANCE/tomcat-7.0.62/webapps</liferay.app.server.deploy.dir>
	    <liferay.app.server.lib.global.dir>PATH_TO_YOUR_LIFERAY_INSTANCE/tomcat-7.0.62/lib/ext</liferay.app.server.lib.global.dir>
	    <liferay.app.server.portal.dir>PATH_TO_YOUR_LIFERAY_INSTANCE/tomcat-7.0.62/webapps/ROOT</liferay.app.server.portal.dir>
	  </properties>
	</profile>
</profiles>
```
(replace *PATH_TO_YOUR_LIFERAY_INSTANCE* for your local liferay instance's path)

## Deploy

Run the follow maven command, replacing the profile argument as you've named in settings.xml:
```bash
mvn package liferay:deploy -P Liferay-Tomcat-7.0.62
```


environments {
    production {
        grails.gsp.enable.reload = true
        //def classpaths = "${appName}/WEB-INF/grails-app";
        //grails.reload.location = classpaths
        //System.setProperty("basdire.", classpaths)
        //grails.serverURL = "http://www.changeme.com"
    }
    development {
        //grails.serverURL = "http://localhost:8080/${appName}"
    }
    test {
        //grails.serverURL = "http://localhost:8080/${appName}"
    }
}

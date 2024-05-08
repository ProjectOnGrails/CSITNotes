package csitnotes

import com.CSITNotes.Requestmap

class BootStrap {
    def setUpService
    def springSecurityService
    def init = { servletContext ->
        for (String url in [
                '/', '/error', '/index', '/index.gsp', '/**/favicon.ico', '/shutdown',
                '/**/js/**', '/**/css/**', '/**/images/**',
                '/login', '/login.*', '/login/*',
                '/logout', '/logout.*', '/logout/*']) {
            new Requestmap(url: url, configAttribute: 'permitAll').save()
        }
        new Requestmap(url: '/noteUser/**',      configAttribute: 'ROLE_ADMIN').save()
        springSecurityService.clearCachedRequestmaps()
        setUpService.startMethod()
    }

    def destroy = {
    }
}

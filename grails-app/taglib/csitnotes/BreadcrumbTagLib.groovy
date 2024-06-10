package csitnotes

class BreadcrumbTagLib {

    static namespace = "breadcrumb"

    def breadcrumbs = { attrs ->
        def currentPage = attrs.currentPage
        def semesterId = attrs.semesterId

        def homeLink = createLink(uri: "/")
        def resourceLink = createLink(controller: "resource", action: "index", params: [semesterId: semesterId])

        out << "<div id=\"breadcrumbs\">"
        out << "<a href=\"${homeLink}\">Home</a> > "
        out << "<a href=\"${resourceLink}\">Resources</a> > "
        out << "<span id=\"currentResource\">${currentPage}</span>"
        out << "</div>"
    }

}
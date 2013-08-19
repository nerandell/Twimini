<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String heading= request.getParameter("heading");
    String message= request.getParameter("message");
    String errorCode= request.getParameter("errorCode");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <%@ include file="includes/tabImage.jsp" %>
    <meta charset="utf-8">
    <title>MiniTwitter - Page not found</title>
    <meta name="description" content="MiniTwitter - Ideas you care about">
    <link href="/w8_admin/bootstrap/css/bootstrap.css" rel="stylesheet" />

</head>
<body>
<div id="notify-wrapper">
</div>
<div class="container" id="main-page-container">
    <div class="row">
        <div class="span12">

            <%@ include file="includes/simpleLogoHeaderWithSignUpDropdown.jsp"%>

            <div id="page-content">
                <div class="span8 offset2" id="sub-content-container">
                    <div class="page-content-sub-heading pagination-centered">
                        <h3>
                            <%----------------------%>
                            <c:choose>
                                <c:when test="${heading != null}"> ${heading}
                                </c:when>

                                <c:otherwise>Oops!
                                </c:otherwise>
                            </c:choose>
                            <%----------------------%>
                        </h3>
                    </div>
                    <div class="biggify text-center little-margin-top-bottom" >
                        <%----------------------%>
                        <c:choose>
                            <c:when test="${message != null}"> ${message}
                            </c:when>

                            <c:otherwise>Seems like you were looking for something else. No worries, happens!
                            </c:otherwise>
                        </c:choose>
                        <%----------------------%>
                        <div class="biggify text-center little-margin-top-bottom" >
                            <%----------------------%>
                            <c:choose>
                                <c:when test="${errorCode != null}"> ${errorCode}
                                </c:when>

                                <c:otherwise>404
                                </c:otherwise>
                            </c:choose>
                            <%----------------------%>
                        </div>
                    </div>
                </div>
            </div>

            <%@ include file="includes/simpleFooter.jsp"%>

        </div>
    </div>
</div>

<!--basic scripts-->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript">
    window.jQuery || document.write("<script src='themes/js/jquery-1.9.1.min.js'>"+"<"+"/script>");
</script>
<script src="/w8_admin/bootstrap/js/bootstrap.min.js"></script>

<%--page-specific scripts--%>
<script src="/w8_admin/js/pageContentMinHeight.js"></script>
<script src="/w8_admin/js/dropdownToggle.js"></script>
<script>
    $(document).load(adjustPageContentHeight());
</script>

</body>
</html>
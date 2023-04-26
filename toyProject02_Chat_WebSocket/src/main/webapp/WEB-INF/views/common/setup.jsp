<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<c:set var="root" value="${pageContext.request.contextPath }" />

<c:set var="URL" value="${pageContext.request.requestURL}" />


<c:set var="endPoind" value="${fn:indexOf(URL, root)}" />

<c:set var="wsURL" value="${fn:substring(URL, 7, endPoind) }${root}" />


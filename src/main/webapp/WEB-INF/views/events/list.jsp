<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib tagdir="/WEB-INF/tags/dates" prefix="d" %>

<h2>Upcoming Events</h2>

<c:if test="${not empty eventList}">
	<dl>
	<c:forEach items="${eventList}" var="event">
		<s:url value="/groups/{group}/events/{year}/{month}/{name}" var="eventUrl">
			<s:param name="group" value="${event.groupProfileKey}" />
			<s:param name="year" value="${event.startTime.year}" />
			<s:param name="month" value="${event.startTime.monthOfYear}" />
			<s:param name="name" value="${event.name}" />
		</s:url>
		<dt class="event">
			<a href="${eventUrl}"><c:out value="${event.title}" escapeXml="true"/></a> <br/>
			<span class="locationAndDate">
				<d:dateRange startTime="${event.startTime}" endTime="${event.endTime}" /> - 
				<c:out value="${event.location}" escapeXml="true"/>
			</span>
		</dt>
		<dd class="event">
			<c:out value="${event.description}" escapeXml="true" />
		</dd>
	</c:forEach>
	</dl>
</c:if>

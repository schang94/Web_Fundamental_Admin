<%@ page pageEncoding="EUC-KR"%>
<%-- 
<%
								
								if(paging%10 == 0){
									paging = (paging/10 - 1)*10 + 1;
								} else{
									paging = (paging/10)*10 +1;
								}
								int pageMax = 0;
								if((paging/10+1)*100 > count){
									if(count%10 == 0) {
										pageMax = (count%100)/10;
									} else {
										pageMax = (count%100)/10 + paging;
									}
								} else  {
									pageMax = (paging/10+1)*10;
								}%>
								
								<%if(paging > 10) { %>
								<li class="page-item"><a class="page-link"
									href="list.jsp?page=<%=paging - 1%>" tabindex="-1">&laquo;</a></li>
								<%} %>
								<% for(int i = paging ;i <= pageMax ;i++){%>
									<li class=">page-item">
									<a class="page-link " 
										href=<%if(i==tempPage){%>"javascript:void(0);"<%}else{%>"list.jsp?page=<%=i%>"<%}%>><%=i%></a></li>
									<% if(pageMax==i && pageMax*10 < count){%>
										<li class="page-item"><a class="page-link" href="list.jsp?page=<%=paging+10%>">&raquo;</a>
								</li>
									<%}
								} %>
								
			--%>					
<%
if Session("grantAccess") <> 1 then 
	Response.Redirect "login.html"
end if
%>

<HTML>
<HEAD>
<TITLE></TITLE>
</HEAD>
<BODY>
<CENTER>
<TABLE WIDTH=600>


			<%			total_reached=0
			total_notreached=0			
			Set sqlconnection = Server.CreateObject("ADODB.Connection")			Set rs = Server.CreateObject("ADODB.recordset")
						sqlconnection.ConnectionTimeout=60
			sqlconnection.Open session("dbColonDSN"),session("dbUsername"),session("dbPassword")
			
			rs.Open "SELECT subQ1.id as id, subQ1.text as text, subQ2.goods as reached, subQ1.bads as notreached, (subQ2.goods+subQ1.bads) as total, ((subQ2.goods*1.0)/(subQ2.goods+subQ1.bads))*100 as pcent FROM (SELECT physicians.id, physicians.text, COUNT(colonoscopy.advancedupto) as bads FROM physicians, colonoscopy WHERE physicians.id > 0 AND physicians.id=colonoscopy.attendingphysician AND colonoscopy.advancedupto NOT LIKE 'the cecum' AND colonoscopy.operationdate BETWEEN '" + Request("startdate") +"' AND '" + Request("enddate") +"' GROUP BY physicians.text, physicians.id) subQ1, (SELECT physicians.id, physicians.text, COUNT(colonoscopy.advancedupto) as goods FROM physicians, colonoscopy WHERE physicians.id > 0 AND physicians.id=colonoscopy.attendingphysician AND colonoscopy.advancedupto LIKE 'the cecum' AND colonoscopy.operationdate BETWEEN '" + Request("startdate") +"' AND '" + Request("enddate") +"' GROUP BY physicians.text, physicians.id) subQ2 where subQ1.id=subQ2.id order by " + Request("orderByStr"), sqlconnection
			
			if (not rs.EOF) then
				do until rs.EOF
					total_reached=total_reached+rs.Fields("reached")
					total_notreached=total_notreached+rs.Fields("notreached")
					Response.Write "<TR>" + vbcrlf
					Response.Write "<TD width=200><B>" + rs.Fields("text")+ "<B></TD>" + vbcrlf
					Response.Write "<TD width=100><CENTER>" + CStr(rs.Fields("reached"))+ "<B></CENTER></TD>" + vbcrlf
					Response.Write "<TD width=150><CENTER>" + CStr(rs.Fields("notreached"))+ "<B></CENTER></TD>" + vbcrlf
					Response.Write "<TD width=150><CENTER>" + CStr(rs.Fields("total"))+ "<B></CENTER></TD>" + vbcrlf
					Response.Write "<TD width=100><CENTER><B>" + left(CStr(rs.Fields("pcent")),2) + "%</B></CENTER></TD>" + vbcrlf
					Response.Write "</TR>" + vbcrlf
					rs.MoveNext
				loop
				Response.Write "</TABLE>" + vbcrlf
				Response.Write "<BR>" + vbcrlf
				Response.Write "<TABLE WIDTH=600>" + vbcrlf
				Response.Write "<TR>" + vbcrlf
				Response.Write "<TD width=200><FONT size=-1><B>Totals:</B></FONT></TD>" + vbcrlf
				Response.Write "<TD width=100><CENTER><FONT size=-1><B>" + CStr(total_reached) + "</B></FONT></CENTER></TD>" + vbcrlf
				Response.Write "<TD width=150><CENTER><FONT size=-1><B>" + CStr(total_notreached) + "</B></FONT></CENTER></TD>" + vbcrlf
				Response.Write "<TD width=150><CENTER><FONT size=-1><B>" + CStr((total_notreached+total_reached)) + "</B></FONT></CENTER></TD>" + vbcrlf
				Response.Write "<TD width=100><CENTER><FONT size=-1><B>" + Left(CStr(100*(CInt(total_reached)/(CInt(total_notreached)+CInt(total_reached)))),2) + "%</B></FONT></CENTER></TD>" + vbcrlf
			else
				Response.Write "</TABLE>" + vbcrlf
				Response.Write "<BR>" + vbcrlf
				Response.Write "<TABLE WIDTH=600>" + vbcrlf
				Response.Write "<TR>" + vbcrlf
				Response.Write "<TD width=200><FONT size=-1><B>No data found!</B></FONT></TD>" + vbcrlf
			end if

			rs.close
			sqlconnection.close
			%>
			
			
</TR>
</TABLE>
</CENTER>
</BODY>
</HTML>

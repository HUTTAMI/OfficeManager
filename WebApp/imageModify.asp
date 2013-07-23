<%
if Session("grantAccess") <> 1 then 
	Response.Redirect "login.html"
end if
%>

<%			
			Set sqlconnection = Server.CreateObject("ADODB.Connection")			Set rs = Server.CreateObject("ADODB.recordset")
						sqlconnection.ConnectionTimeout=60
			sqlconnection.Open session("dbColonDSN"),session("dbUsername"),session("dbPassword")

			rs.Open "SELECT photoid,CAST(operationid as varchar(50)) as operationid,photocaption,CAST(filename as varchar(50)) as filename, location, distance, object FROM operation_pics where filename like '"+request("imageFileName")+"'", sqlconnection
			
			
			if (not rs.EOF) then
				dbphotoid=cstr(rs("photoid"))
				dbphotocaption=rs("photocaption")
				dboperationid=rs("operationid")
				dbfilename=rs("filename")
				dblocation=rs("location")
				dbdistance=rs("distance")
				dbobject=rs("object")
				dbphotoid=rs("photoid")
			end if

			rs.close
			
			if (session("optype")="colonoscopy") then
			rs.Open "SELECT text FROM id_objecttaken", sqlconnection			else
			rs.Open "SELECT text FROM id_egd_objecttaken", sqlconnection			end if
			
			
			do while (not rs.EOF)
				objectArray=objectArray+"'" + replace(Lcase(Trim(rs("text"))),"'","") + "',"
				rs.MoveNext
			loop
			objectArray=left(objectArray,len(objectArray)-1)
			rs.close		
				if (session("optype")="colonoscopy") then
			rs.Open "SELECT text FROM id_location", sqlconnection			else
			rs.Open "SELECT text FROM id_egd_location", sqlconnection			end if
			
			
			do while (not rs.EOF)
				locationArray=locationArray+"'" + replace(Lcase(Trim(rs("text"))),"'","") + "',"
				rs.MoveNext
			loop
			locationArray=left(locationArray,len(locationArray)-1)
			rs.close	
			
			sqlconnection.close
			%>

<HTML>
<HEAD>
<script>
var dbobject;
var dblocation;

function varInit() {
dbobject = new Array(<%=objectArray%>);
dblocation = new Array(<%=locationArray%>);
}

function autocomplete(n,array_name){
	if (array_name=="dbobject") {
		ac_array=dbobject;
	}
	else {
		ac_array=dblocation;
	}

    if (n.value == "") return 0;
    if (event.keyCode == 8 && n.backspace){
        n.value = n.value.substr(0,n.value.length-1);
        n.backspace = false;
		return 0;
    }

    var r = n.createTextRange();
    tmp=n.value.toLowerCase();
    if (tmp == "")return 0;
    for (z=0;z<ac_array.length;z++){
        tmp2 = ac_array[z];
        count = 0;
        for (i = 0;i<tmp.length;i++){
            if (tmp2.charAt(i) == tmp.charAt(i)){
                count++
            }
        }
        if (count == tmp.length){
            diff = tmp2.length - tmp.length;
            if (diff <= 0) break;
            kap = "";
            for (i=0;i<tmp2.length;i++){
                if (i >= tmp.length) kap += tmp2.charAt(i);
            }
            n.backspace = true;
            r.text += kap;
            r.findText(kap,diff*-2);
            r.select();
            return 0;
        }
    }
    n.backspace = false;

    return 0;
}
</script>
<TITLE></TITLE>
</HEAD>
<BODY bgcolor=lightgrey scroll=no onload="varInit();">
<FORM action="imageModifySubmit.asp" method=POST id=imageModify name=imageModify>
<TABLE WIDTH="100%" BORDER=0 CELLSPACING=1 CELLPADDING=1>
	<TR>
		<TD width=220 valign=top><IMG style="WIDTH: 220px" alt="<%=session("imageURL")+dbfilename%>" src="<%=session("imageURL")+dbfilename%>" width=220></TD>
		<TD valign=top>
		<TABLE WIDTH="100%" BORDER=0 CELLSPACING=1 CELLPADDING=1>
			<TR>
				<TD><FONT size=+1><B>Caption</B></FONT></TD>
				<TD><INPUT id=dbphotocaption name=dbphotocaption style="FONT-SIZE: larger; WIDTH: 300px; HEIGHT: 30px" size=25 value="<%=dbphotocaption%>"></TD>
			</TR>
			<TR>
				<TD><FONT size=+1><B>Location</B></FONT></TD>
				<TD><INPUT id=dblocation style="FONT-SIZE: larger; WIDTH: 300px; HEIGHT: 30px" size=25 name=dblocation value="<%=dblocation%>"onkeyup="autocomplete(this,'dblocation'); document.forms(0).item('dbphotocaption').value=document.forms(0).item('dbobject').value+' in '+document.forms(0).item('dblocation').value+' at '+document.forms(0).item('dbdistance').value+'cm';"></TD>
			</TR>
			<TR>
				<TD><FONT size=+1><B>Object</B></FONT></TD>
				<TD><INPUT id=dbobject style="FONT-SIZE: larger; WIDTH: 300px; HEIGHT: 30px" size=25 name=dbobject value="<%=dbobject%>" onkeyup="autocomplete(this,'dbobject'); document.forms(0).item('dbphotocaption').value=document.forms(0).item('dbobject').value+' in '+document.forms(0).item('dblocation').value+' at '+document.forms(0).item('dbdistance').value+'cm';"></TD>
			</TR>
			<TR>
				<TD><FONT size=+1><B>Centimeters</B></FONT></TD>
				<TD><INPUT id=dbdistance style="FONT-SIZE: larger; WIDTH: 300px; HEIGHT: 30px" size=25 name=dbdistance value="<%=dbdistance%>" onkeyup=" document.forms(0).item('dbphotocaption').value=document.forms(0).item('dbobject').value+' in '+document.forms(0).item('dblocation').value+' at '+document.forms(0).item('dbdistance').value+'cm';"></TD>
			</TR>
		</TABLE>
		<TABLE width="100%" border=0 CELLSPACING=0 CELLPADDING=0>
			<TR>
				<TD><INPUT id=exitBtn style="FONT-WEIGHT: bold; FONT-SIZE: larger; WIDTH: 105px; COLOR: white; FONT-FAMILY: monospace; HEIGHT: 76px; BACKGROUND-COLOR: black" type=button size=31 value="EXIT" name=exitBtn onclick="document.location.href='test2.htm?updatePreview'"></TD>
				<TD align=middle><INPUT id=nextBtn style="FONT-WEIGHT: bold; FONT-SIZE: larger; WIDTH: 105px; COLOR: black; FONT-FAMILY: monospace; HEIGHT: 76px; BACKGROUND-COLOR: red" type=button size=31 value="Delete" name=nextBtn onclick="if (confirm('Delete this image?')) {document.location.href='test2.htm?deleteImage=<%=request("imageFileName")%>';}"></TD>
				<TD align=right><INPUT id=nextBtn style="FONT-WEIGHT: bold; FONT-SIZE: larger; WIDTH: 105px; COLOR: black; FONT-FAMILY: monospace; HEIGHT: 76px" type=submit size=31 value="Ok" name=nextBtn></TD>
			</TR>
		</TABLE>
		</TD>
	</TR>
</TABLE>
<INPUT type="hidden" id=dbphotoid name=dbphotoid value="<%=dbphotoid%>">
<INPUT type="hidden" id=dbfilename name=dbfilename value="<%=dbfilename%>">
</FORM>
</BODY>
</HTML>
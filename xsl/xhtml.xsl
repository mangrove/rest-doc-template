<?xml version="1.0" encoding="UTF-8"?>
<!-- Author: Benjamin Erb -->
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:api="http://www.ioexception.de/rest-api-doc">


	<xsl:output method="html" omit-xml-declaration="no" indent="yes"
		doctype-public="-//W3C//DTD XHTML 1.1//EN" doctype-system="http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd" />

		<xsl:variable name="baseURI"><xsl:value-of select="api:api/api:baseuri"></xsl:value-of></xsl:variable>

	<xsl:template match="*">
	</xsl:template>

	<xsl:template match="api:api">
		<html xmlns="http://www.w3.org/1999/xhtml">
			<head>
			<link href="http://alexgorbatchev.com/pub/sh/current/styles/shCore.css" rel="stylesheet" type="text/css" />
			<link href="http://alexgorbatchev.com/pub/sh/current/styles/shThemeRDark.css" rel="stylesheet" type="text/css" />
<script src="http://alexgorbatchev.com/pub/sh/current/scripts/shCore.js" type="text/javascript"></script>
			<script src="http://alexgorbatchev.com/pub/sh/current/scripts/shBrushJScript.js" type="text/javascript"></script>
			<script src="http://alexgorbatchev.com/pub/sh/current/scripts/shBrushXml.js" type="text/javascript"></script>
			<script src="http://alexgorbatchev.com/pub/sh/current/scripts/shBrushPlain.js" type="text/javascript"></script>
	
			<style type="text/css">
			
body {
	background: #FFF;
	color: #333;
	font: normal 100% sans-serif;
margin-left: auto;
	margin-right: auto;

	line-height: 1.5;
	width:66%;
}


.uripart {
	background:#666;
	color: #fff;
	font-style: italic;
}


h1,h2,h3,h4,h5,h6 {
	color: #444;
	font-weight: normal;
	line-height: 1;
	margin-bottom: 0.6em;
	font-family:  Helvetica, sans-serif;

}
h4,h5,h6 {font-weight: bold;}

h1 {font-size: 2.6em;}
h2 {font-size: 2em;margin-top:3em;}
h3 {font-size: 1.5em;margin-top:1.5em;}
h4 {font-size: 1.25em;}
h5 {font-size: 1.1em;}
h6 {font-size: 1em;}

h1 img, h2 img, h3 img, h4 img, h5 img, h6 img {margin: 0;}

pre {
	font: normal 100% monospace; 
}

table thead td{
	margin: 0;
	padding: 10px 20px;
	border-bottom: 1px solid #000;
	font-weight: bold;
}

table tbody td{
	padding: 0px 20px;
	border-bottom: 1px solid #bbb;
}


dl { padding: 0.5em; } dt { background:#fff; float: left; clear: left; padding-left:0.3em; padding-right:0.3em;  text-align: right; }  dd { margin: 0 0 0 110px; padding: 0 0 0.5em 0; }

.statuscode, .method {
	font: bold 100% monospace; 
}

			</style>

<script type="text/javascript">
		SyntaxHighlighter.all();
</script>

				<title><xsl:value-of select="api:name" /> - RESTful API Documentation</title>				
			</head>
			<body>
				<h1><xsl:apply-templates select="api:name" /></h1>
				<a name="introduction" />
				<h2>Introduction</h2>
				<h4>Version</h4>
				<p><xsl:apply-templates select="api:version" /></p>
				<h4>Author</h4>
				<p><xsl:apply-templates select="api:author" /></p>
				<h4>Description</h4>
				<p><xsl:apply-templates select="api:description" /></p>
				<h4>Authentication Schemes</h4>
				<p><xsl:apply-templates select="api:authentication" /></p>
				<h4>Base URI</h4>
				<p><xsl:apply-templates select="api:baseuri" /></p>
				
				<a name="index" />
				<h2>Index of Resources and Operations</h2>
				<ol>
				<xsl:for-each select="api:resources/api:resource">
					<xsl:sort select="api:name"/>

					<xsl:variable name="resourcenr"><xsl:value-of select="position()"/></xsl:variable>
					<xsl:element name="li">
					<xsl:element name="a">
						<xsl:attribute name="href">#<xsl:value-of select="generate-id(.)" /></xsl:attribute>
						 <xsl:apply-templates select="api:name" />
					</xsl:element>
					<ol>
						<xsl:for-each select="api:operation">
						<xsl:sort select="api:name"/>
							<xsl:element name="li">
							<xsl:element name="a">
								<xsl:attribute name="href">#<xsl:value-of select="generate-id(.)" /></xsl:attribute>
								 <xsl:value-of select="api:name" />
							</xsl:element>
							</xsl:element>
						</xsl:for-each>
					</ol>
					</xsl:element>
				</xsl:for-each>
				</ol>
				
				<xsl:apply-templates select="api:resources" />
			</body>
		</html>
	</xsl:template>
	
	<xsl:template match="api:resources">
		<xsl:for-each select="api:resource">
		<xsl:sort select="api:name"/>
		
		<xsl:element name="a">
			<xsl:attribute name="name"><xsl:value-of select="generate-id(.)" /></xsl:attribute>
		</xsl:element>
		<h2 class="resource"><xsl:value-of select="position()" />. <xsl:apply-templates select="api:name" /></h2>
		<xsl:variable name="resourceNr"><xsl:value-of select="position()" /></xsl:variable>
		
		<h4>Description</h4>
		<p><xsl:apply-templates select="api:description" /></p>
		
		<h4>Resource URI</h4>
		<pre><xsl:value-of select="$baseURI" />
					           <xsl:for-each select="./api:path/node()">
	   			       <xsl:choose>
							<xsl:when test="@description">
									<span class="uripart">{<xsl:value-of select="." />}</span>
							</xsl:when>
							<xsl:otherwise><xsl:value-of select="." /></xsl:otherwise>
						</xsl:choose>
   			        </xsl:for-each></pre>
   			        
   			        <dl>
   			        <xsl:for-each select="api:path/node()">
							<xsl:if test="@description">
								<dt class="uripart"><xsl:value-of select="." /></dt>
								<dd><xsl:value-of select="@description" /></dd>									
							</xsl:if>
   			        </xsl:for-each>
   			        </dl>
		<xsl:if test="api:model">
		<h4>Model</h4>
		<xsl:apply-templates select="api:model"/>
		</xsl:if>
		
		<xsl:for-each select="api:operation">
		<xsl:sort select="api:name"/>
		
		<xsl:element name="a">
			<xsl:attribute name="name"><xsl:value-of select="generate-id(.)" /></xsl:attribute>
		</xsl:element>		
		<h3  class="operation"><xsl:value-of select="$resourceNr" />.<xsl:value-of select="position()" /><xsl:text> </xsl:text><xsl:apply-templates select="api:name" /></h3>
		
		<h4>Description</h4>
		<xsl:apply-templates select="api:description" />
		
		<h4>URI</h4>
							 <xsl:variable name="resoureUri">
			           <xsl:value-of select="$baseURI" />
			           <xsl:for-each select="./../api:path/node()">
	   			       <xsl:choose>
							<xsl:when test="@description">
								<xsl:text>{</xsl:text><xsl:value-of select="." /><xsl:text>}</xsl:text>
							</xsl:when>
							<xsl:otherwise><xsl:value-of select="." /></xsl:otherwise>
						</xsl:choose>
   			        </xsl:for-each>
			        </xsl:variable>
			<pre>			
				<xsl:choose>
					<xsl:when test="api:path[@omitResourcePath = 'true']"><xsl:value-of select="$baseURI" /></xsl:when>
			       <xsl:otherwise><xsl:value-of select="$resoureUri" /></xsl:otherwise>
		        </xsl:choose>					
								
			           <xsl:for-each select="api:path/node()">
	   			       <xsl:choose>
							<xsl:when test="@description">
									<span class="uripart">{<xsl:value-of select="." />}</span>
							</xsl:when>
							<xsl:otherwise><xsl:value-of select="." /></xsl:otherwise>
						</xsl:choose>
   			        </xsl:for-each></pre>

		
		<h4>URI Parameters</h4>
			<xsl:choose>
				<xsl:when test="count(api:path/api:param) > 0">
			  			        
   			        <dl>
   			        <xsl:for-each select="api:path/node()">
							<xsl:if test="@description">
								<dt class="uripart">{<xsl:value-of select="." />}</dt>
								<dd><xsl:value-of select="@description" /></dd>									
							</xsl:if>
   			        </xsl:for-each>
   			        </dl>
		       </xsl:when>
		       <xsl:otherwise>n/a</xsl:otherwise>
	        </xsl:choose>		
		<h4>HTTP Method</h4>
		<xsl:apply-templates select="api:request/api:method" />
		
		<h4>Resource Formats</h4>		
		<xsl:apply-templates select="api:formats" />
		
		<h4>Authentication</h4>
		<xsl:apply-templates select="api:request/api:authentication" />
		
		<h4>Request Entities</h4>
		<xsl:apply-templates select="api:request/api:entities" />
		
		<h4>Responses</h4>
		<xsl:apply-templates select="api:response/api:responses" />
		
		<h4>Response Entities</h4>
		<xsl:apply-templates select="api:response/api:entities" />
		
		</xsl:for-each>
		
		</xsl:for-each>
	</xsl:template>	
	

	<xsl:template match="api:entities">
		<xsl:choose>
			<xsl:when test="count(api:entity) > 0">
				<xsl:apply-templates />
			</xsl:when>
			<xsl:otherwise>n/a</xsl:otherwise>
		</xsl:choose>
	</xsl:template>	

	<xsl:template match="api:entity">
		<xsl:apply-templates />
	</xsl:template>			
			
	<xsl:template match="api:method">
		<span class="method"><xsl:apply-templates /></span>
	</xsl:template>			
			
	<xsl:template match="api:name">
		<xsl:apply-templates />
	</xsl:template>

	<xsl:template match="api:author">
		<xsl:apply-templates />
	</xsl:template>
	<xsl:template match="api:version">
		<xsl:apply-templates />
	</xsl:template>	
	
	<xsl:template match="api:baseuri">
	<xsl:element name="a">
			<xsl:attribute name="href"><xsl:apply-templates /></xsl:attribute>
			<xsl:apply-templates />
		</xsl:element>	
		
	</xsl:template>	
	
	<xsl:template match="api:description">
		<xsl:apply-templates />
	</xsl:template>	
			
	<xsl:template match="api:code">
		<xsl:element name="pre">
			<xsl:attribute name="class">brush: <xsl:value-of select="@language" /></xsl:attribute>
		<xsl:apply-templates />
		</xsl:element>
	</xsl:template>	
		
		
	<xsl:template match="api:formats">
	<ul>
		<xsl:apply-templates />
	</ul>
	</xsl:template>		
		
	<xsl:template match="api:format">
		<li><xsl:apply-templates /></li>
	</xsl:template>		


	<xsl:template match="api:request/api:authentication">
		<xsl:choose>
			<xsl:when test="@mandatory = 'true'">
				<xsl:text>required</xsl:text>
			</xsl:when>
			<xsl:otherwise>not required</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	

	<xsl:template match="api:api/api:authentication">
				<ul>
				<xsl:for-each select="api:type">
					<li><xsl:value-of select="." /></li>
				</xsl:for-each>
				</ul>
	</xsl:template>
	
	

	<xsl:template match="api:responses">
		<dl>
		<xsl:for-each select="api:answer">
			<dt  class="statuscode"><xsl:call-template name="statuscode">
				<xsl:with-param name="code"><xsl:value-of select="@code" /></xsl:with-param>
			</xsl:call-template>
			</dt>
			<dd><xsl:value-of select="." /></dd>
		</xsl:for-each>
		</dl>
	</xsl:template>	

	<xsl:template match="api:model">
		<table cellspacing="0" cellpadding="0">
			<thead>
				<td>Property</td>
				<td>Type</td>
				<td>Description</td>
			</thead>
			<tbody>
			<xsl:for-each select="api:property">
				<tr>
					<td><xsl:value-of select="@name"/></td>
					<td><pre><xsl:value-of select="@type"/></pre></td>
					<td><em><xsl:value-of select="@description"/></em></td>
				</tr>
			</xsl:for-each>
			</tbody>
		</table>
	</xsl:template>

	<xsl:template name="statuscode">
		<xsl:param name="code" />
		<xsl:text></xsl:text><xsl:value-of select="$code" /><xsl:text> </xsl:text>
		<xsl:choose>
			<xsl:when test="$code = '100'">Continue</xsl:when>
			<xsl:when test="$code = '101'">Switching Protocols</xsl:when>
			<xsl:when test="$code = '200'">OK</xsl:when>
			<xsl:when test="$code = '201'">Created</xsl:when>
			<xsl:when test="$code = '202'">Accepted</xsl:when>
			<xsl:when test="$code = '203'">Non-Authoritative Information</xsl:when>
			<xsl:when test="$code = '204'">No Content</xsl:when>
			<xsl:when test="$code = '205'">Reset Content</xsl:when>
			<xsl:when test="$code = '206'">Partial Content</xsl:when>
			<xsl:when test="$code = '300'">Multiple Choices</xsl:when>
			<xsl:when test="$code = '301'">Moved Permanently</xsl:when>
			<xsl:when test="$code = '302'">Found</xsl:when>
			<xsl:when test="$code = '303'">See Other</xsl:when>
			<xsl:when test="$code = '304'">Not Modified</xsl:when>
			<xsl:when test="$code = '305'">Use Proxy</xsl:when>
			<xsl:when test="$code = '306'">Switch Proxy</xsl:when>
			<xsl:when test="$code = '307'">Temporary Redirect </xsl:when>
			<xsl:when test="$code = '400'">Bad Request</xsl:when>
			<xsl:when test="$code = '401'">Unauthorized</xsl:when>
			<xsl:when test="$code = '402'">Payment Required</xsl:when>
			<xsl:when test="$code = '403'">Forbidden</xsl:when>
			<xsl:when test="$code = '404'">Not Found</xsl:when>
			<xsl:when test="$code = '405'">Method Not Allowed</xsl:when>
			<xsl:when test="$code = '406'">Not Acceptable</xsl:when>
			<xsl:when test="$code = '407'">Proxy Authentication Required</xsl:when>
			<xsl:when test="$code = '408'">Request Timeout</xsl:when>
			<xsl:when test="$code = '409'">Conflict</xsl:when>
			<xsl:when test="$code = '410'">Gone</xsl:when>
			<xsl:when test="$code = '411'">Length Required</xsl:when>
			<xsl:when test="$code = '412'">Precondition Failed</xsl:when>
			<xsl:when test="$code = '413'">Request Entity Too Large</xsl:when>
			<xsl:when test="$code = '414'">Request-URI Too Long</xsl:when>
			<xsl:when test="$code = '415'">Unsupported Media Type</xsl:when>
			<xsl:when test="$code = '416'">Requested Range Not Satisfiable</xsl:when>
			<xsl:when test="$code = '417'">Expectation Failed</xsl:when>
			<xsl:when test="$code = '500'">Internal Server Error</xsl:when>
			<xsl:when test="$code = '501'">Not Implemented</xsl:when>
			<xsl:when test="$code = '502'">Bad Gateway</xsl:when>
			<xsl:when test="$code = '503'">Service Unavailable</xsl:when>
			<xsl:when test="$code = '504'">Gateway Timeout</xsl:when>
			<xsl:when test="$code = '505'">HTTP Version Not Supported</xsl:when>
			<xsl:otherwise>custom</xsl:otherwise>
		</xsl:choose>
		<xsl:text></xsl:text>
	</xsl:template>
</xsl:stylesheet>
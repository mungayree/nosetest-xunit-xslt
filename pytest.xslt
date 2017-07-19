<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="testsuite">
        <html>
            <head>
                <title> Test Results For <xsl:value-of select="@name"/></title>
                <link rel="stylesheet" href="http://www.secdev.org/projects/UTscapy/UTscapy.css" type="text/css"/>
                <script language="JavaScript" src="http://www.secdev.org/projects/UTscapy/UTscapy.js" type="text/javascript"/>
            </head>
            <body>
            	<h1> Test Results for: <xsl:value-of select="@name"/> </h1>

            	<span class="button" onClick="hide_all('tst')">Shrink All</span>&#160;
            	<span class="button" onClick="show_all('tst')">Expand All</span>&#160;
            	<span class="button" onClick="show_passed('tst')">Expand Passed</span>&#160;
            	<span class="button" onClick="show_failed('tst')">Expand Failed</span>&#160;
            	<span class="button" onClick="show_failed('tst')">Expand Error</span>&#160;
            	<span class="button" onClick="show_passed('tst')">Expand Skipped</span>&#160;
            	<p>
            		TOTAL=<xsl:value-of select="@tests"/> ,
            		PASSED=<xsl:value-of select="@tests - @failures - @errors - @skips"/> ,
            		FAILED=<xsl:value-of select="@failures"/> ,
            		ERRORS=<xsl:value-of select="@errors"/> ,
            		SKIPPED=<xsl:value-of select="@skips"/>
            	</p>
		<xsl:for-each select="testcase">
			<xsl:variable name="id" select="position()"/>
			<xsl:variable name="fid" select=" format-number($id, '0000')"/>
			<xsl:choose>
			<xsl:when test="failure">
			<span class="buttonfailed" onClick="goto_id('tst{$id}l')"><xsl:value-of select="$fid"/></span>&#160;
			</xsl:when>
			<xsl:when test="error">
			<span class="buttonfailed" onClick="goto_id('tst{$id}l')"><xsl:value-of select="$fid"/></span>&#160;
			</xsl:when>
			<xsl:when test="skipped">
			<span class="buttonpassed" onClick="goto_id('tst{$id}l')"><xsl:value-of select="$fid"/></span>&#160;
			</xsl:when>
			<xsl:otherwise>
			<span class="buttonpassed" onClick="goto_id('tst{$id}l')"><xsl:value-of select="$fid"/></span>&#160;
			</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
            		<h2>tests</h2>
			<xsl:for-each select="testcase">
			<xsl:variable name="id" select="position()"/>
			<xsl:variable name="fid" select="format-number($id, '0000')"/>
			    <xsl:choose>
				<xsl:when test="failure">
				<li class="failed" id="tst{$id}l">
					<span id="tst{$id}+" class="buttonfailed" onClick="show('tst{$id}')">+<xsl:value-of select="$fid"/>+</span>
					<span id="tst{$id}-" class="buttonfailed" onClick="hide('tst{$id}')" style="POSITION: absolute; VISIBILITY: hidden;">
						-<xsl:value-of select="$fid"/>-
					</span>
					&#160;
					<xsl:value-of select="@classname"/>.<xsl:value-of select="@name"/>
					<span class="comment failed" id="tst{$id}" style="POSITION: absolute; VISIBILITY: hidden;"><pre><xsl:value-of select="."/></pre></span>
				</li>
				</xsl:when>
				<xsl:when test="skipped">
				<li class="skipped" id="tst{$id}l">
					<span id="tst{$id}+" class="buttonskip" onClick="show('tst{$id}')">+<xsl:value-of select="$fid"/>+</span>
					<span id="tst{$id}-" class="buttonskip" onClick="hide('tst{$id}')" style="POSITION: absolute; VISIBILITY: hidden;">
						-<xsl:value-of select="$fid"/>-
					</span>
					&#160;
					<xsl:value-of select="@classname"/>.<xsl:value-of select="@name"/>
					<span class="comment skipped" id="tst{$id}" style="POSITION: absolute; VISIBILITY: hidden;"><pre><xsl:value-of select="."/></pre></span>
				</li>
				</xsl:when>
				<xsl:when test="error">
				<li class="error" id="tst{$id}l">
					<span id="tst{$id}+" class="buttonerror" onClick="show('tst{$id}')">+<xsl:value-of select="$fid"/>+</span>
					<span id="tst{$id}-" class="buttonerror" onClick="hide('tst{$id}')" style="POSITION: absolute; VISIBILITY: hidden;">
						-<xsl:value-of select="$fid"/>-
					</span>
					&#160;
					<xsl:value-of select="@classname"/>.<xsl:value-of select="@name"/>
					<span class="comment error" id="tst{$id}" style="POSITION: absolute; VISIBILITY: hidden;"><pre><xsl:value-of select="."/></pre></span>
				</li>
				</xsl:when>
				<xsl:otherwise>
				<li class="passed" id="tst{$id}l">
					<span id="tst{$id}+" class="buttonpassed" onClick="show('tst{$id}')">+<xsl:value-of select="$fid"/>+</span>
					<span id="tst{$id}-" class="buttonpassed" onClick="hide('tst{$id}')" style="POSITION: absolute; VISIBILITY: hidden;">
						-<xsl:value-of select="$fid"/>-
					</span>
					&#160;
					<xsl:value-of select="@classname"/>.<xsl:value-of select="@name"/>
					<span class="comment passed" id="tst{$id}" style="POSITION: absolute; VISIBILITY: hidden;"><pre><xsl:value-of select="."/></pre></span>
				</li>		
				</xsl:otherwise>
			    </xsl:choose>
			</xsl:for-each>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>


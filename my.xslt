<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="testsuite">
        <html>
            <head>
                <title>
                    Test Results For <xsl:value-of select="@name"/>
                </title>
            </head>
            <body>
                <h1> Test Results for: <xsl:value-of select="@name"/> </h1>
                <p>
                    TOTAL=<xsl:value-of select="@tests"/> ,
                    PASSED=<xsl:value-of select="@tests - @failures - @errors - @skip"/> ,
                    FAILED=<xsl:value-of select="@failures"/> ,
                    ERRORS=<xsl:value-of select="@errors"/> ,
                    SKIPPED=<xsl:value-of select="@skip"/>
                </p>
                <table border="1">
                    <tr>
                        <th> TestStatus </th>
                        <th> TestGroup </th>
                        <th> TestName </th>
                        <th> ExecutionTime </th>
                    </tr>
                    <xsl:for-each select="testcase">
                       <tr>
                           <xsl:choose>
                               <xsl:when test="failure">
                                   <td bgcolor="#FF9999">Failed</td>
                                   <td><xsl:value-of select="@classname"/></td>
                                   <td><xsl:value-of select="@name"/></td>
                                   <td><xsl:value-of select="@time"/></td>
                               </xsl:when>
                               <xsl:when test="error">
                                   <td bgcolor="#CCCC00">Error</td>
                                   <td><xsl:value-of select="@classname"/></td>
                                   <td><xsl:value-of select="@name"/></td>
                                   <td><xsl:value-of select="@time"/></td>
                               </xsl:when>
                               <xsl:otherwise>
                                   <td bgcolor="#66FF66">Passed</td>
                                   <td><xsl:value-of select="@classname"/></td>
                                   <td><xsl:value-of select="@name"/></td>
                                   <td><xsl:value-of select="@time"/></td>
                               </xsl:otherwise>
                           </xsl:choose>
                       </tr>
                    </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>

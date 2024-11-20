<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <html>
            <body>
                <h2>Studio One Music Catalogue</h2>
                <table border="1">
                    <tr>
                        <th style="text-align:left">Title</th>
                        <th style="text-align:left">Album</th>
                        <th style="text-align:left">Artist</th>
                        <th style="text-align:left">Country</th>
                        <th style="text-align:left">Company</th>
                        <th style="text-align:left">Price</th>
                        <th style="text-align:left">Year</th>
                        <th style="text-align:left">Format</th>
                    </tr>
                    <xsl:for-each select="catalogue/song">
                        <xsl:choose>
                            <xsl:when test="price &gt; 10">
                                <tr class="gt-10">
                                    <td><xsl:value-of select="title" /></td>
                                    <td><xsl:value-of select="album" /></td>
                                    <td><xsl:value-of select="artist" /></td>
                                    <td><xsl:value-of select="country" /></td>
                                    <td><xsl:value-of select="company" /></td>
                                    <td>$<xsl:value-of select="price" /></td>
                                    <td><xsl:value-of select="year" /></td>
                                    <td><xsl:value-of select="format" /></td>
                                </tr>
                            </xsl:when>
                            <xsl:when test="price &gt; 9">
                                <tr class="gt-9">
                                    <td><xsl:value-of select="title" /></td>
                                    <td><xsl:value-of select="album" /></td>
                                    <td><xsl:value-of select="artist" /></td>
                                    <td><xsl:value-of select="country" /></td>
                                    <td><xsl:value-of select="company" /></td>
                                    <td>$<xsl:value-of select="price" /></td>
                                    <td><xsl:value-of select="year" /></td>
                                    <td><xsl:value-of select="format" /></td>
                                </tr>
                            </xsl:when>
                            <xsl:otherwise>
                                <tr>
                                    <td><xsl:value-of select="title" /></td>
                                    <td><xsl:value-of select="album" /></td>
                                    <td><xsl:value-of select="artist" /></td>
                                    <td><xsl:value-of select="country" /></td>
                                    <td><xsl:value-of select="company" /></td>
                                    <td>$<xsl:value-of select="price" /></td>
                                    <td><xsl:value-of select="year" /></td>
                                    <td><xsl:value-of select="format" /></td>
                                </tr>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
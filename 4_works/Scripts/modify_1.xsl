<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:tei="http://www.tei-c.org/ns/1.0" version="1.0">
    <!-- Identity template to copy all elements and attributes as is -->
    <xsl:template match="node()|@*">
        <xsl:copy>
            <xsl:apply-templates select="node()|@*"/>
        </xsl:copy>
    </xsl:template>
    
    <!-- Match the first <date> element with a @when attribute and insert the new <date> element right after it -->
    <xsl:template match="tei:bibl/tei:date[@when][1]">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
        <!-- Insert the new <date> element after the first <date> -->
        <xsl:text>&#xA;    </xsl:text>
        <xsl:element name="date" namespace="http://www.tei-c.org/ns/1.0">
            <xsl:attribute name="when">1203</xsl:attribute>
            <xsl:attribute name="calendar">Gregorian</xsl:attribute>
            <xsl:text> CE</xsl:text>
        </xsl:element>
    </xsl:template>
</xsl:stylesheet>

<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    version="2.0">
    
    <xsl:output method="xml" indent="yes" encoding="UTF-8"/>
    <xsl:strip-space elements="*"/>
    
    <!-- Identity template: copies everything by default -->
    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>
    
    <!-- Match the <note> element with type 'bibliography' and handle the lists inside it -->
    <xsl:template match="tei:note[@type='bibliography']">
        <xsl:copy>
            <xsl:apply-templates select="@*"/>
            <xsl:apply-templates select="tei:listBibl"/>
        </xsl:copy>
    </xsl:template>
    
    <!-- Match the <listBibl> elements based on their type and insert the corresponding bibliographic entries -->
    <xsl:template match="tei:listBibl[@type='editions']">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
            <xsl:apply-templates select="document('/Users/Ali/Desktop/miasCatalogue/7_exports/Zotero_Bibl/amr_Bibl.xml')//tei:biblStruct[tei:note[contains(., 'edition')]]"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="tei:listBibl[@type='translations']">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
            <xsl:apply-templates select="document('/Users/Ali/Desktop/miasCatalogue/7_exports/Zotero_Bibl/amr_Bibl.xml')//tei:biblStruct[tei:note[contains(., 'translation')]]"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="tei:listBibl[@type='studies']">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
            <xsl:apply-templates select="document('/Users/Ali/Desktop/miasCatalogue/7_exports/Zotero_Bibl/amr_Bibl.xml')//tei:biblStruct[tei:note[contains(., 'study')]]"/>
        </xsl:copy>
    </xsl:template>
</xsl:stylesheet>

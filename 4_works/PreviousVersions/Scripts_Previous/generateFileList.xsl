<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    version="2.0">
    
    <!-- Output as text since we are generating a plain text file -->
    <xsl:output method="text" encoding="UTF-8"/>
    
    <!-- Match the root template to begin processing -->
    <xsl:template match="/">
        
        <!-- Iterate over each row in the XML file -->
        <xsl:for-each select="//tei:bibl">
            <!-- Generate the file path and file name -->
            <xsl:value-of select="concat('../Works/', normalize-space(tei:idno[@type = 'keyword']), '.xml')"/>
            <!-- Add a newline after each file path -->
            <xsl:text>&#10;</xsl:text>
        </xsl:for-each>
        
    </xsl:template>
    
</xsl:stylesheet>


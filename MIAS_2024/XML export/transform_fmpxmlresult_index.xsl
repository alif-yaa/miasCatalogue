<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:fm="http://www.filemaker.com/fmpxmlresult"
    exclude-result-prefixes="fm"
    version="2.0">
    
    <xsl:output method="xml" indent="yes" encoding="UTF-8"/>
    <xsl:strip-space elements="*"/>
    
    <!-- Set the default namespace to TEI -->
    <xsl:template match="/fm:FMPXMLRESULT">
        <TEI xmlns="http://www.tei-c.org/ns/1.0">
            <teiHeader>
                <fileDesc>
                    <titleStmt>
                        <title>Central Index of Works</title>
                    </titleStmt>
                    <publicationStmt>
                        <p>Publication Information</p>
                    </publicationStmt>
                    <sourceDesc>
                        <p>Information about the source</p>
                    </sourceDesc>
                </fileDesc>
            </teiHeader>
            <text>
                <body>
                    <listBibl>
                        <!-- Apply templates for each record in the FileMaker export -->
                        <xsl:apply-templates select="fm:RESULTSET/fm:ROW"/>
                    </listBibl>
                </body>
            </text>
        </TEI>
    </xsl:template>
    
    <!-- Template for each ROW -->
    <xsl:template match="fm:ROW">
        <bibl xmlns="http://www.tei-c.org/ns/1.0">
            <!-- Auto-generate xml:id -->
            <xsl:attribute name="xml:id">
                <xsl:value-of select="concat('index_work_', position())"/>
            </xsl:attribute>
            <ref>
                <xsl:attribute name="target">
                    <xsl:value-of select="concat('work_', position(), '.xml')"/>
                </xsl:attribute>
                <xsl:text>Link to Work </xsl:text>
                <xsl:value-of select="position()"/>
            </ref>
            <title xml:lang="ara-Latn-x-lc" type="uniform">
                <xsl:value-of select="normalize-space(fm:COL[1]/fm:DATA)"/>
            </title>
            <title xml:lang="ara" type="uniform-ara">
                <xsl:value-of select="normalize-space(fm:COL[2]/fm:DATA)"/>
            </title>
            <idno type="RG">
                <xsl:value-of select="normalize-space(fm:COL[3]/fm:DATA)"/>
            </idno>
            <note type="classification">
                <xsl:value-of select="normalize-space(fm:COL[4]/fm:DATA)"/>
            </note>
            <date type="earliestMS">
                <xsl:value-of select="normalize-space(fm:COL[5]/fm:DATA)"/>
            </date>
        </bibl>
    </xsl:template>
</xsl:stylesheet>

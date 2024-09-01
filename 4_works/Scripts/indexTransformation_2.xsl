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
                        <title>Index of Verified and Probable Works</title>
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
            <xsl:attribute name="xml:id">
                <xsl:value-of select="normalize-space(fm:COL[7]/fm:DATA)"/>
            </xsl:attribute>
        <idno type="RG"><xsl:value-of select="normalize-space(fm:COL[1]/fm:DATA)"/></idno>
        <title type="uniform" xml:lang="ara-Latn-x-lc"><xsl:value-of select="normalize-space(fm:COL[4]/fm:DATA)"/></title>
        <title type="uniform" xml:lang="ara"><xsl:value-of select="normalize-space(fm:COL[5]/fm:DATA)"/></title>
            <idno type="Normalized"><xsl:value-of select="normalize-space(fm:COL[7]/fm:DATA)"/></idno>
            <ref>
                <xsl:attribute name="target">
                    <xsl:text>../</xsl:text>
                    <xsl:value-of select="normalize-space(fm:COL[7]/fm:DATA)"/>
                    <xsl:text>.xml#</xsl:text>
                    <xsl:value-of select="normalize-space(fm:COL[7]/fm:DATA)"/>
                </xsl:attribute>
            </ref>
               
        </bibl>
    </xsl:template>
</xsl:stylesheet>

<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    version="1.0">
    
    <!-- Output the result as XML -->
    <xsl:output method="xml" indent="yes" encoding="UTF-8"/>
    
    <!-- Root template -->
    <xsl:template match="/">
        <TEI xmlns="http://www.tei-c.org/ns/1.0">
            <text>
                <body>
                    <listBibl>
                        <!-- Apply templates to each bibl element -->
                        <xsl:apply-templates select="//tei:listBibl/tei:bibl"/>
                    </listBibl>
                </body>
            </text>
        </TEI>
    </xsl:template>
    
    <!-- Template for each bibl element -->
    <xsl:template match="tei:bibl">
        <bibl>
            <!-- Copy RG ID -->
            <idno type="RG">
                <xsl:value-of select="tei:idno[@type='RG']"/>
            </idno>
            
            <!-- Copy Transliteration title -->
            <title type="uniform" xml:lang="ara-Latn-x-lc">
                <xsl:value-of select="tei:title[@type='uniform' and @xml:lang='ara-Latn-x-lc']"/>
            </title>
            
            <!-- Copy Arabic title -->
            <title type="uniform" xml:lang="ara">
                <xsl:value-of select="tei:title[@type='uniform' and @xml:lang='ara']"/>
            </title>
            
            <!-- Copy Keyword ID -->
            <idno type="keyword">
                <xsl:value-of select="tei:idno[@type='keyword']"/>
            </idno>
            
            <!-- Generate ref target attribute -->
            <ref>
                <xsl:attribute name="target">
                    <xsl:text>../</xsl:text>
                    <xsl:value-of select="tei:idno[@type='keyword']"/>
                    <xsl:text>.xml</xsl:text>
                </xsl:attribute>
            </ref>
        </bibl>
    </xsl:template>
    
</xsl:stylesheet>

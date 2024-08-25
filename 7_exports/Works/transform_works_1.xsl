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
                        <title>Works</title>
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
                <xsl:value-of select="normalize-space(fm:COL[7]/fm:DATA)"/>
            </xsl:attribute>
            <idno type="RG"><xsl:value-of select="normalize-space(fm:COL[1]/fm:DATA)"/></idno>
            <idno type="Alt_RG"><xsl:value-of select="normalize-space(fm:COL[2]/fm:DATA)"/></idno>
            <idno type="RECORDID"><xsl:value-of select="normalize-space(fm:COL[3]/fm:DATA)"/></idno>
            
            
            <title xml:lang="ara-Latn-x-lc" type="uniform"><xsl:value-of select="normalize-space(fm:COL[4]/fm:DATA)"/></title>
            <title xml:lang="ara" type="uniform-ara"><xsl:value-of select="normalize-space(fm:COL[5]/fm:DATA)"/></title>
            <title xml:lang="ara-Latn-x-lc" type="abbreviated"><xsl:value-of select="normalize-space(fm:COL[7]/fm:DATA)"/></title>
            <title xml:lang="ara-Latn-x-lc" type="full">Insert full title where relevant</title>
            <title xml:lang="ara-Latn-x-lc" type="alternate">Insert Alternate Title(s)</title>
            <title xml:lang="eng" type="translation">Insert translation of title where relevant</title>
            
            
            <xsl:choose>
                <xsl:when test="contains(normalize-space(fm:COL[6]/fm:DATA), 'Verified A')">
                    <author cert="high" key="person_0001">Ibn al-ʿArabī</author>
                    <persName role="att" key="person_0001">Ibn al-ʿArabī</persName>
                </xsl:when>
                <xsl:when test="contains(normalize-space(fm:COL[6]/fm:DATA), 'Verified B')">
                    <author cert="medium" key="person_0001">Ibn al-ʿArabī</author>
                    <persName role="att" key="person_0001">Ibn al-ʿArabī</persName>
                </xsl:when>
                <xsl:when test="contains(normalize-space(fm:COL[6]/fm:DATA), 'Probable IA')">
                    <author cert="low" key="person_0001">Ibn al-ʿArabī</author>
                    <persName role="att" key="person_0001">Ibn al-ʿArabī</persName>
                </xsl:when>
                <xsl:when test="contains(normalize-space(fm:COL[6]/fm:DATA), 'Unverified')">
                    <author cert="unknown" key="person_0001">Ibn al-ʿArabī</author>
                    <persName role="att" key="person_0001">Ibn al-ʿArabī</persName>
                </xsl:when>
                <xsl:when test="contains(normalize-space(fm:COL[6]/fm:DATA), 'Not IA')">
                    <author key="person_0000"><xsl:value-of select="normalize-space(fm:COL[8]/fm:DATA)"/></author>
                    <persName role="dub" key="person_0001">Ibn al-ʿArabī</persName>
                </xsl:when>
                <xsl:when test="contains(normalize-space(fm:COL[6]/fm:DATA), 'Spurious')">
                    <author key="person_0000"><xsl:value-of select="normalize-space(fm:COL[8]/fm:DATA)"/></author>
                    <persName role="dub" key="person_0001">Ibn al-ʿArabī</persName>
                </xsl:when>
                <xsl:when test="contains(normalize-space(fm:COL[6]/fm:DATA), 'Commentary')">
                    <author key="person_0000"><xsl:value-of select="normalize-space(fm:COL[8]/fm:DATA)"/></author>
                    <persName role="ant" key="person_0001">Ibn al-ʿArabī</persName>
                    <persName role="cwt" key="person_0000"><xsl:value-of select="normalize-space(fm:COL[8]/fm:DATA)"/></persName>
                </xsl:when>
            </xsl:choose>
            
            
            <date type="fmEarliestMS" calendar="Hijri-qamari"><xsl:value-of select="normalize-space(fm:COL[19]/fm:DATA)"/></date>
            <date type="fmDate" calendar="Hijri-qamari"><xsl:value-of select="normalize-space(fm:COL[9]/fm:DATA)"/></date>
            <placeName type="fmPlace"><xsl:value-of select="normalize-space(fm:COL[11]/fm:DATA)"/></placeName>
            <note type="fmComposition"><xsl:value-of select="normalize-space(fm:COL[10]/fm:DATA)"/></note>
            
            <date when="1111" cert="high" calendar="Hijri-qamari" evidence="internal">Insert Exact Date of Composition</date>
            <date from="1111" to="1111" cert="medium" calendar="Hijri-qamari" evidence="external">Insert Known Period of Composition</date>
            <date notBefore="1111" notAfter="1111" cert="low" calendar="Hijri-qamari" evidence="conjecture">Insert Conceivable Date Range of Composition</date>
            
            
            <incipit type="uniform" xml:lang="ara-Latn-x-lc"><xsl:value-of select="normalize-space(fm:COL[12]/fm:DATA)"/></incipit>
            <incipit type="uniform-ara" xml:lang="ara">Insert Arabic Incipit</incipit>
            
            
            <textLang mainLang="ara">Arabic</textLang>
            
            
            <noteGrp type="workDesc">
                <note type="description"><xsl:value-of select="normalize-space(fm:COL[13]/fm:DATA)"/></note>
                <note type="biblioComments"><xsl:value-of select="normalize-space(fm:COL[14]/fm:DATA)"/></note>
                <note type="compHist">Insert Revised Composition History</note>
                <note type="structure">Insert Revised Work Structure</note>
                <note type="discussion">Insert Revised Discussion</note>
                <note type="reception">Insert Revised Reception</note>
                <note type="stemmatics">Insert Revised Stemmatics</note>
                <note type="khutba">Insert Transcribed Khutba</note>
            </noteGrp>  
            
            
            <xsl:choose>
                <xsl:when test="contains(normalize-space(fm:COL[6]/fm:DATA), 'Extract')">
                    <relatedItem type="extractFrom">
                        <ref target="#work_0000a"><xsl:value-of select="normalize-space(fm:COL[2]/fm:DATA)"/></ref>
                    </relatedItem>
                </xsl:when>
                <xsl:when test="contains(normalize-space(fm:COL[6]/fm:DATA), 'Commentary')">
                    <relatedItem type="commentaryOn">
                        <ref target="#work_0000a"><xsl:value-of select="normalize-space(fm:COL[2]/fm:DATA)"/></ref>
                    </relatedItem>
                </xsl:when>
            </xsl:choose>
            
            
            <noteGrp type="references">
                <note type="ijaza">Insert Title of Work as given in Ijāza plus any of IA's comments</note>
                <note type="ijaza_2" resp="Badawī" n="{normalize-space(fm:COL[16]/fm:DATA)}">
                    <xsl:value-of select="normalize-space(fm:COL[16]/fm:DATA)"/>
                </note>
                <note type="fihris">Insert Title of Work as given in Fihris plus any of IA's comments</note>
                <note type="fihris_2" resp="Awwād" n="{normalize-space(fm:COL[15]/fm:DATA)}">
                    <xsl:value-of select="normalize-space(fm:COL[15]/fm:DATA)"/>
                </note>
                <note type="fut_mak">Insert mentions of work in fut_mak</note>
                <note type="fut_mak" resp="OY"><xsl:value-of select="normalize-space(fm:COL[17]/fm:DATA)"/></note>
                <note type="other"><xsl:value-of select="normalize-space(fm:COL[18]/fm:DATA)"/></note>
            </noteGrp>
            
            
            <noteGrp type="mentions">
                <note type="mention"><ref target="#work">Insert target to work(s) mentioned, and can give more detail about precise location as plain text here</ref>
                    
                    <quote xml:lang="ara">Add quotation(s), if relevant</quote></note>
            </noteGrp>
        </bibl>
    </xsl:template>
</xsl:stylesheet>

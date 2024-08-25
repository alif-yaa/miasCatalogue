<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:fm="http://www.filemaker.com/fmpxmlresult"
    exclude-result-prefixes="fm"
    version="2.0">
    
    <xsl:output method="xml" indent="yes" encoding="UTF-8"/>
    <xsl:strip-space elements="*"/>
    
    <!-- Add the preamble to the output -->
    <xsl:template match="/">
        <xsl:text disable-output-escaping="yes">&lt;?xml version="1.0" encoding="UTF-8"?&gt;</xsl:text>
        <xsl:text disable-output-escaping="yes">&lt;?xml-model href="http://www.tei-c.org/release/xml/tei/custom/schema/relaxng/tei_all.rng" type="application/xml" schematypens="http://relaxng.org/ns/structure/1.0"?&gt;</xsl:text>
        <xsl:text disable-output-escaping="yes">&lt;?xml-model href="http://www.tei-c.org/release/xml/tei/custom/schema/relaxng/tei_all.rng" type="application/xml" schematypens="http://purl.oclc.org/dsdl/schematron"?&gt;</xsl:text>
        <xsl:text disable-output-escaping="yes">&lt;?xml-model href="authority-schematron.sch" type="application/xml" schematypens="http://purl.oclc.org/dsdl/schematron"?&gt;</xsl:text>
        <xsl:text disable-output-escaping="yes">&lt;?xml-stylesheet type="text/xsl" href="previewAuthorities.xsl"?&gt;</xsl:text>
        <xsl:text disable-output-escaping="yes">&lt;TEI xmlns="http://www.tei-c.org/ns/1.0" xmlns:xi="http://www.w3.org/2001/XInclude"&gt;</xsl:text>
        <xsl:apply-templates/>
        <xsl:text disable-output-escaping="yes">&lt;/TEI&gt;</xsl:text>
    </xsl:template>
    
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
                <xsl:value-of select="normalize-space(fm:COL[20]/fm:DATA)"/>
            </xsl:attribute>
            <idno type="RG"><xsl:value-of select="normalize-space(fm:COL[1]/fm:DATA)"/></idno>
            <idno type="Alt. RG"><xsl:value-of select="normalize-space(fm:COL[2]/fm:DATA)"/></idno>
            <idno type="RECORDID"><xsl:value-of select="normalize-space(fm:COL[3]/fm:DATA)"/></idno>
            
            <p xmlns="http://www.tei-c.org/ns/1.0"></p>
            
            <title xml:lang="ara-Latn-x-lc" type="uniform"><xsl:value-of select="normalize-space(fm:COL[4]/fm:DATA)"/></title>
            <title xml:lang="ara" type="uniform-ara"><xsl:value-of select="normalize-space(fm:COL[5]/fm:DATA)"/></title>
            <title xml:lang="ara-Latn-x-lc" type="abbreviated"><xsl:value-of select="normalize-space(fm:COL[7]/fm:DATA)"/></title>
            <title xml:lang="ara-Latn-x-lc" type="alternate">Insert Alternate Title(s)</title>
            
            <p xmlns="http://www.tei-c.org/ns/1.0"></p>
            
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
            
            <p xmlns="http://www.tei-c.org/ns/1.0"></p>
            
            <date type="ms" calendar="Hijri-qamari"><xsl:value-of select="normalize-space(fm:COL[19]/fm:DATA)"/></date>
            <date type="composition" calendar="Hijri-qamari"><xsl:value-of select="normalize-space(fm:COL[9]/fm:DATA)"/></date>
            <placeName type="composition"><xsl:value-of select="normalize-space(fm:COL[11]/fm:DATA)"/></placeName>
            <note type="composition"><xsl:value-of select="normalize-space(fm:COL[10]/fm:DATA)"/></note>
            <date when="YYYY" cert="high" calendar="Hijri-qamari">Insert Exact Date of Composition</date>
            <date from="YYYY" to="YYYY" cert="med" calendar="Hijri-qamari">Insert Known Period of Composition</date>
            <date notBefore="YYYY" notAfter="YYYY" cert="low" calendar="Hijri-qamari">Insert Conceivable Date Range of Composition</date>
            
            <p xmlns="http://www.tei-c.org/ns/1.0"></p>
            
            <incipit type="uniform" xml:lang="ara-Latn-x-lc"><xsl:value-of select="normalize-space(fm:COL[12]/fm:DATA)"/></incipit>
            <incipit type="uniform-ara" xml:lang="ara">Insert Arabic Incipit</incipit>
            
            <p xmlns="http://www.tei-c.org/ns/1.0"></p>
            
            <textLang mainLang="ara">Arabic</textLang>
            
            <p xmlns="http://www.tei-c.org/ns/1.0"></p>
            
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
            
            <p xmlns="http://www.tei-c.org/ns/1.0"></p>
            
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
            
            <p xmlns="http://www.tei-c.org/ns/1.0"></p>
            
            <noteGrp type="references">
                <note type="ijaza">Insert Title of Work as given in Ijāza plus any of IA's comments</note>
                <note type="ijaza" resp="ArBad" n="{normalize-space(fm:COL[16]/fm:DATA)}">
                    <xsl:value-of select="concat(normalize-space(fm:COL[16]/fm:DATA), ' (Badawī)')"/>
                </note>
                <note type="fihris">Insert Title of Work as given in Fihris plus any of IA's comments</note>
                <note type="fihris" resp="KorAw" n="{normalize-space(fm:COL[15]/fm:DATA)}">
                    <xsl:value-of select="concat(normalize-space(fm:COL[15]/fm:DATA), ' (ʿAwwād)')"/>
                </note>
                <note type="fut_mak">Insert mentions of work in fut_mak</note>
                <note type="fut_mak" resp="OY"><xsl:value-of select="normalize-space(fm:COL[17]/fm:DATA)"/></note>
                <note type="other"><xsl:value-of select="normalize-space(fm:COL[18]/fm:DATA)"/></note>
            </noteGrp>
            
            <p xmlns="http://www.tei-c.org/ns/1.0"></p>
            <noteGrp type="mentions">
                <note type="mentions"><ref target="#work">Insert target to work(s) mentioned, and can give more detail about precise location as plain text here</ref><p xmlns="http://www.tei-c.org/ns/1.0"></p><quote xml:lang="ara">Add quotation(s), if relevant</quote></note>
            </noteGrp>
        </bibl>
    </xsl:template>
</xsl:stylesheet>

<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:fm="http://www.filemaker.com/fmpxmlresult"
    exclude-result-prefixes="fm"
    version="2.0">
    
    <xsl:output method="xml" indent="yes" encoding="UTF-8"/>
    <xsl:strip-space elements="*"/>
    
    <xsl:template match="/fm:FMPXMLRESULT">
        <TEI xmlns="http://www.tei-c.org/ns/1.0">
            <teiHeader>
                <fileDesc>
                    <titleStmt>
                        <title>Works by Ibn al-ʿArabī (Verified and Probable)</title>
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
                        <xsl:apply-templates select="fm:RESULTSET/fm:ROW"/>
                    </listBibl>
                </body>
            </text>
        </TEI>
    </xsl:template>
    
    <xsl:template match="fm:ROW">
        <bibl xmlns="http://www.tei-c.org/ns/1.0">
                        
            <xsl:attribute name="xml:id">
                <xsl:value-of select="normalize-space(fm:COL[7]/fm:DATA)"/>
            </xsl:attribute>
            
            
            
            <idno type="RG"><xsl:value-of select="normalize-space(fm:COL[1]/fm:DATA)"/></idno>
            <idno type="Alt_RG"><xsl:value-of select="normalize-space(fm:COL[2]/fm:DATA)"/></idno>
            <idno type="RECORDID"><xsl:value-of select="normalize-space(fm:COL[3]/fm:DATA)"/></idno>
            <idno type="Normalized"><xsl:value-of select="normalize-space(fm:COL[7]/fm:DATA)"/></idno>
            
            <xsl:comment> Titles </xsl:comment>
            
            <title xml:lang="ara-Latn-x-lc" type="uniform"><xsl:value-of select="normalize-space(fm:COL[4]/fm:DATA)"/></title>
            <title xml:lang="ara" type="uniform-ara"><xsl:value-of select="normalize-space(fm:COL[5]/fm:DATA)"/></title>
            <title xml:lang="ara-Latn-x-lc" type="full"><xsl:value-of select="normalize-space(fm:COL[21]/fm:DATA)"/></title>
            <title xml:lang="ara-Latn-x-lc" type="variant"><xsl:value-of select="normalize-space(fm:COL[20]/fm:DATA)"/></title>
            <title xml:lang="eng" type="translationEng"><xsl:value-of select="normalize-space(fm:COL[22]/fm:DATA)"/></title>
            <note type="titleNote">Note on Title</note>
            
            <xsl:comment> Textual Identifiers </xsl:comment>
            
            <incipit type="hamdala" xml:lang="ara-Latn-x-lc"><xsl:value-of select="normalize-space(fm:COL[12]/fm:DATA)"/></incipit>
            <incipit type="hamdala-ara" xml:lang="ara">Arabic Script Incipit</incipit>
            <incipit type="muqadimma" xml:lang="ara-Latn-x-lc">First Line of Intro (after ḥamdala )</incipit>
            <incipit type="muqadimma" xml:lang="ara">First Line of Intro (Arabic script)</incipit>
            <incipit type="khutba" xml:lang="ara">Complete Khuṭba</incipit>
            <explicit xml:lang="ara-Latn-x-lc">Closing Words of Text (exclusive of any rubric or colophon which might follow it).</explicit>
            <explicit type="muqadimma" xml:lang="ara">Closing Words of Text (Arabic script)</explicit>
            <note type="textualIdentifiersNote">Note on Textual Identifiers</note>
            
            
            <xsl:comment> Authorship and Editorial Roles </xsl:comment>
            
            <xsl:choose>
                <xsl:when test="contains(normalize-space(fm:COL[6]/fm:DATA), 'Verified A')">
                    <author cert="high" key="IA">Ibn al-ʿArabī</author>
                    <editor role="role" key="key">Other Roles</editor>
                    <persName role="att" key="IA">Ibn al-ʿArabī</persName>
                </xsl:when>
                <xsl:when test="contains(normalize-space(fm:COL[6]/fm:DATA), 'Verified B')">
                    <author cert="medium" key="IA">Ibn al-ʿArabī</author>
                    <editor role="role" key="key">Other Roles</editor>
                    <persName role="att" key="IA">Ibn al-ʿArabī</persName>
                </xsl:when>
                <xsl:when test="contains(normalize-space(fm:COL[6]/fm:DATA), 'Probable IA')">
                    <author cert="low" key="IA">Ibn al-ʿArabī</author>
                    <editor role="role" key="key">Other Roles</editor>
                    <persName role="att" key="IA">Ibn al-ʿArabī</persName>
                </xsl:when>
            </xsl:choose>
            
            <xsl:choose>
                <xsl:when test="contains(normalize-space(fm:COL[23]/fm:DATA), 'H')"> 
                    <note type="authenticationType" subtype="H">Holograph</note>
                </xsl:when>
                <xsl:when test="contains(normalize-space(fm:COL[23]/fm:DATA), 'A')"> 
                    <note type="authenticationType" subtype="A">Autograph</note>
                </xsl:when>
                <xsl:when test="contains(normalize-space(fm:COL[23]/fm:DATA), 'C')"> 
                    <note type="authentificationType" subtype="C">Copy</note>
                </xsl:when>
            </xsl:choose> 
            <note type="authenticityNote">Note on Authenticity</note>
            
            
            <xsl:comment> Composition History </xsl:comment>

            <date type="fmDate" calendar="Hijri-qamari"><xsl:value-of select="normalize-space(fm:COL[9]/fm:DATA)"/></date>
            <date type="fmEarliestMS" calendar="Hijri-qamari"><xsl:value-of select="normalize-space(fm:COL[19]/fm:DATA)"/></date>
            <date when="1111" cert="high" calendar="Hijri-qamari">Date of Composition</date>
            <date from="1111" to="1111" cert="medium" calendar="Hijri-qamari">Period of Composition</date>
            <date notBefore="1111" notAfter="1111" cert="low" calendar="Hijri-qamari" evidence="conjecture">Terminus post quem and terminus ante quem</date>
            <note type="dateNote">Note on Date of Composition</note>
                        
            <placeName type="fmPlace"><xsl:value-of select="normalize-space(fm:COL[11]/fm:DATA)"/></placeName>
            <note type="placeNote">Note on Place of Composition</note>
                        
            <note type="compositionNote"><xsl:value-of select="normalize-space(fm:COL[10]/fm:DATA)"/></note>
            
            
            <xsl:comment> Contents </xsl:comment>
            
            <noteGrp type="workDesc">
                <note type="description"><xsl:value-of select="normalize-space(fm:COL[13]/fm:DATA)"/></note>
                <note type="structure">Structure of Work</note>
                <note type="contentsNote">Note on Contents</note>
            </noteGrp>
                
            <xsl:comment> Stemmatics </xsl:comment>    
            <note type="stemmatics"><xsl:value-of select="normalize-space(fm:COL[14]/fm:DATA)"/></note>
            
            
            <xsl:comment> Related Works </xsl:comment>
            
            <relatedItem type="type" target="#work_id"/>
            <note type="relationsNote">Note on Related Works</note>
            
            
            <xsl:comment> References to This Work in Other Works </xsl:comment>
            
            <noteGrp type="references2ThisWork">
                <note type="ijazaBadawi" resp="Badawī" n="{normalize-space(fm:COL[16]/fm:DATA)}">
                    <xsl:value-of select="normalize-space(fm:COL[16]/fm:DATA)"/>
                </note>
                <note type="fihrisAwwad" resp="Awwād" n="{normalize-space(fm:COL[15]/fm:DATA)}"><xsl:value-of select="normalize-space(fm:COL[15]/fm:DATA)"/>
                </note>
                <note type="futuhatOY" resp="OY"><xsl:value-of select="normalize-space(fm:COL[17]/fm:DATA)"/>
                </note>
                <note type="other"><xsl:value-of select="normalize-space(fm:COL[18]/fm:DATA)"/>
                </note>
                <note target="#ijaza">Reference to work in the Ijāza</note>
                <note target="#fihris">Reference to work in the Fihris</note>
                <note target="#fut_mak">References to work in Futūḥāt</note>
                <note target="#work">Referenes to work in other works</note>
            </noteGrp>
            
            <xsl:comment> References in This Work to Other Works </xsl:comment>
            
            <noteGrp type="references2OtherWorks">
                <note target="#work">
                <quote xml:lang="ara">Quotation</quote>
                </note>
            </noteGrp>
                                    
            <xsl:comment> Comments and Corrections </xsl:comment>
            
            <noteGrp type="scholarComments">
                <note resp="corr."><xsl:value-of select="normalize-space(fm:COL[29]/fm:DATA)"/> 
                </note>
                <note resp="additions_0"><xsl:value-of select="normalize-space(fm:COL[25]/fm:DATA)"/> 
                </note>
                <note resp="msAdd."><xsl:value-of select="normalize-space(fm:COL[47]/fm:DATA)"/> 
                </note>
                <note resp="JC">
                    <p> </p> 
                    <p> </p></note>
                <note resp="SH">
                    <p> </p> 
                    <p> </p></note>
                <note resp="AP">
                    <p> </p> 
                    <p> </p></note>
            </noteGrp>
            
            <xsl:comment> Migration Notes </xsl:comment>
            
            <note type="migrationNote"><xsl:value-of select="normalize-space(fm:COL[24]/fm:DATA)"/></note> 
            
            <xsl:comment> Editions, Translations, and Relevant Publications </xsl:comment>
            <noteGrp type="publications"> 
                <note type="editions"><xsl:value-of select="normalize-space(fm:COL[50]/fm:DATA)"/></note>
                <note type="translations"><xsl:value-of select="normalize-space(fm:COL[62]/fm:DATA)"/></note>
                <note type="translationsEur"><xsl:value-of select="normalize-space(fm:COL[63]/fm:DATA)"/></note>
                <note type="additions_1"><xsl:value-of select="normalize-space(fm:COL[52]/fm:DATA)"/></note>
                <note type="additions_2"><xsl:value-of select="normalize-space(fm:COL[39]/fm:DATA)"/></note>
                <note type="additions_3"><xsl:value-of select="normalize-space(fm:COL[59]/fm:DATA)"/></note>                
            </noteGrp>
            
            
            <xsl:comment> Administrative Notes </xsl:comment>
            <noteGrp type="admin">
                <note type="archive"><xsl:value-of select="normalize-space(fm:COL[27]/fm:DATA)"/></note>
                <note type="library"><xsl:value-of select="normalize-space(fm:COL[41]/fm:DATA)"/></note>
            </noteGrp>
                       
            <textLang mainLang="ara">Arabic</textLang>
            <xsl:comment> End </xsl:comment>
        </bibl>
        
        
    </xsl:template>
</xsl:stylesheet>

<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0">
    
    <xsl:output method="html" encoding="UTF-8" indent="yes"/>
    
    <xsl:template match="/">
        <html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
            <head>
                <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
                <title>Bibliography</title>
            </head>
            <body>
                <div class="bib-body" style="line-height: 1.35; margin-left: 2em; text-indent:-2em;">
                    <div class="bibliography">
                        <!-- Apply templates and sort alphabetically by author surname -->
                        <xsl:apply-templates select="//tei:biblStruct">
                            <!-- Sort by surname of author in analytic section if it exists -->
                            <xsl:sort select="normalize-space(tei:monogr/tei:editor/tei:surname)" order="ascending"/>
                            <xsl:sort select="normalize-space(tei:analytic/tei:author/tei:surname)" order="ascending"/>
                            <xsl:sort select="normalize-space(tei:monogr/tei:author/tei:surname)" order="ascending"/>
                        </xsl:apply-templates>
                    </div>
                </div>
            </body>
        </html>
    </xsl:template>
    
    <!-- Template for book entries -->
    <xsl:template match="tei:biblStruct[@type='book']">
        <div class="entry">
            <!-- Authors -->
            <xsl:apply-templates select="tei:monogr/tei:author"/>
            <!-- Title -->
            <i><xsl:value-of select="tei:monogr/tei:title[@level='m']"/></i>.
            <!-- Editor -->
            <xsl:apply-templates select="tei:monogr/tei:editor"/>
            <!-- Translator -->
            <xsl:apply-templates select="tei:monogr/tei:respStmt[tei:resp='translator']/tei:persName"/>
            <!-- Edition -->
            <xsl:if test="tei:monogr/tei:edition">
                <xsl:text> </xsl:text>
                <xsl:value-of select="tei:monogr/tei:edition"/>.
            </xsl:if>
            <!-- Place -->
            <xsl:if test="tei:monogr/tei:imprint/tei:pubPlace">
                <xsl:text> </xsl:text>
                <xsl:value-of select="tei:monogr/tei:imprint/tei:pubPlace"/>:
            </xsl:if>
            <!-- Publisher -->
            <xsl:if test="tei:monogr/tei:imprint/tei:publisher">
                <xsl:text> </xsl:text>
                <xsl:value-of select="tei:monogr/tei:imprint/tei:publisher"/><xsl:text>, </xsl:text>
            </xsl:if>
            <!-- Date -->
            <xsl:value-of select="tei:monogr/tei:imprint/tei:date"/>
            <xsl:text>.</xsl:text>
        </div>
    </xsl:template>
    
    <!-- Template for entries with editors but no authors -->
    <xsl:template match="tei:biblStruct[not(tei:monogr/tei:author) and tei:monogr/tei:editor]">
        <div class="csl-entry">
            <!-- Editors with specific mode -->
            <xsl:apply-templates select="tei:monogr/tei:editor" mode="no-authors"/>
            <!-- Title -->
            <xsl:text>‘</xsl:text>
            <xsl:value-of select="tei:monogr/tei:title[@level='m']"/>
            <xsl:text>’. </xsl:text>
            <!-- Publisher and Date -->
            <xsl:value-of select="tei:monogr/tei:imprint/tei:publisher"/>
            <xsl:text>, </xsl:text>
            <xsl:value-of select="tei:monogr/tei:imprint/tei:date"/>
            <xsl:text>.</xsl:text>
        </div>
    </xsl:template>
    
    <!-- Template for book sections -->
    <xsl:template match="tei:biblStruct[@type='bookSection']">
        <div class="entry">
            <!-- Authors -->
            <xsl:apply-templates select="tei:analytic/tei:author"/>
            <!-- Title -->
            <xsl:text> ‘</xsl:text><xsl:value-of select="tei:analytic/tei:title[@level='a']"/><xsl:text>’. </xsl:text>
            <!-- Editor -->
            <xsl:apply-templates select="tei:monogr/tei:editor"/>
            <!-- Translator -->
            <xsl:apply-templates select="tei:monogr/tei:respStmt[tei:resp='translator']/tei:persName"/>
            <!-- Journal title -->
            <i><xsl:value-of select="tei:monogr/tei:title[@level='j']"/></i>
            <!-- Date -->
            <xsl:text> (</xsl:text>
            <xsl:value-of select="tei:monogr/tei:imprint/tei:date"/>
            <xsl:text>)</xsl:text>
            <!-- Page numbers, if present -->
            <xsl:if test="tei:monogr/tei:imprint/tei:biblScope[@unit='page']">
                <xsl:text>: </xsl:text>
                <xsl:value-of select="tei:monogr/tei:imprint/tei:biblScope[@unit='page']"/>
            </xsl:if>
            <xsl:text>.</xsl:text>
        </div>
    </xsl:template>
    
    <!-- Template for journal articles -->
    <xsl:template match="tei:biblStruct[@type='journalArticle']">
        <div class="entry">
            <!-- Authors -->
            <xsl:apply-templates select="tei:analytic/tei:author"/>
            <!-- Title -->
            <xsl:text> ‘</xsl:text><xsl:value-of select="tei:analytic/tei:title[@level='a']"/><xsl:text>’. </xsl:text>
            <!-- Editor -->
            <xsl:apply-templates select="tei:monogr/tei:editor"/>
            <!-- Translator -->
            <xsl:apply-templates select="tei:monogr/tei:respStmt[tei:resp='translator']/tei:persName"/>
            <!-- Journal title -->
            <i><xsl:value-of select="tei:monogr/tei:title[@level='j']"/></i>
            <!-- Volume -->
            <xsl:if test="tei:monogr/tei:imprint/tei:biblScope[@unit='volume']">
                <xsl:text> </xsl:text>
                <xsl:value-of select="tei:monogr/tei:imprint/tei:biblScope[@unit='volume']"/>
            </xsl:if>
            <!-- Date -->
            <xsl:text> (</xsl:text>
            <xsl:value-of select="tei:monogr/tei:imprint/tei:date"/>
            <xsl:text>)</xsl:text>
            <!-- Page numbers, if present -->
            <xsl:if test="tei:monogr/tei:imprint/tei:biblScope[@unit='page']">
                <xsl:text>: </xsl:text>
                <xsl:value-of select="tei:monogr/tei:imprint/tei:biblScope[@unit='page']"/>
            </xsl:if>
            <xsl:text>.</xsl:text>
        </div>
    </xsl:template>
    
    <!-- Template for authors -->
    <xsl:template match="tei:author">
        <xsl:choose>
            <!-- First author: surname, forename -->
            <xsl:when test="position() = 1">
                <xsl:value-of select="tei:surname"/>
                <xsl:text>, </xsl:text>
                <xsl:value-of select="tei:forename"/>
            </xsl:when>
            <!-- Subsequent authors: forename surname -->
            <xsl:otherwise>
                <xsl:text>, and </xsl:text>
                <xsl:value-of select="tei:forename"/>
                <xsl:text> </xsl:text>
                <xsl:value-of select="tei:surname"/>
            </xsl:otherwise>
        </xsl:choose>
        <xsl:if test="position() = last()">
            <xsl:text>. </xsl:text>
        </xsl:if>
    </xsl:template>
    
    <!-- Template for editors (with authors) -->
    <xsl:template match="tei:editor">
        <xsl:choose>
            <!-- First editor: "Edited by forename surname" -->
            <xsl:when test="position() = 1">
                <xsl:text> Edited by </xsl:text>
                <xsl:value-of select="tei:forename"/>
                <xsl:text> </xsl:text>
                <xsl:value-of select="tei:surname"/>
            </xsl:when>
            <!-- Subsequent editors: "and forename surname" -->
            <xsl:otherwise>
                <xsl:text> and </xsl:text>
                <xsl:value-of select="tei:forename"/>
                <xsl:text> </xsl:text>
                <xsl:value-of select="tei:surname"/>
            </xsl:otherwise>
        </xsl:choose>
        <xsl:if test="position() = last()">
            <xsl:text>. </xsl:text>
        </xsl:if>
    </xsl:template>
    
    <!-- Template for editors (no authors) -->
    
    <xsl:template match="tei:editor" mode="no-authors">
        <xsl:choose>
            <!-- First editor: surname, forename -->
            <xsl:when test="position() = 1">
                <xsl:value-of select="tei:surname"/>
                <xsl:text>, </xsl:text>
                <xsl:value-of select="tei:forename"/>
            </xsl:when>
            <!-- Subsequent editors: forename surname -->
            <xsl:otherwise>
                <xsl:text>, and </xsl:text>
                <xsl:value-of select="tei:forename"/>
                <xsl:text> </xsl:text>
                <xsl:value-of select="tei:surname"/>
            </xsl:otherwise>
        </xsl:choose>
        <!-- Add "ed." or "eds." -->
        <xsl:if test="position() = last()">
            <xsl:choose>
                <xsl:when test="position() = 1">
                    <xsl:text>, ed. </xsl:text>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:text>, eds. </xsl:text>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:if>
    </xsl:template>
        
    <!-- Template for translators -->
    <xsl:template match="tei:respStmt[tei:resp='translator']/tei:persName">
        <xsl:choose>
            <!-- First translator: "Translated by forename surname" -->
            <xsl:when test="position() = 1">
                <xsl:text> Translated by </xsl:text>
                <xsl:value-of select="tei:forename"/>
                <xsl:text> </xsl:text>
                <xsl:value-of select="tei:surname"/>
            </xsl:when>
            <!-- Subsequent translators: "and forename surname" -->
            <xsl:otherwise>
                <xsl:text> and </xsl:text>
                <xsl:value-of select="tei:forename"/>
                <xsl:text> </xsl:text>
                <xsl:value-of select="tei:surname"/>
            </xsl:otherwise>
        </xsl:choose>
        <xsl:if test="position() = last()">
            <xsl:text>. </xsl:text>
        </xsl:if>
    </xsl:template>
    
</xsl:stylesheet>

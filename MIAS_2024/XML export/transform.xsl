<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:tei="http://www.tei-c.org/ns/1.0">
    <xsl:output method="xml" indent="yes" encoding="UTF-8"/>
    
    <!-- Match the root element of the FileMaker XML export -->
    <xsl:template match="/FMPXMLRESULT">
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
                        <xsl:apply-templates select="RESULTSET/ROW"/>
                    </listBibl>
                </body>
            </text>
        </TEI>
    </xsl:template>
    
    <!-- Template for each record -->
    <xsl:template match="ROW">
        <bibl>
            <!-- Auto-generate xml:id -->
            <xsl:attribute name="xml:id">
                <xsl:value-of select="concat('index_work_', position())"/>
            </xsl:attribute>
            <title>
                <xsl:value-of select="COL[@NAME='Title']"/>
            </title>
            <idno type="RG">
                <xsl:value-of select="COL[@NAME='RG. No.']"/>
            </idno>
            <note type="classification">
                <xsl:value-of select="COL[@NAME='Verified']"/>
            </note>
            <!-- Auto-generate ref target -->
            <ref>
                <xsl:attribute name="target">
                    <xsl:value-of select="concat('work_', position(), '.xml')"/>
                </xsl:attribute>
                <xsl:text>Link to Work </xsl:text>
                <xsl:value-of select="position()"/>
            </ref>
        </bibl>
    </xsl:template>
</xsl:stylesheet>

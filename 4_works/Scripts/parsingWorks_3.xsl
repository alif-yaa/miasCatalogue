<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    version="2.0">
    
    <!-- Output settings -->
    <xsl:output method="xml" encoding="UTF-8" indent="yes"/>
    
    <!-- Match the root TEI element -->
    <xsl:template match="/tei:TEI">
        <!-- Loop through each <bibl> element -->
        <xsl:for-each select="//tei:bibl">
            <!-- Create a new document for each <bibl> -->
            <xsl:result-document 
                href="../../4_works/{@xml:id}.xml" 
                method="xml"
                encoding="UTF-8">
                
                <!-- Start the new file with the TEI preamble -->
                <TEI xmlns="http://www.tei-c.org/ns/1.0">
                    <!-- Include the necessary teiHeader, customize as needed -->
                    <teiHeader>
                        <fileDesc>
                            <titleStmt>
                                <!-- Set the <title> based on the <title> element within the <bibl> -->
                                <title>
                                    <xsl:value-of select="tei:title[@xml:lang='ara-Latn-x-lc'][@type='uniform']"/>
                                    <xsl:text> | MIAS Catalogue</xsl:text>
                                </title>
                            </titleStmt>
                            <publicationStmt>
                                <p>Publication Information</p>
                            </publicationStmt>
                            <sourceDesc>
                                <p>Information about the source</p>
                            </sourceDesc>
                        </fileDesc>
                    </teiHeader>
                    
                    <!-- Insert the <bibl> element -->
                    <text>
                        <body>
                            <xsl:copy-of select="."/>
                        </body>
                    </text>
                </TEI>
            </xsl:result-document>
        </xsl:for-each>
    </xsl:template>
    
</xsl:stylesheet>

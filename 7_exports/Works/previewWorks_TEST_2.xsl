<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    version="1.0"
    xmlns:tei="http://www.tei-c.org/ns/1.0">
    <xsl:output method="html" indent="yes"/>
    
    <!-- Template for the root element -->
    <xsl:template match="/">
        <html>
            <head>
                <title>Works By Ibn al-ʿArabī</title>
                <style>
                    body {
                    font-family: Arial, sans-serif; 
                    }
                    h1, h2 {
                    color: #4CAF50;
                    text-align: center;
                    }
                    h1 {
                    font-style: italic;
                    }
                    h2 {
                    font-style: normal;
                    }
                    h3 {
                    color: #333;
                    margin-top: 10px;
                    }
                    .container {
                    border: 5px solid #4CAF50; /* Green border */
                    padding: 20px;             /* Inner padding */
                    margin: 20px auto;         /* Outer margin (auto centers the container) */
                    max-width: 900px;          /* Optional: set a maximum width for the content */
                    background-color: #f9f9f9; /* Optional: light background color */
                    }
                    .bibl {
                    margin-bottom: 30px;
                    border-bottom: 1px solid #ccc; 
                    padding-bottom: 10px;
                    }
                    .bibl p {
                    margin: 5px 0;
                    }
                    .body-text {
                    color: #333;
                    }
                </style>
            </head>
            <body>
                <div class="container">
                    <h1>Works by Ibn al-ʿArabī</h1>
                    <xsl:apply-templates select="//tei:bibl"/>
                </div>
            </body>
        </html>
    </xsl:template>
    
    <!-- Template for <bibl> elements -->
    <xsl:template match="tei:bibl">
        <div class="bibl">
            <!-- Main Title -->
            <xsl:if test="tei:title[@xml:lang='ara-Latn-x-lc' and @type='uniform']">
                <h1>
                    <xsl:value-of select="tei:title[@xml:lang='ara-Latn-x-lc' and @type='uniform']"/>
                </h1>
            </xsl:if>
            
            <!-- Arabic Title -->
            <xsl:if test="tei:title[@xml:lang='ara' and @type='uniform-ara']">
                <h2>
                    <xsl:value-of select="tei:title[@xml:lang='ara' and @type='uniform-ara']"/>
                </h2>
            </xsl:if>
            
            <!-- Information Immediately After Title -->
            <xsl:if test="tei:idno[@type='RG']">
                <h3>
                    RG: <xsl:value-of select="tei:idno[@type='RG']"/>
                </h3>
            </xsl:if>
            
            <xsl:if test="tei:placeName[@type='fmPlace']">
                <h3>
                    Place: <xsl:value-of select="tei:placeName[@type='fmPlace']"/>
                </h3>
            </xsl:if>
            
            <xsl:if test="tei:date[@type='fmDate']">
                <h3>
                    Date: <xsl:value-of select="tei:date[@type='fmDate']"/>
                </h3>
            </xsl:if>
            
            <xsl:if test="tei:note[@type='authentification']">
                <h3>
                    Authentification: <xsl:value-of select="tei:note[@type='authentification']"/>
                </h3>
            </xsl:if>
            
            <!-- Additional Info with Subheadings -->
            <xsl:if test="tei:note[@type='fmComposition']">
                <h3>Composition</h3>
                <p class="body-text">
                    <xsl:value-of select="tei:note[@type='fmComposition']"/>
                </p>
            </xsl:if>
            
            <xsl:if test="tei:date[@type='fmEarliestMS']">
                <h3>Earliest witness</h3>
                <p class="body-text">
                    <xsl:value-of select="tei:date[@type='fmEarliestMS']"/>
                </p>
            </xsl:if>
            
            <xsl:if test="tei:title[@xml:lang='ara-Latn-x-lc' and @type='full']">
                <h3>Full title</h3>
                <p class="body-text">
                    <xsl:value-of select="tei:title[@xml:lang='ara-Latn-x-lc' and @type='full']"/>
                </p>
            </xsl:if>
            
            <xsl:if test="tei:title[@xml:lang='ara-Latn-x-lc' and @type='alternate']">
                <h3>Alternate titles</h3>
                <p class="body-text">
                    <xsl:value-of select="tei:title[@xml:lang='ara-Latn-x-lc' and @type='alternate']"/>
                </p>
            </xsl:if>
            
            <xsl:if test="tei:incipit[@type='uniform']">
                <h3>Incipit</h3>
                <p class="body-text">
                    <xsl:value-of select="tei:incipit[@type='uniform']"/>
                </p>
            </xsl:if>
            
            <xsl:if test="tei:noteGrp[@type='workDesc']/tei:note[@type='description']">
                <h3>Description</h3>
                <p class="body-text">
                    <xsl:value-of select="tei:noteGrp[@type='workDesc']/tei:note[@type='description']"/>
                </p>
            </xsl:if>
            
            <xsl:if test="tei:noteGrp[@type='workDesc']/tei:note[@type='biblioComments']">
                <h3>Manuscripts</h3>
                <p class="body-text">
                    <xsl:value-of select="tei:noteGrp[@type='workDesc']/tei:note[@type='biblioComments']"/>
                </p>
            </xsl:if>
            
            <xsl:if test="tei:noteGrp[@type='references']/tei:note[@type='ijaza_2']">
                <h3>Ijaza No.</h3>
                <p class="body-text">
                    <xsl:value-of select="tei:noteGrp[@type='references']/tei:note[@type='ijaza_2']"/>
                </p>
            </xsl:if>
            
            <xsl:if test="tei:noteGrp[@type='references']/tei:note[@type='fihris_2']">
                <h3>Fihris No.</h3>
                <p class="body-text">
                    <xsl:value-of select="tei:noteGrp[@type='references']/tei:note[@type='fihris_2']"/>
                </p>
            </xsl:if>
        </div>
    </xsl:template>
    
</xsl:stylesheet>
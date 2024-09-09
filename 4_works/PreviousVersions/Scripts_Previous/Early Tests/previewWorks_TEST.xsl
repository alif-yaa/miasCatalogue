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
                    font-family: Arial, sans-serif; }
                    h1 {
                    color: #4CAF50;
                    text-align: center;
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
                    .title-latin {
                    font-size: 1.2em;
                    font-style: italic;
                    font-weight: bold;
                    color: #191919;
                    margin-bottom: 0;
                    }
                    .rg-number {
                    font-size: 0.8em;
                    text-transform: small-caps;
                    font-style: roman;
                    margin-left: 5px;
                    color: #191919;
                    }
                    .title-arabic {
                    font-size: 1.5em;
                    font-weight: bold;
                    color: #191919;
                    direction: rtl;
                    margin-top: 0;
                    }
                    .place-date {
                    font-size: 1.1em;
                    color: #555;
                    margin-top: 5px;
                    }
                    .composition-history, .description, .incipit, .textual-criticism, .references {
                    margin-top: 15px;
                    font-weight: bold;
                    color: #333333;
                    }
                    .composition-history-text, .description-text, .textual-criticism-text, .references-text{
                    margin-top: 5px;
                    color: #333333;
                    }
                    .incipit-text {
                    margin-top: 5px;
                    font-style: italic;
                    color: #333333;
                    }
                </style>
            </head>
            <body>
                <div class="container">
                    <h1>Works by Ibn al-ʿArabī</h1>
                    <xsl:apply-templates select="//tei:bibl"/>
                </div>
                <h1>Works by Ibn al-ʿArabī</h1>
                <xsl:apply-templates select="//tei:bibl"/>
            </body>
        </html>
    </xsl:template>
    
    <!-- Template for <bibl> elements -->
    <xsl:template match="tei:bibl">
        <div class="bibl">
            
            <!-- Title in Arabic script -->
            <div class="title-arabic">
                <xsl:value-of select="tei:title[@xml:lang='ara' and @type='uniform-ara']"/>
            </div>
            
            <!-- Title in Latin script and RG number -->
            <div class="title-latin">
                <xsl:value-of select="tei:title[@xml:lang='ara-Latn-x-lc' and @type='uniform']"/>
                <span class="rg-number">(RG <xsl:value-of select="tei:idno[@type='RG']"/>)</span>
            </div>
            
            <!-- Place and Date -->
            <div class="place-date">
                <!-- PlaceName -->
                <xsl:value-of select="tei:placeName[@type='fmPlace'][normalize-space(.) != '']"/>
                
                <!-- Conditionally add comma only if both PlaceName and Date are present and not empty -->
                <xsl:if test="normalize-space(tei:placeName[@type='fmPlace']) != '' 
                    and normalize-space(tei:date[@type='fmDate']) != ''">
                    <xsl:text>, </xsl:text>
                </xsl:if>
                
                <!-- Date -->
                <xsl:value-of select="tei:date[@type='fmDate'][normalize-space(.) != '']"/>
            </div>
            
            <!-- Composition History -->
            <xsl:if test="tei:note[@type='fmComposition']">
                <div class="composition-history">Composition History</div>
                <div class="composition-history-text">
                    <xsl:value-of select="tei:note[@type='fmComposition']"/>
                </div>
            </xsl:if>
            
            <!-- Incipit -->
            <xsl:if test="tei:incipit[@type='uniform']">
                <div class="incipit">Incipit</div>
                <div class="incipit-text">
                    <xsl:value-of select="tei:incipit[@type='uniform']"/>
                </div>
            </xsl:if>
            
            <!-- Description -->
            <xsl:if test="tei:noteGrp/tei:note[@type='description']">
                <div class="description">Description</div>
                <div class="description-text">    
                    <xsl:value-of select="tei:noteGrp/tei:note[@type='description']"/>
                </div>
            </xsl:if>
            
            <!-- Textual Criticism -->
            <xsl:if test="tei:noteGrp/tei:note[@type='biblioComments']">
                <div class="textual-criticism">Textual Criticism</div>
                <div class="textual-criticism-text">
                    <xsl:value-of select="tei:noteGrp/tei:note[@type='biblioComments']"/>
                </div>
            </xsl:if>
            
            <!-- References: Ijaza and Fihris -->
            <xsl:if test="tei:noteGrp/tei:note[@type='ijaza_2']">
                <div class="references">Ijaza No. (Badawī)</div>
                <div class="references-text">
                    <xsl:value-of select="tei:noteGrp/tei:note[@type='ijaza_2']"/>
                </div>
            </xsl:if>
            
            <xsl:if test="tei:noteGrp/tei:note[@type='fihris_2']">
                <div class="references">Fihris No. (ʿAwwād)</div>
                <div class="references-text"> 
                    <xsl:value-of select="tei:noteGrp/tei:note[@type='fihris_2']"/>
                </div>
            </xsl:if>
           
        </div>
    </xsl:template>
</xsl:stylesheet>
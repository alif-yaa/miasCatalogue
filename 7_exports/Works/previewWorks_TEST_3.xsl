<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    version="1.0"
    xmlns:tei="http://www.tei-c.org/ns/1.0">
    <xsl:output method="html" indent="yes"/>
    
    <!-- Template to match the root and generate HTML structure -->
    <xsl:template match="/">
        <html>
            <head>
                <style>
                    /* CSS styles for the HTML preview */
                    .bibl-box {
                    background-color: #e8efc0;
                    border: 2px solid #d8dfb0;
                    padding: 10px;
                    margin-bottom: 20px;
                    }
                    .info-box {
                    background-color: white;
                    border: 1px solid #d8dfb0;
                    padding: 5px;
                    margin-bottom: 10px;
                    }
                    .title-latin {
                    font-style: italic;
                    color: #0052a4;
                    font-size: 1.2em;
                    }
                    .title-arabic {
                    font-size: 0.9em;
                    direction: rtl;
                    }
                    .subheading {
                    font-weight: bold;
                    }
                </style>
            </head>
            <body>
                <!-- Loop through each <bibl> element -->
                <xsl:apply-templates select="//tei:bibl"/>
            </body>
        </html>
    </xsl:template>
    
    <!-- Template to match each <bibl> element -->
    <xsl:template match="tei:bibl">
        <div class="bibl-box">
            <!-- Entry Title (Latin) -->
            <div class="title-latin">
                <xsl:value-of select="tei:title[@xml:lang='ara-Latn-x-lc'][@type='uniform']"/>
            </div>
            
            <!-- Entry Title (Arabic) -->
            <div class="title-arabic">
                <xsl:value-of select="tei:title[@xml:lang='ara'][@type='uniform-ara']"/>
            </div>
            
            <!-- First Row: Date, Place, Authentication -->
            <div class="info-box">
                <span class="subheading">Date</span>
                <xsl:value-of select="tei:date[@type='fmDate'][@calendar='Hijri-qamari']"/>
                <br/>
                <span class="subheading">Place</span>
                <xsl:value-of select="tei:placeName[@type='fmPlace']"/>
                <br/>
                <span class="subheading">Authentication</span>
                <xsl:value-of select="tei:note[@type='authentification']"/>
            </div>
            
            <!-- Second Row: Composition -->
            <div class="info-box">
                <span class="subheading">Composition</span>
                <xsl:value-of select="tei:note[@type='fmComposition']"/>
            </div>
            
            <!-- Third Row: Full Title, Alternate Titles -->
            <div class="info-box">
                <span class="subheading">Full Title</span>
                <xsl:value-of select="tei:title[@type='full'][@xml:lang='ara-Latn-x-lc']"/>
                <br/>
                <span class="subheading">Alternate Titles</span>
                <xsl:value-of select="tei:title[@type='alternate'][@xml:lang='ara-Latn-x-lc']"/>
            </div>
            
            <!-- Fourth Row: Incipit -->
            <div class="info-box">
                <span class="subheading">Incipit</span>
                <xsl:value-of select="tei:incipit[@type='uniform'][@xml:lang='ara-Latn-x-lc']"/>
            </div>
            
            <!-- Fifth Row: Description -->
            <div class="info-box">
                <span class="subheading">Description</span>
                <xsl:value-of select="tei:noteGrp[@type='workDesc']/tei:note[@type='description']"/>
            </div>
            
            <!-- Sixth Row: Manuscript Base -->
            <div class="info-box">
                <span class="subheading">Manuscript Base</span>
                <xsl:value-of select="tei:noteGrp[@type='workDesc']/tei:note[@type='biblioComments']"/>
            </div>
            
            <!-- Seventh Row: RG №, Ijaza №, Fihris № -->
            <div class="info-box">
                <span class="subheading">RG №</span>
                <xsl:value-of select="tei:idno[@type='RG']"/>
                <br/>
                <span class="subheading">Ijaza №</span>
                <xsl:value-of select="tei:noteGrp[@type='references']/tei:note[@type='ijaza_2']"/>
                <br/>
                <span class="subheading">Fihris №</span>
                <xsl:value-of select="tei:noteGrp[@type='references']/tei:note[@type='fihris_2']"/>
            </div>
        </div>
    </xsl:template>
</xsl:stylesheet>

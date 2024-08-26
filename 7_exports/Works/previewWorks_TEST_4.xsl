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
                    body {
                    font-family: Verdana, sans-serif; 
                    }
                    .bibl-box {
                    background-color: #e8efc0;
                    border: 2px solid #d8dfb0;
                    padding: 10px;
                    margin-bottom: 20px;
                    min-width: 760px;
                    }
                    .info-row {
                    display: flex;
                    align-items: center;
                    margin-bottom: 10px;
                    min-width: 760px; /* Adjust this value based on your content */
                    }
                    .subheading {
                    font-weight: bold;
                    padding-right: 10px;
                    min-width: 150px;
                    text-align: right;
                    vertical-align: middle;
                    }
                    .info-box {
                    background-color: white;
                    border: 1px solid #d8dfb0;
                    padding: 5px;
                    margin-left: 10px;
                    flex: 1;
                    }
                    .info-box-italics {
                    font-style: italic;
                    background-color: white;
                    border: 1px solid #d8dfb0;
                    padding: 5px;
                    margin-left: 10px;
                    flex: 1;
                    }
                    .title-latin {
                    font-style: italic;
                    font-weight: bold;
                    color: #0052a4;
                    font-size: 1.3em;
                    text-align: center;
                    margin-bottom: 5px;
                    font-family: 'Comorant Garamond', serif;
                    }
                    .title-arabic {
                    font-size: 1.3em;
                    color: #0052a4;
                    direction: rtl;
                    margin-bottom: 15px;
                    text-align: center;
                    font-family: 'Amiri', serif;
                    }
                    .scholar-comments-header {
                    font-weight: bold;
                    font-size: 1.1em;
                    color: #0052a4;
                    margin-top: 20px;
                    margin-bottom: 10px;
                    }
                    .scholar-comment-box {
                    background-color: #f1f3eb; /* Different background color for scholar comments */
                    border: 2px solid #e1dbe8; /* Different border color for scholar comments */
                    padding: 10px;
                    margin-top: 10px;
                    margin-bottom: 10px;
                    min-width: 760px;
                    }
                    .subheading-scholar {
                    font-weight: normal;
                    font-size: 0.8em;
                    padding-right: 10px;
                    min-width: 150px;
                    text-align: right;
                    vertical-align: middle;
                    }
                    .scholar-comment {
                    font-size: 0.8em; /* Smaller text for scholar comments */
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
            <div class="info-row">
                <div class="subheading">Date</div>
                <div class="info-box">
                    <xsl:value-of select="tei:date[@type='fmDate'][@calendar='Hijri-qamari']"/>
                </div>
                <div class="subheading">Place</div>
                <div class="info-box">
                    <xsl:value-of select="tei:placeName[@type='fmPlace']"/>
                </div>
                <div class="subheading">Auth.</div>
                <div class="info-box">
                    <xsl:value-of select="tei:note[@type='authentification']"/>
                </div>
            </div>
            
            
            <!-- Second Row: Composition -->
            <div class="info-row">
                <div class="subheading">Composition</div>
                <div class="info-box">
                    <xsl:value-of select="tei:note[@type='fmComposition']"/>
                </div>
            </div>
            
            <!-- Third Row: Full Title, Alternate Titles -->
            <div class="info-row">
                <div class="subheading">Full Title</div>
                <div class="info-box-italics">
                    <xsl:value-of select="tei:title[@type='full'][@xml:lang='ara-Latn-x-lc']"/>
                </div>
                <div class="subheading">Alternate Titles</div>
                <div class="info-box-italics">
                    <xsl:value-of select="tei:title[@type='alternate'][@xml:lang='ara-Latn-x-lc']"/>
                </div>
            </div>
            
            <!-- Fourth Row: Incipit -->
            <div class="info-row">
                <div class="subheading">Incipit</div>
                <div class="info-box-italics">
                    <xsl:value-of select="tei:incipit[@type='uniform'][@xml:lang='ara-Latn-x-lc']"/>
                </div>
            </div>
            
            <!-- Fifth Row: Description -->
            <div class="info-row">
                <div class="subheading">Description</div>
                <div class="info-box">
                    <xsl:value-of select="tei:noteGrp[@type='workDesc']/tei:note[@type='description']"/>
                </div>
            </div>
            
            <!-- Sixth Row: Manuscript Base -->
            <div class="info-row">
                <div class="subheading">Manuscript Base</div>
                <div class="info-box">
                    <xsl:value-of select="tei:noteGrp[@type='workDesc']/tei:note[@type='biblioComments']"/>
                </div>
            </div>
            
            <!-- Seventh Row: RG №, Ijaza №, Fihris № -->
            <div class="info-row">
                <div class="subheading">RG №</div>
                <div class="info-box">
                    <xsl:value-of select="tei:idno[@type='RG']"/>
                </div>
                <div class="subheading">Ijaza №</div>
                <div class="info-box">
                    <xsl:value-of select="tei:noteGrp[@type='references']/tei:note[@type='ijaza_2']"/>
                </div>
                <div class="subheading">Fihris №</div>
                <div class="info-box">
                    <xsl:value-of select="tei:noteGrp[@type='references']/tei:note[@type='fihris_2']"/>
                </div>
            </div>
            
            <!-- New Rows for Scholar Comments -->
            <xsl:if test="tei:noteGrp[@type='scholarComments']">
                <!-- Scholar comments container -->
                <div class="scholar-comment-box">
                <!-- Scholars' Comments Header -->
                <div class="scholar-comments-header">Scholars' Comments</div>
                    <!-- Apply templates to notes within scholarComments -->
                    <xsl:apply-templates select="tei:noteGrp[@type='scholarComments']/tei:note"/>
                </div>
            </xsl:if>
        </div>
    </xsl:template>
    
    <!-- Template to match each <note> within <noteGrp type="scholarComments"> -->
    <xsl:template match="tei:note">
        <div class="info-row">
            <div class="subheading-scholar">
                <xsl:value-of select="@resp"/>
            </div>
            <div class="info-box scholar-comment">
                <xsl:value-of select="."/>
            </div>
        </div>
    </xsl:template>
</xsl:stylesheet>

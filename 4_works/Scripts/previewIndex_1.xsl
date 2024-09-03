<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"
    xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:xhtml="http://www.w3.org/1999/xhtml">
    <xsl:output method="html" indent="yes"/>
    
    <!-- Template to match the root and generate HTML structure -->
    <xsl:template match="/">
        <html>
            <head>
                <style>
                    body {
                    font-family: 'Comorant Garamond', serif;
                    }
                    /* green background */
                    .background-1 {
                    background-color: #e8efc0;
                    border: 2px solid #d8dfb0;
                    padding: 10px;
                    min-width: 600px;
                    }
                    /* Row styling */
                    .row-2 {
                    display: flex;
                    justify-content: space-between;
                    align-items: center;
                    margin-bottom: 10px;
                    min-width: 600px; /* Adjust this value as necessary */
                    }
                    .column {
                    flex: 1;
                    padding: 5px;
                    margin: 0 10px;
                    }
                    .column-small {
                    flex: 1;
                    padding: 5px;
                    margin: 0 10px;
                    max-width: 50px;
                    }
                    /* Custom link style */
                    a {
                    text-decoration: none;
                    color: #0052a4; /* Your desired color */
                    }
                    /* Title boxes */
                    .box-1,
                    .box-1-italics,
                    .box-1-arabic {
                    background-color: white;
                    border: 1px solid #d8dfb0;
                    padding: 5px;
                    margin-left: 5px;
                    margin-right: 5px;
                    flex: 1;
                    display: flex;
                    align-items: center;
                    line-height: 1.5;
                    }
                    .box-1-italics {
                    font-style: italic;
                    }
                    .box-1-arabic {
                    direction: rtl;
                    font-family: 'Amiri', serif;
                    }
                    /* small box */
                    .box-small {
                    background-color: white;
                    border: 1px solid #d8dfb0;
                    padding: 5px;
                    margin-left: 5px;
                    margin-right: 5px;
                    flex: 1;
                    display: flex;
                    align-items: center;
                    line-height: 1.5;
                    max-width: 50px;
                    }
                    /* headings */
                    .h4 {
                    font-weight: bold;
                    color: #0052a4;
                    font-size: 1em;
                    text-align: center;
                    margin-top: 10px;
                    margin-bottom: 10px;
                    }
                    .h4-arabic {
                    text-align: center;
                    direction: rtl;
                    font-family: 'Amiri', serif;
                    color: #0052a4;
                    }
                </style>
            </head>
            <body>
                <div class="background-1">
                    <!-- Column headings -->
                    <div class="row-2">
                        <div class="column-small">
                            <div class="h4">RG №</div>
                        </div>
                        <div class="column">
                            <div class="h4">Title</div>
                        </div>
                        <div class="column">
                            <div class="h4-arabic">عنوان</div>
                        </div>
                    </div>
                    
                    <!-- Loop through each <bibl> element -->
                    <xsl:apply-templates select="//tei:bibl"/>
                </div>
            </body>
        </html>
    </xsl:template>
    
    <!-- Template to match each <bibl> element -->
    <xsl:template match="tei:bibl">
        <div class="row-2">
            <div class="column-small">
                <div class="box-small">
                    <xsl:value-of select="tei:idno[@type = 'RG']"/>
                </div>
            </div>
            <div class="column">
                <div class="box-1-italics">
                    <a>
                        <xsl:attribute name="href">
                            <xsl:value-of select="concat('../worksPreview/', tei:idno[@type = 'keyword'], '.html')"/>
                        </xsl:attribute>
                        <xsl:value-of select="tei:title[@xml:lang = 'ara-Latn-x-lc'][@type = 'uniform']"/>
                    </a>
                </div>
            </div>
            <div class="column">
                <div class="box-1-arabic">
                    <a>
                        <xsl:attribute name="href">
                            <xsl:value-of select="concat(tei:idno[@type = 'keyword'], '.html')"/>
                        </xsl:attribute>
                        <xsl:value-of select="tei:title[@xml:lang = 'ara'][@type = 'uniform']"/>
                    </a>
                </div>
            </div>
        </div>
    </xsl:template>
    
</xsl:stylesheet>

<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    xmlns:tei="http://www.tei-c.org/ns/1.0" 
    version="2.0">
    
    <!-- Import the bibliography XML -->
    <xsl:variable name="bibliography" select="document('../Bibliography/bibliography.xml')"/>
    
    <!-- Import the biblPreview.xsl for formatting -->
    <xsl:import href="biblPreview.xsl"/>
    
    <!-- Get the current work's xml:id -->
    <xsl:variable name="workId" select="(//tei:bibl/@xml:id | //tei:idno[@type='keyword'])[1]"/>
    
    <!-- Main template -->
    <xsl:template match="/">
        <html>
            <head> 
                <title>Bibliographic Preview</title>
                <style>
                    /* Basic styles for preview */
                    body { font-family: Arial, sans-serif; }
                    .section { margin-bottom: 20px; }
                    .section h2 { border-bottom: 1px solid #ddd; padding-bottom: 5px; }
                    .bibl { margin-bottom: 10px; }
                </style>
            </head>
            <body>
                <h1>Bibliographic Preview</h1>
                
                <!-- Debug output for workId -->
                <div>
                    <h2>Debug Information</h2>
                    <p><strong>Current Work ID:</strong> <xsl:value-of select="$workId"/></p>
                </div>
                
                <!-- Filter bibliography items by the current work's xml:id -->
                <xsl:variable name="filteredBibliography" select="$bibliography//tei:biblStruct[tei:note[@type='tags']/tei:note = $workId]"/>
                
                <!-- Editions Section -->
                <div class="section">
                    <h2>Editions</h2>
                    <xsl:for-each select="$filteredBibliography[tei:note[@type='tags']/tei:note = 'edition']">
                        <!-- Sort by surname -->
                        <xsl:sort select="concat(
                            normalize-space(tei:monogr/tei:author[1]/tei:surname[1]), 
                            normalize-space(tei:analytic/tei:author[1]/tei:surname[1]), 
                            normalize-space(tei:monogr/tei:editor[1]/tei:surname[1])
                            )" order="ascending"/>
                        <div class="bibl">
                            <xsl:apply-templates select="."/>
                        </div>
                    </xsl:for-each>
                </div>
                
                <!-- Translations Section -->
                <div class="section">
                    <h2>Translations</h2>
                    <xsl:for-each select="$filteredBibliography[tei:note[@type='tags']/tei:note = 'translation']">
                        <!-- Sort by surname -->
                        <xsl:sort select="concat(
                            normalize-space(tei:monogr/tei:author[1]/tei:surname[1]), 
                            normalize-space(tei:analytic/tei:author[1]/tei:surname[1]), 
                            normalize-space(tei:monogr/tei:editor[1]/tei:surname[1])
                            )" order="ascending"/>
                        
<div class="bibl">
                            <xsl:apply-templates select="."/>
                        </div>
                    </xsl:for-each>
                </div>
                
                <!-- Studies Section -->
                <div class="section">
                    <h2>Studies</h2>
                    <xsl:for-each select="$filteredBibliography[tei:note[@type='tags']/tei:note = 'study']">
                        <!-- Sort by surname -->
                        <div class="bibl">
                            <xsl:apply-templates select="."/>
                        </div>
                    </xsl:for-each>
                </div>
            </body>
        </html>
    </xsl:template>    
       
</xsl:stylesheet>

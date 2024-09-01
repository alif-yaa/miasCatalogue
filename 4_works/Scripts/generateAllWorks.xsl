<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    version="2.0">
    
    <!-- Output settings -->
    <xsl:output method="xml" encoding="UTF-8" indent="yes"/>
    
    <!-- Match the root template to begin processing -->
    <xsl:template match="/">
        <!-- Create the final TEI document with a single preamble -->
        <TEI xmlns="http://www.tei-c.org/ns/1.0">
            <!-- Include the TEI Header -->
            <teiHeader>
                <fileDesc>
                    <titleStmt>
                        <title>Works</title>
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
                        <!-- Include multiple documents explicitly -->
                        <xsl:copy-of select="document('../Works/abadilah.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../Works/ajwiba.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../Works/alif.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../Works/amr.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../Works/anqa.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../Works/anwar.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../Works/aqtab.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../Works/arwah.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../Works/asrar.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../Works/awrad.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../Works/ayyam.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../Works/azal.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../Works/azama.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../Works/ba.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../Works/dana.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../Works/dhakhair.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../Works/diwan.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../Works/fihrist.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../Works/fusus.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../Works/futuhat.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../Works/haqq.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../Works/hilya.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../Works/hizb-ahad.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../Works/hizb-wiq.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../Works/hu.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../Works/hujub.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../Works/ifada.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../Works/ijaz.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../Works/ijaza-akb.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../Works/ijaza-muz.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../Works/ilam.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../Works/insan.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../Works/insha.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../Works/intisar.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../Works/isfar.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../Works/isharat.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../Works/isra.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../Works/istilahat.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../Works/ittihad.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../Works/jalal.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../Works/jalala.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../Works/jawab-dur.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../Works/jawab-mus.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../Works/jawab-sab.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../Works/jawab-sawd.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../Works/jawab-zum.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../Works/kashf.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../Works/kawkab.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../Works/khalwah.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../Works/khirqa.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../Works/kunh.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../Works/kutub.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../Works/lawaqih.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../Works/madkhal-hur.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../Works/mafatih.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../Works/mahajja.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../Works/malum.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../Works/manzil.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../Works/maqam.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../Works/maqsid.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../Works/maratib.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../Works/marifa-layl.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../Works/marifa-ula.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../Works/mashahid.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../Works/mawaqi.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../Works/mawiza.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../Works/mim.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../Works/mishka.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../Works/muashsharat.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../Works/mubashshirat.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../Works/muhadarat.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../Works/mukhtasar-dur.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../Works/muqni.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../Works/muwashshahat.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../Works/naqsh.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../Works/nasaih.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../Works/nataij.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../Works/nawadir.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../Works/nuqaba.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../Works/nuskha.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../Works/qasam.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../Works/qutb.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../Works/risala-ghaz.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../Works/risala-raz.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../Works/ruh.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../Works/sharh-khal.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../Works/shawahid.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../Works/sira.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../Works/tadbirat.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../Works/tafsir-fat.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../Works/tafsir-kal.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../Works/taiyya.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../Works/taj-ras.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../Works/taj-tar.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../Works/tajalliyat.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../Works/takhmis.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../Works/tanazzulat.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../Works/taqsim.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../Works/tarjuman.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../Works/uqla.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../Works/wasiyya.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../Works/wasiyya-kayf.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../Works/waz.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../Works/yaqin.xml')//tei:bibl"/>
                    </listBibl>
                </body>
            </text>
        </TEI>
    </xsl:template>
    
</xsl:stylesheet>

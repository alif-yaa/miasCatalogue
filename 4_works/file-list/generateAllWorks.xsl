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
                        <xsl:copy-of select="document('../abadilah.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../ajwiba.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../alif.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../amr_muh.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../anq_mugh.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../anwar.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../aqtab.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../arwah.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../asr_hur.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../awr_usb.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../ayy_shan.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../azal.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../azama.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../ba.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../dhakhair.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../diwan.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../fana.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../fihris.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../fus_hik.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../fut_mak.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../haqq.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../hil_abd.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../hiz_ahad.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../hiz_wiq.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../hu.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../hujub.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../huruf.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../ifada.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../ijaz_bay.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../ijaza_akb.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../ijaza_muz.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../ikh_sir.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../ilam.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../ins_kul.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../insh_daw.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../intisar.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../isfar.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../ish_qur.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../isra.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../ist_suf.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../itt_kawn.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../j_dur.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../j_mus.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../j_sab.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../j_sawd.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../j_zum.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../jal_jam.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../jalala.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../kashf_man.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../kawk_dur.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../khalwa.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../khirqa.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../kunh.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../kutub.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../law_asr.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../maf_ghuy.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../mah_bayd.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../malum.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../man_man.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../maq_asm.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../maq_qur.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../mar_layl.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../mar_wahb.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../marifa.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../mash_asr.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../maw_has.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../maw_nuj.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../mim.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../mishk_anw.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../muashsharat.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../mubashshirat.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../muh_abr.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../mukh_dur.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../muqni.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../muwashshahat.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../naqsh_fus.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../nasaih.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../nat_adh.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../nawadir.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../nuqaba.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../nus_haqq.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../qas_ilah.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../qut_imam.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../r_ghaz.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../r_razi.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../ruh_quds.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../sh_khal.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../shaw_haqq.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../tad_ilah.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../taf_fat.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../taf_kal.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../taiyya.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../taj_ras.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../taj_tar.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../tajalliyat.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../takh_mad.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../tan_maws.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../taq_nuut.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../tar_ash.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../uql_mus.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../was_kayf.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../wasiyya.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../waz_ahb.xml')//tei:bibl"/>
                        <xsl:copy-of select="document('../yaqin.xml')//tei:bibl"/>
                        
                    </listBibl>
                </body>
            </text>
        </TEI>
    </xsl:template>
    
</xsl:stylesheet>

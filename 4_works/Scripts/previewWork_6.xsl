<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:xhtml="http://www.w3.org/1999/xhtml" exclude-result-prefixes="xs" version="2.0">
    <xsl:output method="html" indent="yes"/>

    <!-- Template to match the root and generate HTML structure -->
    <xsl:template match="/">
        <html>
            <head>
                <link rel="stylesheet"
                    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"/>
                <style>
                    /*Latin Script Font and ensure backdrop fills full screen*/
                    body {
                        font-family: 'Comorant Garamond', serif;
                        margin: 0;
                        padding: 0;
                        height: 100%;
                        width: 100%;
                    }
                    /*Arabic Script Font*/
                    .arabic {
                        font-family: 'Amiri', serif;
                        direction: rtl;
                        text-align: right;
                    }
                    /* title */
                    .h1-italic,
                    .h1-arabic {
                        font-size: 1.8em;
                        color: #A62300;
                        text-align: center;
                    }
                    .h1-italic {
                        font-style: italic;
                        font-weight: bold;
                        margin-top: 20px;
                        margin-bottom: 5px;
                        font-family: 'Comorant Garamond', serif;
                    }
                    .h1-arabic {
                        margin-bottom: 20px;
                        direction: rtl;
                        font-family: 'Amiri', serif;
                    }
                    /* headings */
                    .h2,
                    .h2-arabic {
                        font-weight: bold;
                        color: #0052a4;
                        font-size: 1.2em;
                        margin-top: 10px;
                        margin-bottom: 10px;
                        margin-right: 5px;
                        margin-left: 5px;
                        text-align: center;
                    }
                    .h2-arabic {
                        direction: rtl;
                        font-family: 'Amiri', serif;
                    }
                    /* subheadings */
                    .h3,
                    .h3-arabic {
                        font-weight: bold;
                        font-size: 1em;
                        margin-top: 10px;
                        margin-bottom: 10px;
                        color: #0052a4;
                        margin-left: 10px;
                        margin-right: 10px;
                    
                    }
                    .h3-arabic {
                        text-align: right;
                        direction: rtl;
                        font-family: 'Amiri', serif;
                    }
                    /* field names to side of box */
                    .h4,
                    .h4-italic,
                    .h4-arabic {
                        vertical-align: middle;
                        align-self: center;
                    }
                    .h4, 
                    .h4-italic {
                        padding-right: 10px;
                        min-width: 90px;
                        text-align: right;
                    }
                    .h4-italic {
                    font-style: italic;
                    }
                    .h4-arabic {
                        padding-left: 8px;
                        min-width: 75px;
                        text-align: left;
                        direction: rtl;
                        font-family: 'Amiri', serif;
                    }
                    /* field names above box */
                    .h5,
                    .h5-arabic,
                    .h5-italic {
                        vertical-align: middle;
                        align-self: center;
                        margin-left: 25px;
                        margin-right: 25px;
                        margin-bottom: 10px;
                    }
                    .h5 {
                        text-align: left;
                    }
                    .h5-italic {
                        text-align: left;
                        font-style: italic;
                    }
                    .h5-arabic {
                        text-align: right;
                        direction: rtl;
                        font-family: 'Amiri', serif;
                    }
                    /* Custom link style */
                    a {
                        text-decoration: none;
                        color: #0052a4; /* Your desired color */
                    }
                    p {
                        margin: 0px; /* Set both top/bottom and left/right margins to 5px */
                    }
                    /* Smaller text */
                    .text-smaller {
                        font-size: 0.8em;
                    }
                    .bold {
                        font-weight: bold;
                    }
                    .italic {
                        font-style: italic;
                    }
                    /*backdrop*/
                    .backdrop {
                        background-color: #f1f3eb; /* Set the background color */
                        padding: 20px; /* Add padding to create space around .background */
                        position: relative;
                        min-width: 100%;
                        position: absolute;
                    }
                    /* green background */
                    .background {
                        background-color: #e8efc0;
                        border-top: 2px solid #d8dfb0;
                        border-bottom: 2px solid #d8dfb0;
                        border-left: 2px solid #d8dfb0;
                        border-right: 2px solid #d8dfb0;
                        padding: 10px;
                        min-width: 800px;
                        max-width: 800px;
                        margin: 0 auto;
                        margin-bottom: 20px;
                        position: relative; /* Ensure the content stays within the backdrop */
                    }
                    .row,
                    .row-2 {
                        display: flex;
                        align-items: center;
                        align-items: stretch;
                        min-width: 600px; /* Adjust this value as necessary */
                    }
                    /* Standard row for subheadings and rows with field names */
                    .row {
                        justify-content: space-between;
                        margin-bottom: 10px;
                    
                    }
                    /* row-2 for rows without field names (ADJUST) */
                    .row-2 {
                        margin-bottom: 0px;
                    
                    }
                    /* column (no margin) */
                    .column {
                        display: flex;
                        align-items: stretch;
                        align-items: center; /* Align items in the center vertically */
                        min-width: 0px;
                        flex: 1;
                    }
                    /* column (aligned left) */
                    .column-left {
                        display: flex;
                        align-items: center; /* Align items in the center vertically */
                        justify-content: flex-start; /* Align items to the left horizontally */
                        margin-right: 10px;
                        min-width: 0px;
                        flex: 1;
                    }
                    /* column (aligned right) */
                    .column-right {
                        display: flex;
                        align-items: center; /* Align items in the center vertically */
                        justify-content: flex-end; /* Align items to the right horizontally */
                        margin-left: 10px;
                        min-width: 0px;
                        flex: 1;
                    }
                    /* white box with green border */
                    .box,
                    .box-italic,
                    .box-arabic {
                        background-color: white;
                        border: 1px solid #d8dfb0;
                        padding: 5px;
                        align-items: center;
                        line-height: 1.5;
                    }
                    .box {
                        flex: 1;
                        margin-left: 5px;
                        margin-right: 5px;
                    }
                    .box-italic {
                        font-style: italic;
                        flex: 1;
                        margin-left: 5px;
                        margin-right: 5px;
                    }
                    .box-arabic {
                        direction: rtl;
                        font-family: 'Amiri', serif;
                        flex: 1;
                        margin-left: 5px;
                        margin-right: 5px;
                    }
                    /*  boxes for rows with no field names */
                    .box-2,
                    .box-2-note,
                    .box-2-small,
                    .box-2-small-italic {
                        border: 1px solid #d8dfb0;
                        padding: 5px;
                        margin-left: 20px;
                        margin-right: 20px;
                        flex: 1;
                        line-height: 1.5
                    }
                    .box-2,
                    .box-2-small,
                    .box-2-small-italic {
                        background-color: white;
                    }
                    .box-2-small,
                    .box-2-small-italic {
                        max-width: 200px;
                    }
                    .box-2-small-italic {
                        font-style: italic;
                    }
                    .box-2-note {
                        background-color: #F7F9EF;
                        margin-top: 10px;
                        margin-bottom: 10px;
                    
                    }
                    .box-no-margin {
                        background-color: white;
                        border: 1px solid #d8dfb0;
                        padding: 5px;
                        flex: 1;
                        display: flex;
                        align-items: center;
                        line-height: 1.5;
                        height: 100%;
                    }
                    /* Styling for buttons*/
                    .chevron {
                        margin-left: 20px; /* Space between text and chevron */
                        margin-right: 20px; /* Space between text and chevron */
                    }
                    #english-button,
                    #arabic-button,
                    #textual-identifiers-button,
                    #textual-identifiers-button-arabic {
                        background-color: transparent; /* Background matches your page style */
                        border: none; /* No border */
                        cursor: pointer;
                        font-size: 1em; /* Matches .h3 */
                        font-weight: bold; /* Matches .h3 */
                        margin-top: 10px;
                        margin-bottom: 10px;
                        color: #0052a4;
                        margin-left: 5px;
                        margin-right: 5px;
                    }
                    #english-button,
                    #textual-identifiers-button {
                        font-family: 
                        'Comorant Garamond', serif;
                    }
                    #arabic-button,
                    #textual-identifiers-button-arabic {
                        text-align: right; /* Align Arabic text right */
                        direction: rtl;
                        font-family: 'Amiri', serif;
                    }</style>
            </head>
            <body>
                <!-- Loop through each <bibl> element -->
                <xsl:apply-templates select="//tei:bibl"/>
            </body>
        </html>
    </xsl:template>

    <!-- Template to match each <bibl> element -->
    <xsl:template match="tei:bibl">
        <div class="backdrop">
            <!-- Work Title (Latin and Arabic) -->
            <div class="h1-italic">
                <xsl:value-of select="tei:title[@xml:lang = 'ara-Latn-x-lc'][@type = 'uniform']"/>
            </div>
            <div class="h1-arabic">
                <xsl:value-of select="tei:title[@xml:lang = 'ara'][@type = 'uniform']"/>
            </div>

            <div class="background">
                <!-- Identifiers -->
                <div class="row">
                    <div class="h4">RG №</div>
                    <div class="box">
                        <xsl:value-of select="tei:idno[@type = 'RG']"/>
                    </div>
                    <div class="h4">Alt. RG №</div>
                    <div class="box">
                        <xsl:value-of select="tei:idno[@type = 'Alt_RG']"/>
                    </div>
                    <div class="h4">xml:id</div>
                    <div class="box">
                        <xsl:value-of select="tei:idno[@type = 'keyword']"/>
                    </div>
                    <div class="h4-arabic"/>
                </div>


                <!-- Title -->
                <div class="row">
                    <div class="h2">Title</div>
                    <div class="h2-arabic">عنوان</div>
                </div>
                <div class="row">
                    <div class="h4">Uniform</div>
                    <div class="box-italic">
                        <xsl:value-of
                            select="tei:title[@type = 'uniform'][@xml:lang = 'ara-Latn-x-lc']"/>
                    </div>
                    <div class="box-arabic">
                        <xsl:value-of select="tei:title[@type = 'uniform'][@xml:lang = 'ara']"/>
                    </div>
                    <div class="h4-arabic">موحد</div>
                </div>

                <div class="row">
                    <div class="h4">Full</div>
                    <div class="box-italic">
                        <xsl:value-of
                            select="tei:title[@type = 'full'][@xml:lang = 'ara-Latn-x-lc']"/>
                    </div>
                    <div class="h4-arabic">كامل</div>
                </div>

                <!-- Loop through all 'variant' types -->

                <div class="row">
                    <div class="h4">Variant(s)</div>
                    <div class="box-italic">
                        <xsl:for-each select="tei:title[@type = 'variant']">
                            <p>
                                <xsl:value-of select="."/>
                            </p>
                        </xsl:for-each>
                    </div>
                    <div class="h4-arabic">بديل</div>
                </div>

                <div class="row">
                    <div class="h4">English</div>
                    <div class="box">
                        <xsl:value-of select="tei:title[@type = 'translation'][@xml:lang = 'eng']"/>
                    </div>
                    <div class="h4-arabic">إنجليزي</div>
                </div>

                <div class="row">
                    <div class="box-2-note">
                        <xsl:apply-templates select="tei:note[@type = 'titleNote']"/>
                    </div>
                </div>

                <!-- Textual Identifiers -->
                <div class="row">
                    <div class="h3">Textual Identifiers</div>
                    <div class="h3-arabic">معرفات نصية</div>
                </div>

                <div class="row">
                    <div class="h4">Incipit</div>
                    <div class="box-italic">
                        <xsl:value-of
                            select="tei:incipit[@type = 'hamdala'][@xml:lang = 'ara-Latn-x-lc']"/>
                    </div>
                    <div class="box-arabic">
                        <xsl:value-of select="tei:incipit[@type = 'hamdala'][@xml:lang = 'ara']"/>
                    </div>
                    <div class="h4-arabic">حمدله</div>
                </div>

                <div class="row">
                    <div class="h4">Intro</div>
                    <div class="box-italic">
                        <xsl:value-of
                            select="tei:incipit[@type = 'muqadimma'][@xml:lang = 'ara-Latn-x-lc']"/>
                    </div>
                    <div class="box-arabic">
                        <xsl:value-of select="tei:incipit[@type = 'muqadimma'][@xml:lang = 'ara']"/>
                    </div>
                    <div class="h4-arabic">مقدمة</div>
                </div>

                <div class="row">
                    <div class="h4">Khuṭba</div>
                    <div class="box-italic">
                        <xsl:value-of
                            select="tei:incipit[@type = 'khutba'][@xml:lang = 'ara-Latn-x-lc']"/>
                    </div>
                    <div class="box-arabic">
                        <xsl:value-of select="tei:incipit[@type = 'khutba'][@xml:lang = 'ara']"/>
                    </div>
                    <div class="h4-arabic">خطبة</div>
                </div>

                <div class="row">
                    <div class="h4">Explicit</div>
                    <div class="box-italic">
                        <xsl:value-of select="tei:explicit[@xml:lang = 'ara-Latn-x-lc']"/>
                    </div>
                    <div class="box-arabic">
                        <xsl:value-of select="tei:explicit[@xml:lang = 'ara']"/>
                    </div>
                    <div class="h4-arabic">ختام</div>
                </div>

                <div class="row">
                    <div class="box-2-note">
                        <xsl:value-of select="tei:note[@type = 'textualIdentifiersNote']"/>
                    </div>
                </div>

            </div>
            <div class="background">

                <!-- Authorship -->

                <div class="row">
                    <div class="h2">Authorship</div>
                    <div class="h2-arabic">صحة النسبة</div>
                </div>
                <div class="row">
                    <div class="h4">Author</div>
                    <div class="box">
                        <xsl:value-of select="tei:author"/>
                    </div>
                    <div class="h4-arabic">مؤلف</div>
                </div>

                <div class="row">
                    <div class="column-left">
                        <div class="h4">Verification</div>
                        <div class="box">
                            <xsl:value-of select="tei:note[@type = 'verification']"/>
                        </div>
                        <div class="h4-arabic">درجة الصحة</div>
                    </div>

                    <div class="column-right">
                        <div class="h4">Authentication</div>
                        <div class="box">
                            <xsl:value-of select="tei:note[@type = 'authenticationType']"/>
                        </div>
                        <div class="h4-arabic">توثيق</div>
                    </div>
                </div>

                <div class="row">
                    <div class="box-2-note">
                        <xsl:value-of select="tei:note[@type = 'authenticityNote']"/>
                    </div>
                </div>


                <!-- Composition -->

                <div class="row">
                    <div class="h3">Composition</div>
                    <div class="h3-arabic">تأليف</div>
                </div>

                <div class="row">
                    <div class="column-left">
                        <div class="h4">Place</div>
                        <div class="box">
                            <xsl:value-of select="tei:placeName[@type = 'fmPlace']"/>
                        </div>
                        <div class="h4-arabic">مكان</div>
                    </div>

                    <div class="column-right">
                        <div class="h4">Date</div>
                        <div class="box">
                            <xsl:value-of select="tei:date[@type = 'fmDate']"/>
                        </div>
                        <div class="h4-arabic">تاريخ</div>
                    </div>
                </div>

                <div class="row">
                    <div class="column-left">
                        <div class="h4">Earliest MS</div>
                        <div class="box">
                            <xsl:value-of select="tei:date[@type = 'fmEarliestMS']"/>
                        </div>
                        <div class="h4-arabic">أقدم شاهد</div>
                    </div>

                    <div class="column-right">
                        <div class="h4">TPQ-TAQ</div>
                        <div class="box">
                            <xsl:value-of select="tei:date[@type = 'TPQ']"/>–<xsl:value-of
                                select="tei:date[@type = 'TAQ']"/>
                        </div>
                        <div class="h4-arabic">نطاق زمني</div>
                    </div>
                </div>

                <div class="row">

                    <div class="box-2-note">
                        <xsl:value-of select="tei:note[@type = 'compositionNote']"/>
                    </div>

                </div>

                <div class="row">
                    <div class="h3">Other roles</div>
                    <div class="h3-arabic">أدوار أخرى</div>
                </div>

                <!-- Loop through all 'editor' elements -->
                <xsl:for-each select="tei:editor">
                    <div class="row">
                        <div class="h4">
                            <!-- Use xsl:choose to convert the abbreviation into the full form -->
                            <xsl:choose>
                                <xsl:when test="@role = 'abr'">Abridger</xsl:when>
                                <xsl:when test="@role = 'ann'">Annotator</xsl:when>
                                <xsl:when test="@role = 'asg'">Assignee</xsl:when>
                                <xsl:when test="@role = 'att'">Attribution</xsl:when>
                                <xsl:when test="@role = 'ant'">Antecedent</xsl:when>
                                <xsl:when test="@role = 'crr'">Corrector</xsl:when>
                                <xsl:when test="@role = 'cwt'">Commentator</xsl:when>
                                <xsl:when test="@role = 'com'">Compiler</xsl:when>
                                <xsl:when test="@role = 'dte'">Dedicatee</xsl:when>
                                <xsl:when test="@role = 'hnr'">Honouree</xsl:when>
                                <xsl:when test="@role = 'lse'">Licensee</xsl:when>
                                <xsl:when test="@role = 'rcp'">Addressee</xsl:when>
                                <xsl:when test="@role = 'scr'">Scribe</xsl:when>
                                <xsl:when test="@role = 'tch'">Teacher</xsl:when>
                                <xsl:when test="@role = 'wit'">Witness</xsl:when>
                                <xsl:when test="@role = 'wst'">Suppl. Writer</xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="@role"/>
                                </xsl:otherwise>
                            </xsl:choose>
                        </div>
                        <div class="box">
                            <!-- Display the text content of the 'editor' element -->
                            <xsl:value-of select="."/>
                        </div>
                        <div class="h4-arabic">
                            <!-- Use xsl:choose to convert the abbreviation into the full form -->
                            <xsl:choose>
                                <xsl:when test="@role = 'abr'">كاتب إختصار</xsl:when>
                                <xsl:when test="@role = 'ann'">معلق حواشي</xsl:when>
                                <xsl:when test="@role = 'asg'">سامع</xsl:when>
                                <xsl:when test="@role = 'att'">منسوب إليه</xsl:when>
                                <xsl:when test="@role = 'ant'">مرجع</xsl:when>
                                <xsl:when test="@role = 'crr'">مصحح</xsl:when>
                                <xsl:when test="@role = 'cwt'">شارح</xsl:when>
                                <xsl:when test="@role = 'com'">مصنف</xsl:when>
                                <xsl:when test="@role = 'dte'">مهدى إليه</xsl:when>
                                <xsl:when test="@role = 'hnr'">رواية</xsl:when>
                                <xsl:when test="@role = 'lse'">مجاز</xsl:when>
                                <xsl:when test="@role = 'rcp'">مرسل إليه</xsl:when>
                                <xsl:when test="@role = 'scr'">بخط</xsl:when>
                                <xsl:when test="@role = 'tch'">شيخ مسمع</xsl:when>
                                <xsl:when test="@role = 'wit'">شاهد</xsl:when>
                                <xsl:when test="@role = 'wst'">كاتب إضافي</xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="@role"/>
                                </xsl:otherwise>
                            </xsl:choose>
                        </div>

                    </div>
                </xsl:for-each>

            </div>
            <div class="background">

                <!-- Contents -->

                <div class="row">
                    <div class="h2">Contents</div>
                    <div class="h2-arabic">مضمون</div>
                </div>

                <div class="row">
                    <div class="h4">Description</div>
                    <div class="box">
                        <xsl:apply-templates
                            select="tei:noteGrp[@type = 'workDesc']/tei:note[@type = 'description']"
                        />
                    </div>
                    <div class="h4-arabic">وصف</div>
                </div>

                <div class="row">
                    <div class="h4">Structure</div>
                    <div class="box">
                        <xsl:value-of
                            select="tei:noteGrp[@type = 'workDesc']/tei:note[@type = 'structure']"/>
                    </div>
                    <div class="h4-arabic">تقسيم</div>
                </div>

                <div class="row">
                    <div class="box-2-note">
                        <xsl:value-of
                            select="tei:noteGrp[@type = 'workDesc']/tei:note[@type = 'contentsNote']"
                        />
                    </div>
                </div>
            </div>

            <div class="background">

                <div class="row">
                    <div class="h2">Manuscripts</div>
                    <div class="h2-arabic">مخطوطات</div>
                </div>


                <div class="row">

                    <div class="box-2-note">
                        <xsl:value-of select="tei:note[@type = 'stemmatics']"/>
                    </div>

                </div>

                <!-- Container for buttons and manuscript information -->
                <div class="row">
                    <!-- English button aligned left -->
                    <button id="english-button" onclick="toggleManuscripts()" class="h3"> Show
                        Manuscripts <i class="fa fa-chevron-down chevron"/>
                    </button>

                    <!-- Arabic button aligned right -->
                    <button id="arabic-button" onclick="toggleManuscripts()" class="h3-arabic"> عرض
                        المخطوطات <i class="fa fa-chevron-down chevron"/>
                    </button>
                </div>
                <!-- Manuscript information -->

                <div id="manuscript-info" style="display:none;">
                    <!-- Column headings -->
                    <div class="row-2">
                        <div class="column">
                            <div class="h5">Date</div>
                        </div>
                        <div class="column">
                            <div class="h5">Manuscript</div>
                        </div>
                        <div class="column"> </div>
                        <div class="column"> </div>
                        <div class="column">
                            <div class="h5">Title</div>
                        </div>
                        <div class="column">
                            <div class="h5">Summary</div>
                        </div>
                    </div>
                    <div class="row-2">
                        <div class="column">
                            <div class="box-no-margin">
                                <xsl:value-of select="tei:date[@type = 'fmEarliestMS']"/>
                            </div>
                        </div>
                        <div class="column">
                            <div class="box-no-margin">Library</div>
                        </div>
                        <div class="column">
                            <div class="box-no-margin">Code</div>
                        </div>
                        <div class="column">
                            <div class="box-no-margin">Pag-es</div>
                        </div>
                        <div class="column">
                            <div class="box-no-margin">
                                <xsl:value-of
                                    select="tei:title[@xml:lang = 'ara-Latn-x-lc'][@type = 'uniform']"
                                />
                            </div>
                        </div>
                        <div class="column">
                            <div class="box-no-margin text-smaller">One line summary. This entry is
                                only an example!</div>
                        </div>
                    </div>
                </div>

                <!-- JavaScript to handle the toggle functionality -->
                <script>
                function toggleManuscripts() {
                var infoDiv = document.getElementById('manuscript-info');
                var englishButton = document.getElementById('english-button');
                var arabicButton = document.getElementById('arabic-button');
                var englishChevron = englishButton.querySelector('.chevron');
                var arabicChevron = arabicButton.querySelector('.chevron');
                
                if (infoDiv.style.display === 'none') {
                infoDiv.style.display = 'block';
                englishButton.innerHTML = 'Hide Manuscripts <i class="fa fa-chevron-up chevron"/>';
                arabicButton.innerHTML = 'اخفاء المخطوطات <i class="fa fa-chevron-up chevron"/>';
                } else {
                infoDiv.style.display = 'none';
                englishButton.innerHTML = 'Show Manuscripts <i class="fa fa-chevron-down chevron"/>';
                arabicButton.innerHTML = 'عرض المخطوطات <i class="fa fa-chevron-down chevron"/>';
                }
                }
            </script>

            </div>

            <div class="background">

                <!-- Cross-references -->

                <div class="row">
                    <div class="h2">Cross-references</div>
                    <div class="h2-arabic">إحالات مزدوجة</div>
                </div>

                <!-- To this work -->
                <div class="row">
                    <div class="h3">To this work</div>
                    <div class="h3-arabic">إلى هذا المصنف</div>
                </div>
                
                <div class="row">
                    <div class="column-left">
                        <div class="h4-italic">Ijāza</div>
                        <div class="box">
                            <xsl:value-of
                                select="tei:noteGrp[@type = 'references']/tei:note[@type = 'ijaza'][@resp = 'Badawi']"
                            />
                        </div>
                        <div class="h4-arabic"/>
                    </div>
                    <div class="column-right">
                        <div class="box">
                            <xsl:value-of
                                select="tei:noteGrp[@type = 'references']/tei:note[@type = 'ijaza'][@resp = 'MIAS']"
                            />
                        </div>
                        <div class="h4-arabic">الإجازة</div>
                    </div>
                </div>
                
                

                <div class="row">
                    <div class="column-left">
                        <div class="h4-italic">Fihrist</div>
                        <div class="box">
                            <xsl:value-of
                                select="tei:noteGrp[@type = 'references']/tei:note[@type = 'fihrist'][@resp = 'Awwad']"
                            />
                        </div>
                        <div class="h4-arabic"/>
                    </div>
                    <div class="column-right">
                        <div class="box">
                            <xsl:value-of
                                select="tei:noteGrp[@type = 'references']/tei:note[@type = 'fihrist'][@resp = 'MIAS']"
                            />
                        </div>
                        <div class="h4-arabic">الفهرست</div>
                    </div>
                </div>

                <div class="row">
                    <div class="column-left">
                        <div class="h4-italic">Futūḥāt</div>
                        <div class="box">
                            <xsl:value-of
                                select="tei:noteGrp[@type = 'references']/tei:note[@type = 'fut_mak'][@resp = 'OY']"
                            />
                        </div>
                        <div class="h4-arabic"/>
                    </div>
                    <div class="column-right">
                        <div class="box">
                            <xsl:value-of
                                select="tei:noteGrp[@type = 'references']/tei:note[@type = 'fut_mak'][@resp = 'MIAS']"
                            />
                        </div>
                        <div class="h4-arabic">الفتوحات</div>
                    </div>
                </div>

                <!-- Loop through all 'other' notes in the 'references' noteGrp -->
                <xsl:for-each select="tei:noteGrp[@type = 'references']/tei:note[@type = 'other']">
                    <div class="row">
                        <div class="column-left">
                            <div class="h4">Other</div>
                            <div class="box-italic">
                                <!-- Display the content of the 'ref' element -->
                                <xsl:value-of select="tei:ref"/>
                            </div>
                            <div class="h4-arabic"/>
                        </div>
                        <div class="column-right">
                            <div class="box">
                                <!-- Display only the text content of the <note> element excluding <ref> -->
                                <xsl:apply-templates select="*[not(self::tei:ref)] | text()"/>
                            </div>
                            <div class="h4-arabic"/>
                        </div>
                    </div>
                </xsl:for-each>


                <!-- Mentions to other works -->

                <div class="row">
                    <div class="h3">To other works</div>
                    <div class="h3-arabic">إلى مصنفات أخرى</div>
                </div>

                <!-- Loop through all 'mention' notes in the 'mentions' noteGrp -->
                <xsl:for-each
                    select="tei:noteGrp[@type = 'mentions']/tei:note[@type = 'mention']/tei:ref">
                    <div class="row-2">
                        <div class="column-left">
                            <div class="box-2-small-italic">
                                <xsl:choose>
                                    <!-- Later fill for all the real xml:id targets -->
                                    <xsl:when test="@target = '#target'"/>
                                    <xsl:otherwise>
                                        <xsl:value-of select="@target"/>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </div>
                        </div>
                    </div>
                    <div class="row-2">
                        <div class="box-2">
                            <xsl:apply-templates
                                select="ancestor::tei:note/node()[not(self::tei:ref)]"/>
                        </div>
                    </div>
                    <div class="row">
                        <div class="column-right">
                            <div class="h4"> </div>
                            <div class="box-2-small">
                                <xsl:value-of select="."/>
                            </div>
                        </div>
                    </div>
                </xsl:for-each>


                <div class="row">
                    <div class="box-2-note">
                        <xsl:value-of select="tei:note[@type = 'referencesNote']"/>
                    </div>

                </div>

            </div>
            <div class="background">

                <!-- Related Works -->

                <div class="row">
                    <div class="h2">Related Works</div>
                    <div class="h2-arabic">مصنفات ذات الصلة</div>
                </div>

                <!-- Loop through all 'related item' elements -->
                <xsl:for-each select="tei:relatedItem">
                    <div class="row">
                        <div class="h4">
                            <!-- Use xsl:choose to convert the abbreviation into the full form -->
                            <xsl:choose>
                                <xsl:when test="@type = 'relation'"/>
                                <xsl:when test="@type = 'ext'">Extract</xsl:when>
                                <xsl:when test="@type = 'ext-'">Ext. from</xsl:when>
                                <xsl:when test="@type = 'com'">Commentary</xsl:when>
                                <xsl:when test="@type = 'com-'">Comm. on</xsl:when>
                                <xsl:when test="@type = 'trn'">Translation</xsl:when>
                                <xsl:when test="@type = 'trn-'">Trans. of</xsl:when>
                                <xsl:when test="@type = 'adp'">Adaptation</xsl:when>
                                <xsl:when test="@type = 'adp-'">Adapt. of</xsl:when>
                                <xsl:when test="@type = 'sum'">Summary</xsl:when>
                                <xsl:when test="@type = 'sum-'">Summ. of</xsl:when>
                                <xsl:when test="@type = 'ant'">Antecedent</xsl:when>
                                <xsl:when test="@type = 'ant-'">Ante. Of</xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="@type"/>
                                </xsl:otherwise>
                            </xsl:choose>
                        </div>
                        <div class="box-italic">
                            <!-- Display the text content of the 'relatedItem' element -->
                            <xsl:value-of select="."/>
                        </div>
                        <div class="h4-arabic">
                            <!-- Use xsl:choose to convert the abbreviation into the full form -->
                            <xsl:choose>
                                <xsl:when test="@type = 'relation'"/>
                                <xsl:when test="@type = 'ext'">مستخرج</xsl:when>
                                <xsl:when test="@type = 'ext-'">مستخرج من</xsl:when>
                                <xsl:when test="@type = 'com'">شرح</xsl:when>
                                <xsl:when test="@type = 'com-'">شرح ل</xsl:when>
                                <xsl:when test="@type = 'trn'">ترجمة</xsl:when>
                                <xsl:when test="@type = 'trn-'">ترجمة ل</xsl:when>
                                <xsl:when test="@type = 'adp'">صيغة معدلة</xsl:when>
                                <xsl:when test="@type = 'adp-'">صيغة معدلة ل</xsl:when>
                                <xsl:when test="@type = 'sum'">إختصار</xsl:when>
                                <xsl:when test="@type = 'sum-'">إختصار ل</xsl:when>
                                <xsl:when test="@type = 'ant'">مرجع</xsl:when>
                                <xsl:when test="@type = 'ant-'">مرجع ل</xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="@type"/>
                                </xsl:otherwise>
                            </xsl:choose>
                        </div>
                    </div>
                </xsl:for-each>

                <div class="row">
                    <div class="box-2-note">
                        <xsl:value-of select="tei:note[@type = 'relationsNote']"/>
                    </div>
                </div>


            </div>
            <div class="background">

                <!-- Publications -->

                <div class="row">
                    <div class="h2">Publications</div>
                    <div class="h2-arabic">منشورات</div>
                </div>

                <div class="row">
                    <div class="h4">Editions</div>
                    <div class="box">
                        <xsl:value-of
                            select="tei:noteGrp[@type = 'publications']/tei:note[@type = 'editions']"
                        />
                    </div>
                    <div class="h4-arabic">طبعات</div>
                </div>

                <div class="row">
                    <div class="h4">Translations</div>
                    <div class="box">
                        <xsl:value-of
                            select="tei:noteGrp[@type = 'publications']/tei:note[@type = 'translations']"/>
                        <br/>
                        <xsl:value-of
                            select="tei:noteGrp[@type = 'publications']/tei:note[@type = 'translationsEur']"
                        />
                    </div>
                    <div class="h4-arabic">تراجم</div>

                </div>

                <div class="row">
                    <div class="h4">Studies</div>
                    <div class="box">
                        <xsl:value-of
                            select="tei:noteGrp[@type = 'publications']/tei:note[@type = 'studies']"
                        />
                    </div>
                    <div class="h4-arabic">أبحاث</div>
                </div>

                <div class="row">
                    <div class="h4">Additions</div>
                    <div class="box">
                        <!-- Loop through all notes of type 'additions' within the 'publications' noteGrp -->
                        <xsl:for-each
                            select="tei:noteGrp[@type = 'publications']/tei:note[@type = 'additions']">
                            <!-- Output the content of each note -->
                            <xsl:value-of select="."/>
                            <!-- Add a line break or separator between notes -->
                            <br/>
                        </xsl:for-each>
                    </div>
                    <div class="h4-arabic">إضافات</div>
                </div>

            </div>
            <!-- Comments and Corrections -->
            <div class="background">
                <div class="row">
                    <div class="h2">Comments and Corrections</div>
                    <div class="h2-arabic">تعليق وتدقيق</div>
                </div>

                <xsl:if test="tei:noteGrp[@type = 'comments']">
                    <xsl:apply-templates select="tei:noteGrp[@type = 'comments']/tei:note"/>
                </xsl:if>

                <!-- MIAS Records -->

                <div class="row">
                    <div class="h2">MIAS Records</div>
                    <div class="h2-arabic">سجلات مكتبية</div>
                </div>

                <div class="row">
                    <div class="column-left">
                        <div class="h4">In Archive</div>
                        <div class="box text-smaller">
                            <xsl:value-of
                                select="tei:noteGrp[@type = 'admin']/tei:note[@type = 'archive']"/>
                        </div>
                        <div class="h4"/>
                    </div>
                    <div class="column-right">
                        <div class="h4">In Library</div>
                        <div class="box text-smaller">
                            <xsl:value-of
                                select="tei:noteGrp[@type = 'admin']/tei:note[@type = 'library']"/>
                        </div>
                        <div class="h4-arabic"/>
                    </div>
                </div>
            </div>
        </div>

    </xsl:template>


    <!-- Template to handle <q rend="italic"> elements -->
    <xsl:template match="tei:q[@rend = 'italic']">
        <span class="italic">
            <xsl:apply-templates/>
        </span>
    </xsl:template>

    <!-- Template to handle Arabic elements in their own paragraph -->
    <xsl:template match="tei:q[@xml:lang = 'ara']">
        <p dir="rtl" class="arabic">
            <xsl:apply-templates/>
        </p>
    </xsl:template>

    <!-- NB if Arabic is needed in the same paragraph, the following modification is possible:
        
        
        1. Template to handle Arabic text in its own paragraph
        
    <xsl:template match="tei:note[@type='titleNote']">
        <div class="box-2-note">
            <xsl:apply-templates select="tei:p"/>
            <xsl:apply-templates select="tei:q[@xml:lang = 'ara']"/>
        </div>
    </xsl:template>
    
    <xsl:template match="tei:q[@xml:lang = 'ara']">
        <p dir="rtl" class="arabic">
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    
        2. Template to handle Arabic text inline
        <xsl:template match="tei:q[@xml:lang = 'ara'][not(preceding-sibling::tei:p)]">
    <span dir="rtl" class="arabic">
        <xsl:apply-templates/>
    </span>
</xsl:template>
        -->

    <!-- Template to handle <hi rend="bold"> elements -->
    <xsl:template match="tei:hi[@rend = 'italic']">
        <span class="italic">
            <xsl:apply-templates/>
        </span>
    </xsl:template>


    <!-- Template to match each <note> within <noteGrp type="scholarComments"> -->
    <xsl:template match="tei:noteGrp[@type = 'comments']/tei:note">
        <div class="row">
            <div class="h4">
                <xsl:value-of select="@resp"/>
            </div>
            <div class="box-2-note">
                <xsl:apply-templates/>
            </div>
        </div>
    </xsl:template>


    <xsl:template match="tei:p">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>



</xsl:stylesheet>

<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"
    xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:xhtml="http://www.w3.org/1999/xhtml">
    <xsl:output method="html" indent="yes"/>

    <!-- Template to match the root and generate HTML structure -->
    <xsl:template match="/">
        <html>
            <head>
                <link rel="stylesheet"
                    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"/>
                <style>
                    body {
                        font-family: 'Comorant Garamond', serif;
                    }
                    .arabic {
                        font-family: 'Amiri', serif;
                        direction: rtl;
                        text-align: right;
                    }
                    q[dir = "rtl"] {
                        text-align: right; /* Align Arabic paragraphs to the right */
                    }
                    q[dir = "ltr"] {
                        text-align: left; /* Align English paragraphs to the left */
                    }
                    /* green background */
                    .background-1 {
                        background-color: #e8efc0;
                        border-top: 2px solid #d8dfb0;
                        border-bottom: 2px solid #d8dfb0;
                        border-left: 2px solid #d8dfb0;
                        border-right: 2px solid #d8dfb0;
                        padding: 10px;
                        min-width: 600px;
                    }
                    /* purple background */
                    .background-2 {
                        background-color: #F6F8E7;
                        border-top: 2px solid #d8dfb0;
                        border-bottom: 2px solid #d8dfb0;
                        border-left: 2px solid #d8dfb0;
                        border-right: 2px solid #d8dfb0;
                        padding: 10px;
                        margin-bottom: 10px;
                        min-width: 600px;
                    }
                    /* white background */
                    .background-3 {
                        background-color: white;
                        padding: 10px;
                        margin-bottom: 20px;
                        margin-top: 20px;
                        min-width: 600px;
                    }
                    /* define row for boxes */
                    .row-1 {
                        display: flex;
                        align-items: center;
                        align-items: stretch;
                        margin-bottom: 10px;
                        min-width: 600px; /* Adjust this value as necessary */
                        flex: 1;
                    }
                    
                    /* define row for headings */
                    .row-2 {
                        display: flex;
                        justify-content: space-between;
                        align-items: center;
                        align-items: stretch;
                        margin-bottom: 10px;
                        min-width: 600px; /* Adjust this value as necessary */
                    }
                    .row-button {
                        display: flex;
                        justify-content: center;
                        align-items: center;
                        margin-top: 20px;
                        margin-bottom: 20px;
                        min-width: 600px; /* Adjust this value as necessary */
                    }
                    /* First column (aligned left) */
                    .column-left {
                        display: flex;
                        align-items: center; /* Align items in the center vertically */
                        justify-content: flex-start; /* Align items to the left horizontally */
                        margin-right: 10px;
                        min-width: 0px;
                        flex: 1;
                    }
                    
                    /* second column (aligned right) */
                    .column-right {
                        display: flex;
                        align-items: center; /* Align items in the center vertically */
                        justify-content: flex-end; /* Align items to the right horizontally */
                        margin-left: 10px;
                        min-width: 0px;
                        flex: 1;
                    }
                    .column,
                    .column-med,
                    .column-small {
                        flex: 1;
                        display: flex;
                    }
                    .column {
                        min-width: 100px;
                    }
                    .column-med {
                        max-width: 150px;
                    }
                    .column-small {
                        max-width: 70px;
                    }
                    .column-box,
                    .column-box-small,
                    .column-box-med,
                    .column-box-italics,
                    .column-box-med-italics {
                    background-color: white;
                        border: 1px solid #d8dfb0;
                        padding: 5px;
                        flex: 1;
                        display: flex;
                        align-items: center;
                        line-height: 1.5;
                    }
                    .column-box-italics,
                    .column-box-med-italics {
                        font-style: italic;
                    }
                    .column-box-med,
                    .column-box-med-italics {
                        max-width: 150px;
                        text-align: center;
                    }
                    .column-box-small {
                        max-width: 70px;
                        text-align: center;
                    }
                    /* white box with green border */
                    .box-1,
                    .box-1-italics,
                    .box-1-arabic,
                    .box-small {
                    background-color: white;
                        border: 1px solid #d8dfb0;
                        padding: 5px;
                        margin-left: 5px;
                        margin-right: 5px;
                        flex: 1;
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
                        max-width: 70px;
                    }
                    /*  box with green background */
                    .box-note {
                    background-color: #F7F9EF;
                        border: 1px solid #d8dfb0;
                        padding: 5px;
                        margin-left: 5px;
                        margin-right: 5px;
                        flex: 1;
                        line-height: 1.5
                    }
                    /* white box with purple border */
                    .box-2 {
                        background-color: white;
                        border: 1px solid #C3AED1;
                        padding: 5px;
                        margin-left: 5px;
                        margin-right: 5px;
                        flex: 1;
                    }
                    /* main title-Latin */
                    .h1-italic {
                        font-size: 1.8em;
                        color: #A62300;
                        font-style: italic;
                        font-weight: bold;
                        text-align: center;
                        margin-top: 20px;
                        margin-bottom: 5px;
                        font-family: 'Comorant Garamond', serif;
                    }
                    /* main title-Arabic */
                    .h1-arabic {
                        font-size: 1.8em;
                        color: #A62300;
                        margin-bottom: 15px;
                        text-align: center;
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
                    }
                    .chevron {
                        margin-left: 20px; /* Space between text and chevron */
                        margin-right: 20px; /* Space between text and chevron */
                    
                    }
                    /* subsubheadings to side of info-box */
                    .h4,
                    .h4-small {
                        padding-right: 10px;
                        min-width: 80px;
                        text-align: right;
                        vertical-align: middle;
                        align-self: center;
                    
                    }
                    .h4-arabic {
                        padding-left: 8px;
                        min-width: 65px;
                        text-align: left;
                        vertical-align: middle;
                        align-self: center;
                        direction: rtl;
                        font-family: 'Amiri', serif;
                    }
                    /* smaller subheadings to side of info-box */
                    .h4-small {
                        font-size: 0.8em;
                    }
                    /* column headings */
                    .h5,
                    .h5-arabic {
                        font-weight: bold;
                        font-size: 1em;
                        color: #0052a4;
                        padding-left: 8px;
                    }
                    .h5 {
                        text-align: left;
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
                    /* Smaller text */
                    .text-smaller {
                        font-size: 0.8em;
                    }
                    .bold {
                        font-weight: bold;
                    }
                    .italic {
                        font-style: italic;
                        white-space: normal;
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
        <div class="background-0">
        <!-- Work Title (Latin and Arabic) -->
        <div class="h1-italic">
            <xsl:value-of select="tei:title[@xml:lang = 'ara-Latn-x-lc'][@type = 'uniform']"/>
        </div>
        <div class="h1-arabic">
            <xsl:value-of select="tei:title[@xml:lang = 'ara'][@type = 'uniform']"/>
        </div>

        <div class="background-1">
            <!-- Identifiers -->
            <div class="row-2">
                <div class="h4">RG №</div>
                <div class="box-1">
                    <xsl:value-of select="tei:idno[@type = 'RG']"/>
                </div>
                <div class="h4">Alt. RG №</div>
                <div class="box-1">
                    <xsl:value-of select="tei:idno[@type = 'Alt_RG']"/>
                </div>
                <div class="h4">xml:id</div>
                <div class="box-1">
                    <xsl:value-of select="tei:idno[@type = 'keyword']"/>
                </div>
                <div class="h4-arabic"/>
            </div>


            <!-- Title -->
            <div class="row-2">
                <div class="h2">Title</div>
                <div class="h2-arabic">عنوان</div>
            </div>
            <div class="row-1">
                <div class="h4">Uniform</div>
                <div class="box-1-italics">
                    <xsl:value-of select="tei:title[@type = 'uniform'][@xml:lang = 'ara-Latn-x-lc']"
                    />
                </div>
                <div class="box-1-arabic">
                    <xsl:value-of select="tei:title[@type = 'uniform'][@xml:lang = 'ara']"/>
                </div>
                <div class="h4-arabic">موحد</div>
            </div>

            <div class="row-1">
                <div class="h4">Full</div>
                <div class="box-1-italics">
                    <xsl:value-of select="tei:title[@type = 'full'][@xml:lang = 'ara-Latn-x-lc']"/>
                </div>
                <div class="h4-arabic">كامل</div>
            </div>

            <!-- Loop through all 'variant' types -->
            <xsl:for-each select="tei:title[@type = 'variant']">
                <div class="row-1">
                    <div class="h4">Variant</div>
                    <div class="box-1-italics">
                        <xsl:value-of select="."/>
                    </div>
                    <div class="h4-arabic">بديل</div>
                </div>
            </xsl:for-each>

            <div class="row-1">
                <div class="h4">English</div>
                <div class="box-1">
                    <xsl:value-of select="tei:title[@type = 'translation'][@xml:lang = 'eng']"/>
                </div>
                <div class="h4-arabic">إنجليزي</div>
            </div>

            <div class="row-2">
                <div class="h4"/>
                <div class="box-note">
                    <xsl:apply-templates select="tei:note[@type = 'titleNote']"/>
                </div>
                <div class="h4-arabic"/>
            </div>

            <!-- Textual Identifiers -->
            <div class="row-2">
                <div class="h3">Textual Identifiers</div>
                <div class="h3-arabic">معرفات نصية</div>
            </div>

            <div class="row-1">
                <div class="h4">Incipit</div>
                <div class="box-1-italics">
                    <xsl:value-of
                        select="tei:incipit[@type = 'hamdala'][@xml:lang = 'ara-Latn-x-lc']"/>
                </div>
                <div class="box-1-arabic">
                    <xsl:value-of select="tei:incipit[@type = 'hamdala'][@xml:lang = 'ara']"/>
                </div>
                <div class="h4-arabic">حمدله</div>
            </div>

            <div class="row-1">
                <div class="h4">Intro</div>
                <div class="box-1-italics">
                    <xsl:value-of
                        select="tei:incipit[@type = 'muqadimma'][@xml:lang = 'ara-Latn-x-lc']"/>
                </div>
                <div class="box-1-arabic">
                    <xsl:value-of select="tei:incipit[@type = 'muqadimma'][@xml:lang = 'ara']"/>
                </div>
                <div class="h4-arabic">مقدمة</div>
            </div>

            <div class="row-1">
                <div class="h4">Khuṭba</div>
                <div class="box-1-italics">
                    <xsl:value-of
                        select="tei:incipit[@type = 'khutba'][@xml:lang = 'ara-Latn-x-lc']"/>
                </div>
                <div class="box-1-arabic">
                    <xsl:value-of select="tei:incipit[@type = 'khutba'][@xml:lang = 'ara']"/>
                </div>
                <div class="h4-arabic">خطبة</div>
            </div>

            <div class="row-1">
                <div class="h4">Explicit</div>
                <div class="box-1-italics">
                    <xsl:value-of select="tei:explicit[@xml:lang = 'ara-Latn-x-lc']"/>
                </div>
                <div class="box-1-arabic">
                    <xsl:value-of select="tei:explicit[@xml:lang = 'ara']"/>
                </div>
                <div class="h4-arabic">ختام</div>
            </div>

            <div class="row-1">
                <div class="h4"/>
                <div class="box-note">
                    <xsl:value-of select="tei:note[@type = 'textualIdentifiersNote']"/>
                </div>
                <div class="h4-arabic"/>
            </div>

        </div>
        <div class="background-3"> </div>
        <div class="background-1">

            <!-- Authorship -->

            <div class="row-2">
                <div class="h2">Authorship</div>
                <div class="h2-arabic">صحة النسبة</div>
            </div>
            <div class="row-1">
                <div class="h4">Author</div>
                <div class="box-1">
                    <xsl:value-of select="tei:author"/>
                </div>
                <div class="h4-arabic">مؤلف</div>
            </div>

            <div class="row-2">
                <div class="column-left">
                    <div class="h4">Verification</div>
                    <div class="box-1">
                        <xsl:value-of select="tei:note[@type = 'verification']"/>
                    </div>
                    <div class="h4-arabic">درجة الصحة</div>
                </div>

                <div class="column-right">
                    <div class="h4">Authentication</div>
                    <div class="box-1">
                        <xsl:value-of select="tei:note[@type = 'authenticationType']"/>
                    </div>
                    <div class="h4-arabic">توثيق</div>
                </div>
            </div>

            <div class="row-1">
                <div class="h4"/>
                <div class="box-note">
                    <xsl:value-of select="tei:note[@type = 'authenticityNote']"/>
                </div>
                <div class="h4-arabic"/>
            </div>


            <!-- Composition -->

            <div class="row-2">
                <div class="h3">Composition</div>
                <div class="h3-arabic">تأليف</div>
            </div>

            <div class="row-2">
                <div class="column-left">
                    <div class="h4">Place</div>
                    <div class="box-1">
                        <xsl:value-of select="tei:placeName[@type = 'fmPlace']"/>
                    </div>
                    <div class="h4-arabic">مكان</div>
                </div>

                <div class="column-right">
                    <div class="h4">Date</div>
                    <div class="box-1">
                        <xsl:value-of select="tei:date[@type = 'fmDate']"/>
                    </div>
                    <div class="h4-arabic">تاريخ</div>
                </div>
            </div>

            <div class="row-2">
                <div class="column-left">
                    <div class="h4">Earliest MS</div>
                    <div class="box-1">
                        <xsl:value-of select="tei:date[@type = 'fmEarliestMS']"/>
                    </div>
                    <div class="h4-arabic">أقدم شاهد</div>
                </div>

                <div class="column-right">
                    <div class="h4">TPQ-TAQ</div>
                    <div class="box-1">
                        <xsl:value-of select="tei:date[@type = 'TPQ']"/>–<xsl:value-of
                            select="tei:date[@type = 'TAQ']"/>
                    </div>
                    <div class="h4-arabic">نطاق زمني</div>
                </div>
            </div>

            <div class="row-1">
                <div class="h4"/>
                <div class="box-note">
                    <xsl:value-of select="tei:note[@type = 'compositionNote']"/>
                </div>
                <div class="h4-arabic"/>
            </div>

            <div class="row-2">
                <div class="h3">Other roles</div>
                <div class="h3-arabic">أدوار أخرى</div>
            </div>

            <!-- Loop through all 'editor' elements -->
            <xsl:for-each select="tei:editor">
                <div class="row-2">
                    <div class="h4">
                        <!-- Display the value of the 'role' attribute -->
                        <xsl:value-of select="@role"/>
                    </div>
                    <div class="box-1">
                        <!-- Display the text content of the 'editor' element -->
                        <xsl:value-of select="."/>
                    </div>
                    <div class="h4-arabic"/>
                </div>
            </xsl:for-each>



        </div>
        <div class="background-3"> </div>
        <div class="background-1">

            <!-- Contents -->

            <div class="row-2">
                <div class="h2">Contents</div>
                <div class="h2-arabic">مضمون</div>
            </div>

            <div class="row-1">
                <div class="h4">Description</div>
                <div class="box-1">
                    <xsl:apply-templates
                        select="tei:noteGrp[@type = 'workDesc']/tei:note[@type = 'description']"/>
                </div>
                <div class="h4-arabic">وصف</div>
            </div>

            <div class="row-1">
                <div class="h4">Structure</div>
                <div class="box-1">
                    <xsl:value-of
                        select="tei:noteGrp[@type = 'workDesc']/tei:note[@type = 'structure']"/>
                </div>
                <div class="h4-arabic">تقسيم</div>
            </div>

            <div class="row-1">
                <div class="h4"/>
                <div class="box-note">
                    <xsl:value-of
                        select="tei:noteGrp[@type = 'workDesc']/tei:note[@type = 'contentsNote']"/>
                </div>
                <div class="h4-arabic"/>
            </div>

        </div>
        <div class="background-3"> </div>
        <div class="background-1">

            <div class="row-2">
                <div class="h2">Manuscripts</div>
                <div class="h2-arabic">مخطوطات</div>
            </div>


            <div class="row-1">
                <div class="h4"/>
                <div class="box-note">
                    <xsl:value-of select="tei:note[@type = 'stemmatics']"/>
                </div>
                <div class="h4-arabic"/>
            </div>

            <!-- Container for buttons and manuscript information -->
            <div class="row-2">
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
                    <div class="column-small">
                        <div class="h5">Date</div>
                    </div>
                    <div class="column-med">
                        <div class="h5">Manuscript</div>
                    </div>
                    <div class="column-small"> </div>
                    <div class="column-small"> </div>
                    <div class="column-med">
                        <div class="h5">Title</div>
                    </div>
                    <div class="column">
                        <div class="h5">Summary</div>
                    </div>
                </div>
                <div class="row-2">
                    <div class="column-small">
                        <div class="column-box-small">
                            <xsl:value-of select="tei:date[@type = 'fmEarliestMS']"/>
                        </div>
                    </div>
                    <div class="column-med">
                        <div class="column-box-med">Library</div>
                    </div>
                    <div class="column-small">
                        <div class="column-box-small">Code</div>
                    </div>
                    <div class="column-small">
                        <div class="column-box-small">Pag-es</div>
                    </div>
                    <div class="column-med">
                        <div class="column-box-med-italics">
                            <xsl:value-of
                                select="tei:title[@xml:lang = 'ara-Latn-x-lc'][@type = 'uniform']"/>
                        </div>
                    </div>
                    <div class="column">
                        <div class="column-box text-smaller">One line summary. This entry is only an
                            example!</div>
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
        <div class="background-3"> </div>
        <div class="background-1">

            <!-- Related Works -->

            <div class="row-2">
                <div class="h2">Related Works</div>
                <div class="h2-arabic">مصنفات ذات الصلة</div>
            </div>

            <!-- Loop through all 'related item' elements -->
            <xsl:for-each select="tei:relatedItem">
                <div class="row-1">
                    <div class="h4">
                        <!-- Display the value of the 'type' attribute -->
                        <xsl:value-of select="@type"/>
                    </div>
                    <div class="box-1-italics">
                        <!-- Display the text content of the 'relatedItem' element -->
                        <xsl:value-of select="."/>
                    </div>
                    <div class="h4-arabic"/>
                </div>
            </xsl:for-each>

            <div class="row-1">
                <div class="h4"/>
                <div class="box-note">
                    <xsl:value-of select="tei:note[@type = 'relationsNote']"/>
                </div>
                <div class="h4-arabic"/>
            </div>

            <!-- Cross-references -->

            <div class="row-2">
                <div class="h2">Cross-references</div>
                <div class="h2-arabic">إحالات مزدوجة</div>
            </div>


            <div class="row-2">
                <div class="h3">To this work</div>
                <div class="h3-arabic">إلى هذا المصنف</div>
            </div>


            <div class="row-2">
                <div class="column-left">
                    <div class="h4">Ijāza</div>
                    <div class="box-1">
                        <xsl:value-of
                            select="tei:noteGrp[@type = 'references']/tei:note[@type = 'ijaza'][@resp = 'Badawi']"
                        />
                    </div>
                    <div class="h4-arabic"/>
                </div>
                <div class="column-right">
                    <div class="box-1">
                        <xsl:value-of
                            select="tei:noteGrp[@type = 'references']/tei:note[@type = 'ijaza'][@resp = 'MIAS']"
                        />
                    </div>
                    <div class="h4-arabic">الإجازة</div>
                </div>
            </div>

            <div class="row-2">
                <div class="column-left">
                    <div class="h4">Fihrist</div>
                    <div class="box-1">
                        <xsl:value-of
                            select="tei:noteGrp[@type = 'references']/tei:note[@type = 'fihrist'][@resp = 'Awwad']"
                        />
                    </div>
                    <div class="h4-arabic"/>
                </div>
                <div class="column-right">
                    <div class="box-1">
                        <xsl:value-of
                            select="tei:noteGrp[@type = 'references']/tei:note[@type = 'fihrist'][@resp = 'MIAS']"
                        />
                    </div>
                    <div class="h4-arabic">الفهرست</div>
                </div>
            </div>

            <div class="row-2">
                <div class="column-left">
                    <div class="h4">Futūḥāt</div>
                    <div class="box-1">
                        <xsl:value-of
                            select="tei:noteGrp[@type = 'references']/tei:note[@type = 'fut_mak'][@resp = 'OY']"
                        />
                    </div>
                    <div class="h4-arabic"/>
                </div>
                <div class="column-right">
                    <div class="box-1">
                        <xsl:value-of
                            select="tei:noteGrp[@type = 'references']/tei:note[@type = 'fut_mak'][@resp = 'MIAS']"
                        />
                    </div>
                    <div class="h4-arabic">الفتوحات</div>
                </div>
            </div>

            <!-- Loop through all 'other' notes in the 'references' noteGrp -->
            <xsl:for-each select="tei:noteGrp[@type = 'references']/tei:note[@type = 'other']">
                <div class="row-2">
                    <div class="column-left">
                        <div class="h4">Other</div>
                        <div class="box-1-italics">
                            <!-- Display the content of the 'ref' element -->
                            <xsl:value-of select="tei:ref"/>
                        </div>
                        <div class="h4-arabic"/>
                    </div>
                    <div class="column-right">
                        <div class="box-1">
                            <!-- Display only the text content of the <note> element excluding <ref> -->
                            <xsl:apply-templates select="*[not(self::tei:ref)] | text()"/>
                        </div>
                        <div class="h4-arabic"/>
                    </div>
                </div>
            </xsl:for-each>

            <div class="row-2">
                <div class="h3">To other works</div>
                <div class="h3-arabic">إلى مصنفات أخرى</div>
            </div>

            <!-- Mentions -->

            <!-- Loop through all 'mention' notes in the 'mentions' noteGrp -->
            <xsl:for-each select="tei:noteGrp[@type = 'mentions']/tei:note[@type = 'mention']">
                <div class="column">
                    <div class="h5"> 
                    <!-- Display the content of the 'ref' element -->
                    <xsl:value-of select="tei:ref"/>
                    </div>
                </div>
                <div class="row-2">
                    <div class="h4"></div>

                    <div class="box-1">
                        <!-- Display only the text content of the <note> element excluding <ref> -->
                        <xsl:apply-templates select="*[not(self::tei:ref)] | text()"/>
                    </div>
                    <div class="h4-arabic"/>
                </div>
            </xsl:for-each>

            <div class="row-1">
                <div class="h4"/>
                <div class="box-note">
                    <xsl:value-of select="tei:note[@type = 'referencesNote']"/>
                </div>
                <div class="h4-arabic"/>
            </div>

        </div>
        <div class="background-3"> </div>
        <div class="background-1">

            <!-- Publications -->

            <div class="row-2">
                <div class="h2">Publications</div>
                <div class="h2-arabic">منشورات</div>
            </div>

            <div class="row-1">
                <div class="h4">Editions</div>
                <div class="box-1">
                    <xsl:value-of
                        select="tei:noteGrp[@type = 'publications']/tei:note[@type = 'editions']"/>
                </div>
                <div class="h4-arabic">طبعات</div>
            </div>

            <div class="row-1">
                <div class="h4">Translations</div>
                <div class="box-1">
                    <xsl:value-of
                        select="tei:noteGrp[@type = 'publications']/tei:note[@type = 'translations']"/>
                    <br/>
                    <xsl:value-of
                        select="tei:noteGrp[@type = 'publications']/tei:note[@type = 'translationsEur']"
                    />
                </div>
                <div class="h4-arabic">تراجم</div>

            </div>

            <div class="row-1">
                <div class="h4">Studies</div>
                <div class="box-1">
                    <xsl:value-of
                        select="tei:noteGrp[@type = 'publications']/tei:note[@type = 'studies']"/>
                </div>
                <div class="h4-arabic">أبحاث</div>
            </div>

            <div class="row-1">
                <div class="h4">Additions</div>
                <div class="box-1">
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
        <div class="background-3"> </div>
        <!-- Comments and Corrections -->
        <div class="background-1">
            <div class="row-2">
                <div class="h2">Comments and Corrections</div>
                <div class="h2-arabic">تعليق وتدقيق</div>
            </div>

            <xsl:if test="tei:noteGrp[@type = 'comments']">
                <xsl:apply-templates select="tei:noteGrp[@type = 'comments']/tei:note"/>
            </xsl:if>

            <!-- MIAS Records -->

            <div class="row-2">
                <div class="h2">MIAS Records</div>
                <div class="h2-arabic">سجلات مكتبية</div>
            </div>

            <div class="row-2">
                <div class="column-left">
                    <div class="h4-small">In Archive</div>
                    <div class="box-1 text-smaller">
                        <xsl:value-of
                            select="tei:noteGrp[@type = 'admin']/tei:note[@type = 'archive']"/>
                    </div>
                    <div class="h4-small"/>
                </div>
                <div class="column-right">
                    <div class="h4-small">In Library</div>
                    <div class="box-1 text-smaller">
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
        <div class="box-note">
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
        <div class="row-1">
            <div class="h4">
                <xsl:value-of select="@resp"/>
            </div>
            <div class="box-note">
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

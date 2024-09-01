import os
from lxml import etree

# Define paths
xml_dir = '/Users/Ali/Desktop/miasCatalogue/4_works/Works'  # Directory containing XML files
xslt_file = '/Users/Ali/Desktop/miasCatalogue/4_works/Scripts/previewIndividualWork_5.xsl'  # Path to your XSLT file
output_dir = '/Users/Ali/Desktop/miasCatalogue/4_works/Previews/worksPreview'  # Directory to save the output HTML files

# Load the XSLT file
xslt_tree = etree.parse(xslt_file)
transform = etree.XSLT(xslt_tree)

# Ensure the output directory exists
os.makedirs(output_dir, exist_ok=True)

# Loop through each XML file in the directory
for xml_file in os.listdir(xml_dir):
    if xml_file.endswith('.xml'):
        xml_path = os.path.join(xml_dir, xml_file)
        # Parse the XML file
        xml_tree = etree.parse(xml_path)
        # Apply the transformation
        result_tree = transform(xml_tree)
        # Create output HTML filename
        html_filename = os.path.splitext(xml_file)[0] + '.html'
        html_path = os.path.join(output_dir, html_filename)
        # Save the result to an HTML file
        with open(html_path, 'wb') as html_file:
            html_file.write(etree.tostring(result_tree, pretty_print=True, method='html'))
        print(f"Generated {html_path}")
        
print("Script started")
print(f"Looking for XML files in directory: {xml_dir}")


# If not working, run "python3 /Users/Ali/Desktop/miasCatalogue/4_works/Scripts/batchPreviewWorks.py" in terminal
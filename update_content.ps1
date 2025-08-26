# PowerShell script to update all HTML files for Orcas Island, WA
# CATEGORY = Ductless Mini split, CITY = orcas island, STATE = WA, Full = orcas island, WA

$basePath = "c:\Users\alooma\Desktop\orcas-ductless-mini-splits-main\ductless mini splits orcas island wa"

# Define replacement mappings
$replacements = @{
    # Basic location replacements
    "Staten Island" = "Orcas Island"
    ", NY" = ", WA"
    " NY " = " WA "
    " NY." = " WA."
    " NY," = " WA,"
    "New York" = "Washington"
    
    # Business name replacements
    "Staten Island Ductless Mini Splits" = "Orcas Island Ductless Mini Splits"
    "SI Ductless Pro" = "Orcas Island HVAC Pro"
    "statenislandductless" = "orcasislandductless"
    
    # Address replacements
    "123 Victory Blvd" = "123 Main Street"
    "Victory Blvd" = "Main Street"
    "10301" = "98245"
    "10302" = "98245"
    "10303" = "98245"
    "10304" = "98245"
    "10305" = "98245"
    "10306" = "98245"
    "10307" = "98245"
    "10308" = "98245"
    "10309" = "98245"
    "10310" = "98245"
    "10311" = "98245"
    "10312" = "98245"
    "10313" = "98245"
    "10314" = "98245"
    
    # Coordinate replacements
    "40.6282" = "48.5933"
    "-74.0776" = "-122.9458"
    
    # Area specific replacements
    "St. George" = "Eastsound"
    "Stapleton" = "Deer Harbor"
    "Port Richmond" = "Olga"
    "Tottenville" = "Doe Bay"
    "Great Kills" = "Moran State Park"
    "New Brighton" = "West Beach"
    "West Brighton" = "Crow Valley"
    "South Beach" = "Indian Island"
    "Rosebank" = "North Beach"
    "Castleton Corners" = "Mount Baker"
    "Mariners Harbor" = "Obstruction Pass"
    "New Dorp" = "Raccoon Point"
    "Oakwood" = "Massacre Bay"
    "Pleasant Plains" = "Point Lawrence"
    "Richmond Valley" = "Fossil Bay"
    "Bay Terrace" = "Neck Point"
    "Charleston" = "Cascade Lake"
    "Clifton" = "Mountain Lake"
    "Dongan Hills" = "Twin Lakes"
    "Eltingville" = "Turtleback Mountain"
    "Grant City" = "Buck Bay"
    "Willowbrook" = "Ship Bay"
    
    # Remove NY/NJ references
    "Brooklyn, NY" = "Shaw Island, WA"
    "Manhattan, NY" = "Lopez Island, WA"
    "Jersey City, NJ" = "San Juan Island, WA"
    "Bayonne, NJ" = "Blakely Island, WA"
    "Hoboken, NJ" = "Decatur Island, WA"
    "Newark, NJ" = "Cypress Island, WA"
    "Elizabeth, NJ" = "Guemes Island, WA"
    "Perth Amboy, NJ" = "Sinclair Island, WA"
    "Union City, NJ" = "Lummi Island, WA"
    "Weehawken, NJ" = "Eliza Island, WA"
    
    # Climate and geographic references
    "New York Harbor" = "Puget Sound"
    "humid summers and cold winters" = "mild summers and cool winters"
    "winter storm" = "Pacific Northwest winter storm"
    "summer heat wave" = "summer warm weather"
    "salt air" = "marine air"
    "waterfront" = "waterfront"
    "ferry terminal" = "ferry terminal"
    "historic brownstones" = "charming island cottages"
    "modern developments" = "modern island homes"
    "dense residential" = "close-knit island community"
    "urban environment" = "island environment"
    "downtown business district" = "main village area"
    "residential neighborhoods" = "island neighborhoods"
    
    # Specific content phrases
    "all Staten Island zip codes" = "all Orcas Island areas"
    "Staten Island communities" = "Orcas Island and the San Juan Islands"
    "serving Staten Island" = "serving Orcas Island"
    "throughout Staten Island" = "throughout Orcas Island"
    "Staten Island residents" = "Orcas Island residents"
    "Staten Island businesses" = "Orcas Island businesses"
    "Staten Island properties" = "Orcas Island properties"
    "Staten Island's" = "Orcas Island's"
    "the island" = "the island"
}

# Location-specific area mappings for different contexts
$areaReplacements = @{
    "North Shore:" = "Village Area:"
    "Mid-Island:" = "Central Island:"
    "South Shore:" = "South Island:"
    "East Shore:" = "East Island:"
    "zip codes including" = "areas including"
    "Zip Code:" = "Area:"
    "zip codes" = "areas"
}

# Get all HTML files
$htmlFiles = Get-ChildItem -Path $basePath -Filter "*.html" -Recurse

Write-Host "Processing $($htmlFiles.Count) HTML files..."

foreach ($file in $htmlFiles) {
    Write-Host "Processing: $($file.Name)"
    
    # Read file content
    $content = Get-Content -Path $file.FullName -Raw -Encoding UTF8
    
    # Apply all replacements
    foreach ($key in $replacements.Keys) {
        $content = $content -replace [regex]::Escape($key), $replacements[$key]
    }
    
    # Apply area replacements
    foreach ($key in $areaReplacements.Keys) {
        $content = $content -replace [regex]::Escape($key), $areaReplacements[$key]
    }
    
    # Write back to file
    Set-Content -Path $file.FullName -Value $content -Encoding UTF8 -NoNewline
}

Write-Host "Completed processing all files!"
Write-Host "All content has been updated for Orcas Island, WA"

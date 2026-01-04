# pelletreachr
pelletreachr is een R Package voor ht analyseren en visualiseren van gedragsdata
afkomstig uit de Pellet Reaching Test bij ratten. 
Het package biedt functies om ruwe data in te lezen, te valideren, om te zetten 
naar percentages, te herstructureren voor visualisatie en resultaten overzichtelijk 
te plotten.

Het package ondersteunt de volgende stappen in de analysepipeline:
1. Validatie van inputdata `helper_check_required_columns.R`
2. Inlezen en filteren van gedragsdata `read_filter_data.R`
3. Berekenen van prestatiepercentages `calculate_percentage.R`
4. Omzetten naar long format voor visualisatie `make_long_format.R`
5. Visualisatie van resultaten per rat en conditie `plot_significance.R`
6. Exporten van figuren naar PDF `plot_to_pdf.R`

# Installatie
`devtools::install_github("AnneBoop/pelletreachr")`

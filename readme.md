# Read me

## Processing pipeline to generate outputs
### Load data into system
- Get everything ready in Filemaker
- Export from Filemaker via `Export all` function
- Place the exported data into `filemaker_data`
- Load data via `pdm run load_data.py`
- Data is loaded

### Generating LC narratives
- Load data into system
- run `pdm run write_lc_narrative.py`
- Take output and place into filemaker
- Re-export filemaker
- [Re-import data](#load-data-into-system)

### Generate Markdown and Excel
- Load data into system (make sure that LC narratives are done)
- Run `pdm run write_outputs.py`
- Run `bash web_build_move.sh`
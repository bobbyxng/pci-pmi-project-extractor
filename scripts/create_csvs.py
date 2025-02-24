"""
Creates select csvs from the PCI/PMI geojsons
"""

import logging
import pandas as pd
import geopandas as gpd

from _helpers import configure_logging

logger = logging.getLogger(__name__)

COLS_LINES = [
    "project_status",
    "length",
    "build_year",
    "underground",
    "v_nom",
    "tags",
    "x0",
    "y0",
    "x1",
    "y1",
    "num_parallel",
    "type",
]

COLS_LINKS = [
    "project_status",
    "length",
    "build_year",
    "underground",
    "p_nom",
    "tags",
    "x0",
    "y0",
    "x1",
    "y1",
]


if __name__ == "__main__":
    if "snakemake" not in globals():
        from _helpers import mock_snakemake

        snakemake = mock_snakemake("create_csvs")
    
    configure_logging(snakemake)

new_lines = gpd.read_file(snakemake.input.lines_electricity_transmission).set_index("id")
new_lines.index.name = None
new_lines["x0"] = new_lines.geometry.apply(lambda x: x.coords[0][0])
new_lines["y0"] = new_lines.geometry.apply(lambda x: x.coords[0][1])
new_lines["x1"] = new_lines.geometry.apply(lambda x: x.coords[-1][0])
new_lines["y1"] = new_lines.geometry.apply(lambda x: x.coords[-1][1])
new_lines = new_lines[COLS_LINES]
new_lines = new_lines.replace({"f": False, "t": True})
new_lines.to_csv(snakemake.output.new_lines, index=True)


new_links = gpd.read_file(snakemake.input.links_electricity_transmission).set_index("id")
new_links.index.name = None
new_links["x0"] = new_links.geometry.apply(lambda x: x.coords[0][0])
new_links["y0"] = new_links.geometry.apply(lambda x: x.coords[0][1])
new_links["x1"] = new_links.geometry.apply(lambda x: x.coords[-1][0])
new_links["y1"] = new_links.geometry.apply(lambda x: x.coords[-1][1])
new_links = new_links[COLS_LINKS]
new_links = new_links.replace({"f": False, "t": True})
new_links.to_csv(snakemake.output.new_links, index=True)
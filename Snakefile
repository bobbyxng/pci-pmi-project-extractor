import os

from glob import glob
from shutil import move


configfile: "config/config.default.yaml"


rule all:
    input: 
        # buses_electricity_transmission="resources/geojson/buses_electricity_transmission.geojson",
        # buses_offshore_grids="resources/geojson/buses_offshore_grids.geojson",
        # buses_smart_electricity_transmission="resources/geojson/buses_smart_electricity_transmission.geojson",
        # generators_h2_terminal="resources/geojson/generators_h2_terminal.geojson",
        lines_electricity_transmission="resources/geojson/lines_electricity_transmission.geojson",
        links_co2_pipeline="resources/geojson/links_co2_pipeline.geojson",
        # links_co2_shipping="resources/geojson/links_co2_shipping.geojson",
        links_electricity_transmission="resources/geojson/links_electricity_transmission.geojson",
        # links_electrolyser="resources/geojson/links_electrolyser.geojson",
        # links_gas_pipeline="resources/geojson/links_gas_pipeline.geojson",
        links_h2_pipeline="resources/geojson/links_h2_pipeline.geojson",
        # links_offshore_grids="resources/geojson/links_offshore_grids.geojson",
        storage_units_electricity="resources/geojson/storage_units_electricity.geojson",
        stores_h2="resources/geojson/stores_h2.geojson",
        stores_co2="resources/geojson/stores_co2.geojson",
        new_lines="resources/csv/new_lines.csv",
        new_links="resources/csv/new_links.csv",


rule retrieve_pci_pmi_annex:
    input:
        storage(
            "https://energy.ec.europa.eu/document/download/3db5e3d1-9989-4d10-93e3-67f5b9ad9103_en?filename=Annex PCI PMI list.pdf",
            keep_local=True
        ),
    output:
        "data/annex/Annex_PCI_PMI_list.pdf",
    run:
        move(input[0], output[0])


rule retrieve_pci_pmi_list:
    input:
        "data/annex/Annex_PCI_PMI_list.pdf",
    output:
        "resources/project_list.csv",
    log:
        "logs/retrieve_pci_pmi_list.log",
    script:
        "scripts/retrieve_pci_pmi_list.py"


rule create_pci_pmi_projects:
    params:
        exclude=config["exclude"],
        overwrite_parsed_data=config["overwrite_parsed_data"],
    input:
        project_list="resources/project_list.csv",
        raw=glob("data/raw/*.json"),
        corrections=glob("data/corrections/*.json"),
        params_storage_units_electricity="data/params/storage_units_electricity.csv",
        params_stores_co2="data/params/stores_co2.csv",
        params_stores_h2="data/params/stores_h2.csv",
        params_links_co2_pipeline="data/params/links_co2_pipeline.csv",
        params_links_h2_pipeline="data/params/links_h2_pipeline.csv",
    output:
        buses_electricity_transmission="resources/geojson/buses_electricity_transmission.geojson",
        buses_offshore_grids="resources/geojson/buses_offshore_grids.geojson",
        buses_smart_electricity_transmission="resources/geojson/buses_smart_electricity_transmission.geojson",
        generators_h2_terminal="resources/geojson/generators_h2_terminal.geojson",
        lines_electricity_transmission="resources/geojson/lines_electricity_transmission.geojson",
        links_co2_pipeline="resources/geojson/links_co2_pipeline.geojson",
        links_co2_shipping="resources/geojson/links_co2_shipping.geojson",
        links_electricity_transmission="resources/geojson/links_electricity_transmission.geojson",
        links_electrolyser="resources/geojson/links_electrolyser.geojson",
        links_gas_pipeline="resources/geojson/links_gas_pipeline.geojson",
        links_h2_pipeline="resources/geojson/links_h2_pipeline.geojson",
        links_offshore_grids="resources/geojson/links_offshore_grids.geojson",
        storage_units_electricity="resources/geojson/storage_units_electricity.geojson",
        stores_h2="resources/geojson/stores_h2.geojson",
        stores_co2="resources/geojson/stores_co2.geojson",
    log:
        "logs/create_pci_pmi_projects.log",
    script:
        "scripts/create_pci_pmi_projects.py"


rule create_csvs:
    input: 
        lines_electricity_transmission="resources/geojson/lines_electricity_transmission.geojson",
        links_electricity_transmission="resources/geojson/links_electricity_transmission.geojson",
    output:
        new_lines="resources/csv/new_lines.csv",
        new_links="resources/csv/new_links.csv",
    log:
        "logs/create_csvs.log",
    script:
        "scripts/create_csvs.py"
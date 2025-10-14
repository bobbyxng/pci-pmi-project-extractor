# pci-pmi-project-extractor
This repository contains data on Projects of Common Interest (PCI) and Projects of Mutual Interest (PMI) collected from publicly available sources. 

## Clone the repository

To start you need to clone the repository, run:

`git clone https://github.com/bobbyxng/pci-pmi-project-extractor.git`

## Initialisation

Before running the workflow for the first time, please run in this order:

* `cd pci-pmi-project-extractor` to enter the correct project directory
* `conda env create -f envs/environment.yaml` to create the environment and installing dependencies
* `conda activate pci-pmi-project-extractor` to activate the environment

## Run the workflow

To extract, clean and build PCI-PMI projects and map project data to the respective projects, please run:
* `snakemake create_pci_pmi_projects` (add `-n` for dry-run)


## Data Sources
- European Commission (2024). PCI-PMI Transparency Platform. https://ec.europa.eu/energy/infrastructure/transparency_platform/map-viewer/main.html (last accessed on 17.09.2024)
- European Commission (2023). Annex to the Commission Delegated Regulation (EU) amending Regulation (EU) No 2022/869 of the European Parliament and of the Council as regards the Union list of projects of common interest and projects of mutual interest. https://energy.ec.europa.eu/publications/annex-first-union-list-projects-common-and-mutual-interest_en (last accessed on 17.09.2024)

## Disclaimer
All data and information provided in this repository have been collected from publicly available sources. The maintainer of this repository does not claim ownership of the original data. All rights, including but not limited to intellectual property rights, remain with their respective owners.

## Liability
The maintainer of this repository accepts no responsibility or liability for any errors, omissions, or consequences arising from the use of this information. Users access and use this data entirely at their own risk.

## Terms of Use
Users accessing this data are responsible for:
- Complying with the original data sources' terms of use (see below)
- Properly citing the original sources when using this data
- Verifying the information against official sources for their specific use case

## Original Terms of Use 
as stated on the [PCI-PMI Transparency Platform](https://ec.europa.eu/energy/infrastructure/transparency_platform/map-viewer/main.html) (last accessed on 13.02.2025)

> Modern energy infrastructure is crucial for an integrated energy market, security of supply and for enabling the EU to meet its broader climate and energy goals. The Transparency Platform is a public information system available to every EU citizen in line with the [TEN-E Regulation](https://eur-lex.europa.eu/legal-content/EN/TXT/PDF/?uri=CELEX:32022R0869) (Art.23) that provides detailed information about Energy Projects of Common Interest (PCIs) and Projects of Mutual Interest (PMIs), including:
>
> - a) geographical representation,
> - b) technical description,
> - c) implementation plan and dates,
> - d) benefits to the Member States and local communities and costs of the projects except for commercially sensitive information,
> - e) the European Union financial support,
> - f) links to national manuals of procedures for permit granting,
> - g) existing sea basin studies and plans for each priority offshore grid corridor.
>
> The PCI-PMI Transparency Platform provides up to date information on the geographic location for each of the [Projects of Common Interest (PCI) & Projects of Mutual Interest (PMI)](https://energy.ec.europa.eu/system/files/2023-11/Annex%20PCI%20PMI%20list.pdf) in the latest PCI-PMI list published by the European Commission. These projects relate to networks for electricity, offshore grids, hydrogen and electrolysers, cross-border carbon dioxide and smart grids in electricity and gas. For each Project of Common Interest (PCI) and Project of Mutual Interest (PMI), the PCI-PMI fiche and PCI-PMI implementation plan are published. In addition, completed PCIs and PMIs from previous lists can be displayed by using the filtering option. For projects in electricity and hydrogen, information on the results from the cost-benefit analysis on the basis of the methodology drawn up pursuant to Article 11 of the TEN-Regulation can be found on [ENTSO-E](https://tyndp.entsoe.eu/) and [ENTSOG](https://www.entsog.eu/) websites. The underlying grid is based on information related to energy networks in Europe, Russia and the Middle East from S&P Global PLATTS Geospatial Database.
>
> The infrastructure types shown in the PCI-PMI Transparency platform include all the detailed infrastructure items that are part of Projects of Common Interest and Projects of Mutual Interest, in line with the general infrastructure categories as defined by TEN-E Regulation Annex II but not limited to them.
>
> CINEA maintains this service to enhance public access to information about these initiatives and European Union in general. Our goal is to keep this information timely and accurate. However, CINEA accepts no responsibility or liability whatsoever with regard to the information on this site. Information displayed at the viewer is downloadable and it can be reused if reference is mentioned. The PCI-PMI fiche, implementation plan and map can be downloaded and printed out by using the print icon and selecting the type. Anything beyond these functionalities is not provided. Please be aware that the data related to the PCI/PMI infrastructures included on this platform, including topographic maps and geographical information system (GIS) data, may be shared with European Commission services for purposes related to the Commission's policy and regulatory requirements.

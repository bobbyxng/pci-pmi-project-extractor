from shutil import move

rule retrieve_pci_pmi_annex:
    input:
        storage(
            "https://energy.ec.europa.eu/document/download/3db5e3d1-9989-4d10-93e3-67f5b9ad9103_en?filename=Annex PCI PMI list.pdf",
            keep_local=True,
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
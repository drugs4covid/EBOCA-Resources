# EBOCA Resources
Resources for constructing the Knowledge Graph generated anotating source data with the [EBOCA ontology](https://w3id.org/eboca/portal). The construction of the KG follows a systematic and maintainable approach creating RML and R2RML mappings with [Mapeathor](https://github.com/oeg-upm/mapeathor), and using [Morph-KGC](https://github.com/oeg-upm/morph-kgc) for transforming the original input data (from JSON data and relational databases) into RDF. This repository contains the resources necessary te create triples for both modules, [SEM-DISNET](https://w3id.org/eboca/sem-disnet) and [Evidences](https://w3id.org/eboca/evidences). 

## Resources
* **Mappings**: RML and R2RML mapping documents, and Mapeathor spreadsheets used for creating the mappings.
* **Queries**: SPARQL queries corresponding to the Competency Questions of each module (available in their respective [documentation](https://w3id.org/eboca/portal)).
* **Results**: N-triples files of the resulting KG generated with Morph-KGC.
* **Scripts**: Bash script for downloading the JSON data of the annotations of the CORD-19 dataset to create the EBOCA-Evidences KG.

## Countributing
The management of issues and improvements suggested for this repository is done by addressing [issues](https://github.com/drugs4covid/EBOCA-KG/issues) and [pull requests](https://github.com/drugs4covid/EBOCA-KG/pulls) in the repository. If you are interested in collaborate with us in a new version of the KG, send us an email!

## Authors
* Ana Iglesias-Molina - [ana.iglesiasm@upm.es](mailto:ana.iglesiasm@upm.es)
* Lucía Prieto Santamaría - [lucia.prieto.santamaria@upm.es](mailto:lucia.prieto.santamaria@upm.es)
* Andrea Álvarez Pérez - [andrea.alvarezp@alumnos.upm.es](andrea.alvarezp@alumnos.upm.es)

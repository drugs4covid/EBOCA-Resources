## EBOCA Evidences

### eboca-ev1
An association can have an evidence
```
PREFIX ebocaev: <https://w3id.org/eboca/evidences#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX prov: <http://www.w3.org/ns/prov#>
PREFIX sio: <http://semanticscience.org/resource/>
PREFIX ncit: <http://ncicb.nci.nih.gov/xml/owl/EVS/Thesaurus.owl#>
PREFIX cco: <http://rdf.ebi.ac.uk/terms/chembl#>
PREFIX fabio: <http://purl.org/spar/fabio/>
PREFIX frbr: <http://purl.org/vocab/frbr/core#>
PREFIX doco: <http://purl.org/spar/doco/>
PREFIX pav: <http://purl.org/pav/>

SELECT DISTINCT ?association ?evidence
WHERE {
	?evidence a ebocaev:Evidence .
	?association a sio:SIO_000897 ;
              sio:SIO_000772 ?evidence .

}
```

### eboca-ev2
Evidences may be inferred or documented
```
PREFIX ebocaev: <https://w3id.org/eboca/evidences#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX prov: <http://www.w3.org/ns/prov#>
PREFIX sio: <http://semanticscience.org/resource/>
PREFIX ncit: <http://ncicb.nci.nih.gov/xml/owl/EVS/Thesaurus.owl#>
PREFIX cco: <http://rdf.ebi.ac.uk/terms/chembl#>
PREFIX fabio: <http://purl.org/spar/fabio/>
PREFIX frbr: <http://purl.org/vocab/frbr/core#>
PREFIX doco: <http://purl.org/spar/doco/>
PREFIX pav: <http://purl.org/pav/>
PREFIX obo: <http://purl.obolibrary.org/obo/>

SELECT DISTINCT ?type
WHERE {
    ?evidence a ?type ;
              a ebocaev:Evidence .
}
```


### eboca-ev3
Evidences are extracted from texts
```
PREFIX ebocaev: <https://w3id.org/eboca/evidences#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX prov: <http://www.w3.org/ns/prov#>
PREFIX sio: <http://semanticscience.org/resource/>
PREFIX ncit: <http://ncicb.nci.nih.gov/xml/owl/EVS/Thesaurus.owl#>
PREFIX cco: <http://rdf.ebi.ac.uk/terms/chembl#>
PREFIX fabio: <http://purl.org/spar/fabio/>
PREFIX frbr: <http://purl.org/vocab/frbr/core#>
PREFIX doco: <http://purl.org/spar/doco/>
PREFIX pav: <http://purl.org/pav/>
PREFIX obo: <http://purl.obolibrary.org/obo/>

SELECT DISTINCT ?evidence ?text
WHERE {
    ?evidence a ebocaev:Evidence ;
              pav:derivedFrom ?paragraph .
    ?text a fabio:Expression ;
          frbr:part ?paragraph.
}
```

### eboca-ev4
Texts and its parts can be uniquely identified
```
PREFIX ebocaev: <https://w3id.org/eboca/evidences#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX prov: <http://www.w3.org/ns/prov#>
PREFIX sio: <http://semanticscience.org/resource/>
PREFIX ncit: <http://ncicb.nci.nih.gov/xml/owl/EVS/Thesaurus.owl#>
PREFIX cco: <http://rdf.ebi.ac.uk/terms/chembl#>
PREFIX fabio: <http://purl.org/spar/fabio/>
PREFIX frbr: <http://purl.org/vocab/frbr/core#>
PREFIX doco: <http://purl.org/spar/doco/>
PREFIX pav: <http://purl.org/pav/>
PREFIX obo: <http://purl.obolibrary.org/obo/>
PREFIX dc: <http://purl.org/dc/terms/>

SELECT DISTINCT ?par_id ?text_id
WHERE {
	?paragraph a doco:Paragraph ;
            dc:identifier ?par_id .
    ?text a fabio:Expression ;
          frbr:part ?paragraph;
          dc:identifier ?text_id .
}
```

### eboca-ev5
Evidences have a date of creation and update
```
PREFIX ebocaev: <https://w3id.org/eboca/evidences#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX prov: <http://www.w3.org/ns/prov#>
PREFIX sio: <http://semanticscience.org/resource/>
PREFIX ncit: <http://ncicb.nci.nih.gov/xml/owl/EVS/Thesaurus.owl#>
PREFIX cco: <http://rdf.ebi.ac.uk/terms/chembl#>
PREFIX fabio: <http://purl.org/spar/fabio/>
PREFIX frbr: <http://purl.org/vocab/frbr/core#>
PREFIX doco: <http://purl.org/spar/doco/>
PREFIX pav: <http://purl.org/pav/>
PREFIX obo: <http://purl.obolibrary.org/obo/>
PREFIX dc: <http://purl.org/dc/terms/>

SELECT DISTINCT ?evidence ?date ?update
WHERE {
    ?evidence a ebocaev:Evidence ;
              pav:createdOn ?date ;
              pav:lastUpdatedOn ?update .
}
```

### eboca-ev6
Evidences may be created with software
```
PREFIX ebocaev: <https://w3id.org/eboca/evidences#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX prov: <http://www.w3.org/ns/prov#>
PREFIX sio: <http://semanticscience.org/resource/>
PREFIX ncit: <http://ncicb.nci.nih.gov/xml/owl/EVS/Thesaurus.owl#>
PREFIX cco: <http://rdf.ebi.ac.uk/terms/chembl#>
PREFIX fabio: <http://purl.org/spar/fabio/>
PREFIX frbr: <http://purl.org/vocab/frbr/core#>
PREFIX doco: <http://purl.org/spar/doco/>
PREFIX pav: <http://purl.org/pav/>
PREFIX obo: <http://purl.obolibrary.org/obo/>
PREFIX dc: <http://purl.org/dc/terms/>
PREFIX dcmi: <http://purl.org/dc/dcmitype/>

SELECT DISTINCT ?evidence ?software
WHERE {
    ?evidence a ebocaev:Evidence ;
              pav:createdWith ?software .
    ?software a dcmi:Software .
}
```

### eboca-ev7
Evidence may be created with a confidence score
```
PREFIX ebocaev: <https://w3id.org/eboca/evidences#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX prov: <http://www.w3.org/ns/prov#>
PREFIX sio: <http://semanticscience.org/resource/>
PREFIX ncit: <http://ncicb.nci.nih.gov/xml/owl/EVS/Thesaurus.owl#>
PREFIX cco: <http://rdf.ebi.ac.uk/terms/chembl#>
PREFIX fabio: <http://purl.org/spar/fabio/>
PREFIX frbr: <http://purl.org/vocab/frbr/core#>
PREFIX doco: <http://purl.org/spar/doco/>
PREFIX pav: <http://purl.org/pav/>
PREFIX obo: <http://purl.obolibrary.org/obo/>
PREFIX dc: <http://purl.org/dc/terms/>
PREFIX dcmi: <http://purl.org/dc/dcmitype/>

SELECT DISTINCT ?evidence ?score
WHERE {
    ?evidence a ebocaev:Evidence ;
              ebocaev:score ?score .
}
```



### eboca-ev8
How many evidences of associations with chemicals has each gene?

```
PREFIX ebocaev: <https://w3id.org/eboca/evidences#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX prov: <http://www.w3.org/ns/prov#>
PREFIX sio: <http://semanticscience.org/resource/>
PREFIX ncit: <http://ncicb.nci.nih.gov/xml/owl/EVS/Thesaurus.owl#>
PREFIX cco: <http://rdf.ebi.ac.uk/terms/chembl#>

SELECT DISTINCT ?gene ?gene_label (COUNT (?evidence) AS ?count_ev)
WHERE {
	?evidence a ebocaev:Evidence .
	?association a sio:SIO_000897 ;
              sio:SIO_000772 ?evidence ;
              sio:SIO_000628 ?gene ;
              sio:SIO_000628 ?chemical .
    ?gene a ncit:C16612 ;
          rdfs:label ?gene_label .
    ?chemical a cco:Substance .
}

GROUP BY ?gene ?gene_label
```

### eboca-ev9
Which associations between diseases and chemicals have more than one evidence?
```
PREFIX ebocaev: <https://w3id.org/eboca/evidences#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX prov: <http://www.w3.org/ns/prov#>
PREFIX sio: <http://semanticscience.org/resource/>
PREFIX ncit: <http://ncicb.nci.nih.gov/xml/owl/EVS/Thesaurus.owl#>
PREFIX cco: <http://rdf.ebi.ac.uk/terms/chembl#>
PREFIX fabio: <http://purl.org/spar/fabio/>
PREFIX frbr: <http://purl.org/vocab/frbr/core#>
PREFIX doco: <http://purl.org/spar/doco/>
PREFIX pav: <http://purl.org/pav/>

SELECT DISTINCT ?association ?disease ?chemical (COUNT (?evidence) AS ?count_ev)
WHERE {
	?evidence a ebocaev:Evidence ;
           pav:derivedFrom ?paragraph .
	?association a sio:SIO_000897 ;
              sio:SIO_000772 ?evidence ;
              sio:SIO_000628 ?disease ;
              sio:SIO_000628 ?chemical .
    ?disease a ncit:C7057 .
    ?chemical a cco:Substance .
}
GROUP BY ?association ?chemical ?disease
HAVING (?count_ev > 1)
```

### eboca-ev10
Which papers contain evidence of associations between the drug 'Celecoxib' and the disease 'Osteoarthritis'?
```
PREFIX ebocaev: <https://w3id.org/eboca/evidences#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX prov: <http://www.w3.org/ns/prov#>
PREFIX sio: <http://semanticscience.org/resource/>
PREFIX ncit: <http://ncicb.nci.nih.gov/xml/owl/EVS/Thesaurus.owl#>
PREFIX cco: <http://rdf.ebi.ac.uk/terms/chembl#>
PREFIX fabio: <http://purl.org/spar/fabio/>
PREFIX frbr: <http://purl.org/vocab/frbr/core#>
PREFIX doco: <http://purl.org/spar/doco/>
PREFIX pav: <http://purl.org/pav/>
PREFIX obo: <http://purl.obolibrary.org/obo/>
PREFIX dc: <http://purl.org/dc/terms/>
PREFIX dcmi: <http://purl.org/dc/dcmitype/>

SELECT DISTINCT ?paper
WHERE {
    ?paper a fabio:Expression ;
           frbr:part ?paragraph .
	?evidence a ebocaev:Evidence ;
           pav:derivedFrom ?paragraph .
	?association a sio:SIO_000897 ;
              sio:SIO_000772 ?evidence ;
              sio:SIO_000628 ?disease ;
              sio:SIO_000628 ?chemical .
    ?disease a ncit:C7057 ;
             rdfs:label ?dis_label .
    ?chemical a cco:Substance ;
              rdfs:label ?chem_label .

    FILTER CONTAINS(?chem_label, "Celecoxib")
    FILTER CONTAINS(?dis_label, "Osteoarthritis")
}
```

## EBOCA Evidences

### CQ-EV1
How many evidences of associations with chemicals has each gene?

```
PREFIX ebocaev: <https://w3id.org/eboca/evidences/>
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

### CQ-EV2
Which associations between diseases and chemicals have more than one evidence?
```
PREFIX ebocaev: <https://w3id.org/eboca/evidences/>
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
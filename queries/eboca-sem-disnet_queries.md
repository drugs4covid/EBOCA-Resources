# SPARQL queries for EBOCA-KG-disnet competency questions

Here we include the 15 SPARQL queries for each of the competency questions designed to validate EBOCA-KG, SEM-DISNET module.


## eboca-disnet1
 How can we define the concept of variant?
 ```Sparql
PREFIX obo:<http://purl.obolibrary.org/obo/>

SELECT ?definition
WHERE {obo:SO_0001060 obo:IAO_0000115 ?definition}
 ```

:heavy_exclamation_mark: Comment :point_right: OBO has its own type of annotation to describe and define its concepts. This annotation property is **obo:IAO_0000115**

## eboca-disnet2
Which object property models the relationship between genes and proteins?
```Sparql
PREFIX ncit:<http://ncicb.nci.nih.gov/xml/owl/EVS/Thesaurus.owl#>
PREFIX owl:<http://www.w3.org/2002/07/owl#>
PREFIX rdfs:<http://www.w3.org/2000/01/rdf-schema#>

SELECT ?encode_relationship
WHERE {?encode_relationship a owl:ObjectProperty ;
                              rdfs:domain ncit:C16612 ;
                              rdfs:range ncit:C17021
      }
```

## eboca-disnet3
Which diseases can be therapeutically treated with more than one drug?
```Sparql
PREFIX ncit:<http://ncicb.nci.nih.gov/xml/owl/EVS/Thesaurus.owl#>
PREFIX cco:<http://rdf.ebi.ac.uk/terms/chembl#>
PREFIX ctd:<http://bio2rdf.org/ctd_vocabulary:>
PREFIX sio:<http://semanticscience.org/resource/>
PREFIX disnet:<https://w3id.org/eboca/sem-disnet/>

SELECT DISTINCT ?disease
WHERE {?drugdisease a disnet:DrugDiseaseTherapeutic ;  
                      sio:SIO_000628 ?disease ;
                    sio:SIO_000628 ?drug .
       ?disease a ncit:C7057 .
       ?drug a cco:Substance
      }
GROUP BY ?disease
HAVING (COUNT(?drug) > 1)
```


## eboca-disnet4
 Are targets associated to their corresponding organism?
 ```Sparql
 PREFIX cco:<http://rdf.ebi.ac.uk/terms/chembl#>
 PREFIX ncit:<http://ncicb.nci.nih.gov/xml/owl/EVS/Thesaurus.owl#>
 PREFIX owl:<http://www.w3.org/2002/07/owl#>
 PREFIX rdfs:<http://www.w3.org/2000/01/rdf-schema#>

 SELECT ?targetorgansim
 WHERE { ?targetorgansim a owl:ObjectProperty ;
                          rdfs:domain cco:Target ;
                          rdfs:range ?range .
        ?range owl:unionOf ?union .
        ?union rdf:first ncit:C14250
       }
 ```


## eboca-disnet5
 How many genes are associated with a given disease? (For example, Smallpox, which is identified with the UMLS CUI C0037354)
 ```Sparql
 PREFIX sio:<http://semanticscience.org/resource/>
 PREFIX ncit:<http://ncicb.nci.nih.gov/xml/owl/EVS/Thesaurus.owl#>

 SELECT (COUNT(?gene) AS ?n_genes)

 WHERE { ?genedisease a sio:SIO_000983 ;
                        sio:SIO_000628 ?gene ;
                        sio:SIO_000628 <http://medal.ctb.upm.es/projects/DISNET/res/sem-disnet#C0043119> .
         ?gene a ncit:C16612}
 ```


## eboca-disnet6
Is there a relationship that models the interaction between two proteins?
 ```Sparql
 PREFIX ncit:<http://ncicb.nci.nih.gov/xml/owl/EVS/Thesaurus.owl#>
 PREFIX sio:<http://semanticscience.org/resource/>
 PREFIX disnet:<https://w3id.org/eboca/sem-disnet#>

 SELECT ?pp_interaction (COUNT(DISTINCT ?protein) as ?count_proteins)
 WHERE { ?pp_interaction a disnet:Ppi ;
                  sio:SIO_000132 ?protein .
          ?protein a ncit:C17021 .
        }
 GROUP BY ?pp_interaction
 HAVING (?count_proteins = 2)
 ```


## eboca-disnet7
Is it the concept of prevalence associated with Orphan Diseases?
```Sparql
PREFIX ordo:<http://purl.obolibrary.org/obo/>

SELECT ?association

WHERE {?orpha a ordo:Orphanet_C009 .
       ?prev a ordo:Orphanet_557492 .
       ?orpha ?association ?prev
      }
```



## eboca-disnet8
Which genes do not have an associated DSI?
```Sparql
PREFIX ncit:<http://ncicb.nci.nih.gov/xml/owl/EVS/Thesaurus.owl#>
PREFIX sio:<http://semanticscience.org/resource/>

SELECT DISTINCT ?gene
WHERE { ?gene a ncit:C16612 .
        OPTIONAL { ?gene sio:SIO_000216 ?DSI .
                   ?DSI a sio:SIO_001351 . }

      }
GROUP BY ?gene
HAVING(COUNT(?DSI) = 0)
```



## eboca-disnet9
What is the relationship between two drugs?
```Sparql
PREFIX sio:<http://semanticscience.org/resource/>
PREFIX cco:<http://rdf.ebi.ac.uk/terms/chembl#>

SELECT ?dd_interaction (COUNT (?drug) as ?count_drugs)
WHERE { ?dd_interacion a sio:SIO_001006 ;
                sio:SIO_000132 ?drug .
        ?drug a cco:Substance .
      }
GROUP BY ?dd_interaction
HAVING (?count_drugs = 2)
```


## eboca-disnet10
Can a given gene be associated with more than one variant? (For example, the TNF, which is identified under Entrez ID 7124)
```Sparql
PREFIX ncit:<http://ncicb.nci.nih.gov/xml/owl/EVS/Thesaurus.owl#>

SELECT (COUNT(?variant) as ?count_variants)
WHERE { <http://medal.ctb.upm.es/projects/DISNET/res/sem-disnet#7124> ncit:R178 ?variant}
```


## eboca-disnet11
Which annotations do we store for each protein? 
```Sparql
PREFIX ncit:<http://ncicb.nci.nih.gov/xml/owl/EVS/Thesaurus.owl#>
PREFIX owl:<http://www.w3.org/2002/07/owl#>

SELECT DISTINCT ?annot
WHERE { ?protein a ncit:C17021 ;
                ?anot_rel ?anot_value .
        ?annot a owl:AnnotationProperty
      }
```


## eboca-disnet12
Which are the drugs and diseases connected by a 'Inferred' association?
```Sparql
PREFIX ncit:<http://ncicb.nci.nih.gov/xml/owl/EVS/Thesaurus.owl#>
PREFIX cco:<http://rdf.ebi.ac.uk/terms/chembl#>
PREFIX disnet:<https://w3id.org/eboca/sem-disnet/>
PREFIX sio:<http://semanticscience.org/resource/>

SELECT DISTINCT ?drug ?disease
WHERE { ?drugdisease a disnet:DrugDiseaseInferred ;
                       sio:SIO_000628 ?drug ;
                       sio:SIO_000628 ?disease .
        ?drug a cco:Substance .
        ?diseases a ncit:C7057
      }
```


## eboca-disnet13
Are drugs and phenotypes connected to side effects?
```Sparql
PREFIX cco:<http://rdf.ebi.ac.uk/terms/chembl#>
PREFIX disnet:<https://w3id.org/eboca/sem-disnet#>
PREFIX owl:<http://www.w3.org/2002/07/owl#>
PREFIX rdfs:<http://www.w3.org/2000/01/rdf-schema#>

SELECT  ?relationship1
WHERE {
  ?relationship_1 a owl:ObjectProperty ;
                    rdfs:domain disnet:Phenotype ;
                    rdfs:range disnet:DrugPhenotypeSideEffect
}


PREFIX cco:<http://rdf.ebi.ac.uk/terms/chembl#>
PREFIX disnet:<https://w3id.org/eboca/sem-disnet#>
PREFIX owl:<http://www.w3.org/2002/07/owl#>
PREFIX rdfs:<http://www.w3.org/2000/01/rdf-schema#>

SELECT  ?relationship1 ?relationship2
WHERE { ?relationship_2 a owl:ObjectProperty ;
                    rdfs:domain cco:Substance ;
                    rdfs:range disnet:DrugPhenotypeSideEffect
}
```


## eboca-disnet14
Which genes are associated with more than one pathway? 
```Sparql
PREFIX ncit:<http://ncicb.nci.nih.gov/xml/owl/EVS/Thesaurus.owl#>
PREFIX sio:<http://semanticscience.org/resource/>
PREFIX wp:<http://vocabularies.wikipathways.org/wp#>


SELECT DISTINCT ?gene
WHERE { ?gene a ncit:C16612 ;
              sio:SIO_000068 ?pathway .
        ?pathway a wp:Pathway .
      }
GROUP BY ?gene
HAVING (COUNT(?pathway) > 1)
```


## eboca-disnet15
How a disease marker is described?
```Sparql
PREFIX ncit:<http://ncicb.nci.nih.gov/xml/owl/EVS/Thesaurus.owl#>

SELECT ?description
WHERE { ncit:C18329 ncit:P97 ?description}
```
:heavy_exclamation_mark:Comment :point_right: NCIT has its own type of annotation to describe and define its concepts. This annotation property is **ncit:P97**

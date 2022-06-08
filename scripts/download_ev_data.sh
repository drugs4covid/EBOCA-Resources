curl -g "http://librairy.linkeddata.es/solr/cord19-paragraphs/select?fl=id,text_t,article_id_s,disease_terms_ss,chemical_terms_ss,genetic_terms_ss,_version_,section_s&q=*:*&rows=5000&start=0" > solr-evidences.json

curl -g "http://librairy.linkeddata.es/solr/cord19-papers/select?fl=id,name_s,url_s,abstract_t&q=*:*&rows=5000&start=0" > solr-paper.json
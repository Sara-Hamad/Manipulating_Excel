library(readxl)
library(rio)
library(dplyr)
memory.limit(size=2000000)
gene_names = list('ATM' ,'BARD1', 'BLM','BRCA1', 
'BRCA2', 'BRIP1', 'CDH1', 'CHEK2',
'FAM175A', 'FANCC','NF1', 'PALB2', 'PMS2',
'PTEN', 'RAD51B', 'RAD51C', 'STK11', 'TP53')
print(gene_names)

all_excel_files = list.files(pattern='*.xlsx')
loop_over_excel_files = lapply(all_excel_files,function(i){
  xl= read_excel(i)
  modified_xl = lapply(gene_names,function(n)
     {
      name_of_gene_n =filter(xl,Gene_Name ==n)
      export(name_of_gene_n,sprintf("%s_%s",n,i))
     })
})


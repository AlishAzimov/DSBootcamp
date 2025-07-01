def read_and_write():
    with open('ds.csv','r', encoding='utf-8') as ds_csv, open('ds.tsv','w',encoding='utf-8') as ds_tsv:
        ds_tsv.write(ds_csv.read().replace('","','"\t"')
                    .replace('false,','false\t')
                    .replace('true,','true\t')
                    .replace('",','"\t'))

if __name__ == '__main__':
    read_and_write()
import pandas as pd

# 读取 human.txt 文件
human_df = pd.read_csv('human.txt', header=None, names=['human.GeneID'])

# 定义要处理的文件及其对应的同源基因 ID 列名
files = [
    ('hs2btaurus.orth.inf.csv', 'cow.GeneID'),
    ('hs2cfamiliaris.orth.inf.csv', 'dog.GeneID'),
    ('hs2dnovemcinctus.orth.inf.csv', 'armadillo.GeneID'),
    ('hs2ecaballus.orth.inf.csv', 'horse.GeneID'),
    ('hs2lafricana.orth.inf.csv', 'elephant.GeneID'),
    ('hs2mdomestica.orth.inf.csv', 'opossum.GeneID'),
    ('hs2mmulatta.orth.inf.csv', 'macaque.GeneID'),
    ('hs2mmusculus.orth.inf.csv', 'mouse.GeneID'),
    ('hs2sscrofa.orth.inf.csv', 'pig.GeneID')
]

# 预先读取所有文件并存储在字典中
gene_data = {}
for file_name, column_name in files:
    df = pd.read_csv(file_name, header=None, names=['human.GeneID', column_name])
    gene_data[file_name] = df.set_index('human.GeneID')

# 创建一个集合保存 human.GeneID
common_genes = set(human_df['human.GeneID'])

# 遍历每个文件，更新共同的 gene ID
for file_name in files:
    current_genes = set(gene_data[file_name[0]].index)
    common_genes.intersection_update(current_genes)

# 保留仅在所有文件中存在的 human.GeneID
result = human_df[human_df['human.GeneID'].isin(common_genes)]

# 确保 result 非空
if not result.empty:
    # 初始化列名
    result_columns = ['human.GeneID'] + [file[1] for file in files]
    
    # 创建一个 DataFrame 来存储结果
    result_df = pd.DataFrame(columns=result_columns)
    result_df['human.GeneID'] = result['human.GeneID']

    # 将各个物种的基因 ID 合并
    for file_name, column_name in files:
        temp_df = gene_data[file_name[0]].loc[result['human.GeneID']]
        result_df[column_name] = temp_df[column_name].values

    # 保存结果到文件
    result_df.to_csv('Species10_ortholog.txt', sep='\t', index=False)
    print("共同的 human Gene ID 及其同源 Gene ID 已保存到 Species10_ortholog.txt。")
else:
    print("没有共同的 human Gene ID。")


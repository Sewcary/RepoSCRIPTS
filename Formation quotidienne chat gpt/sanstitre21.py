import pandas as pd

# Load the Excel file
file_path = 'class.xlsx'  # Adjust this path to your file's actual location
df = pd.read_excel(file_path, sheet_name='Feuil1')

# Perform the merge
df_merged = pd.merge(df[['DI', 'count', 'min', 'max']],
                     df[['CORE', 'count.1', 'min.1', 'max.1']],
                     left_on='DI', right_on='CORE', how='outer', indicator=True)

# Identify rows only in CORE and only in DI
core_only = df_merged[df_merged['_merge'] == 'right_only']
di_only = df_merged[df_merged['_merge'] == 'left_only']
both_sides = df_merged[df_merged['_merge'] == 'both']

# Reorganize columns
both_sides = both_sides[['DI', 'count', 'min', 'max', 'CORE', 'count.1', 'min.1', 'max.1']]
core_only = core_only[['DI', 'count', 'min', 'max', 'CORE', 'count.1', 'min.1', 'max.1']]
di_only = di_only[['DI', 'count', 'min', 'max', 'CORE', 'count.1', 'min.1', 'max.1']]

# Append the di-only and core-only rows to the merged dataframe
df_final = pd.concat([both_sides, di_only, core_only])

# Convert floating-point numbers ending with ".0" to integers
df_final = df_final.applymap(lambda x: int(x) if isinstance(x, float) and x.is_integer() else x)

# Save the dataframe
output_path = 'C:\\reorganized_class_final.xlsx'  # Adjust this path to where you want to save the file
df_final.to_excel(output_path, index=False)

output_path

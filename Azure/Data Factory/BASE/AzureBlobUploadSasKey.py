from azure.storage.blob import BlobClient
import pandas as pd
import os 

# OsconnectionString = os.environ['ConnectionString']
# OscontainerName = os.environ['ContainerName']

connectionString = "" # containor query string
outcontainerName = "" # output containername
outputBlobName = "" # output sourcename

# File SAS Key
SASUrl = "" # soure sas key

blob = BlobClient.from_connection_string(conn_str=connectionString, container_name=outcontainerName, blob_name=outputBlobName)

df = pd.read_csv(SASUrl)

df = df[df['Species'] == "setosa"]

df.to_csv(outputBlobName, index = False)

with open(outputBlobName, "rb") as data:    
    blob.upload_blob(data)
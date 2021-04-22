from azure.storage.blob import BlobClient
import pandas as pd


connectionString = "BlobStorage ConnectionString"
containerName = "ContainerName"
outputBlobName = "OutputFileName"

# Blob 연결
blob = BlobClient.from_connection_string(conn_str=connectionString, container_name=containerName, blob_name=outputBlobName)

# 로컬 에서 확인 용도
df = pd.read_csv("Local File Path", engine='python')

df.to_csv(outputBlobName, index = False)

with open(outputBlobName, "rb") as data:
    blob.upload_blob(data)
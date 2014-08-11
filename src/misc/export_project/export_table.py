import sys
from apiclient.discovery import build
from oauth2client.file import Storage
from oauth2client.client import AccessTokenRefreshError
from oauth2client.client import OAuth2WebServerFlow
from oauth2client.tools import run
from apiclient.errors import HttpError
import httplib2

FLOW = OAuth2WebServerFlow(
    client_id='80375991476-cg634tcggqmdicmcirmubnhh5s2hdfg2.apps.googleusercontent.com',
    client_secret='WbqJt-ojape-ZO6oxxNgO1gE',
    scope='https://www.googleapis.com/auth/bigquery',
    user_agent='my-program-name/1.0')

def exportTable(http, service):
  projectId = raw_input("Choose your project ID: ")
  projectIdSrc = raw_input("Choose source project ID: ")
  datasetId = raw_input("Choose a dataset ID: ")
  tableId = raw_input("Choose a table name to copy: ")

  url = "https://www.googleapis.com/bigquery/v2/projects/" + projectId + "/jobs"

  jobCollection = service.jobs()
  jobData = {
    'projectId': projectId,
    'configuration': {
      'extract': {
        'sourceTable': {
           'projectId': projectIdSrc,
           'datasetId': datasetId,
           'tableId': tableId
         },
        'destinationUris': ['gs://bucket-tvykruta/export-*.csv'],
       }
     }
   }
  insertJob = jobCollection.insert(projectId=projectId, body=jobData).execute()
  import time
  while True:
    status =jobCollection.get(projectId=projectId, jobId=insertJob['jobReference']['jobId']).execute()
    print status
    if 'DONE' == status['status']['state']:
      print "Done exporting!"
      return
    print 'Waiting for export to complete..'
    time.sleep(10)

def main(argv):
  # If the credentials don't exist or are invalid, run the native client
  # auth flow. The Storage object will ensure that if successful the good
  # credentials will get written back to a file.
  storage = Storage('bigquery2.dat') # Choose a file name to store the credentials.
  credentials = storage.get()
  if credentials is None or credentials.invalid:
    credentials = run(FLOW, storage)

  # Create an httplib2.Http object to handle our HTTP requests and authorize it
  # with our good credentials.
  http = httplib2.Http()
  http = credentials.authorize(http)

  service = build('bigquery','v2', http=http)
  exportTable(http, service)

if __name__ == '__main__':
  main(sys.argv)

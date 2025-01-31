param projectName string
param location string = resourceGroup().location

param modelId string = 'azureml://registries/azureml-deepseek/models/DeepSeek-R1'
param endpointName string = 'deepseekendpoint-ajkdajdskahdhakahdd'


resource projectName_endpoint 'Microsoft.MachineLearningServices/workspaces/serverlessEndpoints@2024-04-01-preview' = {
  name: '${projectName}/${endpointName}'
  location: location
  sku: {
    name: 'Consumption'
  }
  properties: {
    modelSettings: {
      modelId: modelId
    }
  }
}

output endpointUri string = projectName_endpoint.properties.inferenceEndpoint.uri

<REDACTED related to EDR>

<REDACTED related to EDR>
<REDACTED related to EDR>
<REDACTED related to EDR>

$Time = ((Get-Date).ToUniversalTime()).ToString("yyyy-MM-ddTHH-mmZ")
$ResultsFolder = "C:\TestData\TestResults\"
$APIFileName = "API_" + $Time + "_NonMalicious.json"
$APIFilePath = $ResultsFolder + $APIFileName
$APIAlertInfoFileName = "API_" + $Time + "_AlertInfo_NonMalicious.json"
$APIAlertInfoFilePath = $ResultsFolder + $APIAlertInfoFileName
$APIAlertEvidenceFileName = "API_" + $Time + "_AlertEvidence_NonMalicious.json"
$APIAlertEvidenceFilePath = $ResultsFolder + $APIAlertEvidenceFileName

$body = @{
<REDACTED related to EDR>
<REDACTED related to EDR>
<REDACTED related to EDR>
<REDACTED related to EDR>
}

$response = Invoke-RestMethod -Method Post -Uri <REDACTED related to EDR> -Body $body
$accessToken = $response.access_token

<REDACTED related to EDR> -AccessToken ($accessToken | ConvertTo-SecureString -AsPlainText -Force)


$query = <REDACTED related to EDR>

$body = @{ Query = $query } | ConvertTo-Json
$response = <REDACTED related to EDR> -Method POST -Uri <REDACTED related to EDR> -Body $body
$output = $response.results | ConvertTo-Json 
$output | Out-File -FilePath $APIFilePath


$queryAlertInfo = <REDACTED related to EDR>

$bodyAlertInfo  = @{ Query = $queryAlertInfo } | ConvertTo-Json
$responseAlertInfo = <REDACTED related to EDR> -Method POST -Uri <REDACTED related to EDR> -Body $bodyAlertInfo
$outputAlertInfo  = $responseAlertInfo.results | ConvertTo-Json 
$outputAlertInfo| Out-File -FilePath $APIAlertInfoFilePath


$queryAlertEvidence = <REDACTED related to EDR>

$bodyAlertEvidence  = @{ Query = $queryAlertEvidence } | ConvertTo-Json
$responseAlertEvidence = <REDACTED related to EDR> -Method POST -Uri <REDACTED related to EDR> -Body $bodyAlertEvidence 
$outputAlertEvidence  = $responseAlertEvidence.results | ConvertTo-Json 
$outputAlertEvidence | Out-File -FilePath $APIAlertEvidenceFilePath


# Find VM Image details
$vmImages = Get-AzVmImage -PublisherName canonical -Location 'West US 2'

$locName="west us 2"
Get-AzVMImagePublisher -Location $locName | 
    Select-Object PublisherName

$pubName="canonical"
Get-AzVMImageOffer -Location $locName -PublisherName $pubName | 
    Select-Object Offer

$offerName="UbuntuServer"
Get-AzVMImageSku -Location $locName -PublisherName $pubName -Offer $offerName | 
    Select-Object Skus

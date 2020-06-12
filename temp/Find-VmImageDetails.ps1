
$locName="westus2"

$publisher = Get-AzVMImagePublisher -Location $locName | 
    Select-Object PublisherName |
    Where-Object {$_.PublisherName -eq "MicrosoftWindowsServer"}

#  $pubName="Microsoft.Server"
$offer = Get-AzVMImageOffer -Location $locName -PublisherName $publisher.PublisherName | 
    Select-Object Offer |
    Where-Object {$_.Offer -eq "WindowsServer"}

#  $offerName="UbuntuServer"
$sku = Get-AzVMImageSku -Location $locName -PublisherName $publisher.PublisherName -Offer $offer.Offer | 
    Select-Object Skus |
    Where-Object {$_.Skus -eq "2019-Datacenter"}

$sku.Skus

# Find VM Image details
$vmImages = Get-AzVmImage -Location westus2 -Offer $offer.Offer -PublisherName $publisher.PublisherName -Skus $sku.Skus

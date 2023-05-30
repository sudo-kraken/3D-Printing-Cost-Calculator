# Ask for user input
$materialPrice = [float](Read-Host "Please enter the Material Price (£/kg)")
$materialConsumed = [float](Read-Host "Please enter the Amount of Material Consumed (g)")
$laborRate = [float](Read-Host "Please enter the Hourly Labor Rate (£/hr)")
$laborTime = [float](Read-Host "Please enter the Labor Time (hr)")
$printerCharge = [float](Read-Host "Please enter the 3D Printer Operation Charge (£/hr)")
$printTime = [float](Read-Host "Please enter the Print Time (hr)")
$electricityCost = [float](Read-Host "Please enter the Local Electricity Cost (£/kWh)")
$printerPower = [float](Read-Host "Please enter the 3D Printer Power Consumption (W)")
$profitMargin = [float](Read-Host "Please enter the Profit Margin (%)")

# Calculate costs
$materialCost = ($materialPrice * ($materialConsumed / 1000))
$laborCost = $laborRate * $laborTime
$equipmentCost = $printerCharge * $printTime
$electricityCost = (($printerPower / 1000) * $printTime * $electricityCost)
$totalCost = $materialCost + $laborCost + $equipmentCost + $electricityCost

# Calculate profit and total charge
$profit = ($profitMargin / 100) * $totalCost
$totalCharge = $totalCost + $profit

# Output total charge, rounded to 2 decimal places
$totalCharge = [math]::Round($totalCharge, 2)
Write-Output "Total 3D Printing Charge (£) = $totalCharge"

## 3D Print Cost Calculator
The 3D Print Cost Calculator is a simple PowerShell script that helps you calculate the cost of 3D printing a particular item, including labor, material, equipment, and electricity costs, as well as a profit margin and shipping cost.

### Inputs
The script prompts for the following inputs:

``` 
Material Price (£/kg): The price of the 3D printing material per kilogram.

Amount of Material Consumed (g): The amount of material consumed in grams for the specific print.

Hourly Labor Rate (£/hr): The rate charged per hour for labor.

Labor Time (hr): The time in hours that labor was spent on the print.

3D Printer Operation Charge (£/hr): The operational charge of the 3D printer per hour.

Print Time (hr): The time in hours it took to print the item.

Local Electricity Cost (£/kWh): The cost of electricity per kilowatt-hour.

3D Printer Power Consumption (W): The power consumption of the 3D printer in watts.

Profit Margin (%): The desired profit margin as a percentage.

Shipping Cost (£): The cost to ship the final product.

Currency Symbol (GBP, USD, EUR): The currency symbol for the final output.
```

### Outputs
The script calculates the cost of the material, labor, equipment, and electricity, then adds the profit margin and shipping cost to give the final total charge. The total charge is then displayed with the chosen currency symbol.

### Usage
Simply run the script in PowerShell and input the required values when prompted. The final total charge for the 3D print will be displayed at the end.

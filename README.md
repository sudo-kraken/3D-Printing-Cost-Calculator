## 3D Print Cost Calculator
The 3D Print Cost Calculator is a simple PowerShell script that helps you calculate the cost of 3D printing a particular item, including labour, material, equipment, and electricity costs, as well as a profit margin and shipping cost.

### Inputs
The script prompts for the following inputs:

![image](https://github.com/Joeharrison94/3D-Printing-Cost-Calculator/assets/53116754/8444ca2a-8042-43e3-ad5a-999b8a5fc578)

``` 
Currency (GBP, USD, EUR): The currency symbol for the final output.

Material Price (per kg): The price of the 3D printing material per kilogram.

Amount of Material Consumed (g): The amount of material consumed in grams for the specific print.

Hourly Labour Rate (hr): The rate charged per hour for labour.

Labour Time (hr): The time in hours that labour was spent on the print.

3D Printer Operation Charge (cost per hr): The operational charge of the 3D printer per hour.

Print Time (hr): The time in hours it took to print the item.

Local Electricity Cost (per kWh): The cost of electricity per kilowatt-hour.

3D Printer Power Consumption (W): The power consumption of the 3D printer in watts.

Profit Margin (%): The desired profit margin as a percentage.

Shipping Cost : The cost to ship the final product.

```

### Outputs
The script calculates the cost of the material, labor, equipment, and electricity, then adds the profit margin and shipping cost to give the final total charge. The total charge is then displayed with the chosen currency symbol.

![image](https://github.com/Joeharrison94/3D-Printing-Cost-Calculator/assets/53116754/9e6cc8f9-d647-4113-879f-a67fbdecce1c)

![image](https://github.com/Joeharrison94/3D-Printing-Cost-Calculator/assets/53116754/3e0716d1-ab2d-4bfa-aebd-54ec6d15b9fc)

### Usage
Simply run the exe or the script in PowerShell and input the required values when prompted. The final total charge for the 3D print will be displayed at the end.

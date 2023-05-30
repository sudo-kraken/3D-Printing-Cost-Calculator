#==========================================================================# 
# 3D Print Costing Tool                                                    #
#==========================================================================# 
# Version 1.0                                                              # 
#==========================================================================# 
# Author Joe Harrison                                                      #
#==========================================================================#

#===========================================================================
# Function Declaration
#===========================================================================

 Function New-WPFMessageBox {

    # Define Parameters
    [CmdletBinding()]
    Param
    (
        # The popup Content
        [Parameter(Mandatory=$True,Position=0)]
        [Object]$Content,

        # The window title
        [Parameter(Mandatory=$false,Position=1)]
        [string]$Title,

        # The buttons to add
        [Parameter(Mandatory=$false,Position=2)]
        [ValidateSet('OK','OK-Cancel','Abort-Retry-Ignore','Yes-No-Cancel','Yes-No','Retry-Cancel','Cancel-TryAgain-Continue','None')]
        [array]$ButtonType = 'OK',

        # The buttons to add
        [Parameter(Mandatory=$false,Position=3)]
        [array]$CustomButtons,

        # Content font size
        [Parameter(Mandatory=$false,Position=4)]
        [int]$ContentFontSize = 14,

        # Title font size
        [Parameter(Mandatory=$false,Position=5)]
        [int]$TitleFontSize = 14,

        # BorderThickness
        [Parameter(Mandatory=$false,Position=6)]
        [int]$BorderThickness = 0,

        # CornerRadius
        [Parameter(Mandatory=$false,Position=7)]
        [int]$CornerRadius = 8,

        # ShadowDepth
        [Parameter(Mandatory=$false,Position=8)]
        [int]$ShadowDepth = 3,

        # BlurRadius
        [Parameter(Mandatory=$false,Position=9)]
        [int]$BlurRadius = 20,

        # WindowHost
        [Parameter(Mandatory=$false,Position=10)]
        [object]$WindowHost,

        # Timeout in seconds,
        [Parameter(Mandatory=$false,Position=11)]
        [int]$Timeout,

        # Code for Window Loaded event,
        [Parameter(Mandatory=$false,Position=12)]
        [scriptblock]$OnLoaded,

        # Code for Window Closed event,
        [Parameter(Mandatory=$false,Position=13)]
        [scriptblock]$OnClosed

    )

    # Dynamically Populated parameters
    DynamicParam {
        
        # Add assemblies for use in PS Console 
        Add-Type -AssemblyName System.Drawing, PresentationCore
        
        # ContentBackground
        $ContentBackground = 'ContentBackground'
        $AttributeCollection = New-Object System.Collections.ObjectModel.Collection[System.Attribute]
        $ParameterAttribute = New-Object System.Management.Automation.ParameterAttribute
        $ParameterAttribute.Mandatory = $False
        $AttributeCollection.Add($ParameterAttribute) 
        $RuntimeParameterDictionary = New-Object System.Management.Automation.RuntimeDefinedParameterDictionary
        $arrSet = [System.Drawing.Brushes] | Get-Member -Static -MemberType Property | Select -ExpandProperty Name 
        $ValidateSetAttribute = New-Object System.Management.Automation.ValidateSetAttribute($arrSet)    
        $AttributeCollection.Add($ValidateSetAttribute)
        $PSBoundParameters.ContentBackground = "White"
        $RuntimeParameter = New-Object System.Management.Automation.RuntimeDefinedParameter($ContentBackground, [string], $AttributeCollection)
        $RuntimeParameterDictionary.Add($ContentBackground, $RuntimeParameter)
        

        # FontFamily
        $FontFamily = 'FontFamily'
        $AttributeCollection = New-Object System.Collections.ObjectModel.Collection[System.Attribute]
        $ParameterAttribute = New-Object System.Management.Automation.ParameterAttribute
        $ParameterAttribute.Mandatory = $False
        $AttributeCollection.Add($ParameterAttribute)  
        $arrSet = [System.Drawing.FontFamily]::Families.Name | Select -Skip 1 
        $ValidateSetAttribute = New-Object System.Management.Automation.ValidateSetAttribute($arrSet)
        $AttributeCollection.Add($ValidateSetAttribute)
        $RuntimeParameter = New-Object System.Management.Automation.RuntimeDefinedParameter($FontFamily, [string], $AttributeCollection)
        $RuntimeParameterDictionary.Add($FontFamily, $RuntimeParameter)
        $PSBoundParameters.FontFamily = "Segoe UI"

        # TitleFontWeight
        $TitleFontWeight = 'TitleFontWeight'
        $AttributeCollection = New-Object System.Collections.ObjectModel.Collection[System.Attribute]
        $ParameterAttribute = New-Object System.Management.Automation.ParameterAttribute
        $ParameterAttribute.Mandatory = $False
        $AttributeCollection.Add($ParameterAttribute) 
        $arrSet = [System.Windows.FontWeights] | Get-Member -Static -MemberType Property | Select -ExpandProperty Name 
        $ValidateSetAttribute = New-Object System.Management.Automation.ValidateSetAttribute($arrSet)    
        $AttributeCollection.Add($ValidateSetAttribute)
        $PSBoundParameters.TitleFontWeight = "Normal"
        $RuntimeParameter = New-Object System.Management.Automation.RuntimeDefinedParameter($TitleFontWeight, [string], $AttributeCollection)
        $RuntimeParameterDictionary.Add($TitleFontWeight, $RuntimeParameter)

        # ContentFontWeight
        $ContentFontWeight = 'ContentFontWeight'
        $AttributeCollection = New-Object System.Collections.ObjectModel.Collection[System.Attribute]
        $ParameterAttribute = New-Object System.Management.Automation.ParameterAttribute
        $ParameterAttribute.Mandatory = $False
        $AttributeCollection.Add($ParameterAttribute) 
        $arrSet = [System.Windows.FontWeights] | Get-Member -Static -MemberType Property | Select -ExpandProperty Name 
        $ValidateSetAttribute = New-Object System.Management.Automation.ValidateSetAttribute($arrSet)    
        $AttributeCollection.Add($ValidateSetAttribute)
        $PSBoundParameters.ContentFontWeight = "Normal"
        $RuntimeParameter = New-Object System.Management.Automation.RuntimeDefinedParameter($ContentFontWeight, [string], $AttributeCollection)
        $RuntimeParameterDictionary.Add($ContentFontWeight, $RuntimeParameter)
        

        # ContentTextForeground
        $ContentTextForeground = 'ContentTextForeground'
        $AttributeCollection = New-Object System.Collections.ObjectModel.Collection[System.Attribute]
        $ParameterAttribute = New-Object System.Management.Automation.ParameterAttribute
        $ParameterAttribute.Mandatory = $False
        $AttributeCollection.Add($ParameterAttribute) 
        $arrSet = [System.Drawing.Brushes] | Get-Member -Static -MemberType Property | Select -ExpandProperty Name 
        $ValidateSetAttribute = New-Object System.Management.Automation.ValidateSetAttribute($arrSet)    
        $AttributeCollection.Add($ValidateSetAttribute)
        $PSBoundParameters.ContentTextForeground = "Black"
        $RuntimeParameter = New-Object System.Management.Automation.RuntimeDefinedParameter($ContentTextForeground, [string], $AttributeCollection)
        $RuntimeParameterDictionary.Add($ContentTextForeground, $RuntimeParameter)

        # TitleTextForeground
        $TitleTextForeground = 'TitleTextForeground'
        $AttributeCollection = New-Object System.Collections.ObjectModel.Collection[System.Attribute]
        $ParameterAttribute = New-Object System.Management.Automation.ParameterAttribute
        $ParameterAttribute.Mandatory = $False
        $AttributeCollection.Add($ParameterAttribute) 
        $arrSet = [System.Drawing.Brushes] | Get-Member -Static -MemberType Property | Select -ExpandProperty Name 
        $ValidateSetAttribute = New-Object System.Management.Automation.ValidateSetAttribute($arrSet)    
        $AttributeCollection.Add($ValidateSetAttribute)
        $PSBoundParameters.TitleTextForeground = "Black"
        $RuntimeParameter = New-Object System.Management.Automation.RuntimeDefinedParameter($TitleTextForeground, [string], $AttributeCollection)
        $RuntimeParameterDictionary.Add($TitleTextForeground, $RuntimeParameter)

        # BorderBrush
        $BorderBrush = 'BorderBrush'
        $AttributeCollection = New-Object System.Collections.ObjectModel.Collection[System.Attribute]
        $ParameterAttribute = New-Object System.Management.Automation.ParameterAttribute
        $ParameterAttribute.Mandatory = $False
        $AttributeCollection.Add($ParameterAttribute) 
        $arrSet = [System.Drawing.Brushes] | Get-Member -Static -MemberType Property | Select -ExpandProperty Name 
        $ValidateSetAttribute = New-Object System.Management.Automation.ValidateSetAttribute($arrSet)    
        $AttributeCollection.Add($ValidateSetAttribute)
        $PSBoundParameters.BorderBrush = "Black"
        $RuntimeParameter = New-Object System.Management.Automation.RuntimeDefinedParameter($BorderBrush, [string], $AttributeCollection)
        $RuntimeParameterDictionary.Add($BorderBrush, $RuntimeParameter)


        # TitleBackground
        $TitleBackground = 'TitleBackground'
        $AttributeCollection = New-Object System.Collections.ObjectModel.Collection[System.Attribute]
        $ParameterAttribute = New-Object System.Management.Automation.ParameterAttribute
        $ParameterAttribute.Mandatory = $False
        $AttributeCollection.Add($ParameterAttribute) 
        $arrSet = [System.Drawing.Brushes] | Get-Member -Static -MemberType Property | Select -ExpandProperty Name 
        $ValidateSetAttribute = New-Object System.Management.Automation.ValidateSetAttribute($arrSet)    
        $AttributeCollection.Add($ValidateSetAttribute)
        $PSBoundParameters.TitleBackground = "White"
        $RuntimeParameter = New-Object System.Management.Automation.RuntimeDefinedParameter($TitleBackground, [string], $AttributeCollection)
        $RuntimeParameterDictionary.Add($TitleBackground, $RuntimeParameter)

        # ButtonTextForeground
        $ButtonTextForeground = 'ButtonTextForeground'
        $AttributeCollection = New-Object System.Collections.ObjectModel.Collection[System.Attribute]
        $ParameterAttribute = New-Object System.Management.Automation.ParameterAttribute
        $ParameterAttribute.Mandatory = $False
        $AttributeCollection.Add($ParameterAttribute) 
        $arrSet = [System.Drawing.Brushes] | Get-Member -Static -MemberType Property | Select -ExpandProperty Name 
        $ValidateSetAttribute = New-Object System.Management.Automation.ValidateSetAttribute($arrSet)    
        $AttributeCollection.Add($ValidateSetAttribute)
        $PSBoundParameters.ButtonTextForeground = "Black"
        $RuntimeParameter = New-Object System.Management.Automation.RuntimeDefinedParameter($ButtonTextForeground, [string], $AttributeCollection)
        $RuntimeParameterDictionary.Add($ButtonTextForeground, $RuntimeParameter)

        # Sound
        $Sound = 'Sound'
        $AttributeCollection = New-Object System.Collections.ObjectModel.Collection[System.Attribute]
        $ParameterAttribute = New-Object System.Management.Automation.ParameterAttribute
        $ParameterAttribute.Mandatory = $False
        #$ParameterAttribute.Position = 14
        $AttributeCollection.Add($ParameterAttribute) 
        $arrSet = (Get-ChildItem "$env:SystemDrive\Windows\Media" -Filter Windows* | Select -ExpandProperty Name).Replace('.wav','')
        $ValidateSetAttribute = New-Object System.Management.Automation.ValidateSetAttribute($arrSet)    
        $AttributeCollection.Add($ValidateSetAttribute)
        $RuntimeParameter = New-Object System.Management.Automation.RuntimeDefinedParameter($Sound, [string], $AttributeCollection)
        $RuntimeParameterDictionary.Add($Sound, $RuntimeParameter)

        return $RuntimeParameterDictionary
    }

    Begin {
        Add-Type -AssemblyName PresentationFramework
    }
    
    Process {

# Define the XAML markup
[XML]$Xaml = @"
<Window 
        xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
        xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
        x:Name="Window" Title="" SizeToContent="WidthAndHeight" WindowStartupLocation="CenterScreen" WindowStyle="None" ResizeMode="NoResize" AllowsTransparency="True" Background="Transparent" Opacity="1">
    <Window.Resources>
        <Style TargetType="{x:Type Button}">
            <Setter Property="Template">
                <Setter.Value>
                    <ControlTemplate TargetType="Button">
                        <Border>
                            <Grid Background="{TemplateBinding Background}">
                                <ContentPresenter />
                            </Grid>
                        </Border>
                    </ControlTemplate>
                </Setter.Value>
            </Setter>
        </Style>
    </Window.Resources>
    <Border x:Name="MainBorder" Margin="10" CornerRadius="$CornerRadius" BorderThickness="$BorderThickness" BorderBrush="$($PSBoundParameters.BorderBrush)" Padding="0" >
        <Border.Effect>
            <DropShadowEffect x:Name="DSE" Color="Black" Direction="270" BlurRadius="$BlurRadius" ShadowDepth="$ShadowDepth" Opacity="0.6" />
        </Border.Effect>
        <Border.Triggers>
            <EventTrigger RoutedEvent="Window.Loaded">
                <BeginStoryboard>
                    <Storyboard>
                        <DoubleAnimation Storyboard.TargetName="DSE" Storyboard.TargetProperty="ShadowDepth" From="0" To="$ShadowDepth" Duration="0:0:1" AutoReverse="False" />
                        <DoubleAnimation Storyboard.TargetName="DSE" Storyboard.TargetProperty="BlurRadius" From="0" To="$BlurRadius" Duration="0:0:1" AutoReverse="False" />
                    </Storyboard>
                </BeginStoryboard>
            </EventTrigger>
        </Border.Triggers>
        <Grid >
            <Border Name="Mask" CornerRadius="$CornerRadius" Background="$($PSBoundParameters.ContentBackground)" />
            <Grid x:Name="Grid" Background="$($PSBoundParameters.ContentBackground)">
                <Grid.OpacityMask>
                    <VisualBrush Visual="{Binding ElementName=Mask}"/>
                </Grid.OpacityMask>
                <StackPanel Name="StackPanel" >                   
                    <TextBox Name="TitleBar" IsReadOnly="True" IsHitTestVisible="False" Text="$Title" Padding="10" FontFamily="$($PSBoundParameters.FontFamily)" FontSize="$TitleFontSize" Foreground="$($PSBoundParameters.TitleTextForeground)" FontWeight="$($PSBoundParameters.TitleFontWeight)" Background="$($PSBoundParameters.TitleBackground)" HorizontalAlignment="Stretch" VerticalAlignment="Center" Width="Auto" HorizontalContentAlignment="Center" BorderThickness="0"/>
                    <DockPanel Name="ContentHost" Margin="0,10,0,10"  >
                    </DockPanel>
                    <DockPanel Name="ButtonHost" LastChildFill="False" HorizontalAlignment="Center" >
                    </DockPanel>
                </StackPanel>
            </Grid>
        </Grid>
    </Border>
</Window>
"@

[XML]$ButtonXaml = @"
<Button xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation" xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml" Width="Auto" Height="30" FontFamily="Segui" FontSize="16" Background="Transparent" Foreground="White" BorderThickness="1" Margin="10" Padding="20,0,20,0" HorizontalAlignment="Right" Cursor="Hand"/>
"@

[XML]$ButtonTextXaml = @"
<TextBlock xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation" xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml" FontFamily="$($PSBoundParameters.FontFamily)" FontSize="16" Background="Transparent" Foreground="$($PSBoundParameters.ButtonTextForeground)" Padding="20,5,20,5" HorizontalAlignment="Center" VerticalAlignment="Center"/>
"@

[XML]$ContentTextXaml = @"
<TextBlock xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation" xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml" Text="$Content" Foreground="$($PSBoundParameters.ContentTextForeground)" DockPanel.Dock="Right" HorizontalAlignment="Center" VerticalAlignment="Center" FontFamily="$($PSBoundParameters.FontFamily)" FontSize="$ContentFontSize" FontWeight="$($PSBoundParameters.ContentFontWeight)" TextWrapping="Wrap" Height="Auto" MaxWidth="500" MinWidth="50" Padding="10"/>
"@

    # Load the window from XAML
    $Window = [Windows.Markup.XamlReader]::Load((New-Object -TypeName System.Xml.XmlNodeReader -ArgumentList $xaml))

    # Custom function to add a button
    Function Add-Button {
        Param($Content)
        $Button = [Windows.Markup.XamlReader]::Load((New-Object -TypeName System.Xml.XmlNodeReader -ArgumentList $ButtonXaml))
        $ButtonText = [Windows.Markup.XamlReader]::Load((New-Object -TypeName System.Xml.XmlNodeReader -ArgumentList $ButtonTextXaml))
        $ButtonText.Text = "$Content"
        $Button.Content = $ButtonText
        $Button.Add_MouseEnter({
            $This.Content.FontSize = "17"
        })
        $Button.Add_MouseLeave({
            $This.Content.FontSize = "16"
        })
        $Button.Add_Click({
            New-Variable -Name WPFMessageBoxOutput -Value $($This.Content.Text) -Option ReadOnly -Scope Script -Force
            $Window.Close()
        })
        $Window.FindName('ButtonHost').AddChild($Button)
    }

    # Add buttons
    If ($ButtonType -eq "OK")
    {
        Add-Button -Content "OK"
    }

    If ($ButtonType -eq "OK-Cancel")
    {
        Add-Button -Content "OK"
        Add-Button -Content "Cancel"
    }

    If ($ButtonType -eq "Abort-Retry-Ignore")
    {
        Add-Button -Content "Abort"
        Add-Button -Content "Retry"
        Add-Button -Content "Ignore"
    }

    If ($ButtonType -eq "Yes-No-Cancel")
    {
        Add-Button -Content "Yes"
        Add-Button -Content "No"
        Add-Button -Content "Cancel"
    }

    If ($ButtonType -eq "Yes-No")
    {
        Add-Button -Content "Yes"
        Add-Button -Content "No"
    }

    If ($ButtonType -eq "Retry-Cancel")
    {
        Add-Button -Content "Retry"
        Add-Button -Content "Cancel"
    }

    If ($ButtonType -eq "Cancel-TryAgain-Continue")
    {
        Add-Button -Content "Cancel"
        Add-Button -Content "TryAgain"
        Add-Button -Content "Continue"
    }

    If ($ButtonType -eq "None" -and $CustomButtons)
    {
        Foreach ($CustomButton in $CustomButtons)
        {
            Add-Button -Content "$CustomButton"
        }
    }

    # Remove the title bar if no title is provided
    If ($Title -eq "")
    {
        $TitleBar = $Window.FindName('TitleBar')
        $Window.FindName('StackPanel').Children.Remove($TitleBar)
    }

    # Add the Content
    If ($Content -is [String])
    {
        # Replace double quotes with single to avoid quote issues in strings
        If ($Content -match '"')
        {
            $Content = $Content.Replace('"',"'")
        }
        
        # Use a text box for a string value...
        $ContentTextBox = [Windows.Markup.XamlReader]::Load((New-Object -TypeName System.Xml.XmlNodeReader -ArgumentList $ContentTextXaml))
        $Window.FindName('ContentHost').AddChild($ContentTextBox)
    }
    Else
    {
        # ...or add a WPF element as a child
        Try
        {
            $Window.FindName('ContentHost').AddChild($Content) 
        }
        Catch
        {
            $_
        }        
    }

    # Enable window to move when dragged
    $Window.FindName('Grid').Add_MouseLeftButtonDown({
        $Window.DragMove()
    })

    # Activate the window on loading
    If ($OnLoaded)
    {
        $Window.Add_Loaded({
            $This.Activate()
            Invoke-Command $OnLoaded
        })
    }
    Else
    {
        $Window.Add_Loaded({
            $This.Activate()
        })
    }
    

    # Stop the dispatcher timer if exists
    If ($OnClosed)
    {
        $Window.Add_Closed({
            If ($DispatcherTimer)
            {
                $DispatcherTimer.Stop()
            }
            Invoke-Command $OnClosed
        })
    }
    Else
    {
        $Window.Add_Closed({
            If ($DispatcherTimer)
            {
                $DispatcherTimer.Stop()
            }
        })
    }
    

    # If a window host is provided assign it as the owner
    If ($WindowHost)
    {
        $Window.Owner = $WindowHost
        $Window.WindowStartupLocation = "CenterOwner"
    }

    # If a timeout value is provided, use a dispatcher timer to close the window when timeout is reached
    If ($Timeout)
    {
        $Stopwatch = New-object System.Diagnostics.Stopwatch
        $TimerCode = {
            If ($Stopwatch.Elapsed.TotalSeconds -ge $Timeout)
            {
                $Stopwatch.Stop()
                $Window.Close()
            }
        }
        $DispatcherTimer = New-Object -TypeName System.Windows.Threading.DispatcherTimer
        $DispatcherTimer.Interval = [TimeSpan]::FromSeconds(1)
        $DispatcherTimer.Add_Tick($TimerCode)
        $Stopwatch.Start()
        $DispatcherTimer.Start()
    }

    # Play a sound
    If ($($PSBoundParameters.Sound))
    {
        $SoundFile = "$env:SystemDrive\Windows\Media\$($PSBoundParameters.Sound).wav"
        $SoundPlayer = New-Object System.Media.SoundPlayer -ArgumentList $SoundFile
        $SoundPlayer.Add_LoadCompleted({
            $This.Play()
            $This.Dispose()
        })
        $SoundPlayer.LoadAsync()
    }

    # Display the window
    $null = $window.Dispatcher.InvokeAsync{$window.ShowDialog()}.Wait()

    }
}

#===========================================================================
# Generate form
#===========================================================================

[void][System.Reflection.Assembly]::LoadWithPartialName('presentationframework')
#Add-Type -AssemblyName PresentationCore,PresentationFramework,WindowsBase,system.windows.forms

[xml] $XAML = @'

<Window xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
        xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
        xmlns:d="http://schemas.microsoft.com/expression/blend/2008"
        xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006"

        Title="3D Printing Cost Calculator" Height="450" Width="564" WindowStartupLocation="CenterScreen" WindowStyle="None" ResizeMode="NoResize">

    <Grid Name="Grid" Margin="0,-1,0,1">
        <Label Content="3D Printing Cost Calculator" HorizontalContentAlignment="Center" HorizontalAlignment="Center" VerticalAlignment="Top" Height="29" Width="684" Background="SteelBlue" Foreground="White"/>
        <Label Content="Currency:" HorizontalAlignment="Left" VerticalAlignment="Top" Height="30" Width="229" Background="SteelBlue" Foreground="White" Margin="0,37,0,0"/>
        <Label Content="Material Cost (per kg):" HorizontalAlignment="Left" VerticalAlignment="Top" Height="30" Width="229" Background="SteelBlue" Foreground="White" Margin="0,72,0,0"/>
        <Label Content="Material Used (g):" HorizontalAlignment="Left" VerticalAlignment="Top" Height="30" Width="229" Background="SteelBlue" Foreground="White" Margin="0,107,0,0"/>
        <Label Content="Labour Time Spent (h):" HorizontalAlignment="Left" VerticalAlignment="Top" Height="30" Width="229" Background="SteelBlue" Foreground="White" Margin="0,142,0,0"/>
        <Label Content="3D Printer Operation Charge (cost per h):" HorizontalAlignment="Left" VerticalAlignment="Top" Height="30" Width="229" Background="SteelBlue" Foreground="White" Margin="0,212,0,0"/>
        <Label Content="Labour Rate (per h):" HorizontalAlignment="Left" VerticalAlignment="Top" Height="30" Width="229" Background="SteelBlue" Foreground="White" Margin="0,177,0,0"/>
        <Label Content="Print Time (h):" HorizontalAlignment="Left" VerticalAlignment="Top" Height="30" Width="229" Background="SteelBlue" Foreground="White" Margin="0,247,0,0"/>
        <Label Content="Local Electricity Cost (per kWh):" HorizontalAlignment="Left" VerticalAlignment="Top" Height="30" Width="229" Background="SteelBlue" Foreground="White" Margin="0,282,0,0"/>
        <Label Content="3D Printer Power Consumption (w):" HorizontalAlignment="Left" VerticalAlignment="Top" Height="30" Width="229" Background="SteelBlue" Foreground="White" Margin="0,317,0,0"/>
        <Label Content="Desired Profit Margin (%):" HorizontalAlignment="Left" VerticalAlignment="Top" Height="30" Width="229" Background="SteelBlue" Foreground="White" Margin="0,352,0,0"/>
        <Label Content="Shipping Cost:" HorizontalAlignment="Left" VerticalAlignment="Top" Height="30" Width="229" Background="SteelBlue" Foreground="White" Margin="0,387,0,0"/>


        <TextBox Name="txtMatCost" Foreground="DarkGray" HorizontalAlignment="Left" Height="30" Margin="234,72,0,0" TextWrapping="Wrap" Text="Enter the cost per kg spool used" TextAlignment="Left" Padding="0,5,0,0" VerticalAlignment="Top" Width="320" IsEnabled="True"/>
        <TextBox Name="txtMatUsed" Foreground="DarkGray" HorizontalAlignment="Left" Height="30" Margin="234,107,0,0" TextWrapping="Wrap" Text="Enter the total print volume in grams" TextAlignment="Left" Padding="0,5,0,0" VerticalAlignment="Top" Width="320" IsEnabled="True"/>
        <TextBox Name="txtLabourTime" Foreground="DarkGray" HorizontalAlignment="Left" Height="30" Margin="234,142,0,0" TextWrapping="Wrap" Text="Enter the total amount of time in hours spent on prep work" TextAlignment="Left" Padding="0,5,0,0" VerticalAlignment="Top" Width="320" IsEnabled="True"/>
        <TextBox Name="txtLabourRate" Foreground="DarkGray" HorizontalAlignment="Left" Height="30" Margin="234,177,0,0" TextWrapping="Wrap" Text="Enter the total amount to pay yourself per hour" TextAlignment="Left" Padding="0,5,0,0" VerticalAlignment="Top" Width="320" IsEnabled="True"/>
        <TextBox Name="txt3DPOC" Foreground="DarkGray" HorizontalAlignment="Left" Height="30" Margin="234,212,0,0" TextWrapping="Wrap" Text="Enter amount to charge per hour of printing" TextAlignment="Left" Padding="0,5,0,0" VerticalAlignment="Top" Width="320" IsEnabled="True"/>
        <TextBox Name="txtPrintTime" Foreground="DarkGray" HorizontalAlignment="Left" Height="30" Margin="234,247,0,0" TextWrapping="Wrap" Text="Enter total print time in hours" TextAlignment="Left" Padding="0,5,0,0" VerticalAlignment="Top" Width="320" IsEnabled="True"/>
        <TextBox Name="txtLocalElecCost" Foreground="DarkGray" HorizontalAlignment="Left" Height="30" Margin="234,282,0,0" TextWrapping="Wrap" Text="Enter the amount you pay per kWh of Electricity" TextAlignment="Left" Padding="0,5,0,0" VerticalAlignment="Top" Width="320" IsEnabled="True"/>
        <TextBox Name="txtPowerConsumption" Foreground="DarkGray" HorizontalAlignment="Left" Height="30" Margin="234,317,0,0" TextWrapping="Wrap" Text="Enter the power consumption of your pritner in watts" TextAlignment="Left" Padding="0,5,0,0" VerticalAlignment="Top" Width="320" IsEnabled="True"/>
        <TextBox Name="txtProfitMargin" Foreground="DarkGray" HorizontalAlignment="Left" Height="30" Margin="234,352,0,0" TextWrapping="Wrap" Text="Enter your desired profit margin in %" TextAlignment="Left" Padding="0,5,0,0" VerticalAlignment="Top" Width="320" IsEnabled="True"/>
        <TextBox Name="txtShippingCost" Foreground="DarkGray" HorizontalAlignment="Left" Height="30" Margin="234,387,0,0" TextWrapping="Wrap" Text="Enter your shipping cost" TextAlignment="Left" Padding="0,5,0,0" VerticalAlignment="Top" Width="320" IsEnabled="True"/>


        <RadioButton Name="rbtn1" GroupName="radiobtns" Content="GBP" HorizontalAlignment="Left" Margin="240,45,0,0" VerticalAlignment="Top" IsChecked="true"/>
        <RadioButton Name="rbtn2" GroupName="radiobtns" Content="USD" HorizontalAlignment="Left" Margin="298,45,0,0" VerticalAlignment="Top"/>
        <RadioButton Name="rbtn3" GroupName="radiobtns" Content="EUR" HorizontalAlignment="Left" Margin="358,45,0,0" VerticalAlignment="Top"/>

        <Button Name="btnOK" Content="Ok" HorizontalAlignment="Left" VerticalAlignment="Top" Width="281" Height="29" BorderThickness="0" Margin="0,422,0,0"/>
        <Button Name="btnExit" Content="Exit" HorizontalAlignment="Left" Margin="283,422,0,0" VerticalAlignment="Top" Width="281" Height="29" BorderThickness="0"/>

    </Grid>
</Window>

'@

#===========================================================================
# Read XAML
#===========================================================================

$reader=(New-Object System.Xml.XmlNodeReader $xaml) 
Try{$Form=[Windows.Markup.XamlReader]::Load( $reader )}
Catch{New-WPFMessageBox -Content "Unable to load Windows.Markup.XamlReader. Some possible causes for this problem include: .NET Framework is missing.`
PowerShell must be launched with PowerShell -sta, invalid XAML code was encountered." -Title "WARNING" -TitleBackground SteelBlue -TitleTextForeground White -ButtonType 'OK' }
 
#===========================================================================
# Store form objects in PowerShell
#===========================================================================

$xaml.SelectNodes("//*[@*[contains(translate(name(.),'n','N'),'Name')]]")  | %{Set-Variable -Name ($_.Name) -Value $Form.FindName($_.Name)}

#===========================================================================
# Add events to form Oojects
#===========================================================================

# Make Form Draggable
$Form.FindName('Grid').Add_MouseLeftButtonDown({
        $Form.DragMove()
    })

# Textbox 1 placeholder remove default text when textbox clicked
$txtMatCost.Add_GotFocus({
    
    If ($txtMatCost.Text -eq "Enter the cost per kg spool used") {
        $txtMatCost.Foreground = 'Black'
        $txtMatCost.Text = ''
    }
})

# Textbox 2 placeholder remove default text when textbox clicked
$txtMatUsed.Add_GotFocus({
    
    If ($txtMatUsed.Text -eq "Enter the total print volume in grams") {
        $txtMatUsed.Foreground = 'Black'
        $txtMatUsed.Text = ''
    }
})

# Textbox 3 placeholder remove default text when textbox clicked
$txtLabourTime.Add_GotFocus({
    
    If ($txtLabourTime.Text -eq "Enter the total amount of time in hours spent on prep work") {
        $txtLabourTime.Foreground = 'Black'
        $txtLabourTime.Text = ''
    }
})

# Textbox 4 placeholder remove default text when textbox clicked
$txtLabourRate.Add_GotFocus({
    
    If ($txtLabourRate.Text -eq "Enter the total amount to pay yourself per hour") {
        $txtLabourRate.Foreground = 'Black'
        $txtLabourRate.Text = ''
    }
})

# Textbox 5 placeholder remove default text when textbox clicked
$txt3DPOC.Add_GotFocus({
    
    If ($txt3DPOC.Text -eq "Enter amount to charge per hour of printing") {
        $txt3DPOC.Foreground = 'Black'
        $txt3DPOC.Text = ''
    }
})

# Textbox 6 placeholder remove default text when textbox clicked
$txtPrintTime.Add_GotFocus({
    
    If ($txtPrintTime.Text -eq "Enter total print time in hours") {
        $txtPrintTime.Foreground = 'Black'
        $txtPrintTime.Text = ''
    }
})

# Textbox 7 placeholder remove default text when textbox clicked
$txtLocalElecCost.Add_GotFocus({
    
    If ($txtLocalElecCost.Text -eq "Enter the amount you pay per kWh of Electricity") {
        $txtLocalElecCost.Foreground = 'Black'
        $txtLocalElecCost.Text = ''
    }
})

# Textbox 8 placeholder remove default text when textbox clicked
$txtPowerConsumption.Add_GotFocus({
    
    If ($txtPowerConsumption.Text -eq "Enter the power consumption of your pritner in watts") {
        $txtPowerConsumption.Foreground = 'Black'
        $txtPowerConsumption.Text = ''
    }
})

# Textbox 9 placeholder remove default text when textbox clicked
$txtProfitMargin.Add_GotFocus({
    
    If ($txtProfitMargin.Text -eq "Enter your desired profit margin in %") {
        $txtProfitMargin.Foreground = 'Black'
        $txtProfitMargin.Text = ''
    }
})

# Textbox 10 placeholder remove default text when textbox clicked
$txtShippingCost.Add_GotFocus({
    
    If ($txtShippingCost.Text -eq "Enter your shipping cost") {
        $txtShippingCost.Foreground = 'Black'
        $txtShippingCost.Text = ''
    }
})


$btnOK.Add_Click({
        
        # Read text box values
        $materialPrice = [float]($txtMatCost.Text)
        $materialConsumed = [float]($txtMatUsed.Text)
        $laborRate = [float]($txtLabourRate.Text)
        $laborTime = [float]($txtLabourTime.Text)
        $printerCharge = [float]($txt3DPOC.Text)
        $printTime = [float]($txtPrintTime.Text)
        $electricityCost = [float]($txtLocalElecCost.Text)
        $printerPower = [float]($txtPowerConsumption.Text)
        $profitMargin = [float]($txtProfitMargin.Text)
        $shippingCost = [float]($txtShippingCost.Text)
        
        If ($rbtn1.IsChecked -eq $true){$currencySymbol = '£'} ElseIf ($rbtn2.IsChecked -eq $true){$currencySymbol = '$'} ElseIf ($rbtn3.IsChecked -eq $true){$currencySymbol = '€'}

        # Calculate costs
        $materialCost = ($materialPrice * ($materialConsumed / 1000))
        $laborCost = $laborRate * $laborTime
        $equipmentCost = $printerCharge * $printTime
        $electricityCost = ($printerPower / 1000) * $electricityCost * $printTime
        $totalCost = $materialCost + $laborCost + $equipmentCost + $electricityCost

        # Calculate profit and total charge
        $profit = ($profitMargin / 100) * $totalCost
        $totalCharge = $totalCost + $profit + $shippingCost

        # Round total charge to 2 decimal places
        $totalCharge = [math]::Round($totalCharge, 2)
        
        If ($totalCharge -match "^\d+(\.\d{1,2})?$") {
        
        New-WPFMessageBox -Content "For this print your pricing should be: $currencySymbol$totalCharge" -Title "SUCCESS" -TitleBackground SteelBlue -FontFamily Verdana -TitleTextForeground White -ButtonType 'OK'; If($WPFMessageBoxOutput -eq 'OK'){}     
        
        }

        Else {
        New-WPFMessageBox -Content "Invalid input, please check all your inputs and try again" -Title "USER ERROR" -TitleBackground SteelBlue -FontFamily Verdana -TitleTextForeground White -ButtonType 'OK'; If($WPFMessageBoxOutput -eq 'OK'){}     
        }
})

$btnExit.Add_Click({ $Form.Close() ; Exit })

[void]($Form.ShowDialog())

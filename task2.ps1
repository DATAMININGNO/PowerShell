<#

==TASKS==

1. The script below contains a bug, tagged with a FIXME comment in
the code. Fix it, changing as little code as necessary. Save the
result as task1.ps1.

2. With the result from task 1, refactor the code to make it easier to read,
maintain, and extend. You may also rewrite the script using a different
language or framework if you are feeling creative. Save the result
as task2.<whatever>

3. With the result from task 2 as your starting point, implement the
feature specified below. Save the result as task3.ps1 (or
task3.<whatever> if you use another language).

Specification: There should be a finite amount of servings for each
 dish on the menu, i.e. 15 Dagens, 2 Vegetar, 5 Halal. Requesting a
 dish that has no servings left should return the message "Sorry, no
 more left of <dish name> today."

Example run:
What would you like today? (type 'how is business?' to attempt small talk, or 'not hungry' to stop)
Input: Vegetar
Vegetar, here you go.
What would you like today? (type 'how is business?' to attempt small talk, or 'not hungry' to stop)
Input: Vegetar
Vegetar, here you go.
What would you like today? (type 'how is business?' to attempt small talk, or 'not hungry' to stop)
Input: Vegetar
Sorry, no more left of <Vegetar> today.
What would you like today? (type 'how is business?' to attempt small talk, or 'not hungry' to stop)
Input: [...]

#>
cls
# Define a class
class Cafeteria {
	
	#Initializing variables
	$Menu = @("1"; "2"; "3") # Where Dagens = 1, Vegetar = 2, Halal = 3
	$Prices = @(
		53.90, # for Dagens
		42.50, # for Vegetar
		59.90 # for Halal
	)
	
	$Sum = 0
	$TotalSum = 0
	
	[void] Sell([String]$Item)
	{
		if ($Item -eq "1")
		{
			$this.Sum = $this.Sum + $this.Prices[0]
			$this.TotalSum = $this.TotalSum + $this.Prices[0]
			Write-Host "Dagens, here you go."
			pause
			cls
		}
		elseif ($Item -eq "2")
		{
			$this.Sum = $this.Sum + $this.Prices[1]
			$this.TotalSum = $this.TotalSum + $this.Prices[1]
			Write-Host "Vegetar, here you go."
			pause
			cls
		}
		elseif ($Item -eq "3")
		{
			$this.Sum = $this.Sum + $this.Prices[2]
			$this.TotalSum = $this.TotalSum + $this.Prices[2]
			Write-Host "Halal, here you go."
			pause
			cls
		}
		elseif (!$Item)
	    {
            Write-Host "You have not chosen yet ... Please try again"
            pause
			cls
        } 
        else
		{
			Write-Host "$Item is not on the menu."
			pause
			cls
		}
	} #End void
	
	# Reset variable and give me alarm 
	[void] EmptyCashRegistry()
	{
		$this.Sum = 0
		Write-Host "Cash registry emptied. Thieves be warned!"
		pause
		cls
	} #End void
} #End class


#Variable $NystaticmethodFracafeclass, will have an empt object returned with 4 basic properties ($Menu, $Prices, $Sum, $TotalSum).
$NystaticmethodFracafeclass = [Cafeteria]::new()


$date = get-date -Format dd-MM-yyyy
#Create a Main menu.
$MenuPrompt = @"


*************************************
               Menu        $date
*************************************

Hello What would you like today :-) 

  1 - Get 1 Dagens dish.
  2 - Get 1 Vegetar dish. 
  3 - Get 1 Halal dish. 

  i - Press i to get how is business?
  s - Not hungry Press s to exit. 


Please select a task
"@

$Input = Read-Host -Prompt $MenuPrompt
 

while ($Input -ne "s")
{
	
	$NotAQuestion = $False 
	if ($Input -eq "i")
	{
		# Attempt a small talk if $input = i and True
		$NotAQuestion = $True
		if ($NystaticmethodFracafeclass.TotalSum -eq 0)
		{
			Write-Host "Not good so far. No one seems to be hungry today!" -ForegroundColor Yellow
			pause
			cls
		}
		elseif ($NystaticmethodFracafeclass.TotalSum -le 500) # FIXME: Change the operator greater than (-gt) to less than or equal (-le) 
		{
			Write-Host "Alright. Could have been better" -ForegroundColor Yellow
			pause
			cls
		}
		elseif ($NystaticmethodFracafeclass.TotalSum -gt 500)
		{
			#Fixit ///# FIXME: this doesn't work properly///
			Write-Host "Excellent! Lots of hungry students around today." -ForegroundColor Yellow
			pause
			cls
		}
	} #End if 
	
	
	if (-not $NotAQuestion)
	{
		$NystaticmethodFracafeclass.Sell($Input)
	}
	#If the sum of the dishes greater than 200, then reset NystaticmethodFracafeclass.Sum to 0 
	if ($NystaticmethodFracafeclass.Sum -gt 200) 
	{
		$NystaticmethodFracafeclass.EmptyCashRegistry()
	}
	
    
	$Input = Read-Host -Prompt $MenuPrompt
	
   
    
} #End while if $input = s exit

cls
Write-Host @"


*************************************



          Welcome back later!



*************************************


"@ -ForegroundColor Yellow




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

class Cafeteria {
	
	
	$Menu = @("Dagens"; "Vegetar"; "Halal")
	$Prices = @(
		53.90, # for Dagens
		42.50, # for Vegetar
		59.90 # for Halal
	)
	
	$Sum = 0
	$TotalSum = 0
	
	[void] Sell([String]$Item)
	{
		if ($Item -eq "Dagens")
		{
			$this.Sum = $this.Sum + $this.Prices[0]
			$this.TotalSum = $this.TotalSum + $this.Prices[0]
			Write-Host "Dagens, here you go."
		}
		elseif ($Item -eq "Vegetar")
		{
			$this.Sum = $this.Sum + $this.Prices[1]
			$this.TotalSum = $this.TotalSum + $this.Prices[1]
			Write-Host "Vegetar, here you go."
		}
		elseif ($Item -eq "Halal")
		{
			$this.Sum = $this.Sum + $this.Prices[2]
			$this.TotalSum = $this.TotalSum + $this.Prices[2]
			Write-Host "Halal, here you go."
		}
		else
		{
			Write-Host "$Item is not on the menu."
		}
	}
	
	[void] EmptyCashRegistry()
	{
		$this.Sum = 0
		Write-Host "Cash registry emptied. Thieves be warned!"
	}
}

$Frederikke = [Cafeteria]::new()
Write-Host "What would you like today? (type 'how is business?' to attempt small talk, or 'not hungry' to stop)"
$Input = Read-Host -Prompt "Input"

while ($Input -ne "not hungry")
{
	$NotAQuestion = $False
	if ($Input -eq "how is business?")
	{
		$NotAQuestion = $True
		if ($Frederikke.TotalSum -eq 0)
		{
			Write-Host "Not good so far. No one seems to be hungry today!"
		}
		elseif ($Frederikke.TotalSum -le 500) # FIXME: Change the operator greater than (-gt) to less than or equal (-le)
		{
			Write-Host "Alright. Could have been better"
		}
		elseif ($Frederikke.TotalSum -gt 500)
		{
			# FIXME: this doesn't work properly
			Write-Host "Excellent! Lots of hungry students around today."
		}
	}
	if (-not $NotAQuestion)
	{
		$Frederikke.Sell($Input)
	}
	if ($Frederikke.Sum -gt 200)
	{
		$Frederikke.EmptyCashRegistry()
	}
	Write-Host "What would you like today? (type 'how is business?' to attempt small talk, or 'not hungry' to stop)"
	$Input = Read-Host -Prompt "Input"
}
Write-Host "Welcome back later!"


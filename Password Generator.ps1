# Define the length of the Password
$length = 24

# Define the characters to use in the random string
$characters = 'abcdefghijkmnopqrstuvwxyzABCDEFGHJKLMNPQRSTUVWXYZ123456789!@#$%^&*()-_=+,./;>?:`~'

# Initialize the random string to generate the password
$randomString1 = -join ((0..($length-1)) | ForEach-Object { $characters[(Get-Random -Minimum 0 -Maximum $characters.Length)] })
$randomString2 = -join ((0..($length-1)) | ForEach-Object { $characters[(Get-Random -Minimum 0 -Maximum $characters.Length)] })
$randomString3 = -join ((0..($length-1)) | ForEach-Object { $characters[(Get-Random -Minimum 0 -Maximum $characters.Length)] })
$randomString4 = -join ((0..($length-1)) | ForEach-Object { $characters[(Get-Random -Minimum 0 -Maximum $characters.Length)] })
$randomString5 = -join ((0..($length-1)) | ForEach-Object { $characters[(Get-Random -Minimum 0 -Maximum $characters.Length)] })

# Load the System.Windows.Forms assembly
Add-Type -AssemblyName System.Windows.Forms

# Create a new form to display the password generator
$form = New-Object System.Windows.Forms.Form
$form.Text = 'Password Generator'
$form.Size = New-Object System.Drawing.Size(300,200)
$form.Topmost = $true
$form.StartPosition = 'CenterScreen'

#OK Button (Copies selection to clipboard)
$okButton = New-Object System.Windows.Forms.Button
$okButton.Location = New-Object System.Drawing.Point(10,120)
$okButton.Size = New-Object System.Drawing.Size(125,23)
$okButton.Text = 'Copy to clipboard'
$okButton.DialogResult = [System.Windows.Forms.DialogResult]::OK
$form.AcceptButton = $okButton
$form.Controls.Add($okButton)

#Exit Button (exits the generator)
$cancelButton = New-Object System.Windows.Forms.Button
$cancelButton.Location = New-Object System.Drawing.Point(195,120)
$cancelButton.Size = New-Object System.Drawing.Size(75,23)
$cancelButton.Text = 'Exit'
$cancelButton.DialogResult = [System.Windows.Forms.DialogResult]::Cancel
$form.CancelButton = $cancelButton
$form.Controls.Add($cancelButton)

#Box description
$label = New-Object System.Windows.Forms.Label
$label.Location = New-Object System.Drawing.Point(10,20)
$label.Size = New-Object System.Drawing.Size(280,20)
$label.Text = 'Choose a randomly generated password:'
$form.Controls.Add($label)

#Create the listbox
$listBox = New-Object System.Windows.Forms.ListBox
$listBox.Location = New-Object System.Drawing.Point(10,40)
$listBox.Size = New-Object System.Drawing.Size(260,20)
$listBox.Height = 80

#Populate the listbox
[void] $listBox.Items.Add($randomString1)
[void] $listBox.Items.Add($randomString2)
[void] $listBox.Items.Add($randomString3)
[void] $listBox.Items.Add($randomString4)
[void] $listBox.Items.Add($randomString5)
$form.Controls.Add($listBox)

#Keep the form on top
$form.Topmost = $true

#Store the selection as a variable
$result = $form.ShowDialog()
if ($result -eq [System.Windows.Forms.DialogResult]::OK)
{
    $x = $listBox.SelectedItem
    $x
}

#Add the chosen random password to the clipboard
set-clipboard -Value $x
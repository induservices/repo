# Charger le module ImportExcel
Import-Module ImportExcel -ErrorAction SilentlyContinue

# Définition du fichier de sortie
$ExcelFile = "C:\Temp\Services_Admin_Local.xlsx"

# Obtenir la liste des serveurs du domaine
$Servers = Get-ADComputer -Filter {OperatingSystem -like "*server*"} | Select-Object -ExpandProperty Name

# Tableau pour stocker les résultats
$Results = @()

foreach ($Server in $Servers) {
    Write-Host "Analyse de $Server..."
    
    try {
        # Récupérer les services en cours d'exécution
        $Services = Get-WmiObject Win32_Service -ComputerName $Server -ErrorAction Stop
        
        foreach ($Service in $Services) {
            $Account = $Service.StartName

            # Vérifier si le service utilise un compte administrateur local
            #if ($Account -match ".*\\Administrator$") {
                $Results += [PSCustomObject]@{
                    Serveur       = $Server
                    Nom_Service   = $Service.Name
                    Affichage     = $Service.DisplayName
                    Compte_Utilise = $Account
                    Statut        = $Service.State
                }
            #}
        }
    } catch {
        Write-Warning "Impossible de récupérer les services de $Server"
    }
}

# Exporter les résultats vers un fichier Excel
# nécessite l'installation du module import-Excel
# Install-Module -Name ImportExcel -Scope CurrentUser



#$Results | Export-Excel -Path $ExcelFile -AutoSize -TableName "ServicesAdminLocal"




$Results | Export-Csv -Path "C:\Temp\Services_Admin_Local.csv" -NoTypeInformation -Encoding UTF8

Write-Host "Scan terminé. Résultats enregistrés dans $ExcelFile"

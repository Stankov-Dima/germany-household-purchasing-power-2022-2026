# Germany Household Purchasing Power 2022-2026

This repository contains a Jupyter Notebook analysis of household purchasing power in Germany for the years 2022-2026, plus the source spreadsheet used in the analysis.

## Contents

- `Germany_household_purchasing_power_analysis.ipynb`: notebook for loading, cleaning, validating, and visualizing the data.
- `Изменение покупательской способности домохозяйств в Германии 2022-2026.xlsx`: source workbook with the raw table.
- `sync-repo.ps1`: PowerShell helper script for daily pull, commit, and push workflow.

## What The Notebook Does

The notebook:

- loads the first `.xlsx` file found in the project folder;
- supports both standard Excel files and SpreadsheetML XML files stored with an `.xlsx` extension;
- cleans placeholders and converts index columns to numeric values;
- reshapes data into long format for analysis;
- provides a quick quality summary;
- builds availability, trend, and year-over-year visualizations.

If the source table still contains placeholders such as `-` or `—`, the notebook shows availability diagnostics instead of full trend charts.

## Environment

The project is currently set up with a local virtual environment in `.venv`.

Typical packages used by the notebook:

- `pandas`
- `matplotlib`
- `seaborn`
- `openpyxl`

## How To Run The Notebook

1. Open the notebook in VS Code.
2. Select the project virtual environment as the Python kernel.
3. Run all cells from top to bottom.
4. Replace placeholder values in the source workbook when real index values are available.
5. Re-run the notebook to refresh diagnostics and charts.

## Daily Git Sync

Run the helper script from PowerShell:

```powershell
.\sync-repo.ps1 -CommitMessage "Update notebook analysis"
```

What it does:

- shows current repository status;
- pulls the current branch with rebase;
- stages all changes;
- creates a commit;
- pushes the branch to GitHub.

If there are no changes, the script exits without creating an empty commit.

## Notes

- `.venv` and common cache folders are ignored by git.
- Notebook outputs can make commits noisier, so clearing heavy outputs before committing is often useful.
# Demo Flow

1. First use case- migrate existing OAS
    1. Run inso-import.sh
    2. Show generated design doc
2. Second use case- net new design doc
    1. Run inso-new.sh
    2. Show new empty design doc
3. Push migration and new design doc to github
4. Pull new docs into insomnia
    1. Show migrated OAS spec
    2. Show empty design doc and add spec to push
5. Run spectral-lint.sh
6. Navigate to repo
    1. Create PR for existing OAS
        1. Setup CODEOWNERS to have Pratik own
    2. Create PR for net new
        1. Setup CODEOWNERS to have Pratik own
    3. Show requirement to have CODEOWNER approval for each
    4. Merge into main
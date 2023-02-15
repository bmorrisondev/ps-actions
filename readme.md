# Create Database Branch Action

This GitHub Action can be used within your workflows to create new branches of your PlanetScale database.

## Usage

You can use the action from this example repository:

```yml
name: Create a branch
on: 

jobs:
  create_a_branch:
    runs-on: ubuntu-latest
    steps:
      - name: checkout
        uses: actions/checkout@v3
      - name: Create a branch
        uses: planetscale/create-branch-action@v1
        id: hello
        with:
          org_name: bmorrison-ps
          database_name: recipes_db
          branch_name: mynewbranch
          source_branch: main
          generate_credentials: true
        env:
          PLANETSCALE_TOKEN_NAME: ${{ secrets.PLANETSCALE_TOKEN_NAME }}
          PLANETSCALE_TOKEN: ${{ secrets.PLANETSCALE_TOKEN }}
```
## Data Coverage
The dataset contains advised fuel prices for every date between **1 January 2006 and today**.

The available columns are:

- **Date** – The date for the price record.
- **BenzineEuro95** – Advised retail price for Euro 95 gasoline.
- **Diesel** – Advised retail price for diesel fuel.
- **LPG** – Advised retail price for LPG (gas).

The dataset is **updated weekly**.

## When to Use This Data Source
Use this lakehouse when the question involves:

- Fuel price trends over time
- Price increases or decreases
- Historical fuel prices on specific dates
- Comparing fuel prices between years
- Periods where there were **no fuel transactions**

## When Not to Use This Data Source
Do not use this lakehouse when the question involves:

- Individual fuel transactions
- Fuel spending by cars
- Paid prices at specific gas station visits

## Important Notes
The Semantic Model only stores advised prices on dates where a transaction occurred.  
This lakehouse should therefore be used whenever a **complete timeline of advised fuel prices** is required.
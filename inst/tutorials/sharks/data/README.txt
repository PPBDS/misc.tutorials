sharks tutorial data: Delimited files (CSV)

attacks_clean.csv
  5,094 shark incidents from 1901 to 2018, one row per incident. Fifteen
  columns: Case_Number, Date, Year, Type, Country, Area, Location, Activity,
  Name, Sex, Age, Injury, Fatal, Time, Species. Source: the Global Shark
  Attack File (GSAF), maintained by the Shark Research Institute
  (https://www.sharkattackfile.net/), via the Kaggle mirror "Global Shark
  Attacks". Teaching version: the raw GSAF export had 25,723 rows and 24
  columns (the last nine are PDF links, href formulas, duplicate case-number
  columns, and empty columns); this file keeps the first 15 columns, renames
  "Case Number" to Case_Number and "Fatal (Y/N)" to Fatal, and drops every
  row whose Year is missing or 1900 or earlier, or whose Country or Activity
  is missing. Values are otherwise untouched: Country is in capitals (USA,
  AUSTRALIA); Fatal holds a few stray values (UNKNOWN, M, 2017, NA) besides
  Y and N; and Type still contains Invalid, Sea Disaster, Boat, and Boating
  alongside Unprovoked and Provoked.

  This is the only data file the tutorial ships. The tutorial's setup chunk
  reads it and adds the two columns the student's map.qmd data chunk adds
  ("Where do attacks happen?", Exercise 4): Country_lower (the trimmed,
  lowercased Country, for matching the maps package's world map) and
  Fatal_clean ("Fatal" for Y, "Non-fatal" for N, "Unknown" otherwise). The
  student's cached data chunk also writes data/attacks.rds for trends.qmd to
  read; that file is gitignored in the student's repo and is not shipped
  here.

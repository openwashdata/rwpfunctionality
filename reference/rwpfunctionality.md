# Water point functionality in sub-Saharan Africa and South Asia

Water point monitoring data associated with the paper "[Rural water
point functionality estimates and associations: evidence from nine
countries in sub-Saharan Africa and South
Asia](https://agupubs.onlinelibrary.wiley.com/doi/10.1029/2023WR034679)"
(Murray, Anna L et al., 2024).

## Usage

``` r
rwpfunctionality
```

## Format

A tibble with 1793 rows and 52 variables

- id:

  Row number assigned during processing

- country:

  Name of the country

- admin1:

  Administrative unit 1

- admin2:

  Administrative unit 2

- admin3:

  Administrative unit 3

- instance_wp:

  Survey ID

- subdate_wp:

  Submission date

- latitude_wp:

  Latitude

- longitude_wp:

  Longitude

- elevation_wp:

  Elevation

- commid_wp:

  Community ID

- dataorg_wp:

  Code for country program

- timepoint_wp:

  Data collection time point

- cwfunded_wp:

  Charity water-funded water point

- cwid:

  Charity water point ID

- wptype:

  Water point type

- pumptype:

  Pump type

- drillmethod:

  Methodology used to dig the well or borehole

- piped_source:

  Source of piped water

- piped_pump:

  Infrastructure through which water travels from the source to the
  storage tank

- rehabyn:

  This water point has undergone rehabilitation with the assistance of
  an outside organization since its construction

- qtyhh_wp:

  Number of households served by this water point, either presently or
  during its last operational period

- whomanage_wp:

  Primarily responsible for managing this water point

- wp_age:

  Years between the reported construction year of the water point and
  the year of the survey

- rehab_age:

  Years between the reported most recent rehabilitation year of the
  water point and the year of the survey

- qtypeople_wp:

  Number of people served by this water point, either now or the last
  time it was working

- wateravailable:

  Water availability from this water point

- functional3:

  Functionality rating for water point: 'Abandoned or not functional'
  means no water available \>1 year or no water available today OR
  (water available, but insufficient quantity AND downtime reported in
  prior 2 weeks), 'Partially functional' means water is available with
  sufficient quantity - 20L in 5 min - but downtime reported in prior 2
  weeks or water is available, but insufficient quantity - 20L in 5
  min - and no downtime reported in prior 2 weeks and 'Functional' means
  water is available, sufficient quantity is available - 20L in 5
  minutes - and no downtime reported in prior 2 weeks

- whynowatertoday_wp:

  Reason for unavailability of water from this water point today

- whynowatertoday_wp_other:

  Other reason for water not being available today

- minutesfill20l:

  Time required to fill the 20 liters container

- brokendays_wp:

  Number of days it took to repair water the point last time it broke
  down

- qtymonthsnowater_wp:

  Number of months in the past year when water was not available from
  this water point because it was dry

- downtime2weeks:

  Water has not been available from this water point for a full day or
  more due to breakdown, seasonal dryness, or lack of fuel or
  electricity in the past two weeks

- lockedfullday_wp:

  Service has been turned off or the water point has been locked in the
  past year by the management for reasons other than breakdowns

- pumpstrokes:

  Number of pump strokes needed until water begins to flow

- photo_wp:

  Photograph of the water point

- grant_number_wp:

  Water grant number

- wc_present_wp:

  Existence of water committee in this community that manages water
  points used for drinking

- paytocollect_wp:

  Obligation for people to contribute money to collect water in this
  community

- balance_any_dollars_wp:

  Amount of money saved by the committee (converted to USD)

- improved_wponly_wp:

  Number of improved water point types used in the community

- qtyhh_c_wp:

  Number of households in this community

- wc_admin_index_wp:

  Administrative index for water committee: 'Inadequate' means WC hasn't
  met in \>6 months, 'Minimum' means WC has reported to have met within
  6 months, 'Moderate' means WC has reported to have met within 6
  months, and has at least 1/3 female members and 'Advanced' means WC
  has reported to have met within 6 months, has at least 1/3 female
  members, AND has record of a meeting within previous 6 months

- wc_finance_index_wp:

  Finance index for water committee: 'Inadequate' means WC does not
  collect fees, 'Minimum' means WC reports a fee collection system,
  'Moderate' means WC reports collecting fees and reports having savings
  and 'Advanced' means WC reports collecting fees and reports having
  savings, can demonstrate a fee collection or balance, and reports that
  money is kept in a cash box, bank account, mobile money, or borehole
  banking

- wc_maint_index_wp:

  Maintenance index for water committee: 'Inadequate' means WC cannot
  identify a person for water point maintenance, 'Minimum' means WC can
  identify a person for water point maintenance , 'Moderate' means WC
  can identify a repair person and that person has had training. Plus,
  the community has access to tools and spare parts and 'Advanced' means
  WC can identify a repair person and that person has had training.
  Plus, the community has access to tools and spare parts AND reported
  that someone has performed preventive maintenence within the past year

- wc_mgmt_index_wp:

  Overall management index for water committee: 'Inadequate' means WC is
  inadequate in any of the above indices, 'Minimum' means WC meets
  minimum level in all above indices, 'Moderate' means WC meets moderate
  level in all above indices and 'Advanced' means WC meets moderate
  level in all above indices AND advanced level in at least one of the
  above

- wc_savings_wp:

  Existence of money saved from water committee to repair water points

- wpqty_wp:

  Number of drinking water points in this community, working or not

- pop_1000:

  Population aggregated for a 1-km radius around the water point (data
  from from https://www.worldpop.org/)

- annual_rain:

  Average annual mm of precipitation for administrative unit 2 (average
  from 1991-2020, from https://climateknowledgeportal.worldbank.org/)

- season:

  Season of data collection, according to hostorical rainall amounts
  (from https://climateknowledgeportal.worldbank.org/)

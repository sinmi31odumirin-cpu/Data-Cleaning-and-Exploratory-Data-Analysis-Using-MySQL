-- Data Cleaning

select * 
from layoffs;

-- Steps 
# Remove duplicates
# Standardize the data
# Null values or blank values
# Removing columns

-- Staging original dataset
create table layoffs_copy
like layoffs;

select * 
from layoffs_copy;

insert into layoffs_copy
select *
from layoffs;

# Removing duplicates
select *,
row_number() over(
partition by company, location, industry, total_laid_off, percentage_laid_off, `date`, stage, country, funds_raised_millions
) as row_num
from layoffs_copy;

with copy_cte as 
(
select *,
row_number() over(
partition by company, location, industry, total_laid_off, percentage_laid_off, `date`, stage, country, funds_raised_millions
) as row_num
from layoffs_copy
)

select *
from copy_cte 
where row_num > 1;




CREATE TABLE `layoffs_copy1` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `row_num` int
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

select * 
from layoffs_copy1;

insert layoffs_copy1
(
select *,
row_number() over(
partition by company, location, industry, total_laid_off, percentage_laid_off, `date`, stage, country, funds_raised_millions
) as row_num
from layoffs_copy
);
select * 
from  layoffs_copy1
where row_num > 1;

delete 
from  layoffs_copy1
where row_num > 1;


-- Standardizing data : findinig issues and fixing it:
select * 
from layoffs_copy1;

select company, trim(company)
from  layoffs_copy1;

update layoffs_copy1
set company = trim(company);

select distinct industry 
from layoffs_copy1
order by 1;

select *
from layoffs_copy1
where industry like 'Crypto%';

update layoffs_copy1
set industry =  'Crypto'
where industry like 'Crypto%';

select distinct country 
from layoffs_copy1
order by 1;

select distinct country 
from layoffs_copy1
where country like 'United States%';

select distinct country, trim(trailing '.' from country)
from layoffs_copy1
order by 1;

update layoffs_copy1
set country = trim(trailing '.' from country);

#converting string to date 
select `date`, 
str_to_date(`date`,'%m/%d/%Y')
from layoffs_copy1;

update layoffs_copy1
set `date` = str_to_date(`date`,'%m/%d/%Y');

alter table layoffs_copy1
modify column `date` date;

-- Changing empty rows to null
update layoffs_copy1
set industry = null 
where industry = '';

select *
from layoffs_copy1
where industry is null or industry = '';

-- Updating similar rows where data are similar e.g updating the datasets where the industry of Airbnb is not stated but is stated in at least one of the rows
select *
from layoffs_copy1
where company like 'Airbnb%';

select * 
from layoffs_copy1 t1
join layoffs_copy1 t2
	on t1.company = t2.company
where (t1.industry is null or t1.industry = '')
	and t2.industry is not null;
    
    
update layoffs_copy1 t1
join layoffs_copy1 t2
	on t1.company = t2.company
set t1.industry = t2.industry 
where (t1.industry is null or t1.industry = '')
	and t2.industry is not null;

select * 
from layoffs_copy1;

#Removing columns and rows

select *
from layoffs_copy1
where total_laid_off is null and percentage_laid_off is null;

delete
from layoffs_copy1
where total_laid_off is null and percentage_laid_off is null;

select * 
from layoffs_copy1;

alter table layoffs_copy1
drop column row_num;


select * 
from layoffs_copy1;

























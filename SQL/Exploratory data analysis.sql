-- Exploratory data analysis 

Select * 
from layoffs_copy1;

Select max(total_laid_off), max(percentage_laid_off)
from layoffs_copy1;

Select * 
from layoffs_copy1
where percentage_laid_off = 1
order by funds_raised_millions desc;

Select company, sum(total_laid_off)
from layoffs_copy1
group by company
order by 2 desc;

Select min(`date`), max(`date`) 
from layoffs_copy1;

Select industry, sum(total_laid_off)
from layoffs_copy1
group by industry
order by 2 desc;

Select year(`date`), sum(total_laid_off)
from layoffs_copy1
group by year(`date`)
order by 1 desc
;

Select year(`date`), sum(total_laid_off)
from layoffs_copy1
group by year(`date`)
order by 1 desc
;

Select substring(`date`, 1,7) as `month`, sum(total_laid_off)
from layoffs_copy1
where substring(`date`, 1,7) is not null
group by `month`
order by 1;

-- calculating the max total_laid_off in a month using cte
with cte_max_laid_off as
(
Select substring(`date`, 1,7) as `month`, sum(total_laid_off) as total_laid_off
from layoffs_copy1
where substring(`date`, 1,7) is not null
group by `month`
order by 1
)
select max(total_laid_off)
from cte_max_laid_off;

-- Using the same query above for the rolling total of months per year
with rolling_total as 
(
Select substring(`date`, 1,7) as `month`, sum(total_laid_off) as total_laid_off
from layoffs_copy1
where substring(`date`, 1,7) is not null
group by `month`
order by 1
)
select `month`, total_laid_off,
sum(total_laid_off) over(order by `month`) as rolling_total
from rolling_total;

-- Sum of total laid off made by each company
Select company, sum(total_laid_off)
from layoffs_copy1
group by company
order by 2 desc;

-- Total laid off per year for each company
Select company, year(`date`), sum(total_laid_off) as total_laid_off
from layoffs_copy1
where year(`date`) is not null and total_laid_off is not null
group by company, year(`date`)
order by year(`date`);

-- Year rolliing total
with rolling_total2 as
(
Select company, year(`date`) as year_date, sum(total_laid_off) as total_laid_off
from layoffs_copy1
where year(`date`) is not null and total_laid_off is not null
group by company, year(`date`)
order by year(`date`)
)
select company, year_date, total_laid_off,
sum(total_laid_off) over(order by year_date) as rolling_total
from rolling_total2;
-- results are the same for a particular year 



-- month and day rolling total of laid offs
Select substring(`date`, 6,10) as month_day, sum(total_laid_off) as total_laid_off
from layoffs_copy1
where substring(`date`, 6,10) is not null and total_laid_off is not null
group by month_day
order by 1;
with rolling_total as 
(
Select substring(`date`, 6,10) as month_day, sum(total_laid_off) as total_laid_off
from layoffs_copy1
where substring(`date`, 6,10) and total_laid_off is not null
group by month_day
order by 1
)
select month_day, total_laid_off,
sum(total_laid_off) over(order by month_day) as rolling_total
from rolling_total;




Select company, sum(total_laid_off) total_laid_off
from layoffs_copy1
group by company
order by 2 desc;

--

Select company, year(`date`), sum(total_laid_off) total_laid_off
from layoffs_copy1
group by company, year(`date`)
order by company;

-- cte of ranking of the company with most laid offs per year

with company_year (company, years, total_laid_off) as 
(
Select company, year(`date`), sum(total_laid_off) total_laid_off
from layoffs_copy1
group by company, year(`date`)
)
select *, 
dense_rank() over(partition by years order by total_laid_off desc) as ranking
from company_year
where years is not null and total_laid_off is not null
order by ranking;

-- ranking top 5 companies with most laid offs per year
with company_year (company, years, total_laid_off) as 
(
Select company, year(`date`), sum(total_laid_off) total_laid_off
from layoffs_copy1
group by company, year(`date`)
),
company_year_ranking as 
(select *, 
dense_rank() over(partition by years order by total_laid_off desc) as ranking
from company_year
where years is not null and total_laid_off is not null
)
select *
from company_year_ranking
where ranking <= 5;







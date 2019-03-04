library(dplyr)
library(ggplot2)

dt_KPI <- read.csv("C:\\GeneralInsurance_Class\\Data\\lesson2_KPI.csv")

dt_KPI_1 <- dt_KPI %>% filter(!is.na(Business))
dt_KPI_2 <- dt_KPI_1 %>% filter(!is.na(Premium))

for(i in 1:length(dt_KPI_2$Premium)) 
{
  if(dt_KPI_2$Premium[i] < 0) 
  {
    dt_KPI_2$Premium[i] <- 0
  }
}
 
dt_KPI_3 <- dt_KPI_2 %>% 
  mutate(Profit = Premium - Losses - Expenses)

dt_KPI_3 %>% 
  group_by(Unit) %>% 
  summarize(Celkovy_profit = sum(Profit)) %>% 
  arrange(Celkovy_profit,Unit)
  
dt_KPI_3 %>% 
  filter(Unit == "Unit7") %>%
  group_by(Year) %>% 
  summarize(Profit_year = sum(Profit)) %>% 
  arrange(Profit_year)

dt_KPI_3 %>% 
  filter(Unit == "Unit7") %>%
  group_by(Year) %>% 
  summarize(Profit_year = sum(Profit)) %>% 
  arrange(Profit_year)%>% 
  ggplot(mapping = aes(x = Year, y = Profit_year))+
  geom_bar(stat="identity")

# najprv som si data ocistila od tych v ktorych su NA
# tam kde boli zaporne hodnoty premie som priradila 0
# do tablky som pridala stlpec s profitom
# nasledne som si data zoskupila podla UNIT a porovnavala ich na zaklade profitu
# vyslo, ze Unit7 ma nalepsi profit 
# pomocou filtrovania dat v Unit7 som zistila najhorsi rok a to 2014
# aj na zaklade grafu mame moznost vidiet, ze rok 2014 bol najhorsi


library(tidyverse)
library(nycflights13)


df<-flights

planes<-planes
airports<-airports

#left join
#ajoute � une base de donn�es de r�f�rence des donn�es qui sont dans une autre base de donn�es

#est ce que ID est unique sur une des deux bases

planes %>%  count(tailnum) %>% filter(n!=1)

#check

flights_planes<-df %>% 
select(-year) %>% 
  left_join(planes,by="tailnum")

# join bases avec cl� non diff�rente
#join airports and flights. l'acronyme de l'a�roport s'appelle "dest" dans df

#est ce que la cl� est unique
df %>% count(dest)
airports  %>% count(faa) %>% filter(n!=1)

#join facon 1: utiliser un vecteur nomm�
df %>% 
  left_join(airports,by=c("dest"="faa"))

#facon 2: renommer variable dans donn�es d'origine
df %>% 
  rename("faa"="dest") %>% 
  left_join(airports,by="faa")

#facon 3: renommer la variable dans les donn�es de droite(additionnelles)

airports %>% 
  rename("dest"="faa") %>% 
  right_join(df,by="dest")

#autres fonctions 
#inner join () permet de d�truire des observations

#joiner les vols avec les airports
airports %>% 
  filter(alt>1000) %>% 
  inner_join(df,by=c("faa"="dest"))

#full join: union de deux bases



# exercice 1
# est ce que c'est les avions les plus modernes qui volent le plus
# age des avions dans planes
 flights %>% 
   select(-year) %>% 
   left_join(planes, by="tailnum") %>% 
   ggplot(aes(x=year,y=distance)) +
   geom_point()+
   geom_smooth()
 
 #pas de relations apparemment. Il faudrait faire une r�gression
 
 #exercice 2 how many flights through NYC land in an aiport whose altitude is> 1000mt?
 
 flights %>% 
   left_join(airports,by=c("dest"="faa")) %>% 
   mutate(altitude_mt=alt/3.28084) %>% 
   filter(altitude_mt>1000) %>% 
   group_by(dest,name,altitude_mt) %>% 
   summarise(n=n())
 
 table1

 #donn�es de la bnque mondiale
 wbp<-world_bank_pop
 wbp %>% 
   pivot_longer(cols=!country &!indicator,names_to="year",values_to="value")->wbp_long
 
 #pivot_rider transforme une base de donn�es en "Largeur"
 
 #s�parer des variables
 # dans notre exemple on lui dit de s�parer la colonne rate dans deux colonnes case et populations
 separate(col=rate,into=c("cases","populations"),sep=c(3,8))
   
 
 
  

  
  


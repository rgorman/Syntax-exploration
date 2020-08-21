require(tidyverse)
require(writexl)
require(readxl)


corpus <- read_excel(path = "xen_hell_with_subdoc.xlsx")
verb_list <- read_excel(path = "part_by_lemma.xlsx")

colnames(corpus) # check names of columns


corpus %>%
  filter(lemma == verb_list$lemma[1]) %>%
  filter(self_mood == "participle") %>%
  group_by(self_case, self_gender) %>%
  summarize(count =  n()) %>%
  arrange(desc(count))

x <- corpus %>%
  filter(lemma == verb_list$lemma[1]) %>%
  filter(self_mood == "participle") %>%
  group_by(self_case, self_gender) %>%
  summarize(count =  n()) %>%
  arrange(desc(count))



# the first entry (before the comma) is the thing you are saving; path ="" is the name you are saving it under
write_xlsx(part_by_lemma, path = "part_by_lemma.xlsx") 


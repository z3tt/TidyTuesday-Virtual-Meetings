## Second #Tidytuesday Virtual Meeting Survey (2020-05-08)

## Question by Alex Cookson
## Visualization implemented by Alex Cookson, based on original by Cédric Scherer

## What is your favourite data viz package? (other tha ggplot2)
## Or, if you can't think of a favourite, what package did you most recently learn or want to learn?
## Meeting attendees filtered in throughout the hour, so we only got a few responses!

library(tidyverse)
library(showtext)
library(cowplot)

font_add_google("Overpass Mono", "Overpass Mono")

packages <- tribble(
  ~package, ~value,
  "{treemapify}", 1,
  "{ggrepel}", 1,
  "{dplyr}", 2,
  "{ggtext}", 2,
  "{fishualize}", 1,
  "{ggExtra}", 1,
  "{ggeasy}", 1
)

p <-
  ggplot(packages, aes(fct_reorder(package, value), value)) +
    geom_col(fill = "#32324b", color = NA, width = .8) +
    geom_text(aes(label = value), family = "Overpass Mono", color = "white", nudge_y = -.07) +
    coord_flip(clip = "off") +
    hrbrthemes::theme_modern_rc(grid = "X") +
    scale_y_continuous(expand = c(.005, .005)) +
    theme(axis.text.x = element_blank(),
          axis.ticks.x = element_blank(),
          axis.text.y = element_text(size = 13, face = "bold"),
          legend.text = element_text(size = 13),
          legend.position = "top",
          plot.title = element_text(size = 20),
          plot.subtitle = element_text(size = 16),
          plot.caption = element_text(color = "grey60", margin = margin(t = 30, b = -10)),
          plot.title.position = "plot")  +
    labs(x = NULL, y = NULL,
         title = '"What is your favorite data visualization package?"',
         subtitle = "... asked at our second #TidyTuesday Virtual Meeting",
         caption = "Visualisation implemented by Alex Cookson\n(Based on original by Cédric Scherer)")

p + draw_image(here::here("logo", "tt_vm_hex.png"),
               x = 12.7, y = .8, width = 4, height = 4)

ggsave(here::here("surveys", "002_favorite_package.pdf"), 
       width = 8, height = 6, device = cairo_pdf)
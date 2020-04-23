## First #Tidytuesday Virtual Meeting Survey (2020-04-23)

## Question & Visualization by Cédric Scherer

## What is your favorite geom? 
## (Or: If you would be a geom, which would it be?)

library(tidyverse)
library(showtext)
library(cowplot)

font_add_google("Overpass Mono", "Overpass Mono")

geoms <- tribble(
  ~geom, ~value, ~type,
  "geom_ridges()", 1, "geom",
  "geom_chicklet()", 1, "geom",
  "geom_bar()", 2, "geom",
  "{ggtext}", 1, "I got the question wrong...",
  "geom_jitter()", 1, "geom",
  "geom_boxplot()", 2, "geom",
  "geom_point()", 3, "geom",
  "{gganimate}", 1, "I got the question wrong...",
  "geom_histogram()", 1, "geom",
  "geom_segment()", 1, "geom",
  "{gghighlight}", 1, "I got the question wrong..."
)

p <-
  ggplot(geoms, aes(fct_reorder(geom, value), value, fill = type)) +
    geom_col(color = NA, width = .8) +
    geom_text(aes(label = value), family = "Overpass Mono", color = "white", nudge_y = -.07) +
    coord_flip(clip = "off") +
    hrbrthemes::theme_modern_rc(grid = "X") +
    scale_y_continuous(expand = c(.005, .005)) +
    nord::scale_fill_nord(palette = "afternoon_prarie", name = "") +
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
         title = '"What is your favorite geom?"',
         subtitle = "... asked at our first #TidyTuesday Virtual Meeting",
         caption = "Visualisation by Cédric Scherer")

p + draw_image(here::here("logo", "tt_vm_hex.png"),
  x = 13, y = 1.1, width = 3.2, height = 3.2
)

ggsave(here::here("surveys", "001_favorite_geoms.pdf"), 
       width = 8, height = 6, device = cairo_pdf)

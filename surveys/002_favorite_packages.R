## Second #Tidytuesday Virtual Meeting Survey (2020-05-08)

## Question by Alex Cookson
## Visualization by Alex Cookson

## What is your favourite data viz package? (other tha ggplot2)
## Or, if you can't think of a favourite, what package did you most recently learn or want to learn?
## Meeting attendees filtered in throughout the hour, so we only got a few responses!

library(tidyverse)
library(extrafont)
library(cowplot)
library(fishualize)
library(ggtext)


packages <- tribble(
  ~package, ~value,
  "treemapify", 1,
  "ggrepel", 1,
  "dplyr", 2,
  "ggtext", 2,
  "fishualize", 1,
  "ggExtra", 1,
  "ggeasy", 1
)

fishualize_palette <- "Pseudochromis_aldabraensis"

p <- packages %>%
  mutate(package = fct_reorder(package, value)) %>%
  ggplot(aes(value, package, fill = package, colour = package)) +
  geom_segment(aes(x = 0, xend = value, y = package, yend = package), size = 1.5, alpha = 0.5) +
  geom_point(shape = 21, size = 12) +
  scale_x_continuous(breaks = 0:2) +
  scale_fill_fish(option = fishualize_palette,
                  discrete = TRUE) +
  scale_colour_fish(option = fishualize_palette,
                    discrete = TRUE) +
  labs(title = "Claus Wilke's <span style = 'font-size:24pt; color:#B24531FF'>**ggtext**</span> is popular among #TidyTuesday-ers!",
       subtitle = "\nWe asked attendees of the 2nd Virtual #TidyTuesday meeting,\n\"What is your favourite visualization package?\"",
       x = "Number of respondents",
       y = NULL,
       caption = "Graphic: @alexcookson") +
  theme_minimal() +
  theme(legend.position = "none",
        text = element_text(family = "Bahnschrift"),
        plot.title = element_textbox_simple(size = 18),
        axis.text = element_text(size = 16),
        axis.title = element_text(size = 12, face = "plain"),
        panel.grid = element_blank())

p + draw_image(here::here("logo", "tt_vm_hex.png"),
               x = 1.4, y = 1, width = 1, height = 1.8)

ggsave(here::here("surveys", "002_favorite_package.pdf"), width = 8, height = 6, device = cairo_pdf)

ggsave(here::here("surveys", "002_favorite_package.png"), dpi = 320, width = 8, height = 6)
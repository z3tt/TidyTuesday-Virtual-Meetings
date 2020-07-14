library(ggplot2)
library(cowplot)

# poll <- data.frame(theme = c("theme_minimal", "theme_light", "theme_bw", "theme_dark", "theme_void", n = c(7, 3, 2, 2, 2)))

common = list(
	scale_x_continuous(limits = c(0, 10)),
	scale_y_discrete(),
	theme(
		axis.text.y = element_text(family = "IBM Plex Mono", size = 9),
		axis.text.x = element_blank(),
		axis.title = element_blank(),
		plot.title = element_text(hjust = 0.5, family = "IBM Plex Sans Bold", margin = margin(10, 0, 10, 0)),
		plot.caption = element_text(hjust = 0.5, family = "IBM Plex Sans", margin = margin(0, 0, 15, 0))
	)
)

minimal <- ggplot() +
  geom_segment(aes(x = 0, y = "theme_minimal", xend = 7, yend = "theme_minimal"), size = 5) +
	geom_text(aes(7, 1, label = paste0("(", 7, ")")), nudge_x = 0.4, family = "IBM Plex Sans") +
  labs(title = "My favorite default theme is…\n(number of votes)") +
  theme_minimal() +
	common

light <- ggplot() +
  geom_segment(aes(x = 0, y = "theme_light", xend = 3, yend = "theme_light"), size = 5) +
	geom_text(aes(3, 1, label = paste0("(", 3, ")")), nudge_x = 0.4, family = "IBM Plex Sans") +
  theme_light() +
	common

bw <- ggplot() +
  geom_segment(aes(x = 0, y = "theme_bw", xend = 2, yend = "theme_bw"), size = 5) +
	geom_text(aes(2, 1, label = paste0("(", 2, ")")), nudge_x = 0.4, family = "IBM Plex Sans") +
  theme_bw() +
	common

dark <- ggplot() +
  geom_segment(aes(x = 0, y = "theme_dark", xend = 2, yend = "theme_dark"), size = 5) +
	geom_text(aes(2, 1, label = paste0("(", 2, ")")), nudge_x = 0.4, family = "IBM Plex Sans") +
  theme_dark() +
	common

void <- ggplot() +
  geom_segment(aes(x = 0, y = "theme_void", xend = 2, yend = "theme_void"), size = 5) +
	geom_text(aes(2, 1, label = paste0("(", 2, ")")), nudge_x = 0.4, family = "IBM Plex Sans") +
  labs(caption = "Total Votes: 16 | Graphic: Georgios Karamanis") +
  theme_void() +
	common

plot_grid(minimal, light, bw, dark, void, ncol = 1, align = "v", rel_heights = c(1.8, 1, 1, 1, 1.2))
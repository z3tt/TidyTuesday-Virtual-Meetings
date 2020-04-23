library(hexSticker)
library(showtext)

font_add_google("Roboto Mono", "Roboto Mono")

sticker(here::here("logo", "tt_vm_logo.png"), 
        package = "Virtual\nMeetings", 
        p_y = 1.05,
        p_size = 17,  
        p_family = "Roboto Mono",
        s_x = 1, 
        s_y = 1.1, 
        s_width = .6,
        h_size = .7,
        h_fill = "#09a361",
        h_color = "#acabb1",
        filename = here::here("logo", "tt_vm_hex.png"))

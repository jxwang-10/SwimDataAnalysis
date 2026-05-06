# moving average function works

    Code
      x$layers$geom_point
    Output
      mapping: y = ~time_sec 
      geom_point: na.rm = FALSE
      stat_identity: na.rm = FALSE
      position_identity 

---

    Code
      x$layers$geom_line
    Output
      mapping: y = ~moving_avg 
      geom_line: na.rm = FALSE, orientation = NA, arrow = NULL, arrow.fill = NULL, lineend = butt, linejoin = round, linemitre = 10
      stat_identity: na.rm = FALSE
      position_identity 

---

    Code
      x$layers$labs
    Output
      NULL


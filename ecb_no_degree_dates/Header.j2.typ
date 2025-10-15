((* if cv.photo *))
#two-col(
  left-column-width: design-header-photo-width * 1.1,
  right-column-width: 1fr,
  left-content: [
    #align(
      left + horizon,
      image("profile_picture.jpg", width: design-header-photo-width),
    )
  ],
  column-gutter: 0cm,
  right-content: [
((* endif *))
((* if cv.name *))
= <<cv.name|escape_typst_characters>>
((* endif *))

// Print connections:
#let connections-list = (
((* for connection in cv.connections *))
  [((*- if connection["url"] -*))
    ((*- if "linkedin.com" in connection["url"]|lower -*))
  #box(original-link("https://linkedin.com/in/<<connection["placeholder"]|lower|replace(" ", "-")|escape_typst_characters>>-10a39b11a")[
    ((*- else -*))
  #box(original-link("<<connection["url"]>>")[
    ((*- endif -*))
  ((*- endif -*))
  ((*- if design.header.use_icons_for_connections -*))
    #fa-icon("<<connection["typst_icon"]>>", size: 0.9em) #h(0.05cm)
  ((*- endif -*))
  ((*- if design.header.use_icons_for_connections or not connection["url"] -*))
    <<connection["placeholder"]|escape_typst_characters>>
  ((*- else -*))
    <<connection["clean_url"]|escape_typst_characters>>
  ((*- endif -*))
  ((*- if connection["url"] -*))
  ])
  ((*- endif -*))],
((* endfor *))
)
#connections(connections-list)

((* if cv.photo *))
  ],
)
((* endif *))
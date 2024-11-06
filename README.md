# Rcolors: Generate and Customize Beautiful Color Palettes for Graphing in R

`Rcolors` is an R package designed to simplify color selection for plots and visualizations. It provides a curated selection of beautiful, well-organized color palettes with easy-to-remember names like "blue", "purple", "sunset", and "columbia". With `Rcolors`, you don’t have to remember complex color names – just select colors that are intuitive and visually appealing.

## Installation

To install `Rcolors` directly from GitHub, use the following commands in R:

```r
# Install devtools if you haven't already
install.packages("devtools")

# Install Rcolors from GitHub
devtools::install_github("priscachang/Rcolors")
```

## Usage
After installation, load the library and use the `color_palette()` function to generate and preview color palettes. You can specify the number of colors, the color theme, and the preview shape.
### Basic Functionality
The `color_palette` function allows you to:

- Choose a palette by name, such as "blue", "purple", "sunset", or "columbia".
- Set the number of colors you want to use.
- Preview the colors in either a bar or circle format.

### Function Arguments
- `n`: The number of colors to generate (default is 3).
- `color_name`: The name of the color palette, such as "blue," "purple," "sunset," etc. (default is "set3").
- `preview_shape`: Set to "bar" or "circle" to display a preview of the colors (default is "bar").

## Example Usage
### 1. Generate a Simple Blue Palette
```r
library(Rcolors)

# Generate a palette with 5 shades of blue and display as circles
colors <- color_palette(n = 5, color_name = "blue", preview_shape = "circle")
print(colors)
```
### 2. Use the Columbia Palette
The "columbia" palette is a custom set of 7 colors inspired by Columbia University’s colors.

```r
# Generate and preview the Columbia palette
columbia_colors <- color_palette(n = 7, color_name = "columbia", preview_shape = "circle")
print(columbia_colors)
```

### 3. Create a Sunset Gradient for a Bar Chart
```r
# Create a sunset gradient and use it in a ggplot bar chart
library(ggplot2)

# Generate sunset colors
sunset_colors <- color_palette(n = 7, color_name = "sunset", preview_shape = "bar")

# Example bar plot using sunset colors
ggplot(mpg, aes(x = class, fill = class)) +
  geom_bar() +
  scale_fill_manual(values = sunset_colors) +
  theme_minimal() +
  labs(title = "Car Classes", x = "Class", y = "Count")
```

## Available Color Names

The following color names are available to use with `color_palette()`:

- **Basic colors:** `blue`, `light_blue`, `dark_blue`, `purple`, `lavender`, `violet`, `green`, `teal`, `mint`, `red`, `pink`, `light_pink`, `coral`, `orange`, `yellow`, `mustard`, `brown`, `beige`, `gray`, `dark_gray`, `light_gray`

- **Gradients and themes:** `sunset`, `ocean`, `forest`, `fire`, `sky`, `earth`, `sand`, `turquoise`, `aqua`, `seafoam`, `gold`, `bronze`, `olive`, `slate`, `navy`, `magenta`, `peach`, `mint_green`, `desert`, `frost`, `spring`, `autumn_forest`, `pastel`, `retro`

- **Custom palettes:** `columbia`

For a full list of color options, refer to the code documentation.


## Error Handling
- If an invalid color name or preview shape is provided, the function will throw an error with a helpful message.
- If you request more colors than are available in the palette, you’ll receive a message indicating the maximum number of colors supported.

## Contributions
Contributions are welcome! If you'd like to add new color names or improve the functionality, please fork the repository and submit a pull request.

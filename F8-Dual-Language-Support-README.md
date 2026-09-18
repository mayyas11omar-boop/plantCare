# F8 - Dual Language Support (Arabic/English)

## Overview
The Dual Language Support ensures the application is accessible to both Arabic and English-speaking users. It implements right-to-left (RTL) and left-to-right (LTR) layout support to accommodate the linguistic needs of the target audience.

## Technical Implementation

### Multi-Page Localization
- **Language Declaration:** Individual pages use the `lang` attribute in the `<html>` tag (e.g., `lang="ar"` or `lang="en"`) to signal the primary language to browsers and screen readers.
- **Directionality:** The `dir` attribute (`rtl` for Arabic, `ltr` for English) is used to flip the layout of the page, ensuring proper alignment of text, buttons, and navigation elements.

### Content Strategy
- **Bilingual Interface:** key navigation elements and descriptions are provided in both languages or translated on specific pages.
- **RTL-Ready Layouts:** CSS and Bootstrap containers are designed to handle flow changes when switching between languages.

### Search Functionality
- **Unicode Support:** The plant search and identification logic (using `toLowerCase()`) supports both Arabic scripts and English text, allowing users to find plants regardless of the input language.

## User Flow
1. User enters the site and observes the language indicator in the navbar (`AR | EN`).
2. The Home page provides English content with a standard layout.
3. Specific interactive modules (like `plantAi.html`) default to Arabic with an RTL layout to prioritize the local user base.
4. All text-heavy sections (About, Feature descriptions) are crafted to be easily readable in the chosen language.

## Best Practices Followed
- **Semantic HTML:** Correct use of `lang` and `dir` attributes for better SEO and accessibility.
- **Flexible Layouts:** Using Bootstrap ensures that grids and cards reorder correctly when the text direction is flipped.
- **Comprehensive Identification:** The backend synthesis of Wikipedia data supports both Arabic and English summaries.

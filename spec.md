# Specifications for the CLI Assessment
# Make sure to check each box in your spec.md (replace the space between the square braces with an x) and explain next to each one how you've met the requirement before you submit your project.

Specs:
- [x] Have a CLI for interfacing with the application: The CLI is provided in cli.rb in the
lib/dharma_me folder. It greets the user, asks them what task they'd like to perform, and then
allows them to do that task (and in one case, show more details).
- [X] Pull data from an external source: The program scrapes recent meditation talks from the
Insight Meditation Community of Washington's website and scrapes guided meditations from UCLA's
Mindful Awareness Research Center.
- [X] Implement both list and detail views: For the talks from IMCW, the first scrape gets the
recent talks and some attributes from the main page. It then scrapes the "more details" page for
each talk and adds more attributes. When the user chooses a talk, they can display the date and
description of the talk before choosing to play it.

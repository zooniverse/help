## Overview
The Zooniverse platform supports translation of platform and project content into many languages, aiding our global community of volunteers. Translated projects must have an English version in order to become official Zooniverse projects listed at [zooniverse.org/projects](https://www.zooniverse.org/projects). 

Approximately 25% of Zooniverse projects have been translated into other languages. The five most common translation languages are currently French, Spanish, German, Portuguese, and Dutch. The large number of projects available in French is largely thanks to one particularly keen Zooniverse volunteer, @veragon, who reached out to project teams to ask if they would like their project translated into French. As of November 2020, @veragon had collaborated with 20 project teams to provide French translations.

When a translated Zooniverse webpage is being viewed in a language other than English, the currently-viewed language is stored as a subpath in the url, which makes it easy for volunteers to share translated project pages. For example, a French URL for the Planet Hunters: TESS project looks like this: [https://www.zooniverse.org/projects/fr/nora-dot-eisner/planet-hunters-tess](https://www.zooniverse.org/projects/fr/nora-dot-eisner/planet-hunters-tess). Translations can also be accessed using a URL query parameter, using URLs like: [https://www.zooniverse.org/projects/nora-dot-eisner/planet-hunters-tess?language=fr](https://www.zooniverse.org/projects/nora-dot-eisner/planet-hunters-tess?language=fr)

## Translation Types

The Zooniverse platform has two types of translations: 1) static translation dictionaries for platform-level text; and 2) project-specific translations.

### Static Translations
Static translations refer to platform-level text; i.e. the text shared across all projects such as menu labels, headers, etc. This content is managed and maintained by the Zooniverse team. Static dictionaries of platform-level content are embedded as part of the Zooniverse platform's front end codebase. We use Lokalise to manage these static dictionaries, and changes or additions are made via pull request to one of our front end repositories.

Volunteer translators can be given a Lokalise account to assist with editing existing or inputting new static translations. Detailed instructions are available on [this wiki page](https://github.com/zooniverse/front-end-monorepo/wiki/Contributing-Translations-via-Lokalise). After a translator has submitted new translations, the change is reviewed by a member of the Zooniverse frontend dev team, who can then share a preview of the updated Zooniverse website with the translator to review before it goes live.

### Project Translations
Project translations refer to the content created and input by external research teams, e.g. Project Builder users. This content is controlled by the project team. Teams must first input English text into their project via the Project Builder. Then they will need to add the non-English language(s) into which they want their project translated. 

Project translations are created and maintained using the Zooniverse translations user interface: [translations.zooniverse.org](https://translations.zooniverse.org).  Here, translators can access each language translation for a project, view all project-level text, and enter tranlated content. This site is password-protected, and only project team members with appropriate roles (translator, collaborator, owner) can gain access.

Research teams manage their project's translations via the Translations tab of the Project Builder. From there, teams can view a list of translations, access translated preview versions of their project, and publish translations to make them available to their volunteer community.

## Instructions
Follow the steps below to translate your project into non-English languages.

1. **Grant Access:** Assign the "translator" role to individuals who will use the Zooniverse project translations interface ([translations.zooniverse.org](https://translations.zooniverse.org)) to translate project-specific content into non-English languages. Assignment can be made via your project's Collaborators page. Note: owners and collaborators already have access via their existing roles.
2. **Translate:** After logging into the translations interface ([translations.zooniverse.org](https://translations.zooniverse.org)) using their Zooniverse username and password, a translator creates an element-by-element translation of your project content. While your team is responsible for translating all project-specific content (workflow instructions, tutorials, about pages, etc.), the Zooniverse team manages translations of all shared platform-level content (e.g., labels for navigation buttons and links).
3. **View and Edit:** Once a translation has been created in the translations interface, the project team can preview a language translation using the "Preview" link provided below. Alternatively, the translation can be viewed by adding a language query param to the end of any project URL (e.g., https://www.zooniverse.org/projects/OWNER/PROJECT?language=fr).
4. **Validate:** Once a translation is complete, it is the responsibility of the project team to review the translation and confirm its quality. Teams can complete this check by previewing the translated content in their web browser, and use a browser's built-in translation tool to transform the translated content back to English for the purpose of checking its accuracy.
5. **Publish:** When a translation is ready to be made available to participants, it can be "published" by clicking the checkbox in the list below. This will add the option to a dropdown language selector available on project pages.

Please Note: Translators and project teams are able to create translations for a large array of languages using the Translations interface ([translations.zooniverse.org](https://translations.zooniverse.org)). If you create a project translation for a language that does not appear in the list of publishable languages on the Project Builder's Translations tab, the reason is typically because that language does not currently have platform-level translations available. In this case, please email contact@zooniverse.org to discuss options and next steps for adding platform-level translations for that language.

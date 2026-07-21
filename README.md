# Priority Funders — Village SF

Grants pipeline tracker for the Village SF capital campaign at Friendship House Association of American Indians.

Single-page app, no build step. Runs two ways:

- **Local only** — before setup, the board saves to your browser (`localStorage`). Good for a solo start.
- **Shared** — once connected to Supabase, the whole team sees and edits one live board, synced every few seconds. A status pill in the header tells you which mode you're in.

Seeded with the current funder shortlist on first load.

## Files

| File | What it is |
|------|-----------|
| `index.html` | The whole app. |
| `config.js` | The two Supabase values you paste in. The only file you edit for setup. |
| `supabase-setup.sql` | One-time database setup — paste into Supabase's SQL editor. |

## Turn on the shared board

1. **Make a Supabase project** — free, no card, at [supabase.com](https://supabase.com). Create a new project (any name; pick a region near SF).
2. **Create the table** — in the project, open **SQL Editor → New query**, paste all of `supabase-setup.sql`, and click **Run**.
3. **Copy your two keys** — go to **Project Settings → API** and copy:
   - **Project URL**
   - the **`anon` `public`** key
4. **Paste them into `config.js`**:
   ```js
   export const SUPABASE_URL = "https://YOURPROJECT.supabase.co";
   export const SUPABASE_ANON_KEY = "eyJhbGciOi...";  // the long anon public key
   ```
5. **Commit and push** — GitHub Pages redeploys and the header pill turns green: **Live — shared board**. The first person to load it seeds the 13 funders; everyone after sees the shared set.

### A note on the open setup

This board is intentionally open: anyone with the page link can view **and** edit, because the database key ships in the page. Keep the URL within the team. To lock it down later, swap the four policies in `supabase-setup.sql` for auth-based ones and turn on Supabase Auth logins — the app is already built to support that.

## Run locally

`config.js` is loaded as a module, so open it through a local server rather than `file://`:

```
python3 -m http.server 8000
# then visit http://localhost:8000
```

## Deploy on GitHub Pages

Settings → **Pages** → Source: **Deploy from a branch** → `main` / `(root)`.
Live at `https://sudo-chop-suey.github.io/village-dash/`.

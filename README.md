# Priority Funders — Village SF

Grants pipeline tracker for the Village SF capital campaign at Friendship House Association of American Indians.

Single-page app, no build step, no backend — state is saved in the browser's `localStorage`. Seeded with the current funder shortlist on first load.

## Run locally

Open `index.html` directly in a browser, or serve the folder:

```
python3 -m http.server 8000
```

## Deploy

GitHub Pages serves `index.html` from the repo root on the `main` branch. Enable it under **Settings → Pages → Source: Deploy from a branch → main / (root)**.

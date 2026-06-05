# Standalone DMN Editor — Example

This folder contains a minimal front-end example showing how to embed the
single-file standalone DMN editor bundle into a web page using Vite.

## Quick start

The example loads the DMN editor bundle from jsDelivr CDN, so no npm install of the package is required:

```bash
npm install
npm run dev
# then open http://localhost:5173 and navigate to /index.html
```

## How it works

- `index.html` includes `<script>` tags that load the bundle from CDN (jsDelivr).
- The page contains an initializer that detects the editor API and attempts common initialization patterns.
- The editor will mount into a `<div id="editor">` element.

## Customization

- **Bundle path**: If you want to use the local node_modules bundle instead of CDN, update the `<script src>` in `index.html`.
- **API detection**: The initializer tries common global names and initialization patterns. If the editor bundle exports a different global or requires different setup, update the `globalsToCheck` array and initialization logic in the `<script>` block.
- **Styling**: Customize the editor appearance by adding CSS in the `<style>` block.

## Production

For production builds:
```bash
npm run build
npm run preview
```

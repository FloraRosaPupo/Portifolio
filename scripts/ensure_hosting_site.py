"""Ensure the approved Firebase Hosting site exists in the portfolio project."""
import json
import os

from google.auth.transport.requests import AuthorizedSession
from google.oauth2 import service_account

PROJECT = 'portifolio-d00ca'
SITE = 'flora-rosa'
credentials = service_account.Credentials.from_service_account_info(
    json.loads(os.environ['FIREBASE_SERVICE_ACCOUNT']),
    scopes=['https://www.googleapis.com/auth/firebase.hosting'],
)
session = AuthorizedSession(credentials)
base = f'https://firebasehosting.googleapis.com/v1beta1/projects/{PROJECT}/sites'
response = session.get(f'{base}/{SITE}', timeout=60)
if response.status_code == 404:
    response = session.post(base, params={'siteId': SITE}, json={}, timeout=60)
if not response.ok:
    raise SystemExit(f'Hosting site setup failed (HTTP {response.status_code}). Check name availability and firebasehosting.sites.create permission.')
site = response.json()
if site.get('name', '').split('/')[-1] != SITE:
    raise SystemExit('Unexpected Hosting site returned; deployment stopped.')
print(f'Hosting site ready: https://{SITE}.web.app')

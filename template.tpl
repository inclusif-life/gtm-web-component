// Copyright 2019 Google LLC

// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at

//     https://www.apache.org/licenses/LICENSE-2.0

// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

___INFO___

{
  "displayName": "Inclusif Accessibility Widget",
  "description": "Easily add the Inclusif accessibility widget to your website. The widget provides comprehensive accessibility tools to help users with disabilities navigate your site more effectively.",
  "categories": ["UTILITY"],
  "securityGroups": [],
  "id": "cvt_temp_public_id",
  "type": "TAG",
  "version": 1,
  "brand": {
    "thumbnail": "https://inclusif.life/favicon.svg",
    "displayName": "Inclusif",
    "id": "inclusif"
  },
  "containerContexts": [
    "WEB"
  ]
}


___TEMPLATE_PARAMETERS___

[
  {
    "help": "Your Inclusif API key. You can find this in your Inclusif dashboard.",
    "displayName": "API Key",
    "name": "apiKey",
    "type": "TEXT",
    "isRequired": true
  },
  {
    "help": "The language for the accessibility widget interface. Supported languages: 'en' (English), 'es' (Spanish)",
    "displayName": "Language",
    "name": "language",
    "type": "TEXT",
    "defaultValue": "en",
    "isRequired": true
  },
  {
    "help": "Position of the accessibility widget on the page.",
    "displayName": "Widget Position",
    "name": "position",
    "type": "SELECT",
    "selectItems": [
      {
        "displayValue": "Bottom Right",
        "value": "bottom-right"
      },
      {
        "displayValue": "Bottom Left",
        "value": "bottom-left"
      },
      {
        "displayValue": "Top Right",
        "value": "top-right"
      },
      {
        "displayValue": "Top Left",
        "value": "top-left"
      },
      {
        "displayValue": "Center Left",
        "value": "center-left"
      },
      {
        "displayValue": "Center Right",
        "value": "center-right"
      }
    ],
    "defaultValue": "bottom-right"
  },
  {
    "help": "Enable debug mode for detailed console logging and debugging information.",
    "displayName": "Debug Mode",
    "name": "debug",
    "type": "RADIO",
    "radioItems": [
      {
        "displayValue": "Enabled",
        "value": true
      },
      {
        "displayValue": "Disabled", 
        "value": false
      }
    ],
    "defaultValue": false
  },
  {
    "help": "Local development script path. Leave empty for production mode. Example: 'http://localhost:3000/widget.js' or '/path/to/local/widget.js'",
    "displayName": "Local Development Script",
    "name": "local",
    "type": "TEXT",
    "defaultValue": ""
  }
]


___WEB_PERMISSIONS___

[
  {
    "instance": {
      "key": {
        "publicId": "logging",
        "versionId": "1"
      },
      "param": [
        {
          "key": "environments",
          "value": {
            "type": 1,
            "string": "debug"
          }
        }
      ]
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "inject_script",
        "versionId": "1"
      },
      "param": [
        {
          "key": "urls",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 1,
                "string": "https://plugin.inclusif.life/*"
              }
            ]
          }
        }
      ]
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "access_globals",
        "versionId": "1"
      },
      "param": [
        {
          "key": "keys",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "key"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  },
                  {
                    "type": 1,
                    "string": "execute"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "Inclusif"
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": true
                  }
                ]
              },
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "key"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  },
                  {
                    "type": 1,
                    "string": "execute"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "Inclusif.q"
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": true
                  }
                ]
              }
            ]
          }
        }
      ]
    },
    "isRequired": true
  }
]


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

// Inclusif Accessibility Widget GTM Template
const log = require('logToConsole');
const injectScript = require('injectScript');
const setInWindow = require('setInWindow');
const copyFromWindow = require('copyFromWindow');

// Get template parameters
const apiKey = data.apiKey;
const language = data.language || 'en';
const position = data.position || 'bottom-right';
const debug = data.debug || false;
const local = data.local || '';

log('Inclusif: Template parameters received:');
log('  - apiKey:', apiKey);
log('  - language:', language);
log('  - position:', position);
log('  - debug:', debug);
log('  - local:', local);

// Validation
if (!apiKey) {
  log('Inclusif ERROR: API Key is required');
  data.gtmOnFailure();
  return;
}

log('Inclusif: Starting queue setup...');

// Set up Inclusif queue first (before script loads)
const initConfig = {
  apiKey: apiKey,
  language: language,
  position: position,
  debug: debug,
  local: local
};

log('Inclusif: Config object created:', initConfig);
log('Inclusif: Setting up complete Inclusif object structure...');

// First set up the main Inclusif object with the queue
const inclusifObject = {
  q: [['init', initConfig]]
};

setInWindow('Inclusif', inclusifObject);

log('Inclusif: Complete object set in window, verifying...');

// Verify the complete object is set up
const verifyInclusif = copyFromWindow('Inclusif');
log('Inclusif: Complete object verification:', verifyInclusif);
log('Inclusif: Queue verification - type:', typeof verifyInclusif);

if (verifyInclusif && verifyInclusif.q) {
  log('Inclusif: Queue found - length:', verifyInclusif.q.length);
  log('Inclusif: Queue content:', verifyInclusif.q);
  
  if (verifyInclusif.q.length > 0) {
    log('Inclusif: First queue item:', verifyInclusif.q[0]);
    if (verifyInclusif.q[0] && verifyInclusif.q[0][0] === 'init') {
      log('Inclusif: Init command found in queue');
      log('Inclusif: Init config:', verifyInclusif.q[0][1]);
    } else {
      log('Inclusif ERROR: Init command not found or malformed');
    }
  }
} else {
  log('Inclusif ERROR: Inclusif object or queue not found after setup');
  log('Inclusif ERROR: verifyInclusif:', verifyInclusif);
}

log('Inclusif: About to inject widget script...');

// Inject the script (this replaces the createElement part)
injectScript('https://plugin.inclusif.life/widget.js', function() {
  log('Inclusif: ✅ Widget script loaded successfully');
  
  const finalInclusif = copyFromWindow('Inclusif');
  log('Inclusif: Final Inclusif object after script load:', finalInclusif);
  log('Inclusif: Final object type:', typeof finalInclusif);
  
  if (finalInclusif && finalInclusif.q) {
    log('Inclusif: Final queue exists - length:', finalInclusif.q.length);
    log('Inclusif: Final queue content:', finalInclusif.q);
  } else {
    log('Inclusif ERROR: Final queue not found');
  }
  
  data.gtmOnSuccess();
}, function() {
  log('Inclusif ERROR: ❌ Failed to load widget script');
  data.gtmOnFailure();
});


___NOTES___

Inclusif Accessibility Widget GTM Template
- Loads the Inclusif accessibility widget on page load
- Configurable API key, language, and position parameters  
- Provides comprehensive accessibility tools for website users

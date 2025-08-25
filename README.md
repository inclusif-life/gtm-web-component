# Inclusif Accessibility Widget - Google Tag Manager Template

This repository contains the Google Tag Manager template for the Inclusif Accessibility Widget. This template allows you to easily deploy the Inclusif accessibility widget on any website through Google Tag Manager with comprehensive configuration options.

## Features

- **Easy Integration**: Simple setup through Google Tag Manager interface
- **Configurable Parameters**: Customize API key, language, widget position, debug mode, and local development
- **Accessibility Compliance**: Helps make websites more accessible for users with disabilities
- **Multiple Languages**: Support for English and Spanish
- **Flexible Positioning**: Choose from bottom-right, bottom-left, top-right, top-left, center-left, or center-right positions
- **Debug Support**: Enable detailed console logging for development and troubleshooting
- **Local Development**: Support for local development with custom script paths

## Template Parameters

### Required Parameters

1. **API Key** (Text): Your Inclusif API key from your dashboard
   - Format: `pk_test_...`, `pk_live_...`, or `pk_dev_...`
   - Get your API key from the Inclusif dashboard

2. **Language** (Text): Interface language for the accessibility widget
   - Default: `en`
   - Supported: `en` (English), `es` (Spanish)

### Optional Parameters

1. **Widget Position** (Select): Position of the widget on the page
   - Options: Bottom Right, Bottom Left, Top Right, Top Left, Center Left, Center Right
   - Default: `bottom-right`

2. **Debug Mode** (Radio): Enable detailed console logging
   - Options: Enabled / Disabled
   - Default: `Disabled`
   - Use for development and troubleshooting

3. **Local Development Script** (Text): Path to local development script
   - Default: Empty (uses production script)
   - Example: `http://localhost:3000/widget.js`
   - Use when developing locally

## How to Use

### Standard Setup

1. Import this template into your Google Tag Manager container
2. Create a new tag using the Inclusif Accessibility Widget template
3. Configure your API key and preferred settings:
   - **API Key**: Your Inclusif API key
   - **Language**: Your preferred language code
   - **Position**: Choose widget position
4. Set up a trigger (typically Page View for all pages)
5. Test in Preview mode
6. Publish your container

### Development Setup

1. Follow standard setup steps 1-3
2. Enable **Debug Mode** for detailed logging
3. Optionally set **Local Development Script** path for local testing
4. Test thoroughly before disabling debug mode
5. Publish your container

## Debugging

When **Debug Mode** is enabled, the template will log detailed information to the browser console:

- Template parameters received
- Configuration object creation
- Queue setup and verification
- Widget script loading status
- Final state verification

This helps troubleshoot any issues during implementation.

## Local Development

For developers working on custom implementations:

1. Set the **Local Development Script** parameter to your local script path
2. Enable **Debug Mode** for detailed logging
3. The widget will use your local script instead of the production CDN

## API Key Validation

The template includes built-in API key validation:

- Validates key format (`pk_test_...`, `pk_live_...`, `pk_dev_...`)
- Performs server-side validation against your domain
- Provides clear error messages for invalid configurations

## Browser Compatibility

The Inclusif widget and GTM template support:

- All modern browsers (Chrome, Firefox, Safari, Edge)
- IE11+ (with polyfills)
- Mobile browsers (iOS Safari, Chrome Mobile)

## Deployment to GTM Gallery

Here are the [detailed instructions on how to submit templates to the Community Template Gallery](https://developers.google.com/tag-manager/templates/gallery).

## Support

- **Documentation**: [https://docs.inclusif.life](https://docs.inclusif.life)
- **Dashboard**: [https://app.inclusif.life](https://app.inclusif.life)
- **Website**: [https://inclusif.life](https://inclusif.life)

## About Inclusif

Inclusif provides comprehensive accessibility tools that help users with disabilities navigate websites more effectively. Our widget includes:

- Screen reader optimization
- Keyboard navigation enhancements
- Visual accessibility adjustments
- Cognitive accessibility tools
- WCAG 2.1 compliance features

The widget ensures compliance with accessibility standards and improves user experience for everyone, making the web more inclusive and accessible.

## License

Licensed under the Apache License, Version 2.0. See the LICENSE file for details.

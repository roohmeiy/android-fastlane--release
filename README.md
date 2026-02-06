# 🚀 Android CI/CD with Fastlane (Alpha & Beta)

Simple build and deployment pipeline for Android apps.
Note: The fastlane file is written keeping in mind that code will use flavours(stg, uat, prod). If you don't use flavours then you have to change the aab path

## 📁 Folder Structure

```
your-android-project/
├── .github/
│   └── workflows/
│       └── android-fastlane-pipeline.yaml
├── android/
│   ├── app/
│   │   ├── build.gradle
│   │   ├── google-services.json
│   │   └── google-services.prod.json
│   ├── fastlane/
│   │   ├── Appfile
│   │   ├── Fastfile
│   │   └── play-store-credentials.json  ← Add this
│   ├── Gemfile
│   ├── build.gradle
│   └── gradle.properties
├── scripts/
│   └── prodSetup.sh
└── README.md
```

---

## 🔄 Pipeline Flow

```
  TRIGGER                         LANE                    DESTINATION
  ───────                         ────                    ───────────

  Push: alpha branch  ─────────►  fastlane alpha  ─────►  Play Store (Alpha)

  Push: beta branch   ─────────►  fastlane beta   ─────►  Play Store (Beta)

  Manual trigger      ─────────►  Choose lane     ─────►  Selected track
```

---

## 🎯 Available Lanes

| Lane | Command | Description |
|------|---------|-------------|
| `build_only` | `fastlane build_only` | Build APK & AAB only |
| `alpha` | `fastlane alpha` | Build & deploy to Alpha |
| `beta` | `fastlane beta` | Build & deploy to Beta |
| `promote_alpha_to_beta` | `fastlane promote_alpha_to_beta` | Promote Alpha → Beta |

---

## 🔑 Setup Required

### 1. Google Play Service Account JSON

1. Go to [Google Play Console](https://play.google.com/console)
2. Settings → API access → Create service account
3. Download JSON key
4. Save as `android/fastlane/play-store-credentials.json`

### 2. Update Package Name

Edit `android/fastlane/Appfile`:
```ruby
package_name("com.yourcompany.yourapp")
```

### 3. Add Firebase Config

Add your `google-services.prod.json` in `android/app/`

---

## 🛠️ Local Usage

```bash
cd android

# Install Fastlane
bundle install

# Build only
bundle exec fastlane build_only

# Deploy to Alpha
bundle exec fastlane alpha

# Deploy to Beta
bundle exec fastlane beta
```

---

## 📋 Automatic Triggers

| Branch | Auto Lane | Destination |
|--------|-----------|-------------|
| `alpha` | `alpha` | Alpha Track |
| `beta` | `beta` | Beta Track |

---

## 📱 Output Artifacts

After build, download from GitHub Actions:
- `app-release-apk` - APK file
- `app-release-aab` - AAB file (for Play Store)

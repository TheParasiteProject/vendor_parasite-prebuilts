# vendor_parasite_prebuilts

Prebuilt binaries used in TheParasiteProject.

## Variables

[Akane Foundation](https://github.com/AkaneFoundation):
Note: If both `TARGET_INCLUDE_ACCORD` and `TARGET_INCLUDE_GRAMOPHONE` set,<br>
`Gramophone` will overrides `Accord`.

* `TARGET_INCLUDE_ACCORD`: Include [Accord](https://github.com/AkaneFoundation/Accord) music player.
* `TARGET_INCLUDE_GRAMOPHONE`: Include [Gramophone](https://github.com/AkaneTan/Gramophone) music player.
* `TARGET_INCLUDE_OMNI`: Include [Omni](https://github.com/AkaneFoundation/Omni) toolbox.

[microG](https://github.com/microg):
* `TARGET_INCLUDE_MICROG`: Include microG components.<br>
  This will overrides `PrebuiltGmsCore` & `GoogleServicesFramework`.
* `TARGET_INCLUDE_MICROG_COMPANION`: Include microG Companion.<br>
  This will overrides `Phonesky`.

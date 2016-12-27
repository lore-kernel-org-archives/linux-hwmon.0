Return-path: <linux@roeck-us.net>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 01/10] hwmon: Prepare for SENSOR_DEVICE_ATTR_{RO,RW,WO} conversion
Date: Tue, 27 Dec 2016 15:28:18 -0800
Message-Id: <1482881308-13550-1-git-send-email-linux@roeck-us.net>
List-ID: <linux-hwmon@vger.kernel.org>

Introduce SENSOR_DEVICE_ATTR_{RO,RW,WO} and SENSOR_DEVICE_ATTR_2_{RO,RW,WO}
as simplified variants of SENSOR_DEVICE_ATTR and SENSOR_DEVICE_ATTR_2 to
simplify the source code, improve readbility, and reduce the chance of
inconsistencies.

Prepare various drivers for automated conversion to the new macros.
This requires replacing various macros with explicit code to avoid confusing
coccinelle. In some cases, minor logical changes are necessary.

Symbolic file permissions are for the most part not replaced with octals
in this patch series. The resulting checkpatch warnings are accepted.
File permissions will be dropped with the conversion to the new macros.
Replacing symbols with octals just to drop the octals would be unnecessary
churn.

----------------------------------------------------------------
Guenter Roeck (10):
      hwmon: Introduce SENSOR_DEVICE_ATTR_{RO,RW,WO} and variants
      hwmon: (wm831x-hwmon) Replace macros generating sensor attributes
      hwmon: (it87) Prepare for auto-conversion to SENSOR_DEVICE_ATTR_{RO,RW}
      hwmon: (max1668) Prepare for auto-conversion to SENSOR_DEVICE_ATTR_{RO,RW}
      hwmon: (f75375s) Replace function macro with explicit code
      hwmon: (ultra45_env) Replace macros generating sensor attributes
      hwmon: (w83l786ng) Replace function macros with explicit code
      hwmon: (w83791d) Replace function macros with explicit code
      hwmon: (w83627ehf) Replace function macros with explicit code
      hwmon: (adt7411) Replace macro generating sensor attributes

 Documentation/hwmon/hwmon-kernel-api.txt |  24 +-
 drivers/hwmon/adt7411.c                  |  16 +-
 drivers/hwmon/f75375s.c                  |  48 ++-
 drivers/hwmon/it87.c                     |  23 +-
 drivers/hwmon/max1668.c                  |  20 +-
 drivers/hwmon/ultra45_env.c              |  30 +-
 drivers/hwmon/w83627ehf.c                | 534 +++++++++++++++++++++----------
 drivers/hwmon/w83791d.c                  | 140 +++++---
 drivers/hwmon/w83l786ng.c                | 158 ++++++---
 drivers/hwmon/wm831x-hwmon.c             |  48 +--
 include/linux/hwmon-sysfs.h              |  39 +++
 11 files changed, 730 insertions(+), 350 deletions(-)

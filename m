Return-Path: <nicoleotsuka@gmail.com>
Return-path: <nicoleotsuka@gmail.com>
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: jdelvare@suse.com,
	linux@roeck-us.net
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 0/4] hwmon: (ina3221) Implement PM runtime to save power
Date: Mon,  5 Nov 2018 12:48:39 -0800
Message-Id: <20181105204843.4081-1-nicoleotsuka@gmail.com>
List-ID: <linux-hwmon@vger.kernel.org>

This series patches implement PM runtime feature in the ina3221 hwmon
driver (PATCH-4). However, PATCH-[1:3] are required to make sure that
the PM runtime feature would be functional and safe.

Changelog
v4->v5:
 * Dropped the change for hwmon core; Shifted all the patch indexes
 * Used i2c_client dev pointer for pm runtime callbacks (PATCH-4)
v3->v4:
 * Added generic pm runtime functions to hwmon class (PATCH-1)
 * Updated to pass pm pointer via _with_info API (PATCH-5)
v2->v3:
 * Dropped timeout dev_err messages as it's indicated in errno (PATCH-4)
 * Improved a dev_err message and comments (PATCH-5)
v1->v2:
 * Added device pointer check (PATCH-1)
 * Returned 0 for alert flags (PATCH-2)
 * Moved CVRF polling to data read routine (PATCH-4)
 * Bypassed i2c_client->dev in suspend/resume() (PATCH-5)

Nicolin Chen (4):
  hwmon: (ina3221) Check channel status for alarms attribute read
  hwmon: (ina3221) Serialize sysfs ABI accesses
  hwmon: (ina3221) Make sure data is ready before reading
  hwmon: (ina3221) Add PM runtime support

 drivers/hwmon/ina3221.c | 190 +++++++++++++++++++++++++++++++++++-----
 1 file changed, 166 insertions(+), 24 deletions(-)

-- 
2.17.1

Return-Path: <nicoleotsuka@gmail.com>
Return-path: <nicoleotsuka@gmail.com>
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: jdelvare@suse.com,
	linux@roeck-us.net
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/5] hwmon: (ina3221) Implement PM runtime to save power
Date: Tue, 16 Oct 2018 18:24:21 -0700
Message-Id: <20181017012426.26958-1-nicoleotsuka@gmail.com>
List-ID: <linux-hwmon@vger.kernel.org>

This series patches implement PM runtime feature in the ina3221 hwmon
driver (PATCH-5). However, PATCH-[1:4] are required to make sure that
the PM runtime feature would be functional and safe.

Nicolin Chen (5):
  hwmon: (core) Inherit power properties to hdev
  hwmon: (ina3221) Return -ENODATA for two alarms attributes
  hwmon: (ina3221) Serialize sysfs ABI accesses
  hwmon: (ina3221) Make sure data is ready after channel enabling
  hwmon: (ina3221) Add PM runtime support

 drivers/hwmon/hwmon.c   |   3 +
 drivers/hwmon/ina3221.c | 185 ++++++++++++++++++++++++++++++++++------
 2 files changed, 162 insertions(+), 26 deletions(-)

-- 
2.17.1

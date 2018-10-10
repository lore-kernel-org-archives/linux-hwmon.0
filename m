Return-Path: <nicoleotsuka@gmail.com>
Return-path: <nicoleotsuka@gmail.com>
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: jdelvare@suse.com,
	linux@roeck-us.net
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	corbet@lwn.net,
	linux-doc@vger.kernel.org
Subject: [PATCH 0/2] hwmon: Add operating mode support for core and ina3221
Date: Tue,  9 Oct 2018 21:33:08 -0700
Message-Id: <20181010043310.30873-1-nicoleotsuka@gmail.com>
List-ID: <linux-hwmon@vger.kernel.org>

Add operating mode support in the core and ina3221.

Nicolin Chen (2):
  hwmon: (core) Add hwmon_mode structure and mode sysfs node
  hwmon: (ina3221) Add operating mode support

 Documentation/hwmon/sysfs-interface | 15 +++++
 drivers/hwmon/hwmon.c               | 87 ++++++++++++++++++++++++++---
 drivers/hwmon/ina3221.c             | 64 +++++++++++++++++++++
 include/linux/hwmon.h               | 24 ++++++++
 4 files changed, 183 insertions(+), 7 deletions(-)

-- 
2.17.1

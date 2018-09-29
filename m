Return-Path: <nicoleotsuka@gmail.com>
Return-path: <nicoleotsuka@gmail.com>
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: jdelvare@suse.com,
	linux@roeck-us.net
Cc: afd@ti.com,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] Add suspend and resume functions
Date: Sat, 29 Sep 2018 14:44:04 -0700
Message-Id: <20180929214407.27208-1-nicoleotsuka@gmail.com>
List-ID: <linux-hwmon@vger.kernel.org>

This series of patches add system suspend and resume functiosn for
ina3221 hwmon driver. To do so, it also needs two small fixes.

Changelog
v1->v2:
 * Added PATCH-2 to fix macros
 * Added power-down setting during suspend in PATCH-3

Nicolin Chen (3):
  hwmon: ina3221: Add INA3221_CONFIG to volatile_table
  hwmon: ina3221: Fix INA3221_CONFIG_MODE macros
  hwmon: ina3221: Add suspend and resume functions

 drivers/hwmon/ina3221.c | 71 ++++++++++++++++++++++++++++++++++++++---
 1 file changed, 67 insertions(+), 4 deletions(-)

-- 
2.17.1

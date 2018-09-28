Return-Path: <nicoleotsuka@gmail.com>
Return-path: <nicoleotsuka@gmail.com>
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: jdelvare@suse.com,
	linux@roeck-us.net
Cc: afd@ti.com,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] hwmon: ina3221: Add suspend and resume functions
Date: Fri, 28 Sep 2018 14:49:19 -0700
Message-Id: <20180928214921.11528-1-nicoleotsuka@gmail.com>
List-ID: <linux-hwmon@vger.kernel.org>

This series of patches add system suspend and resume functiosn for
ina3221 hwmon driver.

Nicolin Chen (2):
  hwmon: ina3221: Add INA3221_CONFIG to volatile_table
  hwmon: ina3221: Add suspend and resume functions

 drivers/hwmon/ina3221.c | 56 ++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 55 insertions(+), 1 deletion(-)

-- 
2.17.1

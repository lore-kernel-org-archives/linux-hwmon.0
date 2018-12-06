Return-Path: <groeck7@gmail.com>
Return-path: <groeck7@gmail.com>
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Jean Delvare <jdelvare@suse.com>,
	linux-kernel@vger.kernel.org,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 00/13] hwmon: Introduce SENSOR_DEVICE_ATTR_{RO, RW, WO} and variants
Date: Thu,  6 Dec 2018 11:22:20 -0800
Message-Id: <1544124153-23961-1-git-send-email-linux@roeck-us.net>
List-ID: <linux-hwmon@vger.kernel.org>

Introduce SENSOR_DEVICE_ATTR_{RO,RW,WO} and SENSOR_DEVICE_ATTR_2_{RO,RW,WO}
as simplified variants of SENSOR_DEVICE_ATTR and SENSOR_DEVICE_ATTR_2 to
simplify the source code, improve readbility, and reduce the chance of
inconsistencies.

This series introduces the new macros and converts some of the drivers.
The first patch was first submitted almost two years ago and has since
been dormant. It is unchanged from the first submission.

The driver conversion was done with the Coccinelle script at
https://github.com/groeck/coccinelle-patches/raw/master/hwmon/sensor-devattr-w6.cocci

This series targets v4.21 (v5.0). More conversions will follow with
subsequent kernel releases.

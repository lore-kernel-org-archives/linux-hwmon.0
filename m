Return-path: <mail@alexanderkoch.net>
From: Alexander Koch <mail@alexanderkoch.net>
To: linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jiri Kosina <trivial@kernel.org>,
	Alexander Koch <mail@alexanderkoch.net>
Subject: [RFC PATCH v2 0/4] hwmon: adc128d818: Support missing operation modes
Date: Fri, 23 Dec 2016 23:12:01 +0100
Message-Id: <20161223221205.8825-1-mail@alexanderkoch.net>
List-ID: <linux-hwmon@vger.kernel.org>

The ADC128D818 offers four different chip operation modes which vary in the
number and measurement types of the available input signals (see datasheet
sec. 8.4.1).

The current version of the driver only supports the default chip operation
mode (mode 0), providing seven analog values and a temperature reading.

This patch series adds support for operation modes 1-3, selectable through
the device tree attribute 'mode':

        adc1: adc128d818@1d {
                compatible = "ti,adc128d818";
                reg = <0x1d>;
                mode = /bits/ 8 <1>;
        };

The changes are transparent as 'mode' defaults to mode 0 which yields the
previous behaviour.


Changes from v1:
 - Add bindings document as first patch
 - Preserve logical atomicity of code changes
 - Improve sysfs device node handling (use is_visible() instead of
   duplicate attribute list)
 - Add trivial code refactoring stage for checkpatch.pl to succeed


Alexander Koch (4):
  devicetree: hwmon: Add bindings for ADC128D818
  hwmon: adc128d818: Implement mode selection via dt
  hwmon: adc128d818: Trivial code style fixup
  hwmon: adc128d818: Support operation modes 1-3

 .../devicetree/bindings/hwmon/adc128d818.txt       |  39 ++++
 drivers/hwmon/adc128d818.c                         | 237 ++++++++++++---------
 2 files changed, 179 insertions(+), 97 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/hwmon/adc128d818.txt

-- 
2.11.0

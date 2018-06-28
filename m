Return-Path: <andrew@lunn.ch>
Return-path: <andrew@lunn.ch>
From: Andrew Lunn <andrew@lunn.ch>
To: netdev <netdev@vger.kernel.org>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Russell King <rmk+kernel@arm.linux.org.uk>,
	vadimp@mellanox.com,
	linux-hwmon@vger.kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>
Subject: [PATCH RFC 0/2] HWMON support for SFP modules
Date: Thu, 28 Jun 2018 22:41:13 +0200
Message-Id: <1530218475-4369-1-git-send-email-andrew@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-ID: <linux-hwmon@vger.kernel.org>

This patchset adds HWMON support to SFP modules. The first patch adds
some attributes for power sensors which are currently missing from the
hwmon core. The second patch then extends the core SFP code to export
the sensors found in SFP modules.

This code has been tested with two SFP modules:

module OEM SFP-7000-85 rev 11.0 sn M1512220075 dc 160221
module FINISAR CORP. FTLF8524E2GNL rev A sn PW40MNN dc 160725

The anonymous module uses external calibration, while the FINISAR uses
internal calibration. Thus both code paths have been tested.

Andrew Lunn (2):
  hwmon: Add support for power min, lcrit, min_alarm and lcrit_alarm
  net: phy: sfp: Add HWMON support for module sensors

 drivers/hwmon/hwmon.c |   4 +
 drivers/net/phy/sfp.c | 732 ++++++++++++++++++++++++++++++++++++++++++
 include/linux/hwmon.h |   8 +
 include/linux/sfp.h   |  72 ++++-
 4 files changed, 815 insertions(+), 1 deletion(-)

-- 
2.18.0.rc2

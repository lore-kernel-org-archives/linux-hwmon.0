Return-Path: <andrew@lunn.ch>
Return-path: <andrew@lunn.ch>
From: Andrew Lunn <andrew@lunn.ch>
To: David Miller <davem@davemloft.net>,
	Guenter Roeck <linux@roeck-us.net>
Cc: netdev <netdev@vger.kernel.org>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Russell King <rmk+kernel@arm.linux.org.uk>,
	linux-hwmon@vger.kernel.org,
	Andrew Lunn <andrew@lunn.ch>
Subject: [PATCH net-next 0/4] HWMON support for SFP modules
Date: Tue, 17 Jul 2018 21:48:09 +0200
Message-Id: <1531856893-27884-1-git-send-email-andrew@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-ID: <linux-hwmon@vger.kernel.org>

This patchset adds HWMON support to SFP modules. The two patches add
some attributes for temperature and power sensors which are currently
missing from the hwmon core. The third patch adds a helper for
filtering out characters in hwmon names which are invalid. The last
patch then extends the core SFP code to export the sensors found in
SFP modules.

This code has been tested with two SFP modules:

module OEM SFP-7000-85 rev 11.0 sn M1512220075 dc 160221
module FINISAR CORP. FTLF8524E2GNL rev A sn PW40MNN dc 160725

The anonymous module uses external calibration, while the FINISAR uses
internal calibration. Thus both code paths have been tested.

Due to the cross subsystem nature of these patches, as discussed with
the RFC, it is hoped Guenter Roeck will ACK the patches, and then Dave
Miller will merge them all via net-next.

Andrew Lunn (4):
  hwmon: Add missing HWMON_T_LCRIT_ALARM define
  hwmon: Add support for power min, lcrit, min_alarm and lcrit_alarm
  hwmon: Add helper to tell if a char is invalid in a name
  net: phy: sfp: Add HWMON support for module sensors

 drivers/hwmon/hwmon.c   |   4 +
 drivers/net/phy/Kconfig |   1 +
 drivers/net/phy/sfp.c   | 727 ++++++++++++++++++++++++++++++++++++++++
 include/linux/hwmon.h   |  32 ++
 include/linux/sfp.h     |  72 +++-
 5 files changed, 835 insertions(+), 1 deletion(-)

-- 
2.18.0

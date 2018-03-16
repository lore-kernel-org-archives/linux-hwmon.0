Return-Path: <eajames@linux.vnet.ibm.com>
Return-path: <eajames@linux.vnet.ibm.com>
From: Eddie James <eajames@linux.vnet.ibm.com>
To: linux-hwmon@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, jdelvare@suse.com, linux@roeck-us.net,
        joel@jms.id.au, Eddie James <eajames@linux.vnet.ibm.com>
Subject: [PATCH v7 0/2] hwmon: (ucd9000) Add gpio and debugfs interfaces
Date: Fri, 16 Mar 2018 16:22:04 -0500
Message-Id: <1521235326-24310-1-git-send-email-eajames@linux.vnet.ibm.com>
List-ID: <linux-hwmon@vger.kernel.org>

The ucd9000 series chips have gpio pins. Add a gpio chip interface to the ucd
device so that users can query and set the state of the gpio pins.

Add a debugfs interface using the existing pmbus debugfs directory to provide
MFR_STATUS and the status of the gpi faults to users.

Changes since v6:
 - don't return null terminator for mfr_status

Changes since v5:
 - enclose gpio code in #ifdef GPIOLIB
 - don't initialize buffers for mfr_status; set last char to 0 instead
 - cap the size argument to bin2hex

Changes since v4:
 - max-sized buffers for smbus transfers
 - used bin2hex instead of my own code

Changes since v3:
 - remove setting of gpio_chip->owner
 - format the mfr_status data
 - switch to #ifdef rather than #if IS_ENABLED for debugfs

Changes since v2:
 - split the gpio registration into it's own function

Changes since v1:
 - dropped dev_err messages
 - made gpio chip registration conditional on having gpio pins
 - made mfr_status debugfs attribute more simple


Christopher Bostic (2):
  hwmon: (ucd9000) Add gpio chip interface
  hwmon: (ucd9000) Add debugfs attributes to provide mfr_status

 drivers/hwmon/pmbus/ucd9000.c | 350 +++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 349 insertions(+), 1 deletion(-)

-- 
1.8.3.1

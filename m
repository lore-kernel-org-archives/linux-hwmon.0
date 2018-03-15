Return-Path: <eajames@linux.vnet.ibm.com>
Return-path: <eajames@linux.vnet.ibm.com>
From: Eddie James <eajames@linux.vnet.ibm.com>
To: linux-hwmon@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, jdelvare@suse.com, linux@roeck-us.net,
        joel@jms.id.au, andy.shevchenko@gmail.com,
        Eddie James <eajames@linux.vnet.ibm.com>
Subject: [PATCH v5 0/2] hwmon: (ucd9000) Add gpio and debugfs interfaces
Date: Thu, 15 Mar 2018 17:21:54 -0500
Message-Id: <1521152516-10829-1-git-send-email-eajames@linux.vnet.ibm.com>
List-ID: <linux-hwmon@vger.kernel.org>

The ucd9000 series chips have gpio pins. Add a gpio chip interface to the ucd
device so that users can query and set the state of the gpio pins.

Add a debugfs interface using the existing pmbus debugfs directory to provide
MFR_STATUS and the status of the gpi faults to users.

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

 drivers/hwmon/pmbus/ucd9000.c | 338 +++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 337 insertions(+), 1 deletion(-)

-- 
1.8.3.1

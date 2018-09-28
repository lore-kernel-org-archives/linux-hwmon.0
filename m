Return-Path: <SRS0=0/YT=MK=vger.kernel.org=linux-kernel-owner@kernel.org>
From: Joe Perches <joe@perches.com>
To: linux-kernel@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
Subject: Bad MAINTAINERS pattern in section 'MAX20751 HARDWARE MONITOR DRIVER'
Date: Fri, 28 Sep 2018 14:55:15 -0700
Message-Id: <20180928215516.30001-1-joe@perches.com>
Sender: linux-kernel-owner@vger.kernel.org
List-Archive: <https://lore.kernel.org/lkml/>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-ID: <linux-hwmon@vger.kernel.org>

Please fix this defect appropriately.

linux-next MAINTAINERS section:

	8835	MAX20751 HARDWARE MONITOR DRIVER
	8836	M:	Guenter Roeck <linux@roeck-us.net>
	8837	L:	linux-hwmon@vger.kernel.org
	8838	S:	Maintained
	8839	F:	Documentation/hwmon/max20751
-->	8840	F:	drivers/hwmon/max20751.c

Commit that introduced this:

commit 1f61cab8a729e00af77b51b44c3a8dc8ef3b3eb9
 Author: Guenter Roeck <linux@roeck-us.net>
 Date:   Mon Jun 8 11:15:23 2015 -0700
 
     hwmon: (pmbus) Add support for MAX20751
     
     MAX20751 is a multiphase power controller with internal buck converter.
     It uses VR12.0 to report the output voltage. This requires an explicit
     driver, since the VR version can not be auto-detected.
     
     The chip supports a manufacturer specific command to fine-tune the output
     voltage.  This command is not currently supported.
     
     Signed-off-by: Guenter Roeck <linux@roeck-us.net>
 
  Documentation/hwmon/max20751   | 77 ++++++++++++++++++++++++++++++++++++++++++
  MAINTAINERS                    |  7 ++++
  drivers/hwmon/pmbus/Kconfig    | 10 ++++++
  drivers/hwmon/pmbus/Makefile   |  1 +
  drivers/hwmon/pmbus/max20751.c | 64 +++++++++++++++++++++++++++++++++++
  5 files changed, 159 insertions(+)

No commit with drivers/hwmon/max20751.c found

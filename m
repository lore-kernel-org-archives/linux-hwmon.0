Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail.zhinst.com ([212.126.164.98]:49904 "EHLO mail.zhinst.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S964853AbcKXNfU (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 24 Nov 2016 08:35:20 -0500
From: Tobias Klauser <tklauser@distanz.ch>
To: Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [PATCH] hwmon: (lm90) Mention support for TI TMP451 in Kconfig description
Date: Thu, 24 Nov 2016 14:34:25 +0100
Message-Id: <20161124133425.6475-1-tklauser@distanz.ch>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

The lm90 driver also supports the Texas Instruments TMP451 sensor chip.
Since the Kconfig description for the driver includes a list of all
compatible chips, mention the TI TMP451 there as well.

Signed-off-by: Tobias Klauser <tklauser@distanz.ch>
---
 drivers/hwmon/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 8681bc65cde5..1adda8a5adce 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -1079,8 +1079,8 @@ config SENSORS_LM90
 	  LM86, LM89 and LM99, Analog Devices ADM1032, ADT7461, and ADT7461A,
 	  Maxim MAX6646, MAX6647, MAX6648, MAX6649, MAX6657, MAX6658, MAX6659,
 	  MAX6680, MAX6681, MAX6692, MAX6695, MAX6696, ON Semiconductor NCT1008,
-	  Winbond/Nuvoton W83L771W/G/AWG/ASG, Philips SA56004, and GMT G781
-	  sensor chips.
+	  Winbond/Nuvoton W83L771W/G/AWG/ASG, Philips SA56004, GMT G781, and
+	  Texas Instruments TMP451 sensor chips.
 
 	  This driver can also be built as a module.  If so, the module
 	  will be called lm90.
-- 
2.11.0.rc0.7.gbe5a750



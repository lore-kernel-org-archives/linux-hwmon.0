Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:55385 "EHLO
        out3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S932108AbdGJN5D (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 10 Jul 2017 09:57:03 -0400
From: Andrew Jeffery <andrew@aj.id.au>
To: linux@roeck-us.net, linux-hwmon@vger.kernel.org
Cc: Andrew Jeffery <andrew@aj.id.au>, jdelvare@suse.com,
        linux-kernel@vger.kernel.org, joel@jms.id.au,
        openbmc@lists.ozlabs.org, msbarth@linux.vnet.ibm.com,
        mspinler@linux.vnet.ibm.com
Subject: [RFC PATCH 1/4] hwmon: pmbus: Disable build of non-max31785 drivers
Date: Mon, 10 Jul 2017 23:26:15 +0930
Message-Id: <20170710135618.13661-2-andrew@aj.id.au>
In-Reply-To: <20170710135618.13661-1-andrew@aj.id.au>
References: <20170710135618.13661-1-andrew@aj.id.au>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
Later patches make incompatible changes to struct pmbus_driver_info, so this
serves to keep the following patches buildable under otherwise incompatible
configurations. It is a junk patch that won't be present in a non-RFC series.

 drivers/hwmon/pmbus/Makefile | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
index 562132054aaf..24ff7ee7f8bb 100644
--- a/drivers/hwmon/pmbus/Makefile
+++ b/drivers/hwmon/pmbus/Makefile
@@ -4,15 +4,15 @@
 
 obj-$(CONFIG_PMBUS)		+= pmbus_core.o
 obj-$(CONFIG_SENSORS_PMBUS)	+= pmbus.o
-obj-$(CONFIG_SENSORS_ADM1275)	+= adm1275.o
-obj-$(CONFIG_SENSORS_LM25066)	+= lm25066.o
-obj-$(CONFIG_SENSORS_LTC2978)	+= ltc2978.o
-obj-$(CONFIG_SENSORS_LTC3815)	+= ltc3815.o
-obj-$(CONFIG_SENSORS_MAX16064)	+= max16064.o
-obj-$(CONFIG_SENSORS_MAX20751)	+= max20751.o
-obj-$(CONFIG_SENSORS_MAX34440)	+= max34440.o
-obj-$(CONFIG_SENSORS_MAX8688)	+= max8688.o
-obj-$(CONFIG_SENSORS_TPS40422)	+= tps40422.o
-obj-$(CONFIG_SENSORS_UCD9000)	+= ucd9000.o
-obj-$(CONFIG_SENSORS_UCD9200)	+= ucd9200.o
-obj-$(CONFIG_SENSORS_ZL6100)	+= zl6100.o
+# obj-$(CONFIG_SENSORS_ADM1275)	+= adm1275.o
+# obj-$(CONFIG_SENSORS_LM25066)	+= lm25066.o
+# obj-$(CONFIG_SENSORS_LTC2978)	+= ltc2978.o
+# obj-$(CONFIG_SENSORS_LTC3815)	+= ltc3815.o
+# obj-$(CONFIG_SENSORS_MAX16064)	+= max16064.o
+# obj-$(CONFIG_SENSORS_MAX20751)	+= max20751.o
+# obj-$(CONFIG_SENSORS_MAX34440)	+= max34440.o
+# obj-$(CONFIG_SENSORS_MAX8688)	+= max8688.o
+# obj-$(CONFIG_SENSORS_TPS40422)	+= tps40422.o
+# obj-$(CONFIG_SENSORS_UCD9000)	+= ucd9000.o
+# obj-$(CONFIG_SENSORS_UCD9200)	+= ucd9200.o
+# obj-$(CONFIG_SENSORS_ZL6100)	+= zl6100.o
-- 
2.11.0


Return-Path: <SRS0=HmyG=SM=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D418C10F11
	for <linux-hwmon@archiver.kernel.org>; Wed, 10 Apr 2019 10:47:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E5F7220830
	for <linux-hwmon@archiver.kernel.org>; Wed, 10 Apr 2019 10:47:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730708AbfDJKr3 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 10 Apr 2019 06:47:29 -0400
Received: from mx2.suse.de ([195.135.220.15]:53952 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730706AbfDJKr3 (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 10 Apr 2019 06:47:29 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 464F6AEC8;
        Wed, 10 Apr 2019 10:47:28 +0000 (UTC)
Date:   Wed, 10 Apr 2019 12:47:26 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     linux-hwmon@vger.kernel.org
Cc:     Eddie James <eajames@linux.ibm.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH v2 1/2] hwmon: (occ) Move common code to a separate module
Message-ID: <20190410124726.2d7e9d38@endymion>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.13.2 (GTK+ 2.24.31; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Instead of duplicating the common code into the 2 (binary) drivers,
move the common code to a separate module. This is cleaner.

Signed-off-by: Jean Delvare <jdelvare@suse.de>
Cc: Eddie James <eajames@linux.ibm.com>
Cc: Guenter Roeck <linux@roeck-us.net>
---
Eddie, can you please give it a try and confirm it works?

Note: I kept the module names as they were before, hence the extra
"*-objs :=" statements. They could be removed if we rename the source
files, but that's better done in git directly. I don't mind either way
personally.

 drivers/hwmon/occ/Kconfig  |    3 +--
 drivers/hwmon/occ/Makefile |    6 ++++--
 drivers/hwmon/occ/common.c |    7 +++++++
 drivers/hwmon/occ/sysfs.c  |    2 ++
 4 files changed, 14 insertions(+), 4 deletions(-)

--- linux-5.0.orig/drivers/hwmon/occ/Kconfig	2019-04-10 11:30:05.579537638 +0200
+++ linux-5.0/drivers/hwmon/occ/Kconfig	2019-04-10 11:31:20.843383376 +0200
@@ -27,5 +27,4 @@ config SENSORS_OCC_P9_SBE
 	 called occ-p9-hwmon.
 
 config SENSORS_OCC
-	bool "POWER On-Chip Controller"
-	depends on SENSORS_OCC_P8_I2C || SENSORS_OCC_P9_SBE
+	tristate
--- linux-5.0.orig/drivers/hwmon/occ/Makefile	2019-03-04 00:21:29.000000000 +0100
+++ linux-5.0/drivers/hwmon/occ/Makefile	2019-04-10 11:33:23.631765535 +0200
@@ -1,5 +1,7 @@
-occ-p8-hwmon-objs := common.o sysfs.o p8_i2c.o
-occ-p9-hwmon-objs := common.o sysfs.o p9_sbe.o
+occ-hwmon-common-objs := common.o sysfs.o
+occ-p8-hwmon-objs := p8_i2c.o
+occ-p9-hwmon-objs := p9_sbe.o
 
+obj-$(CONFIG_SENSORS_OCC) += occ-hwmon-common.o
 obj-$(CONFIG_SENSORS_OCC_P8_I2C) += occ-p8-hwmon.o
 obj-$(CONFIG_SENSORS_OCC_P9_SBE) += occ-p9-hwmon.o
--- linux-5.0.orig/drivers/hwmon/occ/common.c	2019-03-04 00:21:29.000000000 +0100
+++ linux-5.0/drivers/hwmon/occ/common.c	2019-04-10 11:44:53.035573580 +0200
@@ -1,11 +1,13 @@
 // SPDX-License-Identifier: GPL-2.0
 
 #include <linux/device.h>
+#include <linux/export.h>
 #include <linux/hwmon.h>
 #include <linux/hwmon-sysfs.h>
 #include <linux/jiffies.h>
 #include <linux/kernel.h>
 #include <linux/math64.h>
+#include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/sysfs.h>
 #include <asm/unaligned.h>
@@ -1096,3 +1098,8 @@ int occ_setup(struct occ *occ, const cha
 
 	return rc;
 }
+EXPORT_SYMBOL_GPL(occ_setup);
+
+MODULE_AUTHOR("Eddie James <eajames@linux.ibm.com>");
+MODULE_DESCRIPTION("Common OCC hwmon code");
+MODULE_LICENSE("GPL");
--- linux-5.0.orig/drivers/hwmon/occ/sysfs.c	2019-03-04 00:21:29.000000000 +0100
+++ linux-5.0/drivers/hwmon/occ/sysfs.c	2019-04-10 11:39:38.627003382 +0200
@@ -12,6 +12,7 @@
 
 #include <linux/bitops.h>
 #include <linux/device.h>
+#include <linux/export.h>
 #include <linux/hwmon-sysfs.h>
 #include <linux/kernel.h>
 #include <linux/sysfs.h>
@@ -186,3 +187,4 @@ void occ_shutdown(struct occ *occ)
 {
 	sysfs_remove_group(&occ->bus_dev->kobj, &occ_sysfs);
 }
+EXPORT_SYMBOL_GPL(occ_shutdown);


-- 
Jean Delvare
SUSE L3 Support

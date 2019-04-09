Return-Path: <SRS0=FEvN=SL=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71509C10F0E
	for <linux-hwmon@archiver.kernel.org>; Tue,  9 Apr 2019 12:45:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3A18720855
	for <linux-hwmon@archiver.kernel.org>; Tue,  9 Apr 2019 12:45:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726463AbfDIMpM (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 9 Apr 2019 08:45:12 -0400
Received: from mx2.suse.de ([195.135.220.15]:49270 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726352AbfDIMpL (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 9 Apr 2019 08:45:11 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id BC309AECE;
        Tue,  9 Apr 2019 12:45:10 +0000 (UTC)
Date:   Tue, 9 Apr 2019 14:45:09 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     linux-hwmon@vger.kernel.org
Cc:     Eddie James <eajames@linux.ibm.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH] hwmon: OCC drivers are PowerPC-only
Message-ID: <20190409144509.19da00c4@endymion>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.13.2 (GTK+ 2.24.31; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Don't propose PowerPC-only drivers on other architectures, unless
build-testing.

Also drop configuration symbol SENSORS_OCC which serves no purpose
that I can see.

Signed-off-by: Jean Delvare <jdelvare@suse.de>
Cc: Eddie James <eajames@linux.ibm.com>
Cc: Guenter Roeck <linux@roeck-us.net>
---
SENSORS_OCC *would* serve a purpose if the common code between the
POWER8 driver and the POWER9 driver would go in a separate, shared
module, and occ-p8-hwmon and occ-p9-hwmon would only contain the
specific code. This would avoid packaging the same code twice in 2
separate modules, therefore saving some storage space for ppc
distributions.

As far as I can see, this would simply require exporting 2 functions
(occ_setup and occ_shutdown). Is there any reason why things were not
done that way in the first place? This would look cleaner to me.

 drivers/hwmon/Makefile    |    2 +-
 drivers/hwmon/occ/Kconfig |    8 ++------
 2 files changed, 3 insertions(+), 7 deletions(-)

--- linux-5.0.orig/drivers/hwmon/occ/Kconfig	2019-03-04 00:21:29.000000000 +0100
+++ linux-5.0/drivers/hwmon/occ/Kconfig	2019-04-09 14:08:41.316551071 +0200
@@ -5,7 +5,7 @@
 config SENSORS_OCC_P8_I2C
 	tristate "POWER8 OCC through I2C"
 	depends on I2C
-	select SENSORS_OCC
+	depends on POWERPC || COMPILE_TEST
 	help
 	 This option enables support for monitoring sensors provided by the
 	 On-Chip Controller (OCC) on a POWER8 processor. Communications with
@@ -17,7 +17,7 @@ config SENSORS_OCC_P8_I2C
 config SENSORS_OCC_P9_SBE
 	tristate "POWER9 OCC through SBE"
 	depends on FSI_OCC
-	select SENSORS_OCC
+	depends on POWERPC || COMPILE_TEST
 	help
 	 This option enables support for monitoring sensors provided by the
 	 On-Chip Controller (OCC) on a POWER9 processor. Communications with
@@ -25,7 +25,3 @@ config SENSORS_OCC_P9_SBE
 
 	 This driver can also be built as a module. If so, the module will be
 	 called occ-p9-hwmon.
-
-config SENSORS_OCC
-	bool "POWER On-Chip Controller"
-	depends on SENSORS_OCC_P8_I2C || SENSORS_OCC_P9_SBE
--- linux-5.0.orig/drivers/hwmon/Makefile	2019-03-04 00:21:29.000000000 +0100
+++ linux-5.0/drivers/hwmon/Makefile	2019-04-09 14:33:49.605510047 +0200
@@ -178,7 +178,7 @@ obj-$(CONFIG_SENSORS_WM831X)	+= wm831x-h
 obj-$(CONFIG_SENSORS_WM8350)	+= wm8350-hwmon.o
 obj-$(CONFIG_SENSORS_XGENE)	+= xgene-hwmon.o
 
-obj-$(CONFIG_SENSORS_OCC)	+= occ/
+obj-y				+= occ/
 obj-$(CONFIG_PMBUS)		+= pmbus/
 
 ccflags-$(CONFIG_HWMON_DEBUG_CHIP) := -DDEBUG


-- 
Jean Delvare
SUSE L3 Support

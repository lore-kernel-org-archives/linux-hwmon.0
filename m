Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F5F0C433EF
	for <linux-hwmon@archiver.kernel.org>; Fri, 27 May 2022 15:34:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345156AbiE0Pe4 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 27 May 2022 11:34:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243719AbiE0Pe4 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 27 May 2022 11:34:56 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E28E8FC4FA
        for <linux-hwmon@vger.kernel.org>; Fri, 27 May 2022 08:34:54 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1nubzG-0007qn-SR; Fri, 27 May 2022 17:34:50 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1nubzG-004ta7-Bt; Fri, 27 May 2022 17:34:49 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1nubzE-00CUG0-CZ; Fri, 27 May 2022 17:34:48 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH] hwmon: Allow to compile ASB100 and FSCHMD on !X86
Date:   Fri, 27 May 2022 17:34:45 +0200
Message-Id: <20220527153445.1871086-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1102; h=from:subject; bh=C+GYJi4be98zVXruItqwZLQdAdUHUC8/drcMw1dV+2U=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBikO+RbkOWZJDej8NHUv8Egfh0Kk+HHdirh3AGYVMf oFSf86mJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCYpDvkQAKCRDB/BR4rcrsCfbwCA CPWDL0FoO2Oxo7ND0SqC9poNaqElhzrBTAgcnJ1z4Pn5gyMIUOF3WFxj1NbW9tHGPs9N/o+g3yyto2 5JS3vnn6MAfqvvKZcIIKPlYbhd6N8RYqtGsPeYudeNsaRS2IXVXcCUFYi1ram55KVi8UO5IkaAxGeo 139zx6x0KeuqbY4Np9Iv7idqQF0vqcTrK0ckYETVIXf6dfF6+6YPlB0ywaDaAgnlKF5lM/wLiBgCxt YVqJ24hJG6jyFmztybWd0mdF2swx5Y6rN5yuNGzwjMafDpDMeLV5dddjoyx+3amiPaRKyrPN7dkiMR FNq3F6wznYvL0J/CpqZlQBXJsS8vfS
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-hwmon@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

The two drivers compile just fine on ARCH=arm. Allow to select
these drivers if COMPILE_TEST is enabled.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/hwmon/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index f2b038fa3b84..ccd0df5e6b5e 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -378,7 +378,7 @@ config SENSORS_ARM_SCPI
 
 config SENSORS_ASB100
 	tristate "Asus ASB100 Bach"
-	depends on X86 && I2C
+	depends on (X86 || COMPILE_TEST) && I2C
 	select HWMON_VID
 	help
 	  If you say yes here you get support for the ASB100 Bach sensor
@@ -621,7 +621,7 @@ config SENSORS_MC13783_ADC
 
 config SENSORS_FSCHMD
 	tristate "Fujitsu Siemens Computers sensor chips"
-	depends on X86 && I2C
+	depends on (X86 || COMPILE_TEST) && I2C
 	help
 	  If you say yes here you get support for the following Fujitsu
 	  Siemens Computers (FSC) sensor chips: Poseidon, Scylla, Hermes,

base-commit: 4b0986a3613c92f4ec1bdc7f60ec66fea135991f
-- 
2.36.1


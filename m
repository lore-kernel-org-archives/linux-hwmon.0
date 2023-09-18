Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A789CD3421
	for <linux-hwmon@archiver.kernel.org>; Mon, 18 Sep 2023 09:04:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241056AbjIRJBB (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 18 Sep 2023 05:01:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240924AbjIRJAS (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 18 Sep 2023 05:00:18 -0400
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9A1918D
        for <linux-hwmon@vger.kernel.org>; Mon, 18 Sep 2023 02:00:04 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiA6o-0008IP-Hf; Mon, 18 Sep 2023 10:59:58 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiA6m-007B5j-KP; Mon, 18 Sep 2023 10:59:56 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiA6m-002Z8j-BD; Mon, 18 Sep 2023 10:59:56 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     Alistair John Strachan <alistair@devzero.co.uk>,
        Hans de Goede <hdegoede@redhat.com>,
        linux-hwmon@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 01/24] hwmon: (abitguru{,3}) Enable build testing on !X86
Date:   Mon, 18 Sep 2023 10:59:28 +0200
Message-Id: <20230918085951.1234172-2-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230918085951.1234172-1-u.kleine-koenig@pengutronix.de>
References: <20230918085951.1234172-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1128; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=Rj9hWijlZJ1jXilABPCHA0zWEHk6lFehoTJvNUwnOCU=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlCBAr0Mj3rLktnJWlqi5VOa2vO9lVDbT8umQqV PxfXeTX79yJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZQgQKwAKCRCPgPtYfRL+ Tp79B/wNRJpGObhtSdIsOKA4zpYnFHNASTWzmPaKS2kGXQF5dyodJrA/eB2TJM5dVOsl1fskRL8 /VyBy7VxzKchCJMipwzPdofN0W9XvYbkLkp/OUHk505aXS1BfOBOdjddMwN1zetu8XeY2zu1WNj I6n/96HpAZ9qi5LvQklvXO8bNAQaLkMzRgvZ+JlUG5mhR6w7gxqlvPey+B7E0g+iX0DutU76VmO F/5tW+kmCh61sDUFNimmcUoTFXJYoRB1mXjlPneLiu2xISKAbZmK0nu8bvSIo3fhZYfkF/XWwfi At+1P43gcpBkiXEF+89klWb3cedIDEtdrb8mHsUBusH9ryCf
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-hwmon@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

The two drivers compile fine on arm64, powerpc, m68k and s390. So make
it possible to enable the drivers in the presence of COMPILE_TEST.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/hwmon/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index ea390da7bc75..e36f58b01f2d 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -40,7 +40,7 @@ comment "Native drivers"
 
 config SENSORS_ABITUGURU
 	tristate "Abit uGuru (rev 1 & 2)"
-	depends on X86 && DMI
+	depends on (X86 && DMI) || COMPILE_TEST
 	help
 	  If you say yes here you get support for the sensor part of the first
 	  and second revision of the Abit uGuru chip. The voltage and frequency
@@ -55,7 +55,7 @@ config SENSORS_ABITUGURU
 
 config SENSORS_ABITUGURU3
 	tristate "Abit uGuru (rev 3)"
-	depends on X86 && DMI
+	depends on (X86 && DMI) || COMPILE_TEST
 	help
 	  If you say yes here you get support for the sensor part of the
 	  third revision of the Abit uGuru chip. Only reading the sensors
-- 
2.40.1


Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B753BC38A2D
	for <linux-hwmon@archiver.kernel.org>; Mon, 24 Oct 2022 08:27:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230297AbiJXI1v (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 24 Oct 2022 04:27:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230342AbiJXI1o (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 24 Oct 2022 04:27:44 -0400
X-Greylist: delayed 529 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 24 Oct 2022 01:27:35 PDT
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95E944E632
        for <linux-hwmon@vger.kernel.org>; Mon, 24 Oct 2022 01:27:34 -0700 (PDT)
Received: by codeconstruct.com.au (Postfix, from userid 10000)
        id CBCF720059; Mon, 24 Oct 2022 16:17:07 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=codeconstruct.com.au; s=2022a; t=1666599427;
        bh=JrEBTwOG7v2/4H4f/pIwYoh39o7FhQjoxViIeO3LKuE=;
        h=From:To:Cc:Subject:Date;
        b=MX8zQkvUVJPPJ7sisM+gIlA6INazybqz1x3FzQPYHf3027fDehmd2LngvDZqjtc7t
         L+9xEhlJX/nIbmfMw4qXpxJMSvSSz7VekUDSQahWLsDf1UFaHqWApeWuqki0s7vQ8W
         /2W6JXc/0G6RQbo+gMxi1TLdrk054BHIk89dHVKgifegH8paqQ2EpFE67EbrI5Et2e
         tvEyCC2T/hFKo3tIm/rs0q2pL26hvBNN3XmgZuWLli4l73NnSp8vKhmcVHF4CKgXjl
         e1RhEXekDrUivjJ0Asd/SSVpPhGMVX/j0BGTnIUUDSwSiPz5GOlp/H1BoluUEYh509
         rmi3qpXs+WpgQ==
From:   Jeremy Kerr <jk@codeconstruct.com.au>
To:     linux-hwmon@vger.kernel.org
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Eddie James <eajames@linux.ibm.com>,
        Joel Stanley <joel@jms.id.au>
Subject: [PATCH] hwmon/occ: OCC sensors aren't arch-specific
Date:   Mon, 24 Oct 2022 16:15:27 +0800
Message-Id: <20221024081527.3842565-1-jk@codeconstruct.com.au>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Commit c112d75840fb ("hwmon: OCC drivers are ARM-only") made the OCC
sensor drivers not selectable on powerpc64:

  These drivers are for a BMC inside PowerPC servers. The BMC runs on
  ARM hardware, so only propose the drivers on this architecture, unless
  build-testing.

... but we now have a powerpc64 BMC (still for a powerpc64 host), so
drop the `depends on` that excludes building for this platform.

Signed-off-by: Jeremy Kerr <jk@codeconstruct.com.au>
---
 drivers/hwmon/occ/Kconfig | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/hwmon/occ/Kconfig b/drivers/hwmon/occ/Kconfig
index 35a7070db827..348c21100a37 100644
--- a/drivers/hwmon/occ/Kconfig
+++ b/drivers/hwmon/occ/Kconfig
@@ -6,7 +6,6 @@
 config SENSORS_OCC_P8_I2C
 	tristate "POWER8 OCC through I2C"
 	depends on I2C
-	depends on ARM || ARM64 || COMPILE_TEST
 	select SENSORS_OCC
 	help
 	 This option enables support for monitoring sensors provided by the
@@ -21,7 +20,6 @@ config SENSORS_OCC_P8_I2C
 config SENSORS_OCC_P9_SBE
 	tristate "POWER9 OCC through SBE"
 	depends on FSI_OCC
-	depends on ARM || ARM64 || COMPILE_TEST
 	select SENSORS_OCC
 	help
 	 This option enables support for monitoring sensors provided by the
-- 
2.35.1


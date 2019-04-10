Return-Path: <SRS0=HmyG=SM=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE87AC10F14
	for <linux-hwmon@archiver.kernel.org>; Wed, 10 Apr 2019 10:56:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C6C2E20830
	for <linux-hwmon@archiver.kernel.org>; Wed, 10 Apr 2019 10:56:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730609AbfDJK4h (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 10 Apr 2019 06:56:37 -0400
Received: from mx2.suse.de ([195.135.220.15]:55568 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729503AbfDJK4h (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 10 Apr 2019 06:56:37 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 5A089AFBB;
        Wed, 10 Apr 2019 10:56:36 +0000 (UTC)
Date:   Wed, 10 Apr 2019 12:56:35 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     linux-hwmon@vger.kernel.org
Cc:     Eddie James <eajames@linux.ibm.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH v2 2/2] hwmon: OCC drivers are ARM-only
Message-ID: <20190410125635.5610857b@endymion>
In-Reply-To: <20190410124726.2d7e9d38@endymion>
References: <20190410124726.2d7e9d38@endymion>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.13.2 (GTK+ 2.24.31; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

These drivers are for a BMC inside PowerPC servers. The BMC runs on
ARM hardware, so only propose the drivers on this architecture, unless
build-testing.

Signed-off-by: Jean Delvare <jdelvare@suse.de>
Cc: Eddie James <eajames@linux.ibm.com>
Cc: Guenter Roeck <linux@roeck-us.net>
---
If PowerPC BMCs are ever based on another architecture and these drivers
are compatible with them, then the list can be extended.

 drivers/hwmon/occ/Kconfig |    2 ++
 1 file changed, 2 insertions(+)

--- linux-5.0.orig/drivers/hwmon/occ/Kconfig	2019-04-10 11:54:07.014895111 +0200
+++ linux-5.0/drivers/hwmon/occ/Kconfig	2019-04-10 12:12:27.379725640 +0200
@@ -5,6 +5,7 @@
 config SENSORS_OCC_P8_I2C
 	tristate "POWER8 OCC through I2C"
 	depends on I2C
+	depends on ARM || ARM64 || COMPILE_TEST
 	select SENSORS_OCC
 	help
 	 This option enables support for monitoring sensors provided by the
@@ -17,6 +18,7 @@ config SENSORS_OCC_P8_I2C
 config SENSORS_OCC_P9_SBE
 	tristate "POWER9 OCC through SBE"
 	depends on FSI_OCC
+	depends on ARM || ARM64 || COMPILE_TEST
 	select SENSORS_OCC
 	help
 	 This option enables support for monitoring sensors provided by the

-- 
Jean Delvare
SUSE L3 Support

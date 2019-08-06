Return-Path: <SRS0=UELc=WC=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA232C31E40
	for <linux-hwmon@archiver.kernel.org>; Tue,  6 Aug 2019 08:21:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AC6D62070D
	for <linux-hwmon@archiver.kernel.org>; Tue,  6 Aug 2019 08:21:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728918AbfHFIVZ (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 6 Aug 2019 04:21:25 -0400
Received: from mx2.suse.de ([195.135.220.15]:53002 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727259AbfHFIVZ (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 6 Aug 2019 04:21:25 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 2BFAFAF1D;
        Tue,  6 Aug 2019 08:21:24 +0000 (UTC)
Date:   Tue, 6 Aug 2019 10:21:23 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     linux-hwmon@vger.kernel.org
Cc:     Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH] hwmon: w83795: Fan control option isn't that dangerous
Message-ID: <20190806102123.3118bcc5@endymion>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

I have been using SENSORS_W83795_FANCTRL for several years and never
had any problem. When the driver was added, I had not tested that
part of the driver yet so I wanted to be super cautious, but time has
shown that it works just fine.

In the long run I even believe that we should drop the option and
enable the feature unconditionally. It doesn't do anything until the
user explicitly starts twiddling with sysfs attributes anyway.

Signed-off-by: Jean Delvare <jdelvare@suse.de>
---
 drivers/hwmon/Kconfig |    7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

--- linux-5.2.orig/drivers/hwmon/Kconfig	2019-07-08 00:41:56.000000000 +0200
+++ linux-5.2/drivers/hwmon/Kconfig	2019-08-06 09:55:16.344547556 +0200
@@ -1834,17 +1834,12 @@ config SENSORS_W83795
 	  will be called w83795.
 
 config SENSORS_W83795_FANCTRL
-	bool "Include automatic fan control support (DANGEROUS)"
+	bool "Include automatic fan control support"
 	depends on SENSORS_W83795
 	help
 	  If you say yes here, support for automatic fan speed control
 	  will be included in the driver.
 
-	  This part of the code wasn't carefully reviewed and tested yet,
-	  so enabling this option is strongly discouraged on production
-	  servers. Only developers and testers should enable it for the
-	  time being.
-
 	  Please also note that this option will create sysfs attribute
 	  files which may change in the future, so you shouldn't rely
 	  on them being stable.


-- 
Jean Delvare
SUSE L3 Support

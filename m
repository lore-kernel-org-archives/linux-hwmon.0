Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4FE0C433E9
	for <linux-hwmon@archiver.kernel.org>; Sat, 30 Jan 2021 10:27:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5A4AC64DE4
	for <linux-hwmon@archiver.kernel.org>; Sat, 30 Jan 2021 10:27:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230002AbhA3K1J (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 30 Jan 2021 05:27:09 -0500
Received: from lnfm1.sai.msu.ru ([93.180.26.255]:57625 "EHLO lnfm1.sai.msu.ru"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231792AbhA3K1A (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 30 Jan 2021 05:27:00 -0500
X-Greylist: delayed 699 seconds by postgrey-1.27 at vger.kernel.org; Sat, 30 Jan 2021 05:26:59 EST
Received: from dragon.sai.msu.ru (dragon.sai.msu.ru [93.180.26.172])
        by lnfm1.sai.msu.ru (8.14.1/8.12.8) with ESMTP id 10UAAqmE015160;
        Sat, 30 Jan 2021 13:10:57 +0300
Received: from oak.local (unknown [83.167.113.121])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (Client did not present a certificate)
        by dragon.sai.msu.ru (Postfix) with ESMTPSA id 74A7077FB;
        Sat, 30 Jan 2021 13:10:53 +0300 (MSK)
From:   "Matwey V. Kornilov" <matwey@sai.msu.ru>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Javier Martinez Canillas <javier@osg.samsung.com>,
        linux-hwmon@vger.kernel.org (open list:HARDWARE MONITORING),
        linux-kernel@vger.kernel.org (open list)
Cc:     matwey.kornilov@gmail.com,
        "Matwey V. Kornilov" <matwey@sai.msu.ru>,
        linux-hwmon@vger.kernel.org (open list:HARDWARE MONITORING),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] hwmon: lm75: Use zero lm75_type for lm75
Date:   Sat, 30 Jan 2021 13:10:38 +0300
Message-Id: <20210130101038.26331-1-matwey@sai.msu.ru>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

There is a logical flaw in lm75_probe() function introduced in

    e97a45f1b460 ("hwmon: (lm75) Add OF device ID table")

Note, that of_device_get_match_data() returns NULL when no match
found. This is the case when OF node exists but has unknown
compatible line, while the module is still loaded via i2c
detection.

arch/powerpc/boot/dts/fsl/p2041rdb.dts:

    lm75b@48 {
    	compatible = "nxp,lm75a";
    	reg = <0x48>;
    };

In this case, the sensor is mistakenly considered as ADT75 variant.
The simplest way to handle this issue is to make the LM75 code
zero.

Fixes: e97a45f1b460 ("hwmon: (lm75) Add OF device ID table")
Signed-off-by: Matwey V. Kornilov <matwey@sai.msu.ru>
---
 drivers/hwmon/lm75.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/lm75.c b/drivers/hwmon/lm75.c
index e447febd121a..3aa7f9454f57 100644
--- a/drivers/hwmon/lm75.c
+++ b/drivers/hwmon/lm75.c
@@ -25,12 +25,12 @@
  */
 
 enum lm75_type {		/* keep sorted in alphabetical order */
+	lm75 = 0,		/* except of lm75 which is default fallback */
 	adt75,
 	ds1775,
 	ds75,
 	ds7505,
 	g751,
-	lm75,
 	lm75a,
 	lm75b,
 	max6625,
-- 
2.26.2


Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02CAEC433E9
	for <linux-hwmon@archiver.kernel.org>; Tue,  2 Feb 2021 14:27:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B250F64EAC
	for <linux-hwmon@archiver.kernel.org>; Tue,  2 Feb 2021 14:27:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234418AbhBBO1h (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 2 Feb 2021 09:27:37 -0500
Received: from lnfm1.sai.msu.ru ([93.180.26.255]:34648 "EHLO lnfm1.sai.msu.ru"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234480AbhBBO0e (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 2 Feb 2021 09:26:34 -0500
Received: from dragon.sai.msu.ru (dragon.sai.msu.ru [93.180.26.172])
        by lnfm1.sai.msu.ru (8.14.1/8.12.8) with ESMTP id 112ELltP002147;
        Tue, 2 Feb 2021 17:21:52 +0300
Received: from oak.local (unknown [83.167.113.121])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (Client did not present a certificate)
        by dragon.sai.msu.ru (Postfix) with ESMTPSA id 69EC3BE19;
        Tue,  2 Feb 2021 17:21:48 +0300 (MSK)
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
Subject: [PATCH v2] hwmon: lm75: Handle broken device nodes gracefully
Date:   Tue,  2 Feb 2021 17:21:12 +0300
Message-Id: <20210202142113.5456-1-matwey@sai.msu.ru>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210130101038.26331-1-matwey@sai.msu.ru>
References: <20210130101038.26331-1-matwey@sai.msu.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

There is a logical flaw in lm75_probe() function introduced in

    commit e97a45f1b460 ("hwmon: (lm75) Add OF device ID table")

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

Fixes: e97a45f1b460 ("hwmon: (lm75) Add OF device ID table")
Signed-off-by: Matwey V. Kornilov <matwey@sai.msu.ru>
---
 drivers/hwmon/lm75.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/lm75.c b/drivers/hwmon/lm75.c
index e447febd121a..130ad5042107 100644
--- a/drivers/hwmon/lm75.c
+++ b/drivers/hwmon/lm75.c
@@ -561,9 +561,15 @@ static int lm75_probe(struct i2c_client *client)
 	int status, err;
 	enum lm75_type kind;
 
-	if (client->dev.of_node)
-		kind = (enum lm75_type)of_device_get_match_data(&client->dev);
-	else
+	if (dev->of_node) {
+		const struct of_device_id *match =
+			of_match_device(dev->driver->of_match_table, dev);
+
+		if (!match)
+			return -ENODEV;
+
+		kind = (enum lm75_type)(match->data);
+	} else
 		kind = i2c_match_id(lm75_ids, client)->driver_data;
 
 	if (!i2c_check_functionality(client->adapter,
-- 
2.26.2


Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95676C433FE
	for <linux-hwmon@archiver.kernel.org>; Fri, 20 May 2022 09:54:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347970AbiETJyQ (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 20 May 2022 05:54:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347936AbiETJyP (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 20 May 2022 05:54:15 -0400
Received: from smtpo49.interia.pl (smtpo49.interia.pl [217.74.67.49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3453FD343
        for <linux-hwmon@vger.kernel.org>; Fri, 20 May 2022 02:54:12 -0700 (PDT)
X-Interia-R: Interia
X-Interia-R-IP: 80.68.225.159
X-Interia-R-Helo: <localhost>
Received: from localhost (unknown [80.68.225.159])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by www.poczta.fm (INTERIA.PL) with ESMTPSA;
        Fri, 20 May 2022 11:51:53 +0200 (CEST)
From:   Slawomir Stepien <sst@poczta.fm>
To:     linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org
Cc:     jdelvare@suse.com, linux@roeck-us.net, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, przemyslaw.cencner@nokia.com,
        krzysztof.adamski@nokia.com, alexander.sverdlin@nokia.com,
        Slawomir Stepien <sst@poczta.fm>,
        Slawomir Stepien <slawomir.stepien@nokia.com>
Subject: [PATCH 6/8] hwmon: (lm90) enable the extended temperature range
Date:   Fri, 20 May 2022 11:32:42 +0200
Message-Id: <20220520093243.2523749-7-sst@poczta.fm>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220520093243.2523749-1-sst@poczta.fm>
References: <20220520093243.2523749-1-sst@poczta.fm>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Interia-Antivirus: OK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=interia.pl;
        s=biztos; t=1653040314;
        bh=sVsMdV+8BfY9/NwT5Uaq6GjYpmIrVBc5zRUmBPpGcGU=;
        h=From:To:Subject:Date:Message-Id:MIME-Version;
        b=NC8FGXo3xpK25hBxY07JyekmdjZ2u+dTwS6Cdm8HA3Ot0Sfm0C+J2Gfr/GT1/ASF6
         uRiJjM9hyPRrLiWIyJADriDC9tW2ZbRvLPMEFQxkS2tvgzHFQ+FNDHYpks/mc1zIjR
         lff+8ZGWdf58stQ5iwgKWRP/d7L2B2n0LyIt+BZg=
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Slawomir Stepien <slawomir.stepien@nokia.com>

Enable the extended temperature range if it was requested from
device-tree node.

Signed-off-by: Slawomir Stepien <slawomir.stepien@nokia.com>
---
 drivers/hwmon/lm90.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/hwmon/lm90.c b/drivers/hwmon/lm90.c
index f642c6fd1641..67d48707a8d6 100644
--- a/drivers/hwmon/lm90.c
+++ b/drivers/hwmon/lm90.c
@@ -1914,6 +1914,7 @@ static const struct hwmon_ops lm90_ops = {
 static int lm90_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
+	const struct device_node *np = dev->of_node;
 	struct i2c_adapter *adapter = client->adapter;
 	struct hwmon_channel_info *info;
 	struct regulator *regulator;
@@ -2017,6 +2018,17 @@ static int lm90_probe(struct i2c_client *client)
 	/* Set maximum conversion rate */
 	data->max_convrate = lm90_params[data->kind].max_convrate;
 
+	/* Parse device-tree information */
+	if (np) {
+		if (data->flags & LM90_HAVE_EXTENDED_TEMP) {
+			if (of_property_read_bool(np, "extended-range-enable")) {
+				err = lm90_update_confreg(data, data->config | 0x04);
+				if (err)
+					return err;
+			}
+		}
+	}
+
 	/* Initialize the LM90 chip */
 	err = lm90_init_client(client, data);
 	if (err < 0) {
-- 
2.36.1


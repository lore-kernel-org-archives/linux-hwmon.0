Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A157C43334
	for <linux-hwmon@archiver.kernel.org>; Tue,  7 Jun 2022 06:35:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230471AbiFGGfk (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 7 Jun 2022 02:35:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230388AbiFGGff (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 7 Jun 2022 02:35:35 -0400
Received: from smtpo49.interia.pl (smtpo49.interia.pl [217.74.67.49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 786D75640C
        for <linux-hwmon@vger.kernel.org>; Mon,  6 Jun 2022 23:35:34 -0700 (PDT)
Received: from localhost (unknown [80.68.225.159])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by www.poczta.fm (INTERIA.PL) with ESMTPSA;
        Tue,  7 Jun 2022 08:35:31 +0200 (CEST)
From:   Slawomir Stepien <sst@poczta.fm>
To:     linux-hwmon@vger.kernel.org
Cc:     jdelvare@suse.com, linux@roeck-us.net,
        przemyslaw.cencner@nokia.com, krzysztof.adamski@nokia.com,
        alexander.sverdlin@nokia.com, sst@poczta.fm,
        slawomir.stepien@nokia.com
Subject: [PATCH 2/2] hwmon: (lm90) Read the channel's temperature offset from device-tree
Date:   Tue,  7 Jun 2022 08:35:04 +0200
Message-Id: <20220607063504.1287855-3-sst@poczta.fm>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220607063504.1287855-1-sst@poczta.fm>
References: <20220607063504.1287855-1-sst@poczta.fm>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=interia.pl;
        s=biztos; t=1654583732;
        bh=9yN5B8hFswx0Q+HUxEMWggH058LrWw8Oe3Wb8KRE7qc=;
        h=From:To:Subject:Date:Message-Id:MIME-Version;
        b=SlM0ZIfxYCzvq3h82eEEKr3O7OYyBxsi5hiNyhvfNAPLqILRcQDTQT2+b0CFuC0In
         vwpEixfVTNPwT2hWnVYe2jTNC4DXpVhX8Jlo4uez2I4pcfmW9qPf5/ncX3GjJ8OSgU
         nWixKHCn/emTRoLzUKCto9MHzoNe52x1q/Acn4Gc=
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Slawomir Stepien <slawomir.stepien@nokia.com>

Try to read the channel's temperature offset from device-tree. Having
offset in device-tree node is not mandatory. The offset can only be set
for remote channels.

Signed-off-by: Slawomir Stepien <slawomir.stepien@nokia.com>
---
Changes since v1:
* Use the new function lm90_set_temp_offset.
* Update the messages in dev_err() calls.

 drivers/hwmon/lm90.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/hwmon/lm90.c b/drivers/hwmon/lm90.c
index ec885cb3ab92..9d878163a1f2 100644
--- a/drivers/hwmon/lm90.c
+++ b/drivers/hwmon/lm90.c
@@ -2666,6 +2666,7 @@ static int lm90_probe_channel_from_dt(struct i2c_client *client,
 				      struct lm90_data *data)
 {
 	u32 id;
+	s32 val;
 	int err;
 	struct device *dev = &client->dev;
 
@@ -2689,6 +2690,21 @@ static int lm90_probe_channel_from_dt(struct i2c_client *client,
 	if (data->channel_label[id])
 		data->channel_config[id] |= HWMON_T_LABEL;
 
+	err = of_property_read_s32(child, "temperature-offset-millicelsius", &val);
+	if (!err) {
+		if (id == 0) {
+			dev_err(dev, "temperature-offset-millicelsius can't be set for internal channel\n");
+			return -EINVAL;
+		}
+
+		err = lm90_set_temp_offset(data, lm90_temp_offset_index[id], id, val);
+		if (err) {
+			dev_err(dev, "can't set temperature offset %d for channel %d (%d)\n",
+				val, id, err);
+			return err;
+		}
+	}
+
 	return 0;
 }
 
-- 
2.36.1


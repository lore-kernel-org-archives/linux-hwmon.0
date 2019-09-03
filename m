Return-Path: <SRS0=jxcE=W6=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26AFCC3A5A5
	for <linux-hwmon@archiver.kernel.org>; Tue,  3 Sep 2019 14:03:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id F3C4620870
	for <linux-hwmon@archiver.kernel.org>; Tue,  3 Sep 2019 14:03:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tk/B50Gw"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725782AbfICODN (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 3 Sep 2019 10:03:13 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:43032 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729113AbfICODN (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 3 Sep 2019 10:03:13 -0400
Received: by mail-pl1-f193.google.com with SMTP id 4so7927401pld.10
        for <linux-hwmon@vger.kernel.org>; Tue, 03 Sep 2019 07:03:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=OTt2H0rWEepZWJ5NJvH+YQ+TpMzB2d+id5Jx+TVKStE=;
        b=Tk/B50Gw29TuWEboKHm0AFXvia/BEhqOLoIh2P5fQtYClGSZUiAFHAaVTCfZXTpO1f
         Abg0m5LBCDtew0i+XMHn9IHFBHyOe1pEJZSyu+Yp26dQXsLq9FmKV3qCJLnqh7f7wItj
         U1Cy3YWxNcxjKP0lh8TCAT5661gyQn/iJk0258zQnswSzAgwsNX/qNFMRIPTitiL2r8K
         JOKkw5kj34/5A5kU/4rq9A9JlWSbfT7BKylKjO1+Q+ETKTj/7D4XIrODGchDIB8QCaaD
         Muk1gtSWUoqzg6qht25KUqRxG5+NOKSfJKBa7lH1x/xg7yLOpCW/r41N1WNeC1JHQA6g
         NbSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=OTt2H0rWEepZWJ5NJvH+YQ+TpMzB2d+id5Jx+TVKStE=;
        b=WvO8StctN0kCI963bYEJu3PuEuvxOZRdL+Yc1qMF7MAB+EOUINrULlcdHMkchpx4E0
         pFfY3zIwL0GlYXR6bXY94M4QdIuYmC+66wLMTEjtnCxo1Yd2IRoQ2J8TZMYYNlkIM11W
         UTGgVAwCWUFj3Fvz7oqbfDOWqGGpveXWPvQBPeg6XTQ/xHY9osdDsB0o1tpOeDH5jZDm
         fFdFwk1EhF26/GVmqkfj3NRVYXl1mrIg5SZKsmrXRbm3xB+k4RTZ+aanDdul4+/XUzBx
         +01v2V/kiRVjyYUcMMSkKhwvSzQtjJ0aM54NoLMavDoY9s25W85TceO/q0KlSKVBm8jD
         JcnQ==
X-Gm-Message-State: APjAAAUsZTu7Mo4ag5D86Aqf66snhpMqDz1TsRljIGZJFNN0hKKERWI+
        RCSki7dbH9Yy21V+gEEyfho2jgyS
X-Google-Smtp-Source: APXvYqyeVbgGk1G4F6BzLu6eXIvnwZb4hLNkEwo6mJEYIdJ0GaY6O833eyB36ro+OGLvHdd1zAqjcA==
X-Received: by 2002:a17:902:7b97:: with SMTP id w23mr35536808pll.283.1567519392659;
        Tue, 03 Sep 2019 07:03:12 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id s5sm19724379pfm.97.2019.09.03.07.03.12
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 03 Sep 2019 07:03:12 -0700 (PDT)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Iker Perez del Palomar <iker.perez@codethink.co.uk>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 2/4] hwmon: (lm75) Move updating the sample interval to its own function
Date:   Tue,  3 Sep 2019 07:03:07 -0700
Message-Id: <1567519389-16561-2-git-send-email-linux@roeck-us.net>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1567519389-16561-1-git-send-email-linux@roeck-us.net>
References: <1567519389-16561-1-git-send-email-linux@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

We'll need per-chip handling for updating the sample interval.
To prepare for it, separate the code implementing it into its own
function.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/lm75.c | 33 +++++++++++++++++++--------------
 1 file changed, 19 insertions(+), 14 deletions(-)

diff --git a/drivers/hwmon/lm75.c b/drivers/hwmon/lm75.c
index 6474b8f21981..644da2620a26 100644
--- a/drivers/hwmon/lm75.c
+++ b/drivers/hwmon/lm75.c
@@ -388,27 +388,32 @@ static int lm75_write_temp(struct device *dev, u32 attr, long temp)
 	return regmap_write(data->regmap, reg, (u16)temp);
 }
 
-static int lm75_write_chip(struct device *dev, u32 attr, long val)
+static int lm75_update_interval(struct device *dev, long val)
 {
 	struct lm75_data *data = dev_get_drvdata(dev);
 	u8 index;
 	s32 err;
 
-	switch (attr) {
-	case hwmon_chip_update_interval:
-		index = find_closest(val, data->params->sample_times,
-				     (int)data->params->num_sample_times);
+	index = find_closest(val, data->params->sample_times,
+			     (int)data->params->num_sample_times);
 
-		err = lm75_write_config(data,
-					lm75_sample_set_masks[index],
-					LM75_SAMPLE_CLEAR_MASK);
-		if (err)
-			return err;
-		data->sample_time = data->params->sample_times[index];
+	err = lm75_write_config(data, lm75_sample_set_masks[index],
+				LM75_SAMPLE_CLEAR_MASK);
+	if (err)
+		return err;
 
-		if (data->params->resolutions)
-			data->resolution = data->params->resolutions[index];
-		break;
+	data->sample_time = data->params->sample_times[index];
+	if (data->params->resolutions)
+		data->resolution = data->params->resolutions[index];
+
+	return 0;
+}
+
+static int lm75_write_chip(struct device *dev, u32 attr, long val)
+{
+	switch (attr) {
+	case hwmon_chip_update_interval:
+		return lm75_update_interval(dev, val);
 	default:
 		return -EINVAL;
 	}
-- 
2.7.4


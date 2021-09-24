Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5135C433FE
	for <linux-hwmon@archiver.kernel.org>; Fri, 24 Sep 2021 09:30:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A917B610D1
	for <linux-hwmon@archiver.kernel.org>; Fri, 24 Sep 2021 09:30:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244959AbhIXJb7 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 24 Sep 2021 05:31:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237056AbhIXJb7 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 24 Sep 2021 05:31:59 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09F79C061574;
        Fri, 24 Sep 2021 02:30:26 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id g41so37707778lfv.1;
        Fri, 24 Sep 2021 02:30:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=aLKzBVq44X4XRK6+uhga7FvRrq9aY6MQpWozVbR7r3Y=;
        b=bNpOVW0pt7X80+oy48f+lkW732jytZgKazAhXT3eSwefdwEGfslp4Wv8totgJyLah9
         YKhPJML/Hq92+IcN8667DtF+AQX9G3PPgTCll4UnJPsArLWvNjfFyDBNe0yansH0fUiM
         yBXFKtzbpf8nU7zeDT8v3YSbHfsNE9eo26zYpvFqhpPdfs9+i6EnfF1X6mv5CtWU9GuX
         O9LuQ3ABHFlM9wNw9QYelfJs2FgUhoDUqtBJQ8K8sb6UIEBWQLtLQviw0zA9L5p336hR
         GiNefd+FZ5da7LiE4uCGAXFlV3Z/hUaoYBPYN15EeaR90oh0X8uiY3NSNf8ptyRpmM4P
         1r5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aLKzBVq44X4XRK6+uhga7FvRrq9aY6MQpWozVbR7r3Y=;
        b=LB9O51kd12zE0DXzHy3InCoewMvqAo4xKnavKK3JSh512jaaauhdFMZwboEw4NHyEn
         QgGLSA3imTeUdnirgmiXMuD8+B6gFI6mSYLtaoU4UHZR+WJ1ta6yA6KNlgkJTDQTNzvN
         Hl2qccxbNxL32j1U9m0Qer8P9CeZ4mroYU57sPk0/VH1NAIcOpq+tMnwY6ydFSCxoXPM
         u+apvERVZHbUE8PTeFZ58/Bj6puvfJBLSnL2CnvYBqv4BLn8xLl2mMQqppkl6ROw08Dv
         YH9zcYPe9O7iCPxY/vnOPYesVNy2UYdpbHiZGJ77oxRrJ3NadvY1zpFsmBNcZrCevj+y
         0CJA==
X-Gm-Message-State: AOAM532dL9+oe9DFI5HtOgm3viAjSUzXqKyCAQfHvrNRj8jfVBA1Ih1O
        Wur0Bim8T+XfOzPtXbVgA0ZjB9Vm4Gw=
X-Google-Smtp-Source: ABdhPJzZ4tbUJjqT1zgHzhvaq+yEp9cdqomlXZj82jslzxto46Bskpb0Jd4iwXQz9+VZDdvtbS5neQ==
X-Received: by 2002:a05:651c:1408:: with SMTP id u8mr9908838lje.253.1632475824425;
        Fri, 24 Sep 2021 02:30:24 -0700 (PDT)
Received: from home.paul.comp (paulfertser.info. [2001:470:26:54b:226:9eff:fe70:80c2])
        by smtp.gmail.com with ESMTPSA id s9sm460914lfi.73.2021.09.24.02.30.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Sep 2021 02:30:24 -0700 (PDT)
Received: from home.paul.comp (home.paul.comp [IPv6:0:0:0:0:0:0:0:1])
        by home.paul.comp (8.15.2/8.15.2/Debian-14~deb10u1) with ESMTP id 18O9UKFq026123;
        Fri, 24 Sep 2021 12:30:22 +0300
Received: (from paul@localhost)
        by home.paul.comp (8.15.2/8.15.2/Submit) id 18O9UKHZ026122;
        Fri, 24 Sep 2021 12:30:20 +0300
From:   Paul Fertser <fercerpav@gmail.com>
To:     linux-hwmon@vger.kernel.org
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-kernel@vger.kernel.org, Paul Fertser <fercerpav@gmail.com>,
        stable@vger.kernel.org
Subject: [PATCH v3 1/3] hwmon: tmp421: handle I2C errors
Date:   Fri, 24 Sep 2021 12:30:09 +0300
Message-Id: <20210924093011.26083-1-fercerpav@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210924022020.GA3032273@roeck-us.net>
References: <20210924022020.GA3032273@roeck-us.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Function i2c_smbus_read_byte_data() can return a negative error number
instead of the data read if I2C transaction failed for whatever reason.

Lack of error checking can lead to serious issues on production
hardware, e.g. errors treated as temperatures produce spurious critical
temperature-crossed-threshold errors in BMC logs for OCP server
hardware. The patch was tested with Mellanox OCP Mezzanine card
emulating TMP421 protocol for temperature sensing which sometimes leads
to I2C protocol error during early boot up stage.

Fixes: 9410700b881f ("hwmon: Add driver for Texas Instruments TMP421/422/423 sensor chips")
Cc: stable@vger.kernel.org
Signed-off-by: Paul Fertser <fercerpav@gmail.com>
---

Changes from v2:
 - Do not change data->valid type as that's an unrelated cleanup
 - Add Fixes: tag
 - Remove clutter from the commit message

Changes from v1:
 - Reorganise code following excellent suggestion by Guenter Roeck
   to use tagged errors consistently

 drivers/hwmon/tmp421.c | 41 +++++++++++++++++++++++++++++++----------
 1 file changed, 31 insertions(+), 10 deletions(-)

diff --git a/drivers/hwmon/tmp421.c b/drivers/hwmon/tmp421.c
index ede66ea6a730..e6b2b31d17c8 100644
--- a/drivers/hwmon/tmp421.c
+++ b/drivers/hwmon/tmp421.c
@@ -119,38 +119,59 @@ static int temp_from_u16(u16 reg)
 	return (temp * 1000 + 128) / 256;
 }
 
-static struct tmp421_data *tmp421_update_device(struct device *dev)
+static int tmp421_update_device(struct tmp421_data *data)
 {
-	struct tmp421_data *data = dev_get_drvdata(dev);
 	struct i2c_client *client = data->client;
+	int ret = 0;
 	int i;
 
 	mutex_lock(&data->update_lock);
 
 	if (time_after(jiffies, data->last_updated + (HZ / 2)) ||
 	    !data->valid) {
-		data->config = i2c_smbus_read_byte_data(client,
-			TMP421_CONFIG_REG_1);
+		ret = i2c_smbus_read_byte_data(client,
+					       TMP421_CONFIG_REG_1);
+		if (ret < 0)
+			goto exit;
+		data->config = ret;
 
 		for (i = 0; i < data->channels; i++) {
-			data->temp[i] = i2c_smbus_read_byte_data(client,
-				TMP421_TEMP_MSB[i]) << 8;
-			data->temp[i] |= i2c_smbus_read_byte_data(client,
-				TMP421_TEMP_LSB[i]);
+			ret = i2c_smbus_read_byte_data(client,
+						       TMP421_TEMP_MSB[i]);
+			if (ret < 0)
+				goto exit;
+			data->temp[i] = ret << 8;
+
+			ret = i2c_smbus_read_byte_data(client,
+						       TMP421_TEMP_LSB[i]);
+			if (ret < 0)
+				goto exit;
+			data->temp[i] |= ret;
 		}
 		data->last_updated = jiffies;
 		data->valid = 1;
 	}
 
+exit:
 	mutex_unlock(&data->update_lock);
 
-	return data;
+	if (ret < 0) {
+		data->valid = 0;
+		return ret;
+	}
+
+	return 0;
 }
 
 static int tmp421_read(struct device *dev, enum hwmon_sensor_types type,
 		       u32 attr, int channel, long *val)
 {
-	struct tmp421_data *tmp421 = tmp421_update_device(dev);
+	struct tmp421_data *tmp421 = dev_get_drvdata(dev);
+	int ret = 0;
+
+	ret = tmp421_update_device(tmp421);
+	if (ret)
+		return ret;
 
 	switch (attr) {
 	case hwmon_temp_input:
-- 
2.17.1


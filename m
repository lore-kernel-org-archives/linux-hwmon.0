Return-Path: <SRS0=5f14=SZ=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2735C282DD
	for <linux-hwmon@archiver.kernel.org>; Tue, 23 Apr 2019 13:33:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 925D62077C
	for <linux-hwmon@archiver.kernel.org>; Tue, 23 Apr 2019 13:33:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eKw0cRnk"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727825AbfDWNdf (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 23 Apr 2019 09:33:35 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:41299 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726655AbfDWNdf (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 23 Apr 2019 09:33:35 -0400
Received: by mail-pg1-f194.google.com with SMTP id f6so7613152pgs.8
        for <linux-hwmon@vger.kernel.org>; Tue, 23 Apr 2019 06:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=emizb0Bm8pNop8Ua+O0Wj8j5Wmqxw6pBjnGlQIQmGw0=;
        b=eKw0cRnkunYh7UimKUnfR2JaJo8ruwQi5EtDHtBaKPtMklz4wQU9vFwuIJ2pWA39J0
         rZufsgnRcTtgZYRPHkZa1t5R2MKo0P/Hd0tFbYoQw3WBnOU4xlnQbQdzKLoSRd5MF1yA
         YGXkKm9vu8LQUpxcdhs9K6HYUCl0xsqjDrwqAZIxFvUb0ovp1+1poXEXDpC93p6IcA5y
         12mbyCWET6Tsq3+9rzWkgzx3ihJmPJZg+WcWlQ3toW7uRa8VH+v9xkfTw54g8kGl7t4U
         Zba1Cvh5+idUOnJD7C4pnU6Iw9Uvqd3HjEd9862F3r8YSTgBgL0gJq3GdbeBv0GuemW9
         Y71g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=emizb0Bm8pNop8Ua+O0Wj8j5Wmqxw6pBjnGlQIQmGw0=;
        b=q5tYhOj+oERndwHQx2QgW2e1kwNetvuM1GmTCCvWQW5f0t1aO6sCARmWr0lOX9n+UB
         EtInmS+8yEJeNFfnkxCxvXjiCjpdrWNqiIjw5xasz5AEBBfl8lhHX3nwtzst7leM8FXZ
         rlIqLYiuIG0N7+qEE0ISGzEtvI6hyZUOQd9yMiB9zAc2wAxGCKV6Ozn0OidpPmTwuZq3
         k/g+8bbEEvlnqYdCVq5zCmsgCGFrJlZsponG8YqLYv5KqWEFdeRnBLyKQX+uEdRW5Ww8
         gGaOO45WiagZ7TGzGAdthfMSQIEqJ2SeVp2Jf7AU2lMp8heUEh03nJt4/NGDtlczH/1w
         sEkA==
X-Gm-Message-State: APjAAAUrQFhwrFAg4yMlfx7I6ze8aJxN8+iNfD+dSuFGPk5XNoEFY7HB
        tKBdrwiGf7ZIOzV7Ow+iAHMfGN9Y
X-Google-Smtp-Source: APXvYqxcuf3klNPRIfkExQaXFPb1PCWV/V7DN3lLWEydEh+HROhZA9pmoSMtwHzzmVXl+2vktH02aA==
X-Received: by 2002:a62:140d:: with SMTP id 13mr1372125pfu.114.1556026413969;
        Tue, 23 Apr 2019 06:33:33 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id z14sm21729265pfn.161.2019.04.23.06.33.32
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 23 Apr 2019 06:33:33 -0700 (PDT)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Jean-Francois Dagenais <jeff.dagenais@gmail.com>
Subject: [PATCH 11/11] hwmon: (max6650) Fix minor formatting issues
Date:   Tue, 23 Apr 2019 06:33:11 -0700
Message-Id: <1556026391-15360-11-git-send-email-linux@roeck-us.net>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1556026391-15360-1-git-send-email-linux@roeck-us.net>
References: <1556026391-15360-1-git-send-email-linux@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

CHECK: struct mutex definition without comment
CHECK: Alignment should match open parenthesis

Cc: Jean-Francois Dagenais <jeff.dagenais@gmail.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/max6650.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/hwmon/max6650.c b/drivers/hwmon/max6650.c
index 83824e0c9a8e..635ef662f600 100644
--- a/drivers/hwmon/max6650.c
+++ b/drivers/hwmon/max6650.c
@@ -101,7 +101,7 @@ module_param(clock, int, 0444);
 struct max6650_data {
 	struct i2c_client *client;
 	struct thermal_cooling_device *cooling_dev;
-	struct mutex update_lock;
+	struct mutex update_lock; /* protect alarm register updates */
 	int nr_fans;
 	bool valid; /* false until following fields are valid */
 	unsigned long last_updated; /* in jiffies */
@@ -319,7 +319,7 @@ static SENSOR_DEVICE_ATTR_RO(gpio1_alarm, alarm, MAX6650_ALRM_GPIO1);
 static SENSOR_DEVICE_ATTR_RO(gpio2_alarm, alarm, MAX6650_ALRM_GPIO2);
 
 static umode_t max6650_attrs_visible(struct kobject *kobj, struct attribute *a,
-				    int n)
+				     int n)
 {
 	struct device *dev = container_of(kobj, struct device, kobj);
 	struct max6650_data *data = dev_get_drvdata(dev);
@@ -500,11 +500,10 @@ static int max6650_set_cur_state(struct thermal_cooling_device *cdev,
 
 	data->dac = pwm_to_dac(state, data->config & MAX6650_CFG_V12);
 	err = i2c_smbus_write_byte_data(client, MAX6650_REG_DAC, data->dac);
-
 	if (!err) {
 		max6650_set_operating_mode(data, state ?
-						   MAX6650_CFG_MODE_OPEN_LOOP :
-						   MAX6650_CFG_MODE_OFF);
+					   MAX6650_CFG_MODE_OPEN_LOOP :
+					   MAX6650_CFG_MODE_OFF);
 		data->cooling_dev_state = state;
 	}
 
-- 
2.7.4


Return-Path: <SRS0=IYsF=UG=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15A25C2BCA1
	for <linux-hwmon@archiver.kernel.org>; Fri,  7 Jun 2019 17:23:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DB1BB207E0
	for <linux-hwmon@archiver.kernel.org>; Fri,  7 Jun 2019 17:23:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bL9umcg5"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729443AbfFGRX3 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 7 Jun 2019 13:23:29 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:39271 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728998AbfFGRX3 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Fri, 7 Jun 2019 13:23:29 -0400
Received: by mail-pf1-f195.google.com with SMTP id j2so1560631pfe.6
        for <linux-hwmon@vger.kernel.org>; Fri, 07 Jun 2019 10:23:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id;
        bh=xtnznBLhFcf74uvjGSy20dBga5xUdSxq+H6TBHTWa6E=;
        b=bL9umcg52BsbumcYZB1ibfmAWVH+H2J7rFmsS73+xlNI+WXELDsp4MD/TzR6EAKHlZ
         Df/aEWdXBNc0/+ehVwJPeygsrLrx0X+niFYUUSOH1MR9zHnAHsyp023gyxmhJyVD4Suu
         0kM5HZMNjm4BrsvnIxcvHFAXCe5mGtL6SilEkkgDcLOpPwYfMd+ykR2OwS7DauVRfwZI
         6xt9xashr9oyEkbe54Uy/mulBObyS9WF50eW+9sls/QOMfVJ5ZnbHMkdvoNr/dlh5zzv
         xpU/E6SKLpWv3XvPwspj6j+av1tNmLM7oXOsBlh+6gvqQwfdbsJwDRroQkrqS1vd42CR
         EtNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
        bh=xtnznBLhFcf74uvjGSy20dBga5xUdSxq+H6TBHTWa6E=;
        b=G9ofGvIc7byAbxytLPcGlOnyimuZ/1rN8o8CPS6LcV/qja3nJyXVy+M9x+wn7Z5xwz
         qMThXa0kz+2Pm2xFNl3v77Lkq08wgf3rZEEnARcEzs7d8tfn4o0KinulBqry423icFVy
         H6jC7uZwAEgECq2hrCMU6on1Vru+Q/zZG+zp934yy9I3JwK2960OxfpYaVi3jXSYSbah
         dw/xA4ats4gSinupQSswnJLbwSnoORxwf3Rc/ttefkK52yNTJ8d0fJqTw3FC8VbFcD91
         yXsiyTvB5W+VQpTdsDFcWKHBQ+IiT/qvVpUMxNVLmypKe6bXQdrbIzGMIDg741uKkb2P
         uRrQ==
X-Gm-Message-State: APjAAAWntL5Ngse802rG3GrtAgcyEb98XsMtqsC8cMJsIo69z6X4KS3J
        F8DPeqCPh3YNI2WjIQphcAVDiy0T
X-Google-Smtp-Source: APXvYqyt7PZajOD5v1TT84WzRMprJ3mNxzRYnmeKZnffDVRODL857iwbX5kCdiGD2wu517NTc0Xxiw==
X-Received: by 2002:a17:90a:77c4:: with SMTP id e4mr7024645pjs.86.1559928208494;
        Fri, 07 Jun 2019 10:23:28 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id v39sm10338096pjb.3.2019.06.07.10.23.26
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 07 Jun 2019 10:23:27 -0700 (PDT)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Jean-Francois Dagenais <jeff.dagenais@gmail.com>
Subject: [PATCH v2 01/10] hwmon: (max6650) Use devm function to register thermal device
Date:   Fri,  7 Jun 2019 10:23:16 -0700
Message-Id: <1559928205-14030-1-git-send-email-linux@roeck-us.net>
X-Mailer: git-send-email 2.7.4
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Use devm_thermal_of_cooling_device_register to register the thermal
cooling device. This lets us drop the remove function.

At the same time, use 'dev' variable in probe function consistently.

Cc: Jean-Francois Dagenais <jeff.dagenais@gmail.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
v2: Use devm_thermal_of_cooling_device_register() instead of devm_add_action()

 drivers/hwmon/max6650.c | 27 +++++++--------------------
 1 file changed, 7 insertions(+), 20 deletions(-)

diff --git a/drivers/hwmon/max6650.c b/drivers/hwmon/max6650.c
index 6b9056f9483f..e540d0b0145e 100644
--- a/drivers/hwmon/max6650.c
+++ b/drivers/hwmon/max6650.c
@@ -101,7 +101,6 @@ module_param(clock, int, 0444);
 struct max6650_data {
 	struct i2c_client *client;
 	const struct attribute_group *groups[3];
-	struct thermal_cooling_device *cooling_dev;
 	struct mutex update_lock;
 	int nr_fans;
 	char valid; /* zero until following fields are valid */
@@ -744,6 +743,7 @@ static const struct thermal_cooling_device_ops max6650_cooling_ops = {
 static int max6650_probe(struct i2c_client *client,
 			 const struct i2c_device_id *id)
 {
+	struct thermal_cooling_device *cooling_dev;
 	struct device *dev = &client->dev;
 	const struct of_device_id *of_id =
 		of_match_device(of_match_ptr(max6650_dt_match), dev);
@@ -780,28 +780,16 @@ static int max6650_probe(struct i2c_client *client,
 		return err;
 
 #if IS_ENABLED(CONFIG_THERMAL)
-	data->cooling_dev =
-		thermal_of_cooling_device_register(client->dev.of_node,
-						   client->name, data,
-						   &max6650_cooling_ops);
-	if (IS_ERR(data->cooling_dev))
-		dev_warn(&client->dev,
-			 "thermal cooling device register failed: %ld\n",
-			 PTR_ERR(data->cooling_dev));
+	cooling_dev = devm_thermal_of_cooling_device_register(dev, dev->of_node,
+				client->name, data, &max6650_cooling_ops);
+	if (IS_ERR(cooling_dev)) {
+		dev_warn(dev, "thermal cooling device register failed: %ld\n",
+			 PTR_ERR(cooling_dev));
+	}
 #endif
 	return 0;
 }
 
-static int max6650_remove(struct i2c_client *client)
-{
-	struct max6650_data *data = i2c_get_clientdata(client);
-
-	if (!IS_ERR(data->cooling_dev))
-		thermal_cooling_device_unregister(data->cooling_dev);
-
-	return 0;
-}
-
 static const struct i2c_device_id max6650_id[] = {
 	{ "max6650", 1 },
 	{ "max6651", 4 },
@@ -815,7 +803,6 @@ static struct i2c_driver max6650_driver = {
 		.of_match_table = of_match_ptr(max6650_dt_match),
 	},
 	.probe		= max6650_probe,
-	.remove		= max6650_remove,
 	.id_table	= max6650_id,
 };
 
-- 
2.7.4


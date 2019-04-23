Return-Path: <SRS0=5f14=SZ=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECC7CC10F14
	for <linux-hwmon@archiver.kernel.org>; Tue, 23 Apr 2019 13:33:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BD4972077C
	for <linux-hwmon@archiver.kernel.org>; Tue, 23 Apr 2019 13:33:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="uTKFzn9u"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726801AbfDWNdR (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 23 Apr 2019 09:33:17 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:40906 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726655AbfDWNdR (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 23 Apr 2019 09:33:17 -0400
Received: by mail-pf1-f195.google.com with SMTP id c207so7500957pfc.7
        for <linux-hwmon@vger.kernel.org>; Tue, 23 Apr 2019 06:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id;
        bh=B2UiuBzj5CPFoIEP3O7C/Y9iGXiGX1o/2iIF9COFt10=;
        b=uTKFzn9uA4dmTiD696CBXeLdovLikwLnKshNnMETeiQ9nlDeT3FpLa5GczTuNTPa7k
         KpUNBPT0YDDg1zJkX9Lno9+SJrTphRE+QxlR5Zg1jUBJ0OL6sdb1Ci0r1wexhRpyXMQ9
         EdNFYWSJUSugdEDY/0Toi6w1u8YvBcDdsNQv6GFnh22T+B4tA58XfGs6qjjupfpkTvVn
         xqMITin8aYrSD68kpP3J+w1++R97tvDRVKtXK0MX9jm5N3Z1fGOd9OwXPPGpu3MdB8TE
         zMgTdEWJmRHaLuYMGADOjbToEsk8u+F9eZI55vW45Ii7NgPZJHkC9w2PbTyvqcIOFh8v
         eCmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
        bh=B2UiuBzj5CPFoIEP3O7C/Y9iGXiGX1o/2iIF9COFt10=;
        b=ZWZq6PWAACwuGC5hV/alyfaVSGOPg3rz+oRpuVS3IABzsF7i767KDcrFufXaH89TyL
         l/92Qap1AByQhuBqeFEGZR13nkUQsFEI4O4jso0aTUzetR8/Mc1cQlJFs91onRe6N/Vn
         teKYji7mslMrmMS3khWC4Y1Z2tVUA3cjd8uyPBXMH7cs2vy5aFB8Qj+KAbd6L1JJ1b8y
         QvWg2z41lIbJ6UAWbHH8Jwr80bH/80drgjXEr2M+cXRdF2vO5Z0RiYehrlNc6ZMw1BdG
         RfzoCU6COmRoEP5z8aKTxR2fVgsBcPeCMtd1mrcjdcZQfyFMHw3x2zKw6yE8aZI9/QYd
         ECzA==
X-Gm-Message-State: APjAAAWgGkURnsWDv+CkW4dogadGjrp24OG07aP3S/OHagQN0l6Vn9BU
        hhd8DUtmiPXDmIPTxiLK6rCc1gbn
X-Google-Smtp-Source: APXvYqyDFQGsAkk215oCLk03hRE0iTrBwq6Cc9EIW9lM8HLxzj+TctV5Tm6HAAF1UOa0xGuiA8x6cw==
X-Received: by 2002:a63:7444:: with SMTP id e4mr25042798pgn.261.1556026396090;
        Tue, 23 Apr 2019 06:33:16 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id j19sm24633606pfr.155.2019.04.23.06.33.14
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 23 Apr 2019 06:33:14 -0700 (PDT)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Jean-Francois Dagenais <jeff.dagenais@gmail.com>
Subject: [PATCH 01/11] hwmon: (max6650) Use devm_add_action to unregister thermal device
Date:   Tue, 23 Apr 2019 06:33:01 -0700
Message-Id: <1556026391-15360-1-git-send-email-linux@roeck-us.net>
X-Mailer: git-send-email 2.7.4
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Use devm_add_action to unregister the thermal cooling device.
This lets us drop the remove function.

At the same time, use 'dev' variable in probe function consistently.

Cc: Jean-Francois Dagenais <jeff.dagenais@gmail.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/max6650.c | 27 ++++++++++++---------------
 1 file changed, 12 insertions(+), 15 deletions(-)

diff --git a/drivers/hwmon/max6650.c b/drivers/hwmon/max6650.c
index 939953240827..6cce199dab6a 100644
--- a/drivers/hwmon/max6650.c
+++ b/drivers/hwmon/max6650.c
@@ -752,6 +752,11 @@ static const struct thermal_cooling_device_ops max6650_cooling_ops = {
 	.get_cur_state = max6650_get_cur_state,
 	.set_cur_state = max6650_set_cur_state,
 };
+
+static void max6650_thermal_unregister(void *data)
+{
+	thermal_cooling_device_unregister(data);
+}
 #endif
 
 static int max6650_probe(struct i2c_client *client,
@@ -794,27 +799,20 @@ static int max6650_probe(struct i2c_client *client,
 
 #if IS_ENABLED(CONFIG_THERMAL)
 	data->cooling_dev =
-		thermal_of_cooling_device_register(client->dev.of_node,
+		thermal_of_cooling_device_register(dev->of_node,
 						   client->name, data,
 						   &max6650_cooling_ops);
-	if (IS_ERR(data->cooling_dev))
-		dev_warn(&client->dev,
-			 "thermal cooling device register failed: %ld\n",
+	if (IS_ERR(data->cooling_dev)) {
+		dev_warn(dev, "thermal cooling device register failed: %ld\n",
 			 PTR_ERR(data->cooling_dev));
+	} else {
+		devm_add_action(dev, max6650_thermal_unregister,
+				data->cooling_dev);
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
@@ -828,7 +826,6 @@ static struct i2c_driver max6650_driver = {
 		.of_match_table = of_match_ptr(max6650_dt_match),
 	},
 	.probe		= max6650_probe,
-	.remove		= max6650_remove,
 	.id_table	= max6650_id,
 };
 
-- 
2.7.4


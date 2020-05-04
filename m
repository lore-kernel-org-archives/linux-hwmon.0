Return-Path: <SRS0=Qoc9=6S=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4F92C47257
	for <linux-hwmon@archiver.kernel.org>; Mon,  4 May 2020 14:58:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 94388206B9
	for <linux-hwmon@archiver.kernel.org>; Mon,  4 May 2020 14:58:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YbYCOp+L"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726467AbgEDO6H (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 4 May 2020 10:58:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726445AbgEDO6G (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 4 May 2020 10:58:06 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F944C061A0E
        for <linux-hwmon@vger.kernel.org>; Mon,  4 May 2020 07:58:05 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id v2so6851199plp.9
        for <linux-hwmon@vger.kernel.org>; Mon, 04 May 2020 07:58:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vTne60j7ve+H1UNN7J477uThm7D28GEa32UluIBUc+k=;
        b=YbYCOp+LNZ6dFJLOFKrncY4XS7ab9oZrBQDKMzfB842QQOWLfDahez2nNSaS9Wl/mz
         364TjAndI7jcgYwXQ9FoPnzJ+JCywAsh6Ve97WvNXqb5iRrkVpLQCviYDwSuLsN7FJa/
         JaEaJxQNA+ABkLJHSrRJY4uh1SLQrKrgsEvRugNrFVGEwEMAGs+3uR9B0yQ95PX7hR0Q
         hUzNsHyJ5tQfIER6mM3VAIp8jN1m/kcuLrCzGwX+UL2k8sGE9xcrPEYHxl2MlWl4WUwl
         6XuoEbLPXDK3ESmDPkzjAFWoHNx+AM0WLHtzolg4vNH/7ehFRibdttngC4R17l5SOqjx
         FkqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vTne60j7ve+H1UNN7J477uThm7D28GEa32UluIBUc+k=;
        b=ABPHur465WXDLEhvH3ae67TLMOZIJDPDir6nzTB/rv5ja8qTxRZMxzFyF74yMhkWLY
         pFvgfWN11ir/DlL0YX34aD0nKTyuibc4hkhy5rEV+TzdlTSoUwu9PRhR8rJg1M7/aT2O
         oNOH3f0qZSq0D1F+0J5DGAQuWE8uR8UiQlZhK0Qjw1YhnnYn/hvIi2SmMiJMGyOmFDjA
         lQpQOaaqbTzL4f7nPORf3Z+q5WHqF1xkhmzEqntrigBJJgoCSv8Wm6ceuTvaTYxTtqtP
         3lvnfLR1MZjb2O0hvXa8PZYJ4A2yo6GF8JTBjUl/xkwVuL7imBUlBOLvL0bIFcpYRn3h
         OBAg==
X-Gm-Message-State: AGi0PuYo4rL/gGp7OPQPLYtefXPIS/3sk4QKyB2aoTED1rD0wl8oIokU
        PpD2SMqDaZ3YuTh827jKwQO/SPq3
X-Google-Smtp-Source: APiQypLcRR/mJTFO9vQLbu1LZpKHW6PNd0ENIWIQimTXb1n1soRzsltt1XDWtDoysHchL44VXTNJDg==
X-Received: by 2002:a17:902:9a41:: with SMTP id x1mr17276383plv.250.1588604284517;
        Mon, 04 May 2020 07:58:04 -0700 (PDT)
Received: from localhost.localdomain ([240f:34:212d:1:39d5:149a:b403:c3b])
        by smtp.gmail.com with ESMTPSA id h13sm9058375pfk.86.2020.05.04.07.58.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2020 07:58:03 -0700 (PDT)
From:   Akinobu Mita <akinobu.mita@gmail.com>
To:     linux-hwmon@vger.kernel.org
Cc:     Akinobu Mita <akinobu.mita@gmail.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH] hwmon: Reduce indentation level in __hwmon_device_register()
Date:   Mon,  4 May 2020 23:57:44 +0900
Message-Id: <20200504145744.7027-1-akinobu.mita@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Reduce indentation level in __hwmon_device_register() by preparing a
helper function.

This just improves code readability.  No functional change.

Cc: Jean Delvare <jdelvare@suse.com>
Cc: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>
---
 drivers/hwmon/hwmon.c | 68 ++++++++++++++++++++++++++-----------------
 1 file changed, 42 insertions(+), 26 deletions(-)

diff --git a/drivers/hwmon/hwmon.c b/drivers/hwmon/hwmon.c
index 6a30fb453f7a..dcd4445d4570 100644
--- a/drivers/hwmon/hwmon.c
+++ b/drivers/hwmon/hwmon.c
@@ -179,8 +179,40 @@ static int hwmon_thermal_add_sensor(struct device *dev, int index)
 
 	return 0;
 }
+
+static int hwmon_thermal_register_sensors(struct device *dev)
+{
+	struct hwmon_device *hwdev = to_hwmon_device(dev);
+	const struct hwmon_chip_info *chip = hwdev->chip;
+	const struct hwmon_channel_info **info = chip->info;
+	void *drvdata = dev_get_drvdata(dev);
+	int i;
+
+	for (i = 1; info[i]; i++) {
+		int j;
+
+		if (info[i]->type != hwmon_temp)
+			continue;
+
+		for (j = 0; info[i]->config[j]; j++) {
+			int err;
+
+			if (!(info[i]->config[j] & HWMON_T_INPUT) ||
+			    !chip->ops->is_visible(drvdata, hwmon_temp,
+						   hwmon_temp_input, j))
+				continue;
+
+			err = hwmon_thermal_add_sensor(dev, j);
+			if (err)
+				return err;
+		}
+	}
+
+	return 0;
+}
+
 #else
-static int hwmon_thermal_add_sensor(struct device *dev, int index)
+static int hwmon_thermal_register_sensors(struct device *dev)
 {
 	return 0;
 }
@@ -596,7 +628,7 @@ __hwmon_device_register(struct device *dev, const char *name, void *drvdata,
 {
 	struct hwmon_device *hwdev;
 	struct device *hdev;
-	int i, j, err, id;
+	int i, err, id;
 
 	/* Complain about invalid characters in hwmon name attribute */
 	if (name && (!strlen(name) || strpbrk(name, "-* \t\n")))
@@ -664,30 +696,14 @@ __hwmon_device_register(struct device *dev, const char *name, void *drvdata,
 	if (dev && dev->of_node && chip && chip->ops->read &&
 	    chip->info[0]->type == hwmon_chip &&
 	    (chip->info[0]->config[0] & HWMON_C_REGISTER_TZ)) {
-		const struct hwmon_channel_info **info = chip->info;
-
-		for (i = 1; info[i]; i++) {
-			if (info[i]->type != hwmon_temp)
-				continue;
-
-			for (j = 0; info[i]->config[j]; j++) {
-				if (!chip->ops->is_visible(drvdata, hwmon_temp,
-							   hwmon_temp_input, j))
-					continue;
-				if (info[i]->config[j] & HWMON_T_INPUT) {
-					err = hwmon_thermal_add_sensor(hdev, j);
-					if (err) {
-						device_unregister(hdev);
-						/*
-						 * Don't worry about hwdev;
-						 * hwmon_dev_release(), called
-						 * from device_unregister(),
-						 * will free it.
-						 */
-						goto ida_remove;
-					}
-				}
-			}
+		err = hwmon_thermal_register_sensors(hdev);
+		if (err) {
+			device_unregister(hdev);
+			/*
+			 * Don't worry about hwdev; hwmon_dev_release(), called
+			 * from device_unregister(), will free it.
+			 */
+			goto ida_remove;
 		}
 	}
 
-- 
2.20.1


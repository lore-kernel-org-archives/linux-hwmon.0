Return-Path: <SRS0=IYsF=UG=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A59BC468BC
	for <linux-hwmon@archiver.kernel.org>; Fri,  7 Jun 2019 17:23:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 44A99207E0
	for <linux-hwmon@archiver.kernel.org>; Fri,  7 Jun 2019 17:23:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="soG0GOyL"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730652AbfFGRXj (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 7 Jun 2019 13:23:39 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:41529 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728998AbfFGRXi (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Fri, 7 Jun 2019 13:23:38 -0400
Received: by mail-pg1-f193.google.com with SMTP id 83so1493196pgg.8
        for <linux-hwmon@vger.kernel.org>; Fri, 07 Jun 2019 10:23:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=1rO1oYVrUaS3qtjzAea0T9Vce+9nU1nAWg2D5tjqnZU=;
        b=soG0GOyLWHXnpHP+GVEFsyhxuRZkR8W5K42KaENkjJF6mkr7uZgXHx5aS3iiNnrHmJ
         ZdFm16V35y5B+DHpG4cgwDN1h/cZmfQUTs6c3hdN4AJa4LQF21uD6177zTQcwPQoG89y
         Tph3CrQHDlFY/58ZM2xAjwIeBoeopJ7+CiuosTxq5SVRupYCM7x9rA+AZLSSedk75gio
         hbiPkQ2uig5kHc13yjPUtzBoNaqmjXrZp6H9g8HauHXc6vTa/EKE9wzRKLgKdCh2dCy+
         E6w5kryebOQrnDmDx52gLPMOac9MKi+n0EPgxQed++kn1Y5e0eLfSqkisQyq/kaqqH+g
         K6bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=1rO1oYVrUaS3qtjzAea0T9Vce+9nU1nAWg2D5tjqnZU=;
        b=laUgDQfgJGO0I3+DOzW4NnVIsN4+2qSZLKjgynS/Jx/BGfBXFh7ZH193D08nUOTTkw
         AeFRb4clUxWQEMc4tGVTE2VfCEdM0FzSB+ktAw9XwEI9+n1O5kZz9KTVN4xnyeEPWGMl
         adNfewhOX8gUEZ4bZXs1D1Kwlyonmu7f2s9xGXzjG4H2kdCsHpdyfZiBN7t0loPzRKOO
         9pjZIwqJQ9ScgMUJ60eCLZdHkztK8Ck+qhng8RHHFUDVMUoTuVdNgcC1Sp4xSEx87tub
         s/kJn7iwnhPEVw7GkDAp+bmkp/o7azukxdBO7tp2HsOEBWPG38TgoNtvWRihSrstolTh
         Q8OA==
X-Gm-Message-State: APjAAAX1kGnPb1nB242aUymfPG1kYlOO94UQHnQWbiIveZr17pxrIH0n
        AJfFyd4cyhonwwheDuynLXANNlnJ
X-Google-Smtp-Source: APXvYqxBAq7Pn158aabmAROjFlWe6Zo4yufORGvlkf3cCnr3HkSj7J3H31QNyzPKhwg7+8q3J38kCA==
X-Received: by 2002:a63:490b:: with SMTP id w11mr2445070pga.127.1559928218006;
        Fri, 07 Jun 2019 10:23:38 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id e20sm2610430pfi.35.2019.06.07.10.23.37
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 07 Jun 2019 10:23:37 -0700 (PDT)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Jean-Francois Dagenais <jeff.dagenais@gmail.com>
Subject: [PATCH v2 08/10] hwmon: (max6650) Read non-volatile registers only once
Date:   Fri,  7 Jun 2019 10:23:23 -0700
Message-Id: <1559928205-14030-8-git-send-email-linux@roeck-us.net>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1559928205-14030-1-git-send-email-linux@roeck-us.net>
References: <1559928205-14030-1-git-send-email-linux@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Only tachometer and alarm status registers are modified by the chip.
All other registers only need to be read only once, and reading them
repeatedly does not add any value.

Cc: Jean-Francois Dagenais <jeff.dagenais@gmail.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
v2: No change

 drivers/hwmon/max6650.c | 23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/drivers/hwmon/max6650.c b/drivers/hwmon/max6650.c
index bcd50307d963..6f1a1a6eae46 100644
--- a/drivers/hwmon/max6650.c
+++ b/drivers/hwmon/max6650.c
@@ -162,17 +162,10 @@ static struct max6650_data *max6650_update_device(struct device *dev)
 	mutex_lock(&data->update_lock);
 
 	if (time_after(jiffies, data->last_updated + HZ) || !data->valid) {
-		data->speed = i2c_smbus_read_byte_data(client,
-						       MAX6650_REG_SPEED);
-		data->config = i2c_smbus_read_byte_data(client,
-							MAX6650_REG_CONFIG);
 		for (i = 0; i < data->nr_fans; i++) {
 			data->tach[i] = i2c_smbus_read_byte_data(client,
 								 tach_reg[i]);
 		}
-		data->count = i2c_smbus_read_byte_data(client,
-							MAX6650_REG_COUNT);
-		data->dac = i2c_smbus_read_byte_data(client, MAX6650_REG_DAC);
 
 		/*
 		 * Alarms are cleared on read in case the condition that
@@ -421,8 +414,22 @@ static int max6650_init_client(struct max6650_data *data,
 		dev_err(dev, "Config write error, aborting.\n");
 		return err;
 	}
-
 	data->config = reg;
+
+	reg = i2c_smbus_read_byte_data(client, MAX6650_REG_SPEED);
+	if (reg < 0) {
+		dev_err(dev, "Failed to read speed register, aborting.\n");
+		return reg;
+	}
+	data->speed = reg;
+
+	reg = i2c_smbus_read_byte_data(client, MAX6650_REG_DAC);
+	if (reg < 0) {
+		dev_err(dev, "Failed to read DAC register, aborting.\n");
+		return reg;
+	}
+	data->dac = reg;
+
 	reg = i2c_smbus_read_byte_data(client, MAX6650_REG_COUNT);
 	if (reg < 0) {
 		dev_err(dev, "Failed to read count register, aborting.\n");
-- 
2.7.4


Return-Path: <SRS0=5f14=SZ=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 709D5C282E1
	for <linux-hwmon@archiver.kernel.org>; Tue, 23 Apr 2019 13:33:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 41D142077C
	for <linux-hwmon@archiver.kernel.org>; Tue, 23 Apr 2019 13:33:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fMUpO7/4"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727812AbfDWNda (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 23 Apr 2019 09:33:30 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:37366 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726655AbfDWNd3 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 23 Apr 2019 09:33:29 -0400
Received: by mail-pg1-f196.google.com with SMTP id e6so7629729pgc.4
        for <linux-hwmon@vger.kernel.org>; Tue, 23 Apr 2019 06:33:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=c9QrzKrL/UB0/0inA34pNYc1HJpllaSc+gekWPocaSY=;
        b=fMUpO7/41IWFNloFqTh1SBqDccpjf+UFTgVcuOmy973PKG70PkfUoTsC22gA3JO6/v
         47AXYxsQraNsFEDmFNB7f/+JtzsLKHQO3ozdCw3m6iY6NGqukIHMhBLZR5RNhwrKnBxY
         V1us8paNBV5KrGgZiN4+nkCDfbU5fouoQK0x99UffR+2jKsCoLUO6IGDwKSNBD35UHcl
         Qemha/UDWMx0Bgvw0rQIa60nmFVDp+3mkE5dUXeQdRzEZb9cQ4PmYS3At+/8C9Ecc8LD
         TpsrU8gRSJ0YpmvuQKsEBgYf/nctLmmp7deLzZVfU9DaZ6/LSuffZe6Lt8150uqi8xbs
         IHsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=c9QrzKrL/UB0/0inA34pNYc1HJpllaSc+gekWPocaSY=;
        b=ZHXpE24SQscVc5FUHg/SfcaWux7hTKixDwLD3fyw8pRVL43rD8eWfwa9ELOFJfIkEu
         u1kqMy5iexD44SbHBSTwYYuEGguYoypde0ukeCsbn9F/aGOOCvMU80eGqnqi7m447lxg
         3FriEl2SUSlPpHZ6CxYP/glwa7hMLFSWAFUPHMJZOvXTisdK4INhohL3xwgCsfPKCWNo
         78SmWhHvTcYOvCFaxZlsq+bovFYz8hkc44LSRzQDYIigCdpEygEX3T1n96wNjWe32S8E
         YkceL8Is6dnz7H7JwrYvaiSGJDJxA87jMXyjWPMclivJn9Q/GA/r9J9xiVA61ErQ+HGy
         csQw==
X-Gm-Message-State: APjAAAUBvmmK2KOQ3Af8guwv6pG+tMIzTMC/OdwqwvUJa1ZK8fMD6naA
        7Fnc8N9LQKR29+OGEI1za9Jjw0Yj
X-Google-Smtp-Source: APXvYqw5O5IijseW9e77bmUAtCJz5BDAKzQOy9V4sSHc8nNotMRM5RdYC2w4oikdJnbTTH4rtDWSQg==
X-Received: by 2002:a63:494f:: with SMTP id y15mr24624152pgk.56.1556026408830;
        Tue, 23 Apr 2019 06:33:28 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id j5sm20913038pfe.15.2019.04.23.06.33.27
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 23 Apr 2019 06:33:28 -0700 (PDT)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Jean-Francois Dagenais <jeff.dagenais@gmail.com>
Subject: [PATCH 08/11] hwmon: (max6650) Read non-volatile registers only once
Date:   Tue, 23 Apr 2019 06:33:08 -0700
Message-Id: <1556026391-15360-8-git-send-email-linux@roeck-us.net>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1556026391-15360-1-git-send-email-linux@roeck-us.net>
References: <1556026391-15360-1-git-send-email-linux@roeck-us.net>
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
 drivers/hwmon/max6650.c | 23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/drivers/hwmon/max6650.c b/drivers/hwmon/max6650.c
index 301184172ab1..7c8b1b8ededc 100644
--- a/drivers/hwmon/max6650.c
+++ b/drivers/hwmon/max6650.c
@@ -176,17 +176,10 @@ static struct max6650_data *max6650_update_device(struct device *dev)
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
@@ -435,8 +428,22 @@ static int max6650_init_client(struct max6650_data *data,
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


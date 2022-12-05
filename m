Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C98D8C4332F
	for <linux-hwmon@archiver.kernel.org>; Mon,  5 Dec 2022 19:02:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233541AbiLETB4 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 5 Dec 2022 14:01:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233704AbiLETBg (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 5 Dec 2022 14:01:36 -0500
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6C3225E92
        for <linux-hwmon@vger.kernel.org>; Mon,  5 Dec 2022 11:00:57 -0800 (PST)
Received: by mail-pj1-x1031.google.com with SMTP id z8-20020a17090abd8800b00219ed30ce47so1529475pjr.3
        for <linux-hwmon@vger.kernel.org>; Mon, 05 Dec 2022 11:00:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ob9SPVh+bojDwSh7P2u5KuevHOH95nRrGqDN8YODlBI=;
        b=EI+AGAz6Q6r0LZVYMGD/5DtIX07HRMaqmOfjWHh7G5Lq6FqtccCjjQqj5rMt3xEplq
         OyMxzYViBB/LF5yK9eRlQMpYHneJX92VnLfpjbzQtiJjwXrufgx4j6Hoy6qjGFN4Bewe
         /NgWYMEqnM3XxCGNqwu/NDiEeyyC6ObI1j4rkUro0FIERqSbPP62Fs47Xfho08tdySQ2
         M8mRJLyUMs/pi8aK9nsgSSA0CRm4X/+ExUJgglsTSvPX9xc0Ja6Bkn2ddx2hyeXfUuDf
         UjOuAtUq0MOpHvfTel4QrXpSeY+IrffUtKFzgGxBPWSIviceYk2JeWLVq3ugEvX+J2RL
         K1Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ob9SPVh+bojDwSh7P2u5KuevHOH95nRrGqDN8YODlBI=;
        b=nZ59VR3anAAtRgpms9v+EtvkSMlAJG3ftjPY/lPid+TS+igOfKwvkzvbJi0cP+qhBG
         hMTYpsocFMYT5LFtmFgWZnlgzk06/t67knZ36aXNR/g4rcVMJCOFxnTKiSuN1W/aESoz
         /c04Kd1N9NOXxBd75lxXw9Z5hsX3b7G0/caTxoqwOFljv0QApWXZamoYA/iz9r4PRkop
         9tg2nFPSVPDTOsrk/tmAtbfnZL0hQ56zWfxo/IJK0I6UPI8tvBHDIRBjB0YQBxeihy2k
         PsMrTned9dvAM1gM1Bxqlq+LNTyVNrZd/2FNgmDRk0w4EWiv0kaNlYurnN0BJJMbY+cK
         lFLg==
X-Gm-Message-State: ANoB5pkjufC/a7nfFGFWXKvkp+fh97VrcXJ4DsTJgYRWxjUDSMIdzoe0
        oJLEPd7d1f95xJXG22fiekE=
X-Google-Smtp-Source: AA0mqf4Pxvn4X6GeiKJnS6XppHsXpvau3tQaMXkcaIebCdJXQlKDL4UuwNSPfTV65ez8SztIjH7z8w==
X-Received: by 2002:a17:902:7c82:b0:189:760d:c5f2 with SMTP id y2-20020a1709027c8200b00189760dc5f2mr47319694pll.90.1670266856153;
        Mon, 05 Dec 2022 11:00:56 -0800 (PST)
Received: from localhost.localdomain ([193.122.98.110])
        by smtp.gmail.com with ESMTPSA id w10-20020a170902e88a00b00183c67844aesm11026194plg.22.2022.12.05.11.00.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Dec 2022 11:00:55 -0800 (PST)
From:   Xingjiang Qiao <nanpuyue@gmail.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
Cc:     Michael Shych <michaelsh@nvidia.com>,
        Xingjiang Qiao <nanpuyue@gmail.com>,
        linux-hwmon@vger.kernel.org
Subject: [PATCH v2 1/2] hwmon: (emc2305) fix unable to probe emc2301/2/3/4
Date:   Tue,  6 Dec 2022 03:00:39 +0800
Message-Id: <20221205190039.154388-1-nanpuyue@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221205173611.145571-1-nanpuyue@gmail.com>
References: <20221205173611.145571-1-nanpuyue@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

The definitions of 'EMC2305_REG_PRODUCT_ID' and 'EMC2305_REG_DEVICE' are
both '0xfd', they actually return the same value, but the values returned
by emc2301/2/3/4/5 are different, so probe emc2301/2/3/4 will fail, This
patch fixes that.

Signed-off-by: Xingjiang Qiao <nanpuyue@gmail.com>
---
 drivers/hwmon/emc2305.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/hwmon/emc2305.c b/drivers/hwmon/emc2305.c
index aa1f25add0b6..9a78ca22541e 100644
--- a/drivers/hwmon/emc2305.c
+++ b/drivers/hwmon/emc2305.c
@@ -16,7 +16,6 @@ static const unsigned short
 emc2305_normal_i2c[] = { 0x27, 0x2c, 0x2d, 0x2e, 0x2f, 0x4c, 0x4d, I2C_CLIENT_END };
 
 #define EMC2305_REG_DRIVE_FAIL_STATUS	0x27
-#define EMC2305_REG_DEVICE		0xfd
 #define EMC2305_REG_VENDOR		0xfe
 #define EMC2305_FAN_MAX			0xff
 #define EMC2305_FAN_MIN			0x00
@@ -524,7 +523,7 @@ static int emc2305_probe(struct i2c_client *client, const struct i2c_device_id *
 	struct device *dev = &client->dev;
 	struct emc2305_data *data;
 	struct emc2305_platform_data *pdata;
-	int vendor, device;
+	int vendor;
 	int ret;
 	int i;
 
@@ -535,10 +534,6 @@ static int emc2305_probe(struct i2c_client *client, const struct i2c_device_id *
 	if (vendor != EMC2305_VENDOR)
 		return -ENODEV;
 
-	device = i2c_smbus_read_byte_data(client, EMC2305_REG_DEVICE);
-	if (device != EMC2305_DEVICE)
-		return -ENODEV;
-
 	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
 	if (!data)
 		return -ENOMEM;
-- 
2.38.1


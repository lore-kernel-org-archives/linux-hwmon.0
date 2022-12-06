Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21F12C3A5A7
	for <linux-hwmon@archiver.kernel.org>; Tue,  6 Dec 2022 05:54:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233537AbiLFFyI (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 6 Dec 2022 00:54:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233633AbiLFFx7 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 6 Dec 2022 00:53:59 -0500
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BF6227156
        for <linux-hwmon@vger.kernel.org>; Mon,  5 Dec 2022 21:53:55 -0800 (PST)
Received: by mail-pj1-x1034.google.com with SMTP id v13-20020a17090a6b0d00b00219c3be9830so5822455pjj.4
        for <linux-hwmon@vger.kernel.org>; Mon, 05 Dec 2022 21:53:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=paMXecq/jusPp6lBCUqnPgxfy9qrIFeIodiH0VJ5zWw=;
        b=TQ4T6z6bo1+Anz/35VKr1tn7ZF+7VhM6ilHn8LRhnf/zKnSzZwYyrOyuIQh407X6vN
         uoO2UAOeRdGx2sixwqlSRYx2GkwWpWgUiJtYUVNqWviDcdPRZrTkPrTb0T1wslBtlMls
         RYdKh81lLGn+exSRBoN010TMMGpEHKkAJS7wfiGHO2nv3cBTZon/oX2VXuz3uiqq9T2L
         NUm+FiiSnrwMA+YcJlGWM5ODV+81+urj+Yq1MZ1wUEt8EDPbZs+WHDIT1Cj7RqFnFCfK
         2jx92m6gaGV/R0b74MDpEzuGga7UXPn6eZlgLxadzSg/y3r/WclybLdRIbCLE0IzoieB
         UsEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=paMXecq/jusPp6lBCUqnPgxfy9qrIFeIodiH0VJ5zWw=;
        b=TzvNFIYl2rhOQc/fNgy143RyFcz+7ATRDP85gjP7sbijcDYA6j6T7MuR4RBjyBh4zG
         s6dOlUxQ7zErNSeNtkSUERavV3t+llHu5tjI/syva7034aMk/n6mRiHHiEBkvh5Hv1Qk
         Pvuj0hE3synkp/V9YspBM47kXYxhqUIDYkQvC9gx2uh1OKsVbBz4lPwj734HOg2P3fxG
         4b5paVsERYHc9mJFBy9jCqhPpG018zT4XesUIFrkNlwv4yIs0wo6Kpzk4ejC0ByIPI57
         azWvWUBL/qrL5IgkjGqb/F5NAqmg51+wNZGGwhh3LkYWxYHc2LI59SgBCNSa8HMf67tB
         R7CA==
X-Gm-Message-State: ANoB5pkA+WCG1XIwL1bpFI5rd83Oxmc41hUC7uKrdN8ubRu9p6xm9eP3
        itmyLYP6K0LTdl0P2HHjvuDEGO4Sei5nu80o+fU=
X-Google-Smtp-Source: AA0mqf4pY75WsxLqEilwlr/dWLxAjv5moSCcMnWAhbnz4oKtlaOFe8CA5bhq62Y4PWRnEyHkm1+GOA==
X-Received: by 2002:a17:902:9a98:b0:189:ac49:fea8 with SMTP id w24-20020a1709029a9800b00189ac49fea8mr27721471plp.14.1670306034625;
        Mon, 05 Dec 2022 21:53:54 -0800 (PST)
Received: from localhost.localdomain ([193.122.98.110])
        by smtp.gmail.com with ESMTPSA id s5-20020a17090a5d0500b002191e769546sm10064374pji.4.2022.12.05.21.53.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Dec 2022 21:53:54 -0800 (PST)
From:   Xingjiang Qiao <nanpuyue@gmail.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Michael Shych <michaelsh@nvidia.com>,
        Xingjiang Qiao <nanpuyue@gmail.com>,
        linux-hwmon@vger.kernel.org
Subject: [PATCH v3 1/2] hwmon: (emc2305) fix unable to probe emc2301/2/3
Date:   Tue,  6 Dec 2022 13:53:30 +0800
Message-Id: <20221206055331.170459-1-nanpuyue@gmail.com>
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
by emc2301/2/3/5 are different, so probe emc2301/2/3 will fail, This patch
fixes that.

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


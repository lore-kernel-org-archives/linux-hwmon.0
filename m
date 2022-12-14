Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34DACC3DA6D
	for <linux-hwmon@archiver.kernel.org>; Wed, 14 Dec 2022 08:07:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237543AbiLNIHt (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 14 Dec 2022 03:07:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237604AbiLNIH3 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 14 Dec 2022 03:07:29 -0500
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B45DA1EC4E
        for <linux-hwmon@vger.kernel.org>; Wed, 14 Dec 2022 00:07:27 -0800 (PST)
Received: by mail-wr1-x42b.google.com with SMTP id w15so18399873wrl.9
        for <linux-hwmon@vger.kernel.org>; Wed, 14 Dec 2022 00:07:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YmisXUUTcc/2wLYtw2JwGMf2iLn2WSeYXglBIEeZoho=;
        b=M8/xtqY2O3i3K2Yz6NqK5+aza3ypoIX9p/uaSSc4ZVwUCb2XQrkVHtxv0yjcN/kSiB
         SGrwjRxkjHrn4YoUiOL3CBahkHHkRXa5uywll9J70oIMl45KBCMDE7FLt4JI243Fg4ja
         K8iOUVGS5VrRSnXxN4xPHIIdPEAnOQGQPQb+hxvJeH3FWJUbZy19/E4ZwH3b1a/b2bpA
         nR/JTjWlp8NuTdqnNYny0Lk10aey91oh75kRrEB0cRD/TfNF+q3o5dhKT5Sm5FlU0XwX
         E6ioTc5CGAovSvL4kZfhRj9MsJ54hdrA/CnUmttLwo8v53mBwMIh1Utm8tOfM7KbqCcJ
         NIUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YmisXUUTcc/2wLYtw2JwGMf2iLn2WSeYXglBIEeZoho=;
        b=x/RlibJc72qQCTNo37vLLD6wiDpID/JEh6hdeox96RzbMZEDPBMfHU1eMEtwSSWanq
         CLBNhczSL2ibP5tkkZb2Y0HEaY8skMFKJ2YKLQANmbwEWu3m6o9aRJ+7JJeasybGpk5r
         z21Pu/LzHbUTvz6LGgzK6EE8e5/bUUItcmYaE48l9EAr0dU6XdZLm6S59Bhc7deRkDel
         D5gWXwFM8Ng4sME18TNcGo6LanJBgJ9LjihCaYsy4Ouw+HqLfjhrai+cIC+7X1hNFckC
         Rr87KtRLCq5aygaDydMhlKIQso4PkGEg7XAC8ED3xbdru6djiBDjJhHwwKjdXwOnk5w5
         2puQ==
X-Gm-Message-State: ANoB5pntnhVR2dRFqB1eaashcFv6rIFrQw12jh8LvCA1nan1ukXkERbZ
        gz6izaIFXNwLW+lpjMhaCcP14Q==
X-Google-Smtp-Source: AA0mqf4Z8Akd3gcq3Hav9sh318ZeCAA5u0fwpbqKxLHue73ihu02VidHzoLUGXJ+rEEJnl57nImA3w==
X-Received: by 2002:a05:6000:1290:b0:242:733b:af28 with SMTP id f16-20020a056000129000b00242733baf28mr17016908wrx.5.1671005246307;
        Wed, 14 Dec 2022 00:07:26 -0800 (PST)
Received: from stroh80.sec.9e.network (ip-078-094-000-051.um19.pools.vodafone-ip.de. [78.94.0.51])
        by smtp.gmail.com with ESMTPSA id k3-20020a5d5183000000b002422bc69111sm2500781wrv.9.2022.12.14.00.07.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Dec 2022 00:07:26 -0800 (PST)
From:   Naresh Solanki <naresh.solanki@9elements.com>
X-Google-Original-From: Naresh Solanki <Naresh.Solanki@9elements.com>
To:     devicetree@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        Patrick Rudolph <patrick.rudolph@9elements.com>,
        Naresh Solanki <Naresh.Solanki@9elements.com>
Subject: [PATCH RESEND v6 5/5] hwmon: (pmbus/core): Notify regulator events
Date:   Wed, 14 Dec 2022 09:07:15 +0100
Message-Id: <20221214080715.2700442-5-Naresh.Solanki@9elements.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221214080715.2700442-1-Naresh.Solanki@9elements.com>
References: <20221214080715.2700442-1-Naresh.Solanki@9elements.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Notify regulator events in PMBus irq handler.

Signed-off-by: Naresh Solanki <Naresh.Solanki@9elements.com>
---
 drivers/hwmon/pmbus/pmbus_core.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index 22176f266891..c8fae2a9502d 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -3154,7 +3154,7 @@ static irqreturn_t pmbus_fault_handler(int irq, void *pdata)
 {
 	struct pmbus_data *data = pdata;
 	struct i2c_client *client = to_i2c_client(data->dev);
-	int i, status, ret, event;
+	int i, j, status, ret, event;
 
 	for (i = 0; i < data->info->pages; i++) {
 
@@ -3163,6 +3163,15 @@ static irqreturn_t pmbus_fault_handler(int irq, void *pdata)
 		if (ret)
 			return ret;
 
+		if (event) {
+			for (j = 0; j < data->info->num_regulators; j++) {
+				if (i == rdev_get_id(data->rdevs[i])) {
+					regulator_notifier_call_chain(data->rdevs[i], event, NULL);
+					ret = IRQ_HANDLED;
+				}
+			}
+		}
+
 		mutex_lock(&data->update_lock);
 		status = pmbus_read_status_word(client, i);
 		if (status < 0) {
-- 
2.37.3


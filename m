Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCFCDC433EF
	for <linux-hwmon@archiver.kernel.org>; Tue, 11 Jan 2022 16:51:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240516AbiAKQv0 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 11 Jan 2022 11:51:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238513AbiAKQv0 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 11 Jan 2022 11:51:26 -0500
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12EF5C06173F
        for <linux-hwmon@vger.kernel.org>; Tue, 11 Jan 2022 08:51:26 -0800 (PST)
Received: by mail-oi1-x230.google.com with SMTP id s9so13340924oib.11
        for <linux-hwmon@vger.kernel.org>; Tue, 11 Jan 2022 08:51:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nbcM8kn+wKmARe43xVL5ENoGwAPFM3BtzBzbfc4SPiw=;
        b=mLKFtZ9mG6UoKKMKA4Cwim1kEeU5AwobD7oNT91+9FngmN13FEtTgU5oLZluXR6EIB
         +EatSpq6x/9f/MJC4xxxGQMjHDVCTMxeWh/RizQzcbn0oB6TisFgALLjHVTwb9ehD8Vy
         0pIlL7CxGgGbBrqIRKvjh0upCS6IkY/E65CFtQJgKjwVwq04U04cdSh0B9Ix2zgzksj6
         p2bQY+UlmT+/g2T1PP0HVWx9uji8Udt4lG+elEe2RmFBhHDixTuvII7mELnwcH/qkI13
         cMN5iapwEtlU3+awp+BX12dP1mY/1qiJibHcnOdtRYVEzRPihdMUrFIHr4Z2I0dx0TD6
         WG0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=nbcM8kn+wKmARe43xVL5ENoGwAPFM3BtzBzbfc4SPiw=;
        b=WZ011krytvhn1Qoza13S3E9nwUodbwL2QTtUmkSr6S1eKRuRBQujzBEYsEDpygzU99
         LoPr4R79++BLco9+leV8urOSRU1fhWbQJkdfCfoE1/Rm7IokXu/JojQih54oPz1mnAb0
         rNMprkUEou6GgTpX06hNZgehZ95FEJ5YwO3Cm2DHcD6hfojXpxG5zOSHTTWZXvnkhQZt
         Q3adPAY+ILxiL2l/pYaXR1TmTqHifd9ej+wXL8H9fs8G2gEu0nNdgvITasKNEvT25mNs
         LpsRgB8AqvmJ8n1qXlNL86I/2riQoA8AgKJHlWzGa/GPN7pc8yZbXnvFGmtlYQtMBhMC
         H7dg==
X-Gm-Message-State: AOAM531K7LF2OyUB3KC67rJY5XbyhdsHMniUw0syMUg7acUTAvyD1nlR
        UB3DaBbKSbSaPn1hvzCAPtNvHbGHZkY=
X-Google-Smtp-Source: ABdhPJxU2SmYZzlj27IF1cWcuEbABbtqZouze++EosyO/zQ61M1wecJUuB8wmrzsp0cDj+1RaFLiZw==
X-Received: by 2002:a05:6808:10d0:: with SMTP id s16mr2401665ois.111.1641919885222;
        Tue, 11 Jan 2022 08:51:25 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id k1sm2157162otj.61.2022.01.11.08.51.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jan 2022 08:51:24 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH 2/6] hwmon: (lm90) Re-enable interrupts after alert clears
Date:   Tue, 11 Jan 2022 08:51:12 -0800
Message-Id: <20220111165116.1298459-3-linux@roeck-us.net>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220111165116.1298459-1-linux@roeck-us.net>
References: <20220111165116.1298459-1-linux@roeck-us.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

If alert handling is broken, interrupts are disabled after an alert and
re-enabled after the alert clears. However, if there is an interrupt
handler, this does not apply if alerts were originally disabled and enabled
when the driver was loaded. In that case, interrupts will stay disabled
after an alert was handled though the alert handler even after the alert
condition clears. Address the situation by always re-enabling interrupts
after the alert condition clears if there is an interrupt handler.

Fixes: 2abdc357c55d9 ("hwmon: (lm90) Unmask hardware interrupt")
Cc: Dmitry Osipenko <digetx@gmail.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/lm90.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/lm90.c b/drivers/hwmon/lm90.c
index cc5e48fe304b..e4ecf3440d7c 100644
--- a/drivers/hwmon/lm90.c
+++ b/drivers/hwmon/lm90.c
@@ -848,7 +848,7 @@ static int lm90_update_device(struct device *dev)
 		 * Re-enable ALERT# output if it was originally enabled and
 		 * relevant alarms are all clear
 		 */
-		if (!(data->config_orig & 0x80) &&
+		if ((client->irq || !(data->config_orig & 0x80)) &&
 		    !(data->alarms & data->alert_alarms)) {
 			if (data->config & 0x80) {
 				dev_dbg(&client->dev, "Re-enabling ALERT#\n");
-- 
2.33.0


Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C893C433EF
	for <linux-hwmon@archiver.kernel.org>; Tue, 11 Jan 2022 16:51:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241242AbiAKQve (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 11 Jan 2022 11:51:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238513AbiAKQvd (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 11 Jan 2022 11:51:33 -0500
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com [IPv6:2607:f8b0:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8D3FC06173F
        for <linux-hwmon@vger.kernel.org>; Tue, 11 Jan 2022 08:51:33 -0800 (PST)
Received: by mail-ot1-x335.google.com with SMTP id h20-20020a9d6f94000000b0059100e01744so2323799otq.4
        for <linux-hwmon@vger.kernel.org>; Tue, 11 Jan 2022 08:51:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CjwEkdPCpLwHsgwAOflwQ9NFF1ZKkeRUh+fi4hqpiu0=;
        b=I0hZTT77ewUTBvMoH00Y5q+Y+vjN3BxVJ/XR/nwUm5lh4JmAm9hY1aNxRXSSa+QkqB
         bMiQ5wvl6tQCGZYSdxK7OGFP8qb3zLDs6+EQsngqidEtdImaIVi4ZcNORubZBPrVhmzo
         wWI3Gy0YVeCv0qSHKxl8engjja7ujK0dwjhTI6Tu2kIBS5973rMBMIYhVRH16W5tooDR
         0MElKSTZF9herPD6xgP+L9a/4UGJcM0oY999T+tefYpXBju54Zbp3czeNeqLL5PeSTag
         rGeP5fvJg67KgXMfO+/fI+lid66mJEyVH0m78SikJxiacLNE6kbbq+/5cal2/tR2akct
         01zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=CjwEkdPCpLwHsgwAOflwQ9NFF1ZKkeRUh+fi4hqpiu0=;
        b=ipwqg/PPvueWK4jHgWPNa3+d44nlo455s1PFXaM4pQxvMpZs5IYR38s5MyU4VT63NV
         J/ZPuzCztLWklXpbGwIHfphUSYb0+u66CLg2c0ElSXkRqjqmxqS+Vq1U2y84IVcbvVnG
         i+CyS2pOwRXdDsU3mDR6cR1urEZ01sfFrZJKvqHdTCZNhuqpgl5rHpn9VZheUgT1Ng6Q
         OAeEBrt7JLCMdu0+ASLN/gjXTWFkFwtp7+Ckl12pkfEK4xKhiMJLUXpNRHbM110A4bzl
         z1PwifRQWmSUzmkqcMxLlbUVD8cYmTrinHSYxfrpqxf2UXA6hjFIPoNAb9qC07qyJZmC
         5fmg==
X-Gm-Message-State: AOAM531vSF8/SH/0/EwOBkQEDbOiybVN8ncfA0qWQccUCuaIInkwvnF7
        E/tjKFIAPklq9sSa6uNgsYJ5XZ9ihBM=
X-Google-Smtp-Source: ABdhPJyyyV91veL6VdhhSM+IzU9Uq+QTTcY5jyT8iFKpRXb4T2sd87XnuegjKfAZ94mJ61KLiVIeew==
X-Received: by 2002:a9d:4b0b:: with SMTP id q11mr4072761otf.74.1641919892795;
        Tue, 11 Jan 2022 08:51:32 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id x5sm2148617otp.70.2022.01.11.08.51.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jan 2022 08:51:32 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH 6/6] hwmon: (lm90) Fix sysfs and udev notifications
Date:   Tue, 11 Jan 2022 08:51:16 -0800
Message-Id: <20220111165116.1298459-7-linux@roeck-us.net>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220111165116.1298459-1-linux@roeck-us.net>
References: <20220111165116.1298459-1-linux@roeck-us.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

sysfs and udev notifications need to be sent to the _alarm
attributes, not to the value attributes.

Fixes: 94dbd23ed88c ("hwmon: (lm90) Use hwmon_notify_event()")
Cc: Dmitry Osipenko <digetx@gmail.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/lm90.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/hwmon/lm90.c b/drivers/hwmon/lm90.c
index ba01127c1deb..1c9493c70813 100644
--- a/drivers/hwmon/lm90.c
+++ b/drivers/hwmon/lm90.c
@@ -1808,22 +1808,22 @@ static bool lm90_is_tripped(struct i2c_client *client, u16 *status)
 
 	if (st & LM90_STATUS_LLOW)
 		hwmon_notify_event(data->hwmon_dev, hwmon_temp,
-				   hwmon_temp_min, 0);
+				   hwmon_temp_min_alarm, 0);
 	if (st & LM90_STATUS_RLOW)
 		hwmon_notify_event(data->hwmon_dev, hwmon_temp,
-				   hwmon_temp_min, 1);
+				   hwmon_temp_min_alarm, 1);
 	if (st2 & MAX6696_STATUS2_R2LOW)
 		hwmon_notify_event(data->hwmon_dev, hwmon_temp,
-				   hwmon_temp_min, 2);
+				   hwmon_temp_min_alarm, 2);
 	if (st & LM90_STATUS_LHIGH)
 		hwmon_notify_event(data->hwmon_dev, hwmon_temp,
-				   hwmon_temp_max, 0);
+				   hwmon_temp_max_alarm, 0);
 	if (st & LM90_STATUS_RHIGH)
 		hwmon_notify_event(data->hwmon_dev, hwmon_temp,
-				   hwmon_temp_max, 1);
+				   hwmon_temp_max_alarm, 1);
 	if (st2 & MAX6696_STATUS2_R2HIGH)
 		hwmon_notify_event(data->hwmon_dev, hwmon_temp,
-				   hwmon_temp_max, 2);
+				   hwmon_temp_max_alarm, 2);
 
 	return true;
 }
-- 
2.33.0


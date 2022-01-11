Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76730C433F5
	for <linux-hwmon@archiver.kernel.org>; Tue, 11 Jan 2022 11:39:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238542AbiAKLjs (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 11 Jan 2022 06:39:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238840AbiAKLjq (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 11 Jan 2022 06:39:46 -0500
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com [IPv6:2607:f8b0:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75A1CC06173F
        for <linux-hwmon@vger.kernel.org>; Tue, 11 Jan 2022 03:39:46 -0800 (PST)
Received: by mail-oi1-x233.google.com with SMTP id w188so1223540oiw.13
        for <linux-hwmon@vger.kernel.org>; Tue, 11 Jan 2022 03:39:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lGibLAHivS3U0ZygoLHZ1IXYia+NFP4M4/MexBPickI=;
        b=OYNcK5rgoIJeNzj+3zZsTxW2gWpn0RBlC0oGfovUpN7ct+8uzbSU0cz5RDyc9GU3yu
         0ZftSMvGZqBg9LHDoqIBbpTuTmJ8rqSbpY3nLZvUSb6XVSHM9swdXT+jiyD5Pm2FCcDo
         3ieCpmuVBJREr3MNygodpBvKI7uT2iANo6L1HaW4iY26GUdlqwPKKapVFOe9OIUR8+yI
         XJlnn5DybgGxCW/1sDXKvrcKkyPWLmrXyGcuRdvskj6rpIn1Q/lm/j757ly0AKRKeplr
         f8g03dV2rHktRL4BOT6FrD4iyBVDEZSG9ngnoifR9+sOwf0zey2B2JYJEyv19ERKHyYA
         Zu6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=lGibLAHivS3U0ZygoLHZ1IXYia+NFP4M4/MexBPickI=;
        b=E+Ha/gg5wntT9k0rq56AS2mUrll9Hw2xaUafUmoCHFfNhU9m/s/IIs8Shof05hNK8n
         8smPKnOqLsLa2INiePoIhKyKnXMvWQH5IJkcHs6pJTIg4t5Jl9+JU8sbtnDvn0ReMafd
         Puka15eNYuYAhxOAcDVE9/XN7P79CA3YLgpGmM0aPBNdtuaMrGpJUTh42F8qzifwdgih
         lwRPfN8cfKZdtfKvkrHd7wui9FUSA4vU+/DRpHL97jnhLIYuJUPgyPdCA9YRgZnhTHu2
         vCDBmpGiK7B8v4U/88Jf/c69HhU/7FM8CnpmXapbGMcwZwlQgi7ZJC+2cjytDNvZTF6L
         qHjg==
X-Gm-Message-State: AOAM533PrIrjO29jyMMmZoi67Z73InwW6qZfQDmDPm/vfxfnN75Slrx3
        425Vry9MJ/rogYUQNhedPEalLVyZeg0=
X-Google-Smtp-Source: ABdhPJzkibSfKLmB5APS152V9W9J/MHyN9xQAIdmBWCpXZp+U3LUA+87y35bxtIOyNk8wuuHITp+dg==
X-Received: by 2002:a05:6808:b16:: with SMTP id s22mr1439082oij.52.1641901185595;
        Tue, 11 Jan 2022 03:39:45 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id v18sm2061934ott.28.2022.01.11.03.39.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jan 2022 03:39:44 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH] hwmon: Report attribute name with udev events
Date:   Tue, 11 Jan 2022 03:39:40 -0800
Message-Id: <20220111113940.1687987-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Up to now udev events only report the affected hwmon device if an alert
is reported. This requires userspace to read all attributes if it wants
to know what triggered the event. Provide the attribute name with the
NAME property to help userspace find the attribute causing the event.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/hwmon.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/hwmon.c b/drivers/hwmon/hwmon.c
index 3501a3ead4ba..90b4212f83df 100644
--- a/drivers/hwmon/hwmon.c
+++ b/drivers/hwmon/hwmon.c
@@ -623,7 +623,9 @@ static const int __templates_size[] = {
 int hwmon_notify_event(struct device *dev, enum hwmon_sensor_types type,
 		       u32 attr, int channel)
 {
+	char event[MAX_SYSFS_ATTR_NAME_LENGTH + 5];
 	char sattr[MAX_SYSFS_ATTR_NAME_LENGTH];
+	char *envp[] = { event, NULL };
 	const char * const *templates;
 	const char *template;
 	int base;
@@ -639,8 +641,9 @@ int hwmon_notify_event(struct device *dev, enum hwmon_sensor_types type,
 	base = hwmon_attr_base(type);
 
 	scnprintf(sattr, MAX_SYSFS_ATTR_NAME_LENGTH, template, base + channel);
+	scnprintf(event, sizeof(event), "NAME=%s", sattr);
 	sysfs_notify(&dev->kobj, NULL, sattr);
-	kobject_uevent(&dev->kobj, KOBJ_CHANGE);
+	kobject_uevent_env(&dev->kobj, KOBJ_CHANGE, envp);
 
 	if (type == hwmon_temp)
 		hwmon_thermal_notify(dev, channel);
-- 
2.33.0


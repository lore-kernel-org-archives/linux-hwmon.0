Return-Path: <SRS0=IYsF=UG=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64A67C2BCA1
	for <linux-hwmon@archiver.kernel.org>; Fri,  7 Jun 2019 17:23:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3B7C1207E0
	for <linux-hwmon@archiver.kernel.org>; Fri,  7 Jun 2019 17:23:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a6OI0va8"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730608AbfFGRXm (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 7 Jun 2019 13:23:42 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:45829 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728998AbfFGRXl (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Fri, 7 Jun 2019 13:23:41 -0400
Received: by mail-pf1-f194.google.com with SMTP id s11so1545382pfm.12
        for <linux-hwmon@vger.kernel.org>; Fri, 07 Jun 2019 10:23:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=3ypAGjS17nsVYjJiB7rB7/3RQj1AvHzaPB9h2p5SS3I=;
        b=a6OI0va8p/yEDtRgkWfl+S20/YnQ4LvSHwSYChEuwv0xkXd99A5E+NJn+2Go9ok2Mj
         xc+F+K9AlVWt6BmbW5o4cK65/TIN9Dls+oPO/CJrT0h7cRjofzSnITaHa/xBb/fF4+nL
         /ZPCwSw1X9QJIL4wLwdzjW1WN/ZOyIVM8MXFfZabGFSoP8t9h2JELZHU2sCgAEbEYknS
         wAK++6lJInqiuIG6NdI+pxvfXMtHTKjeWknjZr3MEDJLMSOZAG9IIqOEk9YHFuyfIf4N
         WjlO5KJvxpjGFd/GxZgpPxezj9+aW5bho7XoAjoH6Be4uuj45VbkUyesSlZrPKHT11q9
         es0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=3ypAGjS17nsVYjJiB7rB7/3RQj1AvHzaPB9h2p5SS3I=;
        b=Hu52am0QMfOpEOc82/gW/B/OTQUEIUaFGAVe7dBJ6zRxMHMeRPDkIPBCtnIDSObC38
         1gZKo9oMZ8f9Xv/OIqIyHrvmhAgvz9Jem36y4p/gkZ4yJ68hNWCyMq/t9uRa1O/hUw7H
         JrWuOA2csqoLYbPG7QUS1jaCvHCjfiAIv9816PZsTEteeFHJ4vIUDbAOi05ruqG2Er8n
         yu+V8HxPdjHFIz6J5G1NnTTyeRJijfb16aa0jclesakhNA5pof5OfNGIvo7uVMqK7420
         3fOiYmsXNeKnPNS7UW6XinsltbEdvrezsT9eyv2xpm8Ei+cZD6qBPO11O5zi/m1Gn72j
         DlLg==
X-Gm-Message-State: APjAAAVtgNov8ZagDIvi69jZ9XVGkztv2AUgvLrvNiERRbmEl9/Hi7pt
        8LxPMqWdHOLwHj1pwQe0AXi1HwwX
X-Google-Smtp-Source: APXvYqycdgW5Blg8N6Bc5RpMfGWxixF6iRWsmXqBcpSMh751Bc1V6QVs8UeTBs7pJhHkLHj1pnd/mA==
X-Received: by 2002:a63:f410:: with SMTP id g16mr3893702pgi.428.1559928220918;
        Fri, 07 Jun 2019 10:23:40 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id f13sm2724541pje.11.2019.06.07.10.23.40
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 07 Jun 2019 10:23:40 -0700 (PDT)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Jean-Francois Dagenais <jeff.dagenais@gmail.com>
Subject: [PATCH v2 10/10] hwmon: (max6650) Fix minor formatting issues
Date:   Fri,  7 Jun 2019 10:23:25 -0700
Message-Id: <1559928205-14030-10-git-send-email-linux@roeck-us.net>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1559928205-14030-1-git-send-email-linux@roeck-us.net>
References: <1559928205-14030-1-git-send-email-linux@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

CHECK: struct mutex definition without comment
CHECK: Alignment should match open parenthesis

Cc: Jean-Francois Dagenais <jeff.dagenais@gmail.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
v2: No change
    Note: This is now patch 10/10 instead of 11/11.
    Patch 10/11 in the initial series was addressed with upstream commit
    74ba9207e1ad ("treewide: Replace GPLv2 boilerplate/reference with
    SPDX - rule 61").

 drivers/hwmon/max6650.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/hwmon/max6650.c b/drivers/hwmon/max6650.c
index e65792020ca1..5fdad4645cca 100644
--- a/drivers/hwmon/max6650.c
+++ b/drivers/hwmon/max6650.c
@@ -101,7 +101,7 @@ module_param(clock, int, 0444);
 
 struct max6650_data {
 	struct i2c_client *client;
-	struct mutex update_lock;
+	struct mutex update_lock; /* protect alarm register updates */
 	int nr_fans;
 	bool valid; /* false until following fields are valid */
 	unsigned long last_updated; /* in jiffies */
@@ -319,7 +319,7 @@ static SENSOR_DEVICE_ATTR_RO(gpio1_alarm, alarm, MAX6650_ALRM_GPIO1);
 static SENSOR_DEVICE_ATTR_RO(gpio2_alarm, alarm, MAX6650_ALRM_GPIO2);
 
 static umode_t max6650_attrs_visible(struct kobject *kobj, struct attribute *a,
-				    int n)
+				     int n)
 {
 	struct device *dev = container_of(kobj, struct device, kobj);
 	struct max6650_data *data = dev_get_drvdata(dev);
@@ -500,11 +500,10 @@ static int max6650_set_cur_state(struct thermal_cooling_device *cdev,
 
 	data->dac = pwm_to_dac(state, data->config & MAX6650_CFG_V12);
 	err = i2c_smbus_write_byte_data(client, MAX6650_REG_DAC, data->dac);
-
 	if (!err) {
 		max6650_set_operating_mode(data, state ?
-						   MAX6650_CFG_MODE_OPEN_LOOP :
-						   MAX6650_CFG_MODE_OFF);
+					   MAX6650_CFG_MODE_OPEN_LOOP :
+					   MAX6650_CFG_MODE_OFF);
 		data->cooling_dev_state = state;
 	}
 
-- 
2.7.4


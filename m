Return-Path: <SRS0=PihD=PZ=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BBDCC43444
	for <linux-hwmon@archiver.kernel.org>; Thu, 17 Jan 2019 21:14:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EE29820855
	for <linux-hwmon@archiver.kernel.org>; Thu, 17 Jan 2019 21:14:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AhpyVeef"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728586AbfAQVOO (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 17 Jan 2019 16:14:14 -0500
Received: from mail-pl1-f195.google.com ([209.85.214.195]:43344 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728239AbfAQVOO (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 17 Jan 2019 16:14:14 -0500
Received: by mail-pl1-f195.google.com with SMTP id gn14so5292066plb.10
        for <linux-hwmon@vger.kernel.org>; Thu, 17 Jan 2019 13:14:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=n/Pp1+zP6m/fErFOGL/q6Rat/sAFCAVvW1CTO5SoMx4=;
        b=AhpyVeefrtQP3x+kxNvhWWhv9WanRVDfuw64WDCiiv7LpxLyDtz3ytPvAeusxlnrpG
         WVyRqNy4FCwixe7cFLmeKx6DF/BfOecn462J2ajZalbRD8rsj0ExBjWn+az/SA18NlmT
         VVLdQp0EQwFpLmZrNfKVlp940HXJvj9m9TDDunCqS1ByDagV61w2GRopXf9OSXWQM2rZ
         0NfImUCKL5dmUD3x74vFFtice7HO3n5WWf6+wlzA6u4Ym3fNInUd7eLYxPUMbqa3hx+T
         PxowrEfRak1CRUoZCD0WQ7+CFtIeFENLH6O/RZLUXDiedvsz2zS5Z8rKWn3vfkUx33Rm
         dV9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=n/Pp1+zP6m/fErFOGL/q6Rat/sAFCAVvW1CTO5SoMx4=;
        b=Hsx/0pmi3pMKPO/v9IJ2BrwLhflYUjBORL2Y2xTIzVlbr9gDigFNO1/RSy3TJjqiGT
         kjaUQJQ/7gcSE9F8tq6G/QWCdRws7Kkd40qtVG20xywJrfI35hz9a/U4Cn+jUyiqkLTP
         zqeymv0VnlwAUG8N88ZXaifEenJkzr+UJOMABPtdnNn4n/H1OKkbv1LHSGpwDvE8UoA1
         a4S4SnSbhU3doyu5RWLJ39dEhlZZdh6pocTD7jYUz7EMO+kh+MnE8XQpXA88fhPjtdPD
         Yx2fxq2NMdc2uz+iKXX/EcJT+tEWy319TLPv00/mQXnaR3clt80Jid+/LIfvxVpBBKqj
         9sUQ==
X-Gm-Message-State: AJcUukfubtkuQFIH9xilTOpyAMX6GFetuE0nNp/3LBXo3eTKYwI0h6YW
        eMNxjogvXOCN0A1auoQyL3vsOjES
X-Google-Smtp-Source: ALg8bN5/KdKZTzU7cZjFlk9V/7XF/9O/ToZmuLwP1uEhtulyRB7dXN2EDGkuUTin3kVaZALsq0KToQ==
X-Received: by 2002:a17:902:968d:: with SMTP id n13mr16758391plp.109.1547759653414;
        Thu, 17 Jan 2019 13:14:13 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id t13sm2917996pgr.42.2019.01.17.13.14.12
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 17 Jan 2019 13:14:12 -0800 (PST)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 12/29] hwmon: (ina3221) Use permission specific SENSOR[_DEVICE]_ATTR variants
Date:   Thu, 17 Jan 2019 13:13:32 -0800
Message-Id: <1547759629-23007-13-git-send-email-linux@roeck-us.net>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1547759629-23007-1-git-send-email-linux@roeck-us.net>
References: <1547759629-23007-1-git-send-email-linux@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Use SENSOR[_DEVICE]_ATTR[_2]_{RO,RW,WO} to simplify the source code,
to improve readbility, and to reduce the chance of inconsistencies.

Also replace any remaining S_<PERMS> in the driver with octal values.

The conversion was done automatically with coccinelle. The semantic patches
and the scripts used to generate this commit log are available at
https://github.com/groeck/coccinelle-patches/hwmon/.

This patch does not introduce functional changes. It was verified by
compiling the old and new files and comparing text and data sizes.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/ina3221.c | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/drivers/hwmon/ina3221.c b/drivers/hwmon/ina3221.c
index e90ccac8bebb..f157214b3b83 100644
--- a/drivers/hwmon/ina3221.c
+++ b/drivers/hwmon/ina3221.c
@@ -499,7 +499,7 @@ static const struct hwmon_chip_info ina3221_chip_info = {
 };
 
 /* Extra attribute groups */
-static ssize_t ina3221_show_shunt(struct device *dev,
+static ssize_t ina3221_shunt_show(struct device *dev,
 				  struct device_attribute *attr, char *buf)
 {
 	struct sensor_device_attribute *sd_attr = to_sensor_dev_attr(attr);
@@ -510,9 +510,9 @@ static ssize_t ina3221_show_shunt(struct device *dev,
 	return snprintf(buf, PAGE_SIZE, "%d\n", input->shunt_resistor);
 }
 
-static ssize_t ina3221_set_shunt(struct device *dev,
-				 struct device_attribute *attr,
-				 const char *buf, size_t count)
+static ssize_t ina3221_shunt_store(struct device *dev,
+				   struct device_attribute *attr,
+				   const char *buf, size_t count)
 {
 	struct sensor_device_attribute *sd_attr = to_sensor_dev_attr(attr);
 	struct ina3221_data *ina = dev_get_drvdata(dev);
@@ -533,12 +533,9 @@ static ssize_t ina3221_set_shunt(struct device *dev,
 }
 
 /* shunt resistance */
-static SENSOR_DEVICE_ATTR(shunt1_resistor, S_IRUGO | S_IWUSR,
-		ina3221_show_shunt, ina3221_set_shunt, INA3221_CHANNEL1);
-static SENSOR_DEVICE_ATTR(shunt2_resistor, S_IRUGO | S_IWUSR,
-		ina3221_show_shunt, ina3221_set_shunt, INA3221_CHANNEL2);
-static SENSOR_DEVICE_ATTR(shunt3_resistor, S_IRUGO | S_IWUSR,
-		ina3221_show_shunt, ina3221_set_shunt, INA3221_CHANNEL3);
+static SENSOR_DEVICE_ATTR_RW(shunt1_resistor, ina3221_shunt, INA3221_CHANNEL1);
+static SENSOR_DEVICE_ATTR_RW(shunt2_resistor, ina3221_shunt, INA3221_CHANNEL2);
+static SENSOR_DEVICE_ATTR_RW(shunt3_resistor, ina3221_shunt, INA3221_CHANNEL3);
 
 static struct attribute *ina3221_attrs[] = {
 	&sensor_dev_attr_shunt1_resistor.dev_attr.attr,
-- 
2.7.4


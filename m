Return-Path: <SRS0=PihD=PZ=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83133C43387
	for <linux-hwmon@archiver.kernel.org>; Thu, 17 Jan 2019 21:14:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5060D20855
	for <linux-hwmon@archiver.kernel.org>; Thu, 17 Jan 2019 21:14:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VFSNVcOr"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727883AbfAQVOJ (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 17 Jan 2019 16:14:09 -0500
Received: from mail-pf1-f193.google.com ([209.85.210.193]:36568 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728286AbfAQVOI (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 17 Jan 2019 16:14:08 -0500
Received: by mail-pf1-f193.google.com with SMTP id b85so5430969pfc.3
        for <linux-hwmon@vger.kernel.org>; Thu, 17 Jan 2019 13:14:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=3mfvptKLMXXOXnUrtUJCLdQCIJ95XewVum4lyMbK3m4=;
        b=VFSNVcOrQ83bm1OI6TJUFp+t51pK0Tsj+EauGeK/qvWI3O6QsqA7sDzIg2WMDE+xvj
         +1nbjmVBFkmcXE8fjEUeXk7TLxJmFtHUHLNqg8Gi8/5KvOtnaNCVtwwurEZSUohuPgsz
         cmBtl8YNzRX6upZixcCv3hOzpvZPVaicSd8ILlu58PKwDUWH9hE5RcYgfG9zrGQhiM+W
         3XcaWMQ92tuQYsFHEToewbCvSzekvBBpkwh1vLnqnsJ09nkJNmzjsCl+QmlXKLTTywYS
         uId0iLFvfCaZuWCUEhehwPiG9II2GxllMAd/6k3Q+eyq2aGPkA7jlF/RyOXCN0aYzvKp
         isYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=3mfvptKLMXXOXnUrtUJCLdQCIJ95XewVum4lyMbK3m4=;
        b=AwZCXdV2DfrVKQkfBmeXqWZzZHZ9UF/IH1e6EnxF60fGXCxzKrU9RJ+i4kowbx82HI
         a56cDVFKDNsfsJpYe7L3vJmCunHKdkNHGE84k0zdvwEhYO/IpiyBMd2aXXZmbKgCCGne
         xwHoIpRjqAB5C/eOkM5mB0JpSC55QSbiXCpnXpZ0GHk5lLHlQXHuytUzrSzhzdn0KFlu
         ZM68a2kF7DxsheuMm31XVspczFMwCsWAGdv01HeWH/MPDE1wmY9dLRcMmEesahbZ47/A
         ePgpyHob0c70a4cw+xWRzwCEMAoc2mX+32YBGw5/ovzuQRM1IwxnmXV6sq22t/7DLIoP
         6iMQ==
X-Gm-Message-State: AJcUukeT6J7Nu7xX6T4O4RhoS0tXp1tfRPiQPvrVXx0dljicqQeTLL+t
        fBbCLamgWOzKjDqZOTCakBdohIbJ
X-Google-Smtp-Source: ALg8bN5chrvxcVoBiLmqbBbZMDs1lwp1pX/mCFH7RRtgPZUckQNTfxTrYGUtv/Oqy6QFldmmbIvLUQ==
X-Received: by 2002:a63:cf48:: with SMTP id b8mr15191753pgj.17.1547759647090;
        Thu, 17 Jan 2019 13:14:07 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id r1sm3638980pgo.17.2019.01.17.13.14.06
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 17 Jan 2019 13:14:06 -0800 (PST)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 08/29] hwmon: (ibmaem) Use permission specific SENSOR[_DEVICE]_ATTR variants
Date:   Thu, 17 Jan 2019 13:13:28 -0800
Message-Id: <1547759629-23007-9-git-send-email-linux@roeck-us.net>
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
 drivers/hwmon/ibmaem.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/hwmon/ibmaem.c b/drivers/hwmon/ibmaem.c
index 9e92673f6913..db63c1295cb2 100644
--- a/drivers/hwmon/ibmaem.c
+++ b/drivers/hwmon/ibmaem.c
@@ -813,25 +813,24 @@ static void aem_bmc_gone(int iface)
 /* sysfs support functions */
 
 /* AEM device name */
-static ssize_t show_name(struct device *dev, struct device_attribute *devattr,
+static ssize_t name_show(struct device *dev, struct device_attribute *devattr,
 			 char *buf)
 {
 	struct aem_data *data = dev_get_drvdata(dev);
 
 	return sprintf(buf, "%s%d\n", DRVNAME, data->ver_major);
 }
-static SENSOR_DEVICE_ATTR(name, S_IRUGO, show_name, NULL, 0);
+static SENSOR_DEVICE_ATTR_RO(name, name, 0);
 
 /* AEM device version */
-static ssize_t show_version(struct device *dev,
-			    struct device_attribute *devattr,
-			    char *buf)
+static ssize_t version_show(struct device *dev,
+			    struct device_attribute *devattr, char *buf)
 {
 	struct aem_data *data = dev_get_drvdata(dev);
 
 	return sprintf(buf, "%d.%d\n", data->ver_major, data->ver_minor);
 }
-static SENSOR_DEVICE_ATTR(version, S_IRUGO, show_version, NULL, 0);
+static SENSOR_DEVICE_ATTR_RO(version, version, 0);
 
 /* Display power use */
 static ssize_t aem_show_power(struct device *dev,
@@ -931,7 +930,7 @@ static int aem_register_sensors(struct aem_data *data,
 	while (ro->label) {
 		sysfs_attr_init(&sensors->dev_attr.attr);
 		sensors->dev_attr.attr.name = ro->label;
-		sensors->dev_attr.attr.mode = S_IRUGO;
+		sensors->dev_attr.attr.mode = 0444;
 		sensors->dev_attr.show = ro->show;
 		sensors->index = ro->index;
 
@@ -948,7 +947,7 @@ static int aem_register_sensors(struct aem_data *data,
 	while (rw->label) {
 		sysfs_attr_init(&sensors->dev_attr.attr);
 		sensors->dev_attr.attr.name = rw->label;
-		sensors->dev_attr.attr.mode = S_IRUGO | S_IWUSR;
+		sensors->dev_attr.attr.mode = 0644;
 		sensors->dev_attr.show = rw->show;
 		sensors->dev_attr.store = rw->set;
 		sensors->index = rw->index;
-- 
2.7.4


Return-Path: <SRS0=ckkT=P2=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D6A2C5ACD5
	for <linux-hwmon@archiver.kernel.org>; Fri, 18 Jan 2019 17:15:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7558720850
	for <linux-hwmon@archiver.kernel.org>; Fri, 18 Jan 2019 17:15:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UPY4GxUv"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728549AbfARRPq (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 18 Jan 2019 12:15:46 -0500
Received: from mail-pf1-f195.google.com ([209.85.210.195]:45449 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727986AbfARRPq (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 18 Jan 2019 12:15:46 -0500
Received: by mail-pf1-f195.google.com with SMTP id g62so6883794pfd.12
        for <linux-hwmon@vger.kernel.org>; Fri, 18 Jan 2019 09:15:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=yHssaMMaWOdCccR513OtH2Hev+1FZOvFJQgfdtAR5xY=;
        b=UPY4GxUvFa5PXuGHvyUeQIYem06vPoP8k8xwsZpUgVYDuKpNtyXdDu6yg9ve1EFy6F
         P9ryVsLPCymjYsRojKkvftrdK0CyDkLbQJEUOMfqVFHnAbG6KJsAF7QE7uP9iDDw8tgE
         vrvJ0uf4hWMIOIQ2wGgFi3oWzgyl7MA8lczKKgBLXNz8AEGI7EHsOzKKfyez2iYaqTwV
         Ku20vPLprqgdy5F6tIl45PKSFmRw6dP/K+UN/MJbV9q3O/woghOJOA3gZgbjmNxnE0ba
         TrkI/nr/0FN28CxA3QSXbqKubMKwftwdM6yFFM02N6sJGGSJhKpqfNdckLTzFR4QZ2nE
         s8AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=yHssaMMaWOdCccR513OtH2Hev+1FZOvFJQgfdtAR5xY=;
        b=B5pZDX4J72wyUR96s1K3Vxa6n3wuW6rMyBlELbyANSXArej91qtDVxibCaahuPxI78
         v6wCKfDUhHxwCZ9iROPWyjCf9d/w0GVgyHiAgd5J1deSm5HPzg/c1Zmghvh30aLSPARU
         TXT4PeFsN8my74L9CLifaQMaaHJWz11mfPfgaRWSy3zluokJpWgNBMkvmnO79Bxp2Jra
         6qlaBh3lxdqDSqf3qGNSEJktTDLRjauhyknJ3Th7KO//lyec3Co799mVuMR/bBxXv9oR
         NtLfxmk+cvW+AMNyxfLK+aX0vE6CpXI2tDFr+KimdC0P2xxJSWWNJJOlnEWiWx4eJCTj
         oOTg==
X-Gm-Message-State: AJcUukf0LCYehG24/qauHv1XafYGkSegWuIeulZdPOQhUULNce/IhpmB
        lNlunB3hQF/TtZaly+DZZ31f03Nr
X-Google-Smtp-Source: ALg8bN5KbRETdsYOISQMjI3KyQ8chyXOI2i/4Gfs8HUMz2h5wj6EVmYBKxX+El6LS+q+hvex7UicRg==
X-Received: by 2002:a62:6047:: with SMTP id u68mr19881001pfb.239.1547831744994;
        Fri, 18 Jan 2019 09:15:44 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id u70sm10556048pfa.176.2019.01.18.09.15.44
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 18 Jan 2019 09:15:44 -0800 (PST)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 25/30] hwmon: (tc74) Use permission specific SENSOR[_DEVICE]_ATTR variants
Date:   Fri, 18 Jan 2019 09:14:55 -0800
Message-Id: <1547831700-15865-26-git-send-email-linux@roeck-us.net>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1547831700-15865-1-git-send-email-linux@roeck-us.net>
References: <1547831700-15865-1-git-send-email-linux@roeck-us.net>
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
 drivers/hwmon/tc74.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/tc74.c b/drivers/hwmon/tc74.c
index d95165158800..fa306bb681bb 100644
--- a/drivers/hwmon/tc74.c
+++ b/drivers/hwmon/tc74.c
@@ -86,7 +86,7 @@ static int tc74_update_device(struct device *dev)
 	return ret;
 }
 
-static ssize_t show_temp_input(struct device *dev,
+static ssize_t temp_input_show(struct device *dev,
 			       struct device_attribute *attr, char *buf)
 {
 	struct tc74_data *data = dev_get_drvdata(dev);
@@ -98,7 +98,7 @@ static ssize_t show_temp_input(struct device *dev,
 
 	return sprintf(buf, "%d\n", data->temp_input * 1000);
 }
-static SENSOR_DEVICE_ATTR(temp1_input, S_IRUGO, show_temp_input, NULL, 0);
+static SENSOR_DEVICE_ATTR_RO(temp1_input, temp_input, 0);
 
 static struct attribute *tc74_attrs[] = {
 	&sensor_dev_attr_temp1_input.dev_attr.attr,
-- 
2.7.4


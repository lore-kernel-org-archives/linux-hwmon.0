Return-Path: <SRS0=IYsF=UG=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E69CDC2BCA1
	for <linux-hwmon@archiver.kernel.org>; Fri,  7 Jun 2019 17:23:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C07BA207E0
	for <linux-hwmon@archiver.kernel.org>; Fri,  7 Jun 2019 17:23:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pcIQ3kt6"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729845AbfFGRXg (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 7 Jun 2019 13:23:36 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:33844 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728998AbfFGRXg (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Fri, 7 Jun 2019 13:23:36 -0400
Received: by mail-pl1-f195.google.com with SMTP id i2so1083979plt.1
        for <linux-hwmon@vger.kernel.org>; Fri, 07 Jun 2019 10:23:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=xwKTupcAp7w+CpPvTLkLwSOGYjzjbY2n1ltMRf4HtI8=;
        b=pcIQ3kt6ntNxGIfMYrp4lU1I2gjZEfo1N/j/s4cJWLW+kQ1XQX1jb1NdUx2R1BQIY3
         1EPxFEIoclvvttY4x64sF4+nxnDbIpIzKdkHmyBs+GlPVS4jb1uubKPbVygLAbnNkwFy
         nSFgt9V5u0HRsWw4jlXBWaDsrcir8CTlGHeffDAxiErnz2B/XlCgoXgwv6rYJ4gxuMmp
         Y44FDqYQ5HSiPi3pxztkpSFYpIV0LKu4sb6ZsSryECvHzDGgl2STMFII/mKowMFtRAdP
         KNG5R4d5BAM7D6bUUC6RcXMWEsb3tXapBIqfzZ3Emft/F8mRBQjJbHW4C1tROiRFbcti
         OYog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=xwKTupcAp7w+CpPvTLkLwSOGYjzjbY2n1ltMRf4HtI8=;
        b=aAR9QYtFPRTjjtJE7xe9BsESR7VK4u2CSe5dHP8bvEetPlKjZEfmtacbzJ/mz32oVU
         wSvu2QKc/eqhI+n0jnr3kBbpJo6HyoZnPbOzWxxSUHJAimuRZmXDfsi2oOLviksF08pn
         i6qaAhPIEJKOwXttDNv4e5vR95qdId8bzm9MuankEtBlWGVMcwkuy4u3WLN9/tgmpm0T
         sA8E0D/e6vjF16/B3nxAUBsisT2HLTy8zCw2kWUYm6k66SncNPH0nifVQu+f5LhSxrnF
         G/t4A9FYaVDsTpF6X+Gnd3xOkoJMXiTPsRcXKrxEJCyQEzzkouxgCZ9TVTraHjudvtsW
         zKXQ==
X-Gm-Message-State: APjAAAUCaA0xr7F5yqNEVME9gr1R0hTgG5Bng1NT73FyII9eavk3M5OY
        3P5kmgLTqiiPdjaza53VsltvizWv
X-Google-Smtp-Source: APXvYqzQbP8rzj9+UhUVQE6dc+n5p64Zb6ExGs3PFfJGsOxQufDvJnCtEd12DOiyxUGm+APjcU2hXQ==
X-Received: by 2002:a17:902:ac82:: with SMTP id h2mr57471575plr.303.1559928215330;
        Fri, 07 Jun 2019 10:23:35 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id j8sm2681226pfi.148.2019.06.07.10.23.34
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 07 Jun 2019 10:23:34 -0700 (PDT)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Jean-Francois Dagenais <jeff.dagenais@gmail.com>
Subject: [PATCH v2 06/10] hwmon: (max6650) Simplify alarm handling
Date:   Fri,  7 Jun 2019 10:23:21 -0700
Message-Id: <1559928205-14030-6-git-send-email-linux@roeck-us.net>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1559928205-14030-1-git-send-email-linux@roeck-us.net>
References: <1559928205-14030-1-git-send-email-linux@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Instead of re-reading the alarm register after reporting an alarm,
mark cached values as invalid. While this results in always reading all
data on subsequent reads, it is quite unlikely that such reads will
actually happen before the cache times out. The upside is avoiding
unnecessary unconditional i2c read operations.

Cc: Jean-Francois Dagenais <jeff.dagenais@gmail.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
v2: No change

 drivers/hwmon/max6650.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/hwmon/max6650.c b/drivers/hwmon/max6650.c
index 2edee4ca5cae..045e67f73846 100644
--- a/drivers/hwmon/max6650.c
+++ b/drivers/hwmon/max6650.c
@@ -512,15 +512,12 @@ static ssize_t alarm_show(struct device *dev,
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
 	struct max6650_data *data = max6650_update_device(dev);
-	struct i2c_client *client = data->client;
-	int alarm = 0;
+	bool alarm = data->alarm & attr->index;
 
-	if (data->alarm & attr->index) {
+	if (alarm) {
 		mutex_lock(&data->update_lock);
-		alarm = 1;
 		data->alarm &= ~attr->index;
-		data->alarm |= i2c_smbus_read_byte_data(client,
-							MAX6650_REG_ALARM);
+		data->valid = false;
 		mutex_unlock(&data->update_lock);
 	}
 
-- 
2.7.4


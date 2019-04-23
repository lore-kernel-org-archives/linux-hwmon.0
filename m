Return-Path: <SRS0=5f14=SZ=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF037C10F14
	for <linux-hwmon@archiver.kernel.org>; Tue, 23 Apr 2019 13:33:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AF0F02077C
	for <linux-hwmon@archiver.kernel.org>; Tue, 23 Apr 2019 13:33:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HcAH6uE8"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727776AbfDWNd0 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 23 Apr 2019 09:33:26 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:34256 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726655AbfDWNd0 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 23 Apr 2019 09:33:26 -0400
Received: by mail-pg1-f196.google.com with SMTP id v12so7642798pgq.1
        for <linux-hwmon@vger.kernel.org>; Tue, 23 Apr 2019 06:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=iy6wDuU665dHl0Hi6m6kbnGqDtd0stHO3a+7x+yFHdY=;
        b=HcAH6uE8tVEw6TDPBKdpXwq9Y/sL6h7fDe4R0SJ5xg2DpxeKg3x6hmihfn+RcO2g9h
         QIeGw6GBNJZyF9SRG34YPh6Yso2KMHyagCeqiMO0vRdoURXkWlqrsdbAf0RMPfn1sLKq
         Zd52mbwkQNDYlOiQjp3Dk91nADk6n9hI2P4EuecSjofv2YHhwbpmiwIUMoGTeC6P9rgT
         dczaBIPfdjnRwtBV2DDXAWpslpNV1nrVdPbuBSYElt1KUziOzJL4LQmbKLTdEXoV1B0M
         H73pliNrjeG7Bcpk47eaVxm9+ICpLuu85Amrm5d+idPlXLUsv5qZunqo0tUKD22tBZRt
         4NFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=iy6wDuU665dHl0Hi6m6kbnGqDtd0stHO3a+7x+yFHdY=;
        b=MD8v54dnceBtsxf9VJkNwFQ7G+flQb0+72MnkGwZPapF/FZ/B/3jfdhbCE+9YlFyZ9
         0nDNe3BJ7NzmWtFZVSFihKIgU8q4/R6HXkVYCA2A2NCqsdocknOwPz4gsCekibJ3Xe33
         dfpLCxkBMFw4kGUlALXclGUFc9lJL/Qr9PGDMcKBIIb3mUaMlvHSZw2gDQBax9ij8m74
         AHBBxV7ke/QG84ddeJn+kX0i8MTfaOf+CVZY6kckOVzV8D+qKhPDnnLG//nWsIvStkVg
         2pEm1jjCNiKvKID1D87DjM/rzKy4Fqy/155kQShlmfxoeLjZQSRyWIh8o/8oXJykoz/W
         e0UA==
X-Gm-Message-State: APjAAAXXsXKp24eA1FctdQe9IIgblHKCWeKr/ek4B7q0/U0av4Q03pG6
        8ujeIGH0h1z0bnELNYw7f7DNukXr
X-Google-Smtp-Source: APXvYqyBOEV1860/F47dT2sDkboPNs/2amMRveh2b6UB0hxFKHdp2lZjPJa8CCpCDklqHhAmJu+3eA==
X-Received: by 2002:a63:b305:: with SMTP id i5mr24617570pgf.274.1556026405368;
        Tue, 23 Apr 2019 06:33:25 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id c1sm21071387pfd.114.2019.04.23.06.33.24
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 23 Apr 2019 06:33:24 -0700 (PDT)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Jean-Francois Dagenais <jeff.dagenais@gmail.com>
Subject: [PATCH 06/11] hwmon: (max6650) Simplify alarm handling
Date:   Tue, 23 Apr 2019 06:33:06 -0700
Message-Id: <1556026391-15360-6-git-send-email-linux@roeck-us.net>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1556026391-15360-1-git-send-email-linux@roeck-us.net>
References: <1556026391-15360-1-git-send-email-linux@roeck-us.net>
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
 drivers/hwmon/max6650.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/hwmon/max6650.c b/drivers/hwmon/max6650.c
index cf051f3acf26..c02694d70eee 100644
--- a/drivers/hwmon/max6650.c
+++ b/drivers/hwmon/max6650.c
@@ -526,15 +526,12 @@ static ssize_t alarm_show(struct device *dev,
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


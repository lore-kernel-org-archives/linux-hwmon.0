Return-Path: <SRS0=PihD=PZ=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF9BBC43387
	for <linux-hwmon@archiver.kernel.org>; Thu, 17 Jan 2019 21:14:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9E9EF20855
	for <linux-hwmon@archiver.kernel.org>; Thu, 17 Jan 2019 21:14:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Te56lHHp"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728015AbfAQVOD (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 17 Jan 2019 16:14:03 -0500
Received: from mail-pf1-f194.google.com ([209.85.210.194]:36564 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728423AbfAQVOD (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 17 Jan 2019 16:14:03 -0500
Received: by mail-pf1-f194.google.com with SMTP id b85so5430857pfc.3
        for <linux-hwmon@vger.kernel.org>; Thu, 17 Jan 2019 13:14:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=CT1+kRC4VwRMFA1xZkie/rNeNrNqzRZm/8vOUITrQys=;
        b=Te56lHHp+0ADr1u1RJFRwDtcdIC3S4fGjQ2/+nRIJIEaCHcd8qtqbTp0FhCtjPEwlA
         Xkt9ZNGPaxncDBdzhZb0kTpFhyi1qe8pC8HSZH4BZyh+hoWuqb0GeOf8czttVUDkhUTW
         yj9M9ar2qRGExL9e3vArF9gXgdxwyyC1O86n2i+5JGpQ//6x834rtUiV022PW6FGvBMC
         FP4lF3gjTtUtZKa12NmU0VNOMFW/KpmDjO0hin5L/cXwiFiQnI67RjypsYRt0pInYowo
         XTARdlhzv6DVkdwVb81NyMD01yFRtkQfHnIlc4fhfP1+uuKm91jVHh44FiHYlSlval8S
         GyCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=CT1+kRC4VwRMFA1xZkie/rNeNrNqzRZm/8vOUITrQys=;
        b=R4Ic/xzFrS8N8pGWLyRsGfLWnmHSpmB6TV847UJOPierbXHOt/o30RnXdc57uuB5j+
         0tFuy19d5jDTaWmAXJZvXYKtWWEBguxpEa40MGhL76PVrtGMxpH8BzBPc1+CgbdWddH5
         0AB+plwK+SxBbSC0sLt+t6+lIM8KBhR5CX83VrD1mD48x8lqy/UWD2x4dE6PL4XrkwvZ
         n8UOB8D5yaYj3zem5RnGOF1LQol5H4qlG/lZ7pwbfy1AjeWjnDARtOYYqfcMvhWxnuq2
         wHRVgKxRSxHErJxb3BUtHzu08Q9I1lfz6Dzl0nP9TaAD3PF8gLDoghnBR0UUu5Hrhnlk
         x9hQ==
X-Gm-Message-State: AJcUuke7PqIIs4p0WzO0x62NiQS4o59IxKLkRHGXDKYAO/WVeGuHp9Iq
        fkywo6fMwEGL4VJ16eO46Xy6q4Vb
X-Google-Smtp-Source: ALg8bN5isKcNImPccgAESGyDhQGSQ8AXqfTtdheGpZkRggjnmkcx8m7IGlLYd007UhGKy1J8z0RymQ==
X-Received: by 2002:a63:6906:: with SMTP id e6mr14695225pgc.144.1547759641996;
        Thu, 17 Jan 2019 13:14:01 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id p77sm6010298pfi.85.2019.01.17.13.14.00
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 17 Jan 2019 13:14:01 -0800 (PST)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 05/29] hwmon: (hwmon) Replace S_<PERMS> with octal values
Date:   Thu, 17 Jan 2019 13:13:25 -0800
Message-Id: <1547759629-23007-6-git-send-email-linux@roeck-us.net>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1547759629-23007-1-git-send-email-linux@roeck-us.net>
References: <1547759629-23007-1-git-send-email-linux@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Replace S_<PERMS> with octal values.

The conversion was done automatically with coccinelle. The semantic patches
and the scripts used to generate this commit log are available at
https://github.com/groeck/coccinelle-patches/hwmon/.

This patch does not introduce functional changes. It was verified by
compiling the old and new files and comparing text and data sizes.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/hwmon.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/hwmon.c b/drivers/hwmon/hwmon.c
index 36ed50d4b276..c22dc1e07911 100644
--- a/drivers/hwmon/hwmon.c
+++ b/drivers/hwmon/hwmon.c
@@ -278,10 +278,10 @@ static struct attribute *hwmon_genattr(struct device *dev,
 	if (!mode)
 		return ERR_PTR(-ENOENT);
 
-	if ((mode & S_IRUGO) && ((is_string && !ops->read_string) ||
+	if ((mode & 0444) && ((is_string && !ops->read_string) ||
 				 (!is_string && !ops->read)))
 		return ERR_PTR(-EINVAL);
-	if ((mode & S_IWUGO) && !ops->write)
+	if ((mode & 0222) && !ops->write)
 		return ERR_PTR(-EINVAL);
 
 	hattr = devm_kzalloc(dev, sizeof(*hattr), GFP_KERNEL);
-- 
2.7.4


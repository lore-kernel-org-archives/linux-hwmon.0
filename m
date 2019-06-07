Return-Path: <SRS0=IYsF=UG=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2256C468BC
	for <linux-hwmon@archiver.kernel.org>; Fri,  7 Jun 2019 17:23:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id ABF58207E0
	for <linux-hwmon@archiver.kernel.org>; Fri,  7 Jun 2019 17:23:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DLR6ODmU"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729692AbfFGRXd (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 7 Jun 2019 13:23:33 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:35680 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728998AbfFGRXd (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Fri, 7 Jun 2019 13:23:33 -0400
Received: by mail-pf1-f195.google.com with SMTP id d126so1572776pfd.2
        for <linux-hwmon@vger.kernel.org>; Fri, 07 Jun 2019 10:23:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=T7k9AYnO1mNURlsxAnQU61wfHeBoyRysNsiVHi1JHPk=;
        b=DLR6ODmUqVvUjMIhs112AShK6xRNmkkcif75si++K9Lg/xEJqrCgLcMDXN/UCiSzXP
         xnZOIXpvZ6ETgwCJ/T5J49uHNdmSnvmpJgjeOLy+UIzCM7elvU2JNoUitrG6WnE8pNAI
         Dx5e6izZANM7MSmzXuOrQ4dg4kl0Fn10jAgJiTsopeLsCaHjnOi4ou9tAJ/LHE6r1EUu
         yRlEYB90uhOc/3rrMWmnQfj41QNAQEg1/2t0xUob6P8YMyaC5LjW9lD5ju9rk5E66PYb
         8rBwPVT3UQTovilUt/mk56Jp9JMBpA+Z50ACMjdN6gk4PqvkbSHyCeLpoPHeq74LsuaG
         qqNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=T7k9AYnO1mNURlsxAnQU61wfHeBoyRysNsiVHi1JHPk=;
        b=X0Q2Ki2eulHjdXhfcCXdfD2IB8xiILvAHeBPqjZHvlFus5jV2jn60K3zwoP4i987lY
         fMaPK9B7JJ+Hl03vOe0M00Z+rc5ZXy8INf2Yd0WPnz0+JI/y1749pomJcEbAAvBY22/9
         6VwSbC2WvAxCPQUQUpKQlCGNy952Fj27OD3pc49fNHqGyprrCu+DuC7K1v3ww+Tn8MQ8
         2uVYQvdju116UfLS2dv0BbQohML6k5bnO4VRJlnGpxR0F3YiBdTPRhO5NG0WcnuIb4UG
         aEd3ebCEpX1+SbvRnGj/4KIJHGUmLBWg1cEfpAwxsMGObT2AX+P/nf3HRrcU9wdnFwkU
         Jrug==
X-Gm-Message-State: APjAAAWwcqJ44PyvoZTS9VQrr187aHzp3c1boRUCv4ByEHXP09OU5QEA
        WbJhSRnJBuQiPez8z45DOTqJE0Pc
X-Google-Smtp-Source: APXvYqzq+YoWkPExt8r355vPQIluEXQgFSGA4HD5+1GOPOVT+mdzcp1GeAFbb6r3Tw03RXNutJNV4g==
X-Received: by 2002:a63:f146:: with SMTP id o6mr3835689pgk.179.1559928212571;
        Fri, 07 Jun 2019 10:23:32 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id f13sm2992329pfa.182.2019.06.07.10.23.31
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 07 Jun 2019 10:23:32 -0700 (PDT)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Jean-Francois Dagenais <jeff.dagenais@gmail.com>
Subject: [PATCH v2 04/10] hwmon: (max6650) Declare valid as boolean
Date:   Fri,  7 Jun 2019 10:23:19 -0700
Message-Id: <1559928205-14030-4-git-send-email-linux@roeck-us.net>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1559928205-14030-1-git-send-email-linux@roeck-us.net>
References: <1559928205-14030-1-git-send-email-linux@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Declare valid as boolean to match its use case.

Cc: Jean-Francois Dagenais <jeff.dagenais@gmail.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
v2: No change

 drivers/hwmon/max6650.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/max6650.c b/drivers/hwmon/max6650.c
index caede4d3e21a..90565318aafb 100644
--- a/drivers/hwmon/max6650.c
+++ b/drivers/hwmon/max6650.c
@@ -104,7 +104,7 @@ struct max6650_data {
 	const struct attribute_group *groups[3];
 	struct mutex update_lock;
 	int nr_fans;
-	char valid; /* zero until following fields are valid */
+	bool valid; /* false until following fields are valid */
 	unsigned long last_updated; /* in jiffies */
 
 	/* register values */
@@ -183,7 +183,7 @@ static struct max6650_data *max6650_update_device(struct device *dev)
 							MAX6650_REG_ALARM);
 
 		data->last_updated = jiffies;
-		data->valid = 1;
+		data->valid = true;
 	}
 
 	mutex_unlock(&data->update_lock);
-- 
2.7.4


Return-Path: <SRS0=rYov=SQ=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4102C10F13
	for <linux-hwmon@archiver.kernel.org>; Sun, 14 Apr 2019 21:57:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6E74420818
	for <linux-hwmon@archiver.kernel.org>; Sun, 14 Apr 2019 21:57:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FAfrlJRt"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726392AbfDNV52 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 14 Apr 2019 17:57:28 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:45281 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725829AbfDNV51 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 14 Apr 2019 17:57:27 -0400
Received: by mail-pl1-f196.google.com with SMTP id bf11so7558247plb.12
        for <linux-hwmon@vger.kernel.org>; Sun, 14 Apr 2019 14:57:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id;
        bh=zqqYAEdy1XGI0J4t4krzg3qUCRE/LgmC97Nu+8eamxQ=;
        b=FAfrlJRtFvKWCAeq49UjN+T95PYUScjprSX8YNM0CuclcDUiaDEFRcS2RGvsd4dPMn
         gm3931bZvXVgJyjjeevON1KnE8RwJP+6BAygXnUmx6WBcPAXACukbZWFMvh8fNliduCR
         UxGtl2JRQHakugK+5B2q7MSAxu2tbOnLr/rDzsm1WjRGBlm3VQPmJ+Y9s3rNNnnFH199
         6gYHJ1NsCZ+UPA+gU12jYMA/aUauS0h7htdPoytxmPr1uN3wcE8VqOG966hJUMGbsp9+
         izrellHJEjkjI2lZDX9/NiGLiFPNnUwr9ZuO6BDR0pmys8HznOlT/SIcX5aVsdjGqsDt
         XwTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
        bh=zqqYAEdy1XGI0J4t4krzg3qUCRE/LgmC97Nu+8eamxQ=;
        b=F09oeokvEihEBxuaatvRh0fAAr/JIesu01cXDKRQPG4e3nSUcFW/zqYTtPYAhuvBdd
         Rnuzu1DaIIY85PiDf71X6Q80S6GgD4BEfYs8Q4leUmnWct0rIIzn+i4SZLoeQ+mzVnIA
         nyX2Q9gGAwmNYbf2LXPpqRav+aAU8JSXYzACgaYMN4OZLiBIvA3naafrclUoA4Jzb0Py
         AZDHw3iuWnjNyt6jITlgVz+/1pInqlplN7EE+eAkpeYAY4VVrJd6OLdSsKsb1VhJ216J
         N8W1gGdZ3FgJqAL5aKdJzBEeUAZMALhItuClaIAbEHFt7nSrzFX/X4U2ECZSKuIwyCE1
         wqkA==
X-Gm-Message-State: APjAAAVHF7tM8k55+7lNhwPfpzdZfEvtLm2LQRhzXDUNt1W3gbhdsVj3
        bdEvjPpE9f3ZsWbcKOKmy+GUkWgg
X-Google-Smtp-Source: APXvYqz9j3Mf1c1n9g22o14KLHq2poUcVS2F4oW7Q9PMzWar4tYSTA+AtB+XfjWLOmkECJ+m6L30JA==
X-Received: by 2002:a17:902:2862:: with SMTP id e89mr52675147plb.203.1555279046941;
        Sun, 14 Apr 2019 14:57:26 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id l184sm114484761pfc.98.2019.04.14.14.57.26
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 14 Apr 2019 14:57:26 -0700 (PDT)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Krzysztof Adamski <krzysztof.adamski@nokia.com>
Subject: [PATCH] hwmon: (pmbus_core) Replace S_<PERMS> with octal values
Date:   Sun, 14 Apr 2019 14:57:24 -0700
Message-Id: <1555279044-25139-1-git-send-email-linux@roeck-us.net>
X-Mailer: git-send-email 2.7.4
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

Cc: Krzysztof Adamski <krzysztof.adamski@nokia.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/pmbus/pmbus_core.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index 2e2b5851139c..e2366428a9a9 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -1073,7 +1073,7 @@ static int pmbus_add_boolean(struct pmbus_data *data,
 		 name, seq, type);
 	boolean->s1 = s1;
 	boolean->s2 = s2;
-	pmbus_attr_init(a, boolean->name, S_IRUGO, pmbus_show_boolean, NULL,
+	pmbus_attr_init(a, boolean->name, 0444, pmbus_show_boolean, NULL,
 			(reg << 16) | mask);
 
 	return pmbus_add_attribute(data, &a->dev_attr.attr);
@@ -1107,7 +1107,7 @@ static struct pmbus_sensor *pmbus_add_sensor(struct pmbus_data *data,
 	sensor->update = update;
 	sensor->convert = convert;
 	pmbus_dev_attr_init(a, sensor->name,
-			    readonly ? S_IRUGO : S_IRUGO | S_IWUSR,
+			    readonly ? 0444 : 0644,
 			    pmbus_show_sensor, pmbus_set_sensor);
 
 	if (pmbus_add_attribute(data, &a->attr))
@@ -1139,7 +1139,7 @@ static int pmbus_add_label(struct pmbus_data *data,
 		snprintf(label->label, sizeof(label->label), "%s%d", lstring,
 			 index);
 
-	pmbus_dev_attr_init(a, label->name, S_IRUGO, pmbus_show_label, NULL);
+	pmbus_dev_attr_init(a, label->name, 0444, pmbus_show_label, NULL);
 	return pmbus_add_attribute(data, &a->attr);
 }
 
-- 
2.7.4


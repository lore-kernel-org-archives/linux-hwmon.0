Return-Path: <SRS0=PihD=PZ=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D17FAC43387
	for <linux-hwmon@archiver.kernel.org>; Thu, 17 Jan 2019 21:14:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A17D420855
	for <linux-hwmon@archiver.kernel.org>; Thu, 17 Jan 2019 21:14:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ug7HM7um"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728616AbfAQVOQ (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 17 Jan 2019 16:14:16 -0500
Received: from mail-pf1-f195.google.com ([209.85.210.195]:42275 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728239AbfAQVOQ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 17 Jan 2019 16:14:16 -0500
Received: by mail-pf1-f195.google.com with SMTP id 64so5418296pfr.9
        for <linux-hwmon@vger.kernel.org>; Thu, 17 Jan 2019 13:14:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=PA8GWM/K4dIKjKGhukpRdaZ/hJk5CH5KPvEqNLsNmm4=;
        b=ug7HM7um0Q2j6mpT0/Ee46jCcB02kAclWyWUp+BDzksCoG9/tWHXMIrAs2bdfXQlu+
         y3q0PdHcrWFkWF8AUklBugLtSciKuc4zEn3CAibHCsvFQ12egLzM3SSfIHIQXRnrS3WG
         PNC6qwcaBcTpyp8AYZYa9FhjH7bnJTQGltTM4tEJqjLj/tqpsSsSUxdzIvRp3r3xOwhi
         6KTxSf1K58GrK6DVfGSnaDeirTaO+lc6uCdxt8kZ6pDK5rY9Bxr+ae/eqb1M88BmbZtF
         pN38AEYyw8O0DOBuEQ3wO17pTmfwdFHnMbTphZ1go+jIQE8ydZfOtbB5TseHlsVqtq07
         rX8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=PA8GWM/K4dIKjKGhukpRdaZ/hJk5CH5KPvEqNLsNmm4=;
        b=b+I1oiTn0tyzgoQ1JuRDsmlUfi29eMfSIlsFgaM1n5yuGnZ+QS+YQR/uqzyxzPj0zy
         x1RGeZCuA8Aj51E5DEhEPWdkGliRDCL5wPRBJH6OAqwjnYJlLX1j7sejyp+5ALnSXGsa
         5AxO1MDdAYeU6tuRLbuWcL5VI8+sDeKITf2BIK9Vv2peU3ynYBORTsYnkjS7JwqPlD9V
         zfXLeeU7ws4E36cyf/Q1vVNhotfGgxekJi0xZ6EHJJqgW6W0NlbtmI0uqWmcx36oCJd0
         7I85AEu2XpbXKKbAZEcegEeDyGHhyNvjN4sm+bQEp2PTZFi8rMhhQe7Xl6RQmRUxcpLO
         z6aQ==
X-Gm-Message-State: AJcUukfdOHLAS28rSamo1TUkN2zvOmDInl0gHEKeeFKcmblOFC6klWX9
        U88rmoqaYEKcIRe9R54yo6A7gTA+
X-Google-Smtp-Source: ALg8bN4+26eXdu+EKUage1b8tb4bE969RvA5cLVUmNZcLOENaw5vDcPfWQUkERxfRX+yzcXNz6+uzg==
X-Received: by 2002:a63:60cf:: with SMTP id u198mr14933363pgb.323.1547759655062;
        Thu, 17 Jan 2019 13:14:15 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id i5sm5191473pfg.34.2019.01.17.13.14.14
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 17 Jan 2019 13:14:14 -0800 (PST)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 13/29] hwmon: (jc42) Replace S_<PERMS> with octal values
Date:   Thu, 17 Jan 2019 13:13:33 -0800
Message-Id: <1547759629-23007-14-git-send-email-linux@roeck-us.net>
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
 drivers/hwmon/jc42.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/jc42.c b/drivers/hwmon/jc42.c
index e5234f953a6d..4fa482ae0eb5 100644
--- a/drivers/hwmon/jc42.c
+++ b/drivers/hwmon/jc42.c
@@ -390,21 +390,21 @@ static umode_t jc42_is_visible(const void *_data, enum hwmon_sensor_types type,
 {
 	const struct jc42_data *data = _data;
 	unsigned int config = data->config;
-	umode_t mode = S_IRUGO;
+	umode_t mode = 0444;
 
 	switch (attr) {
 	case hwmon_temp_min:
 	case hwmon_temp_max:
 		if (!(config & JC42_CFG_EVENT_LOCK))
-			mode |= S_IWUSR;
+			mode |= 0200;
 		break;
 	case hwmon_temp_crit:
 		if (!(config & JC42_CFG_TCRIT_LOCK))
-			mode |= S_IWUSR;
+			mode |= 0200;
 		break;
 	case hwmon_temp_crit_hyst:
 		if (!(config & (JC42_CFG_EVENT_LOCK | JC42_CFG_TCRIT_LOCK)))
-			mode |= S_IWUSR;
+			mode |= 0200;
 		break;
 	case hwmon_temp_input:
 	case hwmon_temp_max_hyst:
-- 
2.7.4


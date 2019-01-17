Return-Path: <SRS0=PihD=PZ=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BB73C43387
	for <linux-hwmon@archiver.kernel.org>; Thu, 17 Jan 2019 21:14:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0B81120855
	for <linux-hwmon@archiver.kernel.org>; Thu, 17 Jan 2019 21:14:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nYNNYGzZ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728286AbfAQVOL (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 17 Jan 2019 16:14:11 -0500
Received: from mail-pf1-f196.google.com ([209.85.210.196]:46800 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728239AbfAQVOL (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 17 Jan 2019 16:14:11 -0500
Received: by mail-pf1-f196.google.com with SMTP id c73so5409714pfe.13
        for <linux-hwmon@vger.kernel.org>; Thu, 17 Jan 2019 13:14:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Q1kfYMjdHJIxVh9BATerwSZ4HvNLxcWi+3DRF4UQLmI=;
        b=nYNNYGzZUasjNgbbNnDAT2xe8maeELxIrDj/gw7f+d5wnyRsuh2eTgf6owxtSN8gyh
         4N/CZvPSwOaipuTxhy08BR68jjzwQhGSsLBIVCrFUg6qYTNErNblidBPsvWrijEnCyZF
         lnmImJzXSRC3bJbOmKaEom2J87AjYjlwQ0U7VPiyKeuwxPvVfP6Tf1gfkCxJMbfILXgy
         ViEK49Uqcq5tAZ6nb9EVdi2sAiIc69BiBM1kALTlUVdfvpniBuMS7KoWFnHiAy3X4RnM
         lMujiP8J/cR6VosHCFVftSJNyDvrYJxLQ08L641kADZnIjmQDJ5O/fottz6e4VhHCdDL
         kyKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=Q1kfYMjdHJIxVh9BATerwSZ4HvNLxcWi+3DRF4UQLmI=;
        b=e6KasNPqttRSm3KfhsEc5XtFONTyEC5zj5Zp7UTAfV0xHmvHF0PxVbERxufvnLxbH/
         Sybiuz6HM58SJgKM2ZlYWfNpuyLZtjIaeZVRYEQ26/CJC4nGvxjrAe+ZA0lNgR06+Jb+
         eTO8vvmZtA/wKRMPyyQNDc1U0+2bAGdjY9R+x1W1fcEhXBmy/0WgjXCyodaMrtaHvLH2
         HTpNPFMN2j9Cf4+JcYQPmxxdhAWxlaZA8BRXjutqPbEUALQN/sD9L0VbTvVMy/5beiH/
         BdowbCU4kmwcG7HZmbl1O9d3GRpBTRRfTVdJC0nHr+coltMnh+Eet+0VNoWaYye1y1Sf
         1X9A==
X-Gm-Message-State: AJcUukdijCV9o+AocrqhQ6ihbPw5CimhbOElhUifwakJfTS/52zFbyWe
        2EtJY6GzasEaxR+A+HPszm8glmRG
X-Google-Smtp-Source: ALg8bN4afgxvjVTG0DLlnbA39V8O7bPscHAcgVPpM66UnqDk+r+wJBLB0ixNpWJhZmFu0FKAv+XV4Q==
X-Received: by 2002:a62:931a:: with SMTP id b26mr17198502pfe.65.1547759650305;
        Thu, 17 Jan 2019 13:14:10 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id t90sm4968302pfj.23.2019.01.17.13.14.09
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 17 Jan 2019 13:14:09 -0800 (PST)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 10/29] hwmon: (iio_hwmon) Replace S_<PERMS> with octal values
Date:   Thu, 17 Jan 2019 13:13:30 -0800
Message-Id: <1547759629-23007-11-git-send-email-linux@roeck-us.net>
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
 drivers/hwmon/iio_hwmon.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/iio_hwmon.c b/drivers/hwmon/iio_hwmon.c
index eed66e533ee2..5c3c08449de7 100644
--- a/drivers/hwmon/iio_hwmon.c
+++ b/drivers/hwmon/iio_hwmon.c
@@ -129,7 +129,7 @@ static int iio_hwmon_probe(struct platform_device *pdev)
 			return -ENOMEM;
 
 		a->dev_attr.show = iio_hwmon_read_val;
-		a->dev_attr.attr.mode = S_IRUGO;
+		a->dev_attr.attr.mode = 0444;
 		a->index = i;
 		st->attrs[i] = &a->dev_attr.attr;
 	}
-- 
2.7.4


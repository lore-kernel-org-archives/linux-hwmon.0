Return-Path: <SRS0=ckkT=P2=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A100C5ACD3
	for <linux-hwmon@archiver.kernel.org>; Fri, 18 Jan 2019 17:15:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5B75020850
	for <linux-hwmon@archiver.kernel.org>; Fri, 18 Jan 2019 17:15:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sZRL4lpM"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728583AbfARRPf (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 18 Jan 2019 12:15:35 -0500
Received: from mail-pl1-f195.google.com ([209.85.214.195]:39189 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728574AbfARRPf (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 18 Jan 2019 12:15:35 -0500
Received: by mail-pl1-f195.google.com with SMTP id 101so6618601pld.6
        for <linux-hwmon@vger.kernel.org>; Fri, 18 Jan 2019 09:15:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=CQHZN02k41zjHbe4NZrSQSbp8mWUtbeqZIvrtHCHhgA=;
        b=sZRL4lpMpAhTnv1oj/jBrkeVWB3RZZtJ0EnkJtmjbDIMwxgAm5DDdpOUf6Eemm665d
         agEmrHnfmO53P5qq3wUXkOavRFmAGVIt8V9Jdq9v181W2VTuVOdFUdKpMeariRiIa2TB
         G4/O6cEndt3Eg4gGOCI+/HQCZ/9ZiNSoVwhTJQxVWvhAUbiVfmJ8+e0Ns9nvQVW14Q3s
         uSL6jDKq43QKVKNdp7/lP6Yo/ykA1ovbJSbCurVNVgK98PJTYXIiHzBqSh1OPXtqMTFp
         icHBOrCkO9YHpV/8rtEHoyTxcIYZ7C21CsfkPs/3TgMktQV5q7nXc8r94GyXGGjNjFj+
         ZmRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=CQHZN02k41zjHbe4NZrSQSbp8mWUtbeqZIvrtHCHhgA=;
        b=ZwpEw2zFDuE+h8acq1mr/i15vE3h/bGkrvTjMQwoKAvhE96iIF4DtRnC1GwxVDWW62
         mZ7Mn8OU0X6hQ+/sIWcXtLitCDt/nsYPpH5dJNLxIwv6BVFfn70OJ1apByxQZKbVkPWC
         /YJ7OAneplKJpKZVtaI0BbPu3xfT6Mw1/yEpRQtL4tuQYHDo6vfwSBJqsZ8NHjjYNyqj
         2/1lMl73WI1aRC7459P4LANHZnXjRkOufd2umnhFtclxQfxIlYTRYwZPdTkTiDlT0Pk5
         BlzEIxE8R1Bn8JF8R/9Vp0TcivFQMAX18r14MsPk0nnmjNLzDYtL0zsHiuIE9Tgg5IGs
         LAOw==
X-Gm-Message-State: AJcUukfOASehKdYNnWqX+A+V+iX+oR6Ir/V5tBTmGoOXdYDtSqZRRZfy
        Z1y+QcY60BzxdKr0LtIma50SH+HU
X-Google-Smtp-Source: ALg8bN7cGPXytbSfgAnMgJw3ol+Yd80xStIxST4irC0RSHi6oazJI0Lp2b5moO1dNqTy22AqeRGZpg==
X-Received: by 2002:a17:902:66e6:: with SMTP id e93mr19537941plk.92.1547831734188;
        Fri, 18 Jan 2019 09:15:34 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id p6sm7656679pfn.53.2019.01.18.09.15.33
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 18 Jan 2019 09:15:33 -0800 (PST)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 18/30] hwmon: (scpi-hwmon) Replace S_<PERMS> with octal values
Date:   Fri, 18 Jan 2019 09:14:48 -0800
Message-Id: <1547831700-15865-19-git-send-email-linux@roeck-us.net>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1547831700-15865-1-git-send-email-linux@roeck-us.net>
References: <1547831700-15865-1-git-send-email-linux@roeck-us.net>
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
 drivers/hwmon/scpi-hwmon.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/scpi-hwmon.c b/drivers/hwmon/scpi-hwmon.c
index 111d521e2189..9bfa228d0eb0 100644
--- a/drivers/hwmon/scpi-hwmon.c
+++ b/drivers/hwmon/scpi-hwmon.c
@@ -226,11 +226,11 @@ static int scpi_hwmon_probe(struct platform_device *pdev)
 
 		sensor->scale = scale[sensor->info.class];
 
-		sensor->dev_attr_input.attr.mode = S_IRUGO;
+		sensor->dev_attr_input.attr.mode = 0444;
 		sensor->dev_attr_input.show = scpi_show_sensor;
 		sensor->dev_attr_input.attr.name = sensor->input;
 
-		sensor->dev_attr_label.attr.mode = S_IRUGO;
+		sensor->dev_attr_label.attr.mode = 0444;
 		sensor->dev_attr_label.show = scpi_show_label;
 		sensor->dev_attr_label.attr.name = sensor->label;
 
-- 
2.7.4


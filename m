Return-Path: <SRS0=CoSo=SD=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11E43C43381
	for <linux-hwmon@archiver.kernel.org>; Mon,  1 Apr 2019 16:19:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D57192133D
	for <linux-hwmon@archiver.kernel.org>; Mon,  1 Apr 2019 16:19:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EDFW6Pvi"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728499AbfDAQTy (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 1 Apr 2019 12:19:54 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:34169 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728038AbfDAQTy (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 1 Apr 2019 12:19:54 -0400
Received: by mail-pl1-f193.google.com with SMTP id y6so4749404plt.1
        for <linux-hwmon@vger.kernel.org>; Mon, 01 Apr 2019 09:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=c+ZzZYPNs+UKwnepGILmiCM5G2GAMsPPUmYUFUA+Cho=;
        b=EDFW6PviUDkU5PWwP5tEeMMXjyYsE/5A76rKy3ZUrcn3/PTxnDw9cRr9hk1QzE3y48
         /GbJuRhkBk2aJkcDdPuWf7a2JWCJgra8QPUhlOqJoZT0O9sTpkI5wRhsXvXgWssWFhVI
         cI6XQhcpZth29PcbButyAc6MtQRIp5RGVTZkh0YTfH1WrW8QNBqEeKYWwYqwxYCizyAV
         2MLNwgA/LIa+omnqstXsLNMWTjVhqazQmfgS4xF/xPjIMayOarus/mP42pG+Up8QKFTR
         NmeRWKsrBYTNHxa76E1N2iAr8Kb8GcuZvtgDVHqjGtfUn1PBOs0sbE8QoJxx0tpT4sca
         RHEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=c+ZzZYPNs+UKwnepGILmiCM5G2GAMsPPUmYUFUA+Cho=;
        b=lBQhQAdpzN3RYTjrbuNkTUbXVfEWSut3VL0AnphjWpSUO626Sx8UhRKV/p949OK1J6
         7Dx/4kORFMI2GvnwyT++qmTZgktKRr2tKp4vJVssiMjV599KgZpPswaYs2y/99K43yal
         8VcVJmBJeY3mpqL10oYqrSpE72VvfSeHWBTmNxhDt2dwTBNuAS134JkLENNLoF4BfvM3
         qV3wn3rsT48Z8dXgs3nogFFt3TQMlp4vvt7TJSAlPdoaG7uPONmrsNMTkfRmToXOfKeM
         TpaTjYBz8UUEwQ+KuqAu6Ar52nUvcGXSceLrHbVH0aRUVftL+0NA5HIqqBw1HkwN/+vi
         rLjA==
X-Gm-Message-State: APjAAAWdZ229A3qaUrufrBB9j6BcVx8RCnGrQiYlwc084YBOwEMMd7hY
        9BAdouA3ah0/gY6a83LTq4nA0wrS
X-Google-Smtp-Source: APXvYqxT+ZBiEo/E20Uf+z0XVxvFdqJbVTa6FQNLZplRk7gXosDsR6tey3WbF5lDjOoXA7RyTYBTkA==
X-Received: by 2002:a17:902:b43:: with SMTP id 61mr64620060plq.83.1554135593412;
        Mon, 01 Apr 2019 09:19:53 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 28sm17247931pgq.59.2019.04.01.09.19.52
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 01 Apr 2019 09:19:52 -0700 (PDT)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 07/17] hwmon: (lm95245) Use HWMON_CHANNEL_INFO macro
Date:   Mon,  1 Apr 2019 09:19:27 -0700
Message-Id: <1554135577-11889-8-git-send-email-linux@roeck-us.net>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1554135577-11889-1-git-send-email-linux@roeck-us.net>
References: <1554135577-11889-1-git-send-email-linux@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

The HWMON_CHANNEL_INFO macro simplifies the code, reduces the likelihood
of errors, and makes the code easier to read.

The conversion was done automatically with coccinelle. The semantic patch
used to make this change is as follows.

@r@
initializer list elements;
identifier i;
@@

-u32 i[] = {
-  elements,
-  0
-};

@s@
identifier r.i,j,ty;
@@

-struct hwmon_channel_info j = {
-       .type = ty,
-       .config = i,
-};

@script:ocaml t@
ty << s.ty;
elements << r.elements;
shorter;
elems;
@@

shorter :=
   make_ident (List.hd(List.rev (Str.split (Str.regexp "_") ty)));
elems :=
   make_ident
    (String.concat ","
     (List.map (fun x -> Printf.sprintf "\n\t\t\t   %s" x)
       (Str.split (Str.regexp " , ") elements)))

@@
identifier s.j,t.shorter;
identifier t.elems;
@@

- &j
+ HWMON_CHANNEL_INFO(shorter,elems)

This patch does not introduce functional changes. Many thanks to
Julia Lawall for providing the semantic patch.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/lm95245.c | 34 +++++++++-------------------------
 1 file changed, 9 insertions(+), 25 deletions(-)

diff --git a/drivers/hwmon/lm95245.c b/drivers/hwmon/lm95245.c
index e4cac3a04536..c7e04f28ac90 100644
--- a/drivers/hwmon/lm95245.c
+++ b/drivers/hwmon/lm95245.c
@@ -545,32 +545,16 @@ static const struct regmap_config lm95245_regmap_config = {
 	.use_single_write = true,
 };
 
-static const u32 lm95245_chip_config[] = {
-	HWMON_C_UPDATE_INTERVAL,
-	0
-};
-
-static const struct hwmon_channel_info lm95245_chip = {
-	.type = hwmon_chip,
-	.config = lm95245_chip_config,
-};
-
-static const u32 lm95245_temp_config[] = {
-	HWMON_T_INPUT | HWMON_T_CRIT | HWMON_T_CRIT_HYST | HWMON_T_CRIT_ALARM,
-	HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_MAX_HYST | HWMON_T_CRIT |
-		HWMON_T_CRIT_HYST | HWMON_T_FAULT | HWMON_T_MAX_ALARM |
-		HWMON_T_CRIT_ALARM | HWMON_T_TYPE | HWMON_T_OFFSET,
-	0
-};
-
-static const struct hwmon_channel_info lm95245_temp = {
-	.type = hwmon_temp,
-	.config = lm95245_temp_config,
-};
-
 static const struct hwmon_channel_info *lm95245_info[] = {
-	&lm95245_chip,
-	&lm95245_temp,
+	HWMON_CHANNEL_INFO(chip,
+			   HWMON_C_UPDATE_INTERVAL),
+	HWMON_CHANNEL_INFO(temp,
+			   HWMON_T_INPUT | HWMON_T_CRIT | HWMON_T_CRIT_HYST |
+			   HWMON_T_CRIT_ALARM,
+			   HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_MAX_HYST |
+			   HWMON_T_CRIT | HWMON_T_CRIT_HYST | HWMON_T_FAULT |
+			   HWMON_T_MAX_ALARM | HWMON_T_CRIT_ALARM |
+			   HWMON_T_TYPE | HWMON_T_OFFSET),
 	NULL
 };
 
-- 
2.7.4


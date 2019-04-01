Return-Path: <SRS0=CoSo=SD=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88FC6C43381
	for <linux-hwmon@archiver.kernel.org>; Mon,  1 Apr 2019 16:19:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 512582133D
	for <linux-hwmon@archiver.kernel.org>; Mon,  1 Apr 2019 16:19:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ks30OCA5"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726854AbfDAQTx (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 1 Apr 2019 12:19:53 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:35600 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728038AbfDAQTx (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 1 Apr 2019 12:19:53 -0400
Received: by mail-pf1-f195.google.com with SMTP id t21so4825852pfe.2
        for <linux-hwmon@vger.kernel.org>; Mon, 01 Apr 2019 09:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=nRPYySe5R3lQEWfMMgUD4zw90LQSLBGRYWrOhZfab04=;
        b=ks30OCA5RaiAkbmOQ7txoemTgMnSNiz6iV5VdXfHsdLlk25ZEAuaU3SxPFyjFJKjPf
         QNqpgXrK3vOqwsi/BrKTWcAsC9a6HZkTZVnRmSA1Iqiqqx+YyVqS+caJfM27b7D2dt8m
         6JqOo595QWl76+ATlkDZDHKos59Ji4GSYSWxFm/4Mikj5sNVX/6uGPOPB13qITJqvVdH
         wGMVdDSCgTKmMN4zdir/ch3h1+yJBMlUSk02DrRSmBCNegtuI6QfkortNEY22eO2lHne
         HEyjat3bT5S64yLsWalH2ZPJJcFIPEvP09rh7UZukraLyyn0MZka1cFlLDJgQV9uL1mn
         BcBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=nRPYySe5R3lQEWfMMgUD4zw90LQSLBGRYWrOhZfab04=;
        b=l9Y21bllFf56RZ7NP6ywe7CdjglirKPcv2dgTYRy0FNNLzISnKAjWudM/D/uFdotvV
         x2andIBrUi+EPPJfVjVGEtZfSRWoDN+FrrEdxOEyXspZ7BKltgetWHgGuM9Xp2ztG7RM
         vbLvGMJxNK+Nl/WwkCwOJZIqBsKPGPHsh1WSFqDSAn69GlC1LFlTDdIr9HsFu40P5wFQ
         jaI4DWuSfD0ZIv/qK8EDk5RFUQEhvKFjXI+zsp7wWCaz3wDj2f5iQawI5wFwsuN1VsCO
         HZMdrpxdGlQJFd0Kr/4BJbHW2wOm8mhiUqVA2j+BKbWMRj8i8BOZXFEPVyMYRFfdYlXV
         1q5g==
X-Gm-Message-State: APjAAAXWyiG6UyMxjZwFb5RPEFwS3p4Xm5SLDZ4xTZ6b+WiRnGPq65K1
        mqKIPaOy3KDwDuhr3C/yGDdHbslz
X-Google-Smtp-Source: APXvYqyOSHJjysUz4X2dOljdFkuNQ0fAPEgpRqgZsTRbDa7RI5MAvNbgEQXTFOJj+UjAVm1utz/Ldg==
X-Received: by 2002:a63:5b4d:: with SMTP id l13mr16591339pgm.160.1554135591865;
        Mon, 01 Apr 2019 09:19:51 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id f87sm25207176pff.56.2019.04.01.09.19.51
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 01 Apr 2019 09:19:51 -0700 (PDT)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 06/17] hwmon: (lm95241) Use HWMON_CHANNEL_INFO macro
Date:   Mon,  1 Apr 2019 09:19:26 -0700
Message-Id: <1554135577-11889-7-git-send-email-linux@roeck-us.net>
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
 drivers/hwmon/lm95241.c | 34 ++++++++--------------------------
 1 file changed, 8 insertions(+), 26 deletions(-)

diff --git a/drivers/hwmon/lm95241.c b/drivers/hwmon/lm95241.c
index 3ff188937158..6c5215e6d448 100644
--- a/drivers/hwmon/lm95241.c
+++ b/drivers/hwmon/lm95241.c
@@ -418,33 +418,15 @@ static void lm95241_init_client(struct i2c_client *client,
 				  data->model);
 }
 
-static const u32 lm95241_chip_config[] = {
-	HWMON_C_UPDATE_INTERVAL,
-	0
-};
-
-static const struct hwmon_channel_info lm95241_chip = {
-	.type = hwmon_chip,
-	.config = lm95241_chip_config,
-};
-
-static const u32 lm95241_temp_config[] = {
-	HWMON_T_INPUT,
-	HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_MIN | HWMON_T_TYPE |
-		HWMON_T_FAULT,
-	HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_MIN | HWMON_T_TYPE |
-		HWMON_T_FAULT,
-	0
-};
-
-static const struct hwmon_channel_info lm95241_temp = {
-	.type = hwmon_temp,
-	.config = lm95241_temp_config,
-};
-
 static const struct hwmon_channel_info *lm95241_info[] = {
-	&lm95241_chip,
-	&lm95241_temp,
+	HWMON_CHANNEL_INFO(chip,
+			   HWMON_C_UPDATE_INTERVAL),
+	HWMON_CHANNEL_INFO(temp,
+			   HWMON_T_INPUT,
+			   HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_MIN |
+			   HWMON_T_TYPE | HWMON_T_FAULT,
+			   HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_MIN |
+			   HWMON_T_TYPE | HWMON_T_FAULT),
 	NULL
 };
 
-- 
2.7.4


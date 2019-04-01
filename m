Return-Path: <SRS0=CoSo=SD=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59E12C10F05
	for <linux-hwmon@archiver.kernel.org>; Mon,  1 Apr 2019 16:20:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 25D252133D
	for <linux-hwmon@archiver.kernel.org>; Mon,  1 Apr 2019 16:20:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GSjjYJ0b"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728641AbfDAQUG (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 1 Apr 2019 12:20:06 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:44323 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728007AbfDAQUG (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 1 Apr 2019 12:20:06 -0400
Received: by mail-pl1-f193.google.com with SMTP id g12so4723521pll.11
        for <linux-hwmon@vger.kernel.org>; Mon, 01 Apr 2019 09:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=JbHBzg8jP21Ou9WDXO18Q1Bjkcg12SWxcVYR4Mt5cwk=;
        b=GSjjYJ0b3xlr4ZA/Sc/kcZ7pCSc/vUzoDAENoXm/z4gC2sRJvsypWJvBOPJ4sMiDTt
         P2Aqzx2VySxckM7wHSBhHv+9uD5vZfot6T5r9aBKS49o+nTDDkicioa0lquY/P/Yum2a
         rXjZjZMfHu8U9k197G+OYNOLbxYRtQ1ok6sI1sMVmNwnt3ZyI75uCWYzg9B8xYRDJJdI
         myGhUVQS3W6RAx4p5/ybVXR4V/EpxeWqlyVb36e4lylr5qcG5SRxpZUS5DPGgwvDVnj9
         QeQQ8U8oNx5CX1o/dLcwwTzo9H0PEtluvxqVfHSfKN+MhNe4Zw9gIBGixLO+ovrjRiMy
         VopQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=JbHBzg8jP21Ou9WDXO18Q1Bjkcg12SWxcVYR4Mt5cwk=;
        b=Aikzmc5ba1fKriGUT8e3DIh8Xq0hlXPCz3WX5jbanUom/Ree+64cpd2/3M2h3k1Rak
         t+kwvxafLU8edGGyprVwE8pkxBdBVkYgHU0jlKNyYBglzXQ3WEU9WNCiSuSV8ZVdrag4
         ZKJu6Sr+K61YdrBipVhejR4hwlfUblyFVMFip6sf/vBLp8eSNt90AOxCfBpT4wRF2jyw
         aRLS+0D27h33TpYkYG02yzrYWf5n6tW/89kXXQimmjdhmJT9p1Z+IAJvXWArlyLjtQ/b
         PtqyUUJlvB3S6qKsrNL5zMThLVeQpjtGeoKGo6uMKgIHLlZGjWwRrK2SCsTL3sfRMJWX
         RTFA==
X-Gm-Message-State: APjAAAX4ogjEIBKHMzWg2YIGAgb5Tedl/SGiR0jE+eUV3d3Q0hDaGTD/
        28Vvwlahe1G6FTNB5Pz1I4aXaU7M
X-Google-Smtp-Source: APXvYqzx/AkZe77nUQ94gbZ7M7d9jw1z6Yv7UghrYWnGp+n0x7/qEx8//x7+CR0oF6r2/8nytv+1TQ==
X-Received: by 2002:a17:902:e90b:: with SMTP id cs11mr6350971plb.243.1554135605277;
        Mon, 01 Apr 2019 09:20:05 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id i1sm23223912pgc.63.2019.04.01.09.20.04
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 01 Apr 2019 09:20:04 -0700 (PDT)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 15/17] hwmon: (tmp102) Use HWMON_CHANNEL_INFO macro
Date:   Mon,  1 Apr 2019 09:19:35 -0700
Message-Id: <1554135577-11889-16-git-send-email-linux@roeck-us.net>
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
 drivers/hwmon/tmp102.c | 26 ++++----------------------
 1 file changed, 4 insertions(+), 22 deletions(-)

diff --git a/drivers/hwmon/tmp102.c b/drivers/hwmon/tmp102.c
index 35523d315f25..213564aad005 100644
--- a/drivers/hwmon/tmp102.c
+++ b/drivers/hwmon/tmp102.c
@@ -150,29 +150,11 @@ static umode_t tmp102_is_visible(const void *data, enum hwmon_sensor_types type,
 	}
 }
 
-static u32 tmp102_chip_config[] = {
-	HWMON_C_REGISTER_TZ,
-	0
-};
-
-static const struct hwmon_channel_info tmp102_chip = {
-	.type = hwmon_chip,
-	.config = tmp102_chip_config,
-};
-
-static u32 tmp102_temp_config[] = {
-	HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_MAX_HYST,
-	0
-};
-
-static const struct hwmon_channel_info tmp102_temp = {
-	.type = hwmon_temp,
-	.config = tmp102_temp_config,
-};
-
 static const struct hwmon_channel_info *tmp102_info[] = {
-	&tmp102_chip,
-	&tmp102_temp,
+	HWMON_CHANNEL_INFO(chip,
+			   HWMON_C_REGISTER_TZ),
+	HWMON_CHANNEL_INFO(temp,
+			   HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_MAX_HYST),
 	NULL
 };
 
-- 
2.7.4


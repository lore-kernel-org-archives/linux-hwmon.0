Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE281C433EF
	for <linux-hwmon@archiver.kernel.org>; Thu, 12 May 2022 19:56:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351922AbiELT4V (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 12 May 2022 15:56:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358241AbiELT4E (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 12 May 2022 15:56:04 -0400
Received: from mail-oa1-x2c.google.com (mail-oa1-x2c.google.com [IPv6:2001:4860:4864:20::2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 546ADBE11
        for <linux-hwmon@vger.kernel.org>; Thu, 12 May 2022 12:56:03 -0700 (PDT)
Received: by mail-oa1-x2c.google.com with SMTP id 586e51a60fabf-edf9ddb312so7973066fac.8
        for <linux-hwmon@vger.kernel.org>; Thu, 12 May 2022 12:56:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=76Mz/ejgcIn9Y1QSjLKixz/SQ6wftlnjP/a/JHUjETM=;
        b=RPuD65k9qRbJd3jBNYpSp14OUZIf1JA3q+Av/zabEbM/ORAtIfT37Kz5TBXTxQgAqu
         +7Y+T7BNrOs4nt2/BoVtKP4J6PIhIYQ9fpeJhuIgMEZPW1Wcr/5N8FL7Zd1oR1KwI2ff
         3IMCn2Pl4K9OxzxvmrFgUbpEYyNPaLJJCduu4AX4HFBTaaETrSpa+oXAwzCBJ8ULqgfN
         Lzj+ldLkuFBoJLOGl5v06n3qbmsuCVYaRB+YmqoKG9/ldDS9LUB5bfA0Tcz4ebqQQmc3
         1t1u4S0n67f+TqqU7zt6Q488tc3f14qS8eb/wYpoo1Te0C2ysqyD212/D5dmbVLX0Epp
         GYhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=76Mz/ejgcIn9Y1QSjLKixz/SQ6wftlnjP/a/JHUjETM=;
        b=gT2QMQSy/4TnUoMHXCu8MkcRDnt8AzGWlYIRbnizSGjDLdmTsVXdMEuOvIi/qlK/qq
         +gEf0C+aDaJ4O924CFrs5KMzOIRRFK457M9o6ta+Zafb863bA0PP3JIUNhMJBnS06oZn
         hShpijrLbs+e5vt2QUgOH7EttdXq63EYjX8b8HCGOBftJiAqNR8ElFZYg6ZEwAC/fM6Z
         e/OfOG8fkZcNYc/pdXRM3iKJxWMi5PscK22mlV3Gj+HEusNkwAZdB2t9LH4ODohcm2hO
         wg/urzEFzKJdDaKMOHxwoRQ63LlXpE2HihtYT62yBApFyNokg0g+cNxWZz0PHgYQCESv
         9iQg==
X-Gm-Message-State: AOAM533v9ClJ26MJ7btOwicFYjR/tXo8Rq7wR5SHV6aV1u9waJ+8LnsV
        1IICJgCk8vzpITGibuditRMIiTUc2BNq5A==
X-Google-Smtp-Source: ABdhPJzyHMfhzDGwumu75K+tmgJNZRGhMihtrzoZ9ubwIt3L5WhkQgTEP+X3qrwimA1tC/WOQeHr1Q==
X-Received: by 2002:a05:6871:7a1:b0:ee:4c48:bfff with SMTP id o33-20020a05687107a100b000ee4c48bfffmr838847oap.118.1652385362444;
        Thu, 12 May 2022 12:56:02 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id h13-20020a4ab44d000000b0035eb4e5a6d1sm215795ooo.39.2022.05.12.12.56.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 May 2022 12:56:01 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 2/7] hwmon: (ltc2992) Use HWMON_CHANNEL_INFO macro
Date:   Thu, 12 May 2022 12:55:51 -0700
Message-Id: <20220512195556.137741-2-linux@roeck-us.net>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220512195556.137741-1-linux@roeck-us.net>
References: <20220512195556.137741-1-linux@roeck-us.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

The HWMON_CHANNEL_INFO macro simplifies the code, reduces the likelihood
of errors, and makes the code easier to read.

The conversion was done automatically with coccinelle. The semantic patch
used to make this change is as follows.

@s@
identifier i,j,ty;
@@

-struct hwmon_channel_info j = {
-       .type = ty,
-       .config = i,
-};

@r@
initializer list elements;
identifier s.i;
@@

-u32 i[] = {
-  elements,
-  0
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
Julia Lawall for providing the coccinelle script.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/ltc2992.c | 86 ++++++++++++-----------------------------
 1 file changed, 25 insertions(+), 61 deletions(-)

diff --git a/drivers/hwmon/ltc2992.c b/drivers/hwmon/ltc2992.c
index 7352d2b3c756..72489d5d7eaf 100644
--- a/drivers/hwmon/ltc2992.c
+++ b/drivers/hwmon/ltc2992.c
@@ -811,68 +811,32 @@ static const struct hwmon_ops ltc2992_hwmon_ops = {
 	.write = ltc2992_write,
 };
 
-static const u32 ltc2992_chip_config[] = {
-	HWMON_C_IN_RESET_HISTORY,
-	0
-};
-
-static const struct hwmon_channel_info ltc2992_chip = {
-	.type = hwmon_chip,
-	.config = ltc2992_chip_config,
-};
-
-static const u32 ltc2992_in_config[] = {
-	HWMON_I_INPUT | HWMON_I_LOWEST | HWMON_I_HIGHEST | HWMON_I_MIN | HWMON_I_MAX |
-	HWMON_I_MIN_ALARM | HWMON_I_MAX_ALARM,
-	HWMON_I_INPUT | HWMON_I_LOWEST | HWMON_I_HIGHEST | HWMON_I_MIN | HWMON_I_MAX |
-	HWMON_I_MIN_ALARM | HWMON_I_MAX_ALARM,
-	HWMON_I_INPUT | HWMON_I_LOWEST | HWMON_I_HIGHEST | HWMON_I_MIN | HWMON_I_MAX |
-	HWMON_I_MIN_ALARM | HWMON_I_MAX_ALARM,
-	HWMON_I_INPUT | HWMON_I_LOWEST | HWMON_I_HIGHEST | HWMON_I_MIN | HWMON_I_MAX |
-	HWMON_I_MIN_ALARM | HWMON_I_MAX_ALARM,
-	HWMON_I_INPUT | HWMON_I_LOWEST | HWMON_I_HIGHEST | HWMON_I_MIN | HWMON_I_MAX |
-	HWMON_I_MIN_ALARM | HWMON_I_MAX_ALARM,
-	HWMON_I_INPUT | HWMON_I_LOWEST | HWMON_I_HIGHEST | HWMON_I_MIN | HWMON_I_MAX |
-	HWMON_I_MIN_ALARM | HWMON_I_MAX_ALARM,
-	0
-};
-
-static const struct hwmon_channel_info ltc2992_in = {
-	.type = hwmon_in,
-	.config = ltc2992_in_config,
-};
-
-static const u32 ltc2992_curr_config[] = {
-	HWMON_C_INPUT | HWMON_C_LOWEST | HWMON_C_HIGHEST | HWMON_C_MIN | HWMON_C_MAX |
-	HWMON_C_MIN_ALARM | HWMON_C_MAX_ALARM,
-	HWMON_C_INPUT | HWMON_C_LOWEST | HWMON_C_HIGHEST | HWMON_C_MIN | HWMON_C_MAX |
-	HWMON_C_MIN_ALARM | HWMON_C_MAX_ALARM,
-	0
-};
-
-static const struct hwmon_channel_info ltc2992_curr = {
-	.type = hwmon_curr,
-	.config = ltc2992_curr_config,
-};
-
-static const u32 ltc2992_power_config[] = {
-	HWMON_P_INPUT | HWMON_P_INPUT_LOWEST | HWMON_P_INPUT_HIGHEST | HWMON_P_MIN | HWMON_P_MAX |
-	HWMON_P_MIN_ALARM | HWMON_P_MAX_ALARM,
-	HWMON_P_INPUT | HWMON_P_INPUT_LOWEST | HWMON_P_INPUT_HIGHEST | HWMON_P_MIN | HWMON_P_MAX |
-	HWMON_P_MIN_ALARM | HWMON_P_MAX_ALARM,
-	0
-};
-
-static const struct hwmon_channel_info ltc2992_power = {
-	.type = hwmon_power,
-	.config = ltc2992_power_config,
-};
-
 static const struct hwmon_channel_info *ltc2992_info[] = {
-	&ltc2992_chip,
-	&ltc2992_in,
-	&ltc2992_curr,
-	&ltc2992_power,
+	HWMON_CHANNEL_INFO(chip,
+			   HWMON_C_IN_RESET_HISTORY),
+	HWMON_CHANNEL_INFO(in,
+			   HWMON_I_INPUT | HWMON_I_LOWEST | HWMON_I_HIGHEST | HWMON_I_MIN |
+			   HWMON_I_MAX | HWMON_I_MIN_ALARM | HWMON_I_MAX_ALARM,
+			   HWMON_I_INPUT | HWMON_I_LOWEST | HWMON_I_HIGHEST | HWMON_I_MIN |
+			   HWMON_I_MAX | HWMON_I_MIN_ALARM | HWMON_I_MAX_ALARM,
+			   HWMON_I_INPUT | HWMON_I_LOWEST | HWMON_I_HIGHEST | HWMON_I_MIN |
+			   HWMON_I_MAX | HWMON_I_MIN_ALARM | HWMON_I_MAX_ALARM,
+			   HWMON_I_INPUT | HWMON_I_LOWEST | HWMON_I_HIGHEST | HWMON_I_MIN |
+			   HWMON_I_MAX | HWMON_I_MIN_ALARM | HWMON_I_MAX_ALARM,
+			   HWMON_I_INPUT | HWMON_I_LOWEST | HWMON_I_HIGHEST | HWMON_I_MIN |
+			   HWMON_I_MAX | HWMON_I_MIN_ALARM | HWMON_I_MAX_ALARM,
+			   HWMON_I_INPUT | HWMON_I_LOWEST | HWMON_I_HIGHEST | HWMON_I_MIN |
+			   HWMON_I_MAX | HWMON_I_MIN_ALARM | HWMON_I_MAX_ALARM),
+	HWMON_CHANNEL_INFO(curr,
+			   HWMON_C_INPUT | HWMON_C_LOWEST | HWMON_C_HIGHEST | HWMON_C_MIN |
+			   HWMON_C_MAX | HWMON_C_MIN_ALARM | HWMON_C_MAX_ALARM,
+			   HWMON_C_INPUT | HWMON_C_LOWEST | HWMON_C_HIGHEST | HWMON_C_MIN |
+			   HWMON_C_MAX | HWMON_C_MIN_ALARM | HWMON_C_MAX_ALARM),
+	HWMON_CHANNEL_INFO(power,
+			   HWMON_P_INPUT | HWMON_P_INPUT_LOWEST | HWMON_P_INPUT_HIGHEST |
+			   HWMON_P_MIN | HWMON_P_MAX | HWMON_P_MIN_ALARM | HWMON_P_MAX_ALARM,
+			   HWMON_P_INPUT | HWMON_P_INPUT_LOWEST | HWMON_P_INPUT_HIGHEST |
+			   HWMON_P_MIN | HWMON_P_MAX | HWMON_P_MIN_ALARM | HWMON_P_MAX_ALARM),
 	NULL
 };
 
-- 
2.35.1


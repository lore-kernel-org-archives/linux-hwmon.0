Return-Path: <SRS0=CoSo=SD=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73AC2C43381
	for <linux-hwmon@archiver.kernel.org>; Mon,  1 Apr 2019 16:20:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3D48D2133D
	for <linux-hwmon@archiver.kernel.org>; Mon,  1 Apr 2019 16:20:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GAoMW1le"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728626AbfDAQUC (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 1 Apr 2019 12:20:02 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:40129 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728038AbfDAQUB (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 1 Apr 2019 12:20:01 -0400
Received: by mail-pf1-f195.google.com with SMTP id c207so4818645pfc.7
        for <linux-hwmon@vger.kernel.org>; Mon, 01 Apr 2019 09:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=xXohVNKqcgxXYY2TmsIOkDNeXzwT3t2//WuFOjq0Uxs=;
        b=GAoMW1leodniFUILCfTpH/CbB4B+6WXn6VI1/+BVeX8Lkj28Hc38JImgIOyEfw+c4x
         KDkh9qMFZa5xcbnBkx2rhddlbPg+AxsA0LCP40aalw/TsWsBiNeko2ZkENcliV3J3DNM
         2xntdHVuOL0CmCKAlOuRTrzjGKPBrFZBMCW6zzu9XGJ6hgnQRMQHe6+T5duBkIrW0lo2
         Sx4XscYMUL25yPP+sXp6HolpefkGLGHqfbCa3C1d7BKb9o6FuqEydyQsIcaf7nGIWblS
         oA5vARrCbNy5P6h8nEdbGv1Dus1kHnAtmPNZ3Efpt8B/xiAF7lK+3XkDZoeFUcBaKiWh
         wj1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=xXohVNKqcgxXYY2TmsIOkDNeXzwT3t2//WuFOjq0Uxs=;
        b=DDxbWcZ029vQowiJm+mfRO8ckq/ve68gkHPVA8oT05v5vJgwxLaF8OP/rTx4mdrIKB
         ix8SK1E0nalG8j+/MRcBKnm9P19BoQOs/3wdO+CTlQObxLezhcmdWaRnFUN6gF9322Ln
         MvogygmpuR7rJRRTnCm0/dD2Oo8nsVllaqK50ytijb4c2ec6a5iAtDjjPelKiMirz2Ch
         CNsSi1y627CMpFCVfEa3W4tzdsqHl+2+TNEDulj7EJLxSgGaPiBkbsckF4t0XrExXZZS
         4qzzCi6TG8NdsfKjTTreStlgFA5xUPGsk96KYtrla3ak2udAgJgoigxHi/26zydkq2bE
         76wA==
X-Gm-Message-State: APjAAAXttXFOZxit7YP10r1mHWbzZfxQtJV9nWaFcP/h+PuZRedqxXCo
        atr4Uu5zvI0IC+fsldso4LKU5FM6
X-Google-Smtp-Source: APXvYqwETLBSaunGlKwE+xewO8OSiFhiXVxvL3ophbi5Y23x75gF0qLIzqkrLLIOzPKORej/1etSYQ==
X-Received: by 2002:a63:5061:: with SMTP id q33mr34962573pgl.218.1554135601006;
        Mon, 01 Apr 2019 09:20:01 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id p6sm1580730pfd.122.2019.04.01.09.20.00
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 01 Apr 2019 09:20:00 -0700 (PDT)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 12/17] hwmon: (mlxreg-fan) Use HWMON_CHANNEL_INFO macro
Date:   Mon,  1 Apr 2019 09:19:32 -0700
Message-Id: <1554135577-11889-13-git-send-email-linux@roeck-us.net>
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
 drivers/hwmon/mlxreg-fan.c | 48 +++++++++++++++-------------------------------
 1 file changed, 15 insertions(+), 33 deletions(-)

diff --git a/drivers/hwmon/mlxreg-fan.c b/drivers/hwmon/mlxreg-fan.c
index 44d4b1af1550..f816d2ae1e58 100644
--- a/drivers/hwmon/mlxreg-fan.c
+++ b/drivers/hwmon/mlxreg-fan.c
@@ -229,40 +229,22 @@ mlxreg_fan_is_visible(const void *data, enum hwmon_sensor_types type, u32 attr,
 	return 0;
 }
 
-static const u32 mlxreg_fan_hwmon_fan_config[] = {
-	HWMON_F_INPUT | HWMON_F_FAULT,
-	HWMON_F_INPUT | HWMON_F_FAULT,
-	HWMON_F_INPUT | HWMON_F_FAULT,
-	HWMON_F_INPUT | HWMON_F_FAULT,
-	HWMON_F_INPUT | HWMON_F_FAULT,
-	HWMON_F_INPUT | HWMON_F_FAULT,
-	HWMON_F_INPUT | HWMON_F_FAULT,
-	HWMON_F_INPUT | HWMON_F_FAULT,
-	HWMON_F_INPUT | HWMON_F_FAULT,
-	HWMON_F_INPUT | HWMON_F_FAULT,
-	HWMON_F_INPUT | HWMON_F_FAULT,
-	HWMON_F_INPUT | HWMON_F_FAULT,
-	0
-};
-
-static const struct hwmon_channel_info mlxreg_fan_hwmon_fan = {
-	.type = hwmon_fan,
-	.config = mlxreg_fan_hwmon_fan_config,
-};
-
-static const u32 mlxreg_fan_hwmon_pwm_config[] = {
-	HWMON_PWM_INPUT,
-	0
-};
-
-static const struct hwmon_channel_info mlxreg_fan_hwmon_pwm = {
-	.type = hwmon_pwm,
-	.config = mlxreg_fan_hwmon_pwm_config,
-};
-
 static const struct hwmon_channel_info *mlxreg_fan_hwmon_info[] = {
-	&mlxreg_fan_hwmon_fan,
-	&mlxreg_fan_hwmon_pwm,
+	HWMON_CHANNEL_INFO(fan,
+			   HWMON_F_INPUT | HWMON_F_FAULT,
+			   HWMON_F_INPUT | HWMON_F_FAULT,
+			   HWMON_F_INPUT | HWMON_F_FAULT,
+			   HWMON_F_INPUT | HWMON_F_FAULT,
+			   HWMON_F_INPUT | HWMON_F_FAULT,
+			   HWMON_F_INPUT | HWMON_F_FAULT,
+			   HWMON_F_INPUT | HWMON_F_FAULT,
+			   HWMON_F_INPUT | HWMON_F_FAULT,
+			   HWMON_F_INPUT | HWMON_F_FAULT,
+			   HWMON_F_INPUT | HWMON_F_FAULT,
+			   HWMON_F_INPUT | HWMON_F_FAULT,
+			   HWMON_F_INPUT | HWMON_F_FAULT),
+	HWMON_CHANNEL_INFO(pwm,
+			   HWMON_PWM_INPUT),
 	NULL
 };
 
-- 
2.7.4


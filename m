Return-Path: <SRS0=CoSo=SD=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 907AAC4360F
	for <linux-hwmon@archiver.kernel.org>; Mon,  1 Apr 2019 16:19:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 60C0E2133D
	for <linux-hwmon@archiver.kernel.org>; Mon,  1 Apr 2019 16:19:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CapYEWDE"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728040AbfDAQTr (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 1 Apr 2019 12:19:47 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:45252 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726854AbfDAQTr (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 1 Apr 2019 12:19:47 -0400
Received: by mail-pl1-f196.google.com with SMTP id bf11so4717479plb.12
        for <linux-hwmon@vger.kernel.org>; Mon, 01 Apr 2019 09:19:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=HVSjMgBoBsW0LOLJ2AYKLM/rECzLmsodXYvRx06vPR8=;
        b=CapYEWDEv22nk+vcXT+muEqqf3K4bggxLKaD9G0+RI1KHHcvu24p0trKnC/iJZFeDM
         15vINimDtbhEESBNhHgoxbojAZRdy+THWVKucFPpsNUY8UkWbzhLFzd8wjWO9ErncecI
         jTUEO4millRld2XiBTumRe7fB0DXLmGQeG+gtl+QhMcaLAUQ7///7VJwPTNK3kj7A9VD
         /UslPe6dbAjmvo4nmIO/u8Q9d+7etto1cy+RFnfUVwnZ7gsd26ziXL5IJDbROqa/ACJv
         Zr7v90wsM/qsfsneAhoLFb7GsE8R5PSQ9h76l/AvPQV+WZg/QrNupqFm9G7cbNz4sVVk
         G7eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=HVSjMgBoBsW0LOLJ2AYKLM/rECzLmsodXYvRx06vPR8=;
        b=UBqHJHYn0RIvBwiSiqz5ysYCXI2pyqGeeAkNOljRyIV6q33u846FvB84PgHKhZniZI
         6LHKkTFZQR6b2xAZSYqgI2a/eBcpxjj/1qCqaLtv7YLftbl9OjgglNZar5LY5uygkgho
         OHE2jCslAUz9482uG+zTpmO2jsO8MpakCXKenDeFw6Z1LZKccR0fKUlCu3gt6vJqVGiO
         wP27kYL3I4d4Tct7+ZT/04avyT5l0aTehdLYp15nQsGYMxRhnFzGPJugsCJPNrHYsD6A
         6ms66qGEwmkAZojEu3C/r7l2T1A6plyu8NPYLMlzJ0RpwGwLncKewr2G70owP/GjW4EJ
         HmhQ==
X-Gm-Message-State: APjAAAUAykJP/5dTQgHO3YR8cDM7hGv0zo82BkfiqL4t6FVYAThy5oeV
        cTlS0GYlAiE1T4p7v0w4BM4Rgk9E
X-Google-Smtp-Source: APXvYqxiyzRImqiCbCJ7Y2drc1H100SPxZbL+3eCpxd8lZlpDyPJ9Ep4zYRiPEaNvO+yTl1jdJ/gIw==
X-Received: by 2002:a17:902:e002:: with SMTP id ca2mr52902651plb.131.1554135586073;
        Mon, 01 Apr 2019 09:19:46 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id h11sm12503591pgq.57.2019.04.01.09.19.45
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 01 Apr 2019 09:19:45 -0700 (PDT)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 02/17] hwmon: (ina3221) Use HWMON_CHANNEL_INFO macro
Date:   Mon,  1 Apr 2019 09:19:22 -0700
Message-Id: <1554135577-11889-3-git-send-email-linux@roeck-us.net>
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

The patch was post-edited to retain comments.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/ina3221.c | 48 +++++++++++++++---------------------------------
 1 file changed, 15 insertions(+), 33 deletions(-)

diff --git a/drivers/hwmon/ina3221.c b/drivers/hwmon/ina3221.c
index 3626b87a5fd2..e6f43df0435c 100644
--- a/drivers/hwmon/ina3221.c
+++ b/drivers/hwmon/ina3221.c
@@ -458,44 +458,26 @@ static umode_t ina3221_is_visible(const void *drvdata,
 	}
 }
 
-static const u32 ina3221_in_config[] = {
-	/* 0: dummy, skipped in is_visible */
-	HWMON_I_INPUT,
-	/* 1-3: input voltage Channels */
-	HWMON_I_INPUT | HWMON_I_ENABLE | HWMON_I_LABEL,
-	HWMON_I_INPUT | HWMON_I_ENABLE | HWMON_I_LABEL,
-	HWMON_I_INPUT | HWMON_I_ENABLE | HWMON_I_LABEL,
-	/* 4-6: shunt voltage Channels */
-	HWMON_I_INPUT,
-	HWMON_I_INPUT,
-	HWMON_I_INPUT,
-	0
-};
-
-static const struct hwmon_channel_info ina3221_in = {
-	.type = hwmon_in,
-	.config = ina3221_in_config,
-};
-
 #define INA3221_HWMON_CURR_CONFIG (HWMON_C_INPUT | \
 				   HWMON_C_CRIT | HWMON_C_CRIT_ALARM | \
 				   HWMON_C_MAX | HWMON_C_MAX_ALARM)
 
-static const u32 ina3221_curr_config[] = {
-	INA3221_HWMON_CURR_CONFIG,
-	INA3221_HWMON_CURR_CONFIG,
-	INA3221_HWMON_CURR_CONFIG,
-	0
-};
-
-static const struct hwmon_channel_info ina3221_curr = {
-	.type = hwmon_curr,
-	.config = ina3221_curr_config,
-};
-
 static const struct hwmon_channel_info *ina3221_info[] = {
-	&ina3221_in,
-	&ina3221_curr,
+	HWMON_CHANNEL_INFO(in,
+			   /* 0: dummy, skipped in is_visible */
+			   HWMON_I_INPUT,
+			   /* 1-3: input voltage Channels */
+			   HWMON_I_INPUT | HWMON_I_ENABLE | HWMON_I_LABEL,
+			   HWMON_I_INPUT | HWMON_I_ENABLE | HWMON_I_LABEL,
+			   HWMON_I_INPUT | HWMON_I_ENABLE | HWMON_I_LABEL,
+			   /* 4-6: shunt voltage Channels */
+			   HWMON_I_INPUT,
+			   HWMON_I_INPUT,
+			   HWMON_I_INPUT),
+	HWMON_CHANNEL_INFO(curr,
+			   INA3221_HWMON_CURR_CONFIG,
+			   INA3221_HWMON_CURR_CONFIG,
+			   INA3221_HWMON_CURR_CONFIG),
 	NULL
 };
 
-- 
2.7.4


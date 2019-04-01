Return-Path: <SRS0=CoSo=SD=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F3CCC43381
	for <linux-hwmon@archiver.kernel.org>; Mon,  1 Apr 2019 16:19:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6F3202133D
	for <linux-hwmon@archiver.kernel.org>; Mon,  1 Apr 2019 16:19:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rn2xmNLh"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727074AbfDAQTu (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 1 Apr 2019 12:19:50 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:34162 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726854AbfDAQTu (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 1 Apr 2019 12:19:50 -0400
Received: by mail-pl1-f193.google.com with SMTP id y6so4749318plt.1
        for <linux-hwmon@vger.kernel.org>; Mon, 01 Apr 2019 09:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=tNqFILptxHgjUs/akYL5N4I8yMmdv26I7ed6lh0XJW4=;
        b=Rn2xmNLhFqJSePosflbOfKMCpVYkptHMt/LbMfUOrzvzBd6lO85II9Fm8rO4nRLiOk
         TXVD48W0KZe0y4lgnnjoQumcv76W3NbbUq3ZHS3rV+ggCwTf+7X+rXNfNRC604xZLLYq
         azu1VDKQwbLFu8banpq3Vm2JAWMY/bZh1ff2nRkSEBRIeBeSklKdLi+wC6k/LPrf5dCI
         OTgiN/2ANTI4rp3vUDXwjHN3mE9NZWftkbk9UAGXoFmfBxllFx9FuMgCMq/oIOQ/sfpI
         jC6Me4nHgZMpweo+he8kiJTCPCMX9ttXYOQgne8ouAfweeTuy+Fn8CaDx/r61ib6LcRF
         yJ5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=tNqFILptxHgjUs/akYL5N4I8yMmdv26I7ed6lh0XJW4=;
        b=XW3jWpqOaxk0fC1B8zjrxODn31xwyB9x37xcqDo64FIApQIMO4Jx89edaHjteAgPte
         viqaN2idBkX52Nqd+ehWl+u7XtHCgUlDBFqdhPXEoIC3etJ8P5gkHr29nrv/pCBwz+3J
         3ss0jIfeJEDh4tNYb2X6t8bIfGJB/iXFK8FJ2GCUbAaajpVDxemPVXFKbDthW6RYrkC+
         Jic2RRXFjZRumiViKp9sqV3FfI8Uvsx/aqKQII5JoFHHRJEyNIH1+gfHQ9d1NuHIzVII
         4kYvOB22AON9s7TxyvORbEDhCnzOdgXgpSrBzB93JGZ/YFJdyFzTZRacV9fF5hfBQH7+
         7EYA==
X-Gm-Message-State: APjAAAXiWTNwP9oCxyM0eM6HqgytjcRu03XEjQlPZdvnYaOpQ/0lAe7c
        gLd2Pars5nvVYhRtD8QkfxaBD8lW
X-Google-Smtp-Source: APXvYqyrfikJ/Eog9uyQ5H4fY8zIfBTJKEgazpRYShrOm9VCAfKQ6u2reUCWWqwngad29LOgz+fT+w==
X-Received: by 2002:a17:902:e110:: with SMTP id cc16mr1603148plb.147.1554135589170;
        Mon, 01 Apr 2019 09:19:49 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id v6sm13945264pgv.92.2019.04.01.09.19.48
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 01 Apr 2019 09:19:48 -0700 (PDT)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 04/17] hwmon: (lm75) Use HWMON_CHANNEL_INFO macro
Date:   Mon,  1 Apr 2019 09:19:24 -0700
Message-Id: <1554135577-11889-5-git-send-email-linux@roeck-us.net>
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
 drivers/hwmon/lm75.c | 32 ++++----------------------------
 1 file changed, 4 insertions(+), 28 deletions(-)

diff --git a/drivers/hwmon/lm75.c b/drivers/hwmon/lm75.c
index 447af07450f1..3155a04c997e 100644
--- a/drivers/hwmon/lm75.c
+++ b/drivers/hwmon/lm75.c
@@ -194,35 +194,11 @@ static umode_t lm75_is_visible(const void *data, enum hwmon_sensor_types type,
 	return 0;
 }
 
-/*-----------------------------------------------------------------------*/
-
-/* device probe and removal */
-
-/* chip configuration */
-
-static const u32 lm75_chip_config[] = {
-	HWMON_C_REGISTER_TZ | HWMON_C_UPDATE_INTERVAL,
-	0
-};
-
-static const struct hwmon_channel_info lm75_chip = {
-	.type = hwmon_chip,
-	.config = lm75_chip_config,
-};
-
-static const u32 lm75_temp_config[] = {
-	HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_MAX_HYST,
-	0
-};
-
-static const struct hwmon_channel_info lm75_temp = {
-	.type = hwmon_temp,
-	.config = lm75_temp_config,
-};
-
 static const struct hwmon_channel_info *lm75_info[] = {
-	&lm75_chip,
-	&lm75_temp,
+	HWMON_CHANNEL_INFO(chip,
+			   HWMON_C_REGISTER_TZ | HWMON_C_UPDATE_INTERVAL),
+	HWMON_CHANNEL_INFO(temp,
+			   HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_MAX_HYST),
 	NULL
 };
 
-- 
2.7.4


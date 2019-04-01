Return-Path: <SRS0=CoSo=SD=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2939C43381
	for <linux-hwmon@archiver.kernel.org>; Mon,  1 Apr 2019 16:20:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8C9822133D
	for <linux-hwmon@archiver.kernel.org>; Mon,  1 Apr 2019 16:20:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vrx9e3gM"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728551AbfDAQUA (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 1 Apr 2019 12:20:00 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:40126 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728626AbfDAQUA (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 1 Apr 2019 12:20:00 -0400
Received: by mail-pf1-f194.google.com with SMTP id c207so4818612pfc.7
        for <linux-hwmon@vger.kernel.org>; Mon, 01 Apr 2019 09:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=NMmw9BRMDw18YfC4U/C3WT8wc/d09d2AVewUuTbISeg=;
        b=Vrx9e3gM7tqsfy2zxOOa8WTQwF7J0gb3XF/P8x2/IAocZqUoEweoL2eVYj9HaiZYDg
         PESUKS2YSClkntntl3bEYLBsa/BIdU3fg9hOnmWfJl+niqo91dZDZK84BPyK2tmEbOSt
         gwkqnAKC6uTLaVfJEp/7fOfvpvjo9ejs/ejnbcVXPnYu89IIOWRd5rHo3QiIt0oF5SvK
         5yQ7PVvID0K90tVP6hxcq84ROsq3qp69sjXz/0bda29wF32apqV9ELm3nTc+U6e35raw
         InRKvcssGbCnnWJ3zMCwpcRQKQNKArmiPuEu3WKSTamkTAB9h6vqsmmkIYdHnmdl7JAf
         2CBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=NMmw9BRMDw18YfC4U/C3WT8wc/d09d2AVewUuTbISeg=;
        b=Rb9eSLVoSrogD94ISuJOLrxCq5Eu9gHsPQxErZfS6mWrY8vLGnTFMrtpcVv/+ZweQ7
         golrmQ1rb33wCWBDNjgbgNOsnJ5LlF35c3tHIlxeSvUVsEecANKmE0+uzT051CtwjrSj
         SXXCQzd5QlHekoVZpt10qCVyUWUxaOlSjogBJhvF/OFf2O6i80nltT/FYIfwLXAPiRzp
         My4Hd5g43RtN5DqRrgsmXtGLEusxYuUXz1/ae4CWNwyUuvJ2EZTerOM17Xg5pw/kWs8Q
         yOsW02M2rKki9rfbm8P9ByU3WE9OzUkRfRFb4dDk+xNbHqxg/Ia6x/B3bUX6LhuARuD1
         f7MA==
X-Gm-Message-State: APjAAAXHuFTH6ajZjoLyci0FqEtWesYZn75bXwi5hkRJRxmwDJ9vAw+z
        I7iqZ+hceNWoT9vR13Rsv8U4Tcd6
X-Google-Smtp-Source: APXvYqznnz+Bo/7ushYRKLwQQH7TUcf7Uzv21I/33brcmzZF2qY0rUDTruc5ICJHh6YzYsFUXynmIw==
X-Received: by 2002:a65:6108:: with SMTP id z8mr47687565pgu.106.1554135599390;
        Mon, 01 Apr 2019 09:19:59 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id l63sm15720745pfc.89.2019.04.01.09.19.58
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 01 Apr 2019 09:19:58 -0700 (PDT)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 11/17] hwmon: (max6621) Use HWMON_CHANNEL_INFO macro
Date:   Mon,  1 Apr 2019 09:19:31 -0700
Message-Id: <1554135577-11889-12-git-send-email-linux@roeck-us.net>
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
 drivers/hwmon/max6621.c | 42 ++++++++++++------------------------------
 1 file changed, 12 insertions(+), 30 deletions(-)

diff --git a/drivers/hwmon/max6621.c b/drivers/hwmon/max6621.c
index 35555f0eefb9..0c399e407de3 100644
--- a/drivers/hwmon/max6621.c
+++ b/drivers/hwmon/max6621.c
@@ -458,37 +458,19 @@ static const struct regmap_config max6621_regmap_config = {
 	.num_reg_defaults = ARRAY_SIZE(max6621_regmap_default),
 };
 
-static u32 max6621_chip_config[] = {
-	HWMON_C_REGISTER_TZ,
-	0
-};
-
-static const struct hwmon_channel_info max6621_chip = {
-	.type = hwmon_chip,
-	.config = max6621_chip_config,
-};
-
-static const u32 max6621_temp_config[] = {
-	HWMON_T_INPUT | HWMON_T_LABEL | HWMON_T_OFFSET,
-	HWMON_T_INPUT | HWMON_T_CRIT | HWMON_T_CRIT_ALARM | HWMON_T_LABEL,
-	HWMON_T_INPUT | HWMON_T_CRIT | HWMON_T_CRIT_ALARM | HWMON_T_LABEL,
-	HWMON_T_INPUT | HWMON_T_CRIT | HWMON_T_CRIT_ALARM | HWMON_T_LABEL,
-	HWMON_T_INPUT | HWMON_T_CRIT | HWMON_T_CRIT_ALARM | HWMON_T_LABEL,
-	HWMON_T_INPUT | HWMON_T_LABEL,
-	HWMON_T_INPUT | HWMON_T_LABEL,
-	HWMON_T_INPUT | HWMON_T_LABEL,
-	HWMON_T_INPUT | HWMON_T_LABEL,
-	0
-};
-
-static const struct hwmon_channel_info max6621_temp = {
-	.type = hwmon_temp,
-	.config = max6621_temp_config,
-};
-
 static const struct hwmon_channel_info *max6621_info[] = {
-	&max6621_chip,
-	&max6621_temp,
+	HWMON_CHANNEL_INFO(chip,
+			   HWMON_C_REGISTER_TZ),
+	HWMON_CHANNEL_INFO(temp,
+			   HWMON_T_INPUT | HWMON_T_LABEL | HWMON_T_OFFSET,
+			   HWMON_T_INPUT | HWMON_T_CRIT | HWMON_T_CRIT_ALARM | HWMON_T_LABEL,
+			   HWMON_T_INPUT | HWMON_T_CRIT | HWMON_T_CRIT_ALARM | HWMON_T_LABEL,
+			   HWMON_T_INPUT | HWMON_T_CRIT | HWMON_T_CRIT_ALARM | HWMON_T_LABEL,
+			   HWMON_T_INPUT | HWMON_T_CRIT | HWMON_T_CRIT_ALARM | HWMON_T_LABEL,
+			   HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_INPUT | HWMON_T_LABEL),
 	NULL
 };
 
-- 
2.7.4


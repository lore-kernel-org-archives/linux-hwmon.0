Return-Path: <SRS0=CoSo=SD=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0821C43381
	for <linux-hwmon@archiver.kernel.org>; Mon,  1 Apr 2019 16:19:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 685A32133D
	for <linux-hwmon@archiver.kernel.org>; Mon,  1 Apr 2019 16:19:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hbYHvv2F"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728587AbfDAQT4 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 1 Apr 2019 12:19:56 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:44035 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728551AbfDAQT4 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 1 Apr 2019 12:19:56 -0400
Received: by mail-pg1-f194.google.com with SMTP id i2so5005284pgj.11
        for <linux-hwmon@vger.kernel.org>; Mon, 01 Apr 2019 09:19:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=959HrBKQJTeSyXEASVi2q7APYGGUhN9iUFpIa6ora2o=;
        b=hbYHvv2FxOtPu2JeYJ7rNBsHPumeXhparcywdKyus+8+Fxye70vE1dP+Ld0LFg/uzQ
         r+sgQMJ0NtSeNPK8zptoxwDogkqc0Poif6WnCXqH0OY268lLdiRfMuzX00bF6m2ohAHw
         h8HqJ7tPgZHae3ACqOpsj3VXu0KhspSrK0FAOnXy1f5q18mmQdzWVdXT3mdkJ0tdhwlA
         SdYDusqaz75eCWBqkRUby1bqBuEetFOInYyP8rXGDb07a979LZ4VHOfob5R5ujkgOPO7
         D92Oeupmq+Vknv24pG23b0+owQvd2vK/jE9E1i7HBt80Y2Eh9sP/OcT7v7bZDUq4WwEj
         Btrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=959HrBKQJTeSyXEASVi2q7APYGGUhN9iUFpIa6ora2o=;
        b=Pvsk8LxJU19COADL01YgyWtY1V1k6ajDywVSu3h8Es7W7eX9GEzoDAY9Pf8PC2J9gq
         YOk+ochek/68j4HvKMBQfFb8V6BrJ/VmGHtlMXdyVYXt0G35AmAEDNThZQ8p/Eu03iqD
         ielO+ZJYVmFpwI52+0Xw/yS9TSaF7N1ljsQSDASGBcyQ/9NDemFsepsLJCQBoJ/7d0ci
         v5M8xCEVNXHQLAQXn9KrFn03zRtbtKe/xHKmV9FcZFBlR3mtMGNb8PaKCekjcawzwhRZ
         Nwc5qNXJ4527A1A5koTTQhkiiq80nJIYIS4lfRaevu4Cvnw+qAMh+yFNfbtmsBYksLue
         2KMw==
X-Gm-Message-State: APjAAAUCcD0OthmdaMrxE8um6gTvRY2lnmz933KcWU+KQY8gu7pAG0S7
        ZcP+GQMGS5klI38jekGXS5ldlqsD
X-Google-Smtp-Source: APXvYqzwMwW0izvdr7R+Iz4pm6sEmB6/sFOw2t7lI08dH0sJ6Ollf+hwWsGsoyoePILb6IJnw/nTXA==
X-Received: by 2002:a65:518b:: with SMTP id h11mr61658351pgq.41.1554135594944;
        Mon, 01 Apr 2019 09:19:54 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id r11sm28236471pga.87.2019.04.01.09.19.54
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 01 Apr 2019 09:19:54 -0700 (PDT)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 08/17] hwmon: (ltc4245) Use HWMON_CHANNEL_INFO macro
Date:   Mon,  1 Apr 2019 09:19:28 -0700
Message-Id: <1554135577-11889-9-git-send-email-linux@roeck-us.net>
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
 drivers/hwmon/ltc4245.c | 73 ++++++++++++++++---------------------------------
 1 file changed, 23 insertions(+), 50 deletions(-)

diff --git a/drivers/hwmon/ltc4245.c b/drivers/hwmon/ltc4245.c
index 34d0653ca607..26542635de9b 100644
--- a/drivers/hwmon/ltc4245.c
+++ b/drivers/hwmon/ltc4245.c
@@ -390,57 +390,30 @@ static umode_t ltc4245_is_visible(const void *_data,
 	}
 }
 
-static const u32 ltc4245_in_config[] = {
-	HWMON_I_INPUT,			/* dummy, skipped in is_visible */
-	HWMON_I_INPUT | HWMON_I_MIN_ALARM,
-	HWMON_I_INPUT | HWMON_I_MIN_ALARM,
-	HWMON_I_INPUT | HWMON_I_MIN_ALARM,
-	HWMON_I_INPUT | HWMON_I_MIN_ALARM,
-	HWMON_I_INPUT | HWMON_I_MIN_ALARM,
-	HWMON_I_INPUT | HWMON_I_MIN_ALARM,
-	HWMON_I_INPUT | HWMON_I_MIN_ALARM,
-	HWMON_I_INPUT | HWMON_I_MIN_ALARM,
-	HWMON_I_INPUT,
-	HWMON_I_INPUT,
-	HWMON_I_INPUT,
-	0
-};
-
-static const struct hwmon_channel_info ltc4245_in = {
-	.type = hwmon_in,
-	.config = ltc4245_in_config,
-};
-
-static const u32 ltc4245_curr_config[] = {
-	HWMON_C_INPUT | HWMON_C_MAX_ALARM,
-	HWMON_C_INPUT | HWMON_C_MAX_ALARM,
-	HWMON_C_INPUT | HWMON_C_MAX_ALARM,
-	HWMON_C_INPUT | HWMON_C_MAX_ALARM,
-	0
-};
-
-static const struct hwmon_channel_info ltc4245_curr = {
-	.type = hwmon_curr,
-	.config = ltc4245_curr_config,
-};
-
-static const u32 ltc4245_power_config[] = {
-	HWMON_P_INPUT,
-	HWMON_P_INPUT,
-	HWMON_P_INPUT,
-	HWMON_P_INPUT,
-	0
-};
-
-static const struct hwmon_channel_info ltc4245_power = {
-	.type = hwmon_power,
-	.config = ltc4245_power_config,
-};
-
 static const struct hwmon_channel_info *ltc4245_info[] = {
-	&ltc4245_in,
-	&ltc4245_curr,
-	&ltc4245_power,
+	HWMON_CHANNEL_INFO(in,
+			   HWMON_I_INPUT,
+			   HWMON_I_INPUT | HWMON_I_MIN_ALARM,
+			   HWMON_I_INPUT | HWMON_I_MIN_ALARM,
+			   HWMON_I_INPUT | HWMON_I_MIN_ALARM,
+			   HWMON_I_INPUT | HWMON_I_MIN_ALARM,
+			   HWMON_I_INPUT | HWMON_I_MIN_ALARM,
+			   HWMON_I_INPUT | HWMON_I_MIN_ALARM,
+			   HWMON_I_INPUT | HWMON_I_MIN_ALARM,
+			   HWMON_I_INPUT | HWMON_I_MIN_ALARM,
+			   HWMON_I_INPUT,
+			   HWMON_I_INPUT,
+			   HWMON_I_INPUT),
+	HWMON_CHANNEL_INFO(curr,
+			   HWMON_C_INPUT | HWMON_C_MAX_ALARM,
+			   HWMON_C_INPUT | HWMON_C_MAX_ALARM,
+			   HWMON_C_INPUT | HWMON_C_MAX_ALARM,
+			   HWMON_C_INPUT | HWMON_C_MAX_ALARM),
+	HWMON_CHANNEL_INFO(power,
+			   HWMON_P_INPUT,
+			   HWMON_P_INPUT,
+			   HWMON_P_INPUT,
+			   HWMON_P_INPUT),
 	NULL
 };
 
-- 
2.7.4


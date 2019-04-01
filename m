Return-Path: <SRS0=CoSo=SD=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F040C43381
	for <linux-hwmon@archiver.kernel.org>; Mon,  1 Apr 2019 16:19:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2A0312133D
	for <linux-hwmon@archiver.kernel.org>; Mon,  1 Apr 2019 16:19:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OLMaUYmt"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728635AbfDAQT7 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 1 Apr 2019 12:19:59 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:39245 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728626AbfDAQT6 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 1 Apr 2019 12:19:58 -0400
Received: by mail-pf1-f193.google.com with SMTP id i17so4821857pfo.6
        for <linux-hwmon@vger.kernel.org>; Mon, 01 Apr 2019 09:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=cKJ9AmGauN0g0jciBSVQw0iCxFHg40qHY8hUnYfglT4=;
        b=OLMaUYmtUaAENzIr1rxBzltFP+9IWZQ8FwT2+v4twhHdC9Kt7U247SmLdkmVzRWoRV
         vYMYcSrnUnvodQj7NfyYbUVWZjnGO5j1XqdiYt7gDj/m2oJFvplmsj2gfBa8c2t8yjdm
         ZH2k3e5u5l+03K5VyvhNOuEkIVAqk3Wq33N9hw6JqpqDimknkBgaMTGq99X7oTQ2Umcj
         xe3QhiJjCp9ExN9GJRzaORBnzb9/7P2qlv3EftqLwv/H/0x7nx/Whb1BOTEqbu6DBZv7
         gMnFLMVl6737m16ncWeT5dkHLE8p8ZjlPvnBxk4J9JVbNYhBcf4LqAykSJbhkw8Esh2Y
         7WEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=cKJ9AmGauN0g0jciBSVQw0iCxFHg40qHY8hUnYfglT4=;
        b=hFcwyAGTE9SUnV1msU45BKKGBF2Tray0RcareWRQD4pFp7Edcjw9k9ShqkMXd0qhRj
         6znzI+ThxVuZfaPYJbSpBm+ZNQpMWaTHyXxZlrzRA3TNH/WRU0caVwst9L4afLznlAES
         b5LWznQzIjckflK91q4N134Fe8dlXvTgQ1asBoQcHiKIf22TdDz+vWn4LhTPAIXueNJ6
         8fPxElR57Ej77ecP64FqVWCQOMBgvKLFk42w3haTuoH5/3/46S6KthURu6YtLmMbpZxq
         XpTjNqnmdBCJawfWq8wUj4vyI5w7YGM1qz5sguTUvOUU0C1AYMhDNUrHDTOzsq8KHsFz
         VkoA==
X-Gm-Message-State: APjAAAVuxXY+XVxukto9lX1RkMpK0pvvk6bVEr1utpEL2UmG8IMvlixl
        exl02anTqUuY7paLJy0tRHqWV6ia
X-Google-Smtp-Source: APXvYqy87mGWmtU5xL6VhSDj5Iuh2WZbMSv3q8ASzUSemo41HYasEYjFbj1R4OMNlzXENiZ4dTl5vg==
X-Received: by 2002:a62:1815:: with SMTP id 21mr17372289pfy.107.1554135597941;
        Mon, 01 Apr 2019 09:19:57 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id h4sm7445660pgn.20.2019.04.01.09.19.56
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 01 Apr 2019 09:19:57 -0700 (PDT)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 10/17] hwmon: (max31790) Use HWMON_CHANNEL_INFO macro
Date:   Mon,  1 Apr 2019 09:19:30 -0700
Message-Id: <1554135577-11889-11-git-send-email-linux@roeck-us.net>
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
 drivers/hwmon/max31790.c | 58 +++++++++++++++++-------------------------------
 1 file changed, 20 insertions(+), 38 deletions(-)

diff --git a/drivers/hwmon/max31790.c b/drivers/hwmon/max31790.c
index 722bcbb9865a..0b0b04d36931 100644
--- a/drivers/hwmon/max31790.c
+++ b/drivers/hwmon/max31790.c
@@ -400,45 +400,27 @@ static umode_t max31790_is_visible(const void *data,
 	}
 }
 
-static const u32 max31790_fan_config[] = {
-	HWMON_F_INPUT | HWMON_F_TARGET | HWMON_F_FAULT,
-	HWMON_F_INPUT | HWMON_F_TARGET | HWMON_F_FAULT,
-	HWMON_F_INPUT | HWMON_F_TARGET | HWMON_F_FAULT,
-	HWMON_F_INPUT | HWMON_F_TARGET | HWMON_F_FAULT,
-	HWMON_F_INPUT | HWMON_F_TARGET | HWMON_F_FAULT,
-	HWMON_F_INPUT | HWMON_F_TARGET | HWMON_F_FAULT,
-	HWMON_F_INPUT | HWMON_F_FAULT,
-	HWMON_F_INPUT | HWMON_F_FAULT,
-	HWMON_F_INPUT | HWMON_F_FAULT,
-	HWMON_F_INPUT | HWMON_F_FAULT,
-	HWMON_F_INPUT | HWMON_F_FAULT,
-	HWMON_F_INPUT | HWMON_F_FAULT,
-	0
-};
-
-static const struct hwmon_channel_info max31790_fan = {
-	.type = hwmon_fan,
-	.config = max31790_fan_config,
-};
-
-static const u32 max31790_pwm_config[] = {
-	HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
-	HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
-	HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
-	HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
-	HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
-	HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
-	0
-};
-
-static const struct hwmon_channel_info max31790_pwm = {
-	.type = hwmon_pwm,
-	.config = max31790_pwm_config,
-};
-
 static const struct hwmon_channel_info *max31790_info[] = {
-	&max31790_fan,
-	&max31790_pwm,
+	HWMON_CHANNEL_INFO(fan,
+			   HWMON_F_INPUT | HWMON_F_TARGET | HWMON_F_FAULT,
+			   HWMON_F_INPUT | HWMON_F_TARGET | HWMON_F_FAULT,
+			   HWMON_F_INPUT | HWMON_F_TARGET | HWMON_F_FAULT,
+			   HWMON_F_INPUT | HWMON_F_TARGET | HWMON_F_FAULT,
+			   HWMON_F_INPUT | HWMON_F_TARGET | HWMON_F_FAULT,
+			   HWMON_F_INPUT | HWMON_F_TARGET | HWMON_F_FAULT,
+			   HWMON_F_INPUT | HWMON_F_FAULT,
+			   HWMON_F_INPUT | HWMON_F_FAULT,
+			   HWMON_F_INPUT | HWMON_F_FAULT,
+			   HWMON_F_INPUT | HWMON_F_FAULT,
+			   HWMON_F_INPUT | HWMON_F_FAULT,
+			   HWMON_F_INPUT | HWMON_F_FAULT),
+	HWMON_CHANNEL_INFO(pwm,
+			   HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
+			   HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
+			   HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
+			   HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
+			   HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
+			   HWMON_PWM_INPUT | HWMON_PWM_ENABLE),
 	NULL
 };
 
-- 
2.7.4


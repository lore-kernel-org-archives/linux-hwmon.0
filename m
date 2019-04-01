Return-Path: <SRS0=CoSo=SD=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50E68C43381
	for <linux-hwmon@archiver.kernel.org>; Mon,  1 Apr 2019 16:20:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BDBE32133D
	for <linux-hwmon@archiver.kernel.org>; Mon,  1 Apr 2019 16:20:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p2w2hlTj"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728640AbfDAQUD (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 1 Apr 2019 12:20:03 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:38561 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728007AbfDAQUD (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 1 Apr 2019 12:20:03 -0400
Received: by mail-pf1-f195.google.com with SMTP id 10so4821417pfo.5
        for <linux-hwmon@vger.kernel.org>; Mon, 01 Apr 2019 09:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=5PgGJ4ZR3na42kqz0YoBDR/EzAl1rkF8yMpTdSJNSL0=;
        b=p2w2hlTjBZNncrMgZ2QcaT9ymKLl3bR+P2Um3D6+xSKzWRUt7zM5n9uT1gvvy1LNX/
         Ce/V01xw0JQv6zSasgjllOFYoGJRr+oZ5sSpDBF9F3h+w9CgbqtfXmrptPvR/G9EsKdi
         Jl7rB+/xorQ2tJSxcqmMX3c+CtNm0MVUOu3KKgl8fm28q0VVWd0nf8CVmNt8hUWMUsY9
         R7yaBuCCbrZXCvpCmmMej5BzpIXi3GwAl6+0US9YGpRz5yc3UYDujrjg2FL7M3RxFdyx
         Ur79SYYwfNtHdTlSzPUfsGvMQCPi2gbh0zsQBDEMr7DFrU2y6Bu0jur6gyd+oBfMuxnk
         Yb4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=5PgGJ4ZR3na42kqz0YoBDR/EzAl1rkF8yMpTdSJNSL0=;
        b=WGyWwNnnfsifwcuiKcPKgsBoX/ZKBH3OWAh3EVxKW5OE5vdtW6yssoFWyEdNacVV4n
         eXtwDsniU0jq9GvuSvRGejRlAgh8ftCyXoQVt5loBu/zHO69zGaB4S26CgZNKs9ul/c2
         9h4TFjpflKqw5PCi0pPa/74g/e+bwI83OKSPx4nBF8LNePrjjS+P9xywpj0M52lpyJZ8
         ar6EMB0w8CdhW6wtUuN6ipdsCpu5vvqOINnzNvg7xAnMBzzqcaxh3bibhDXyDxezIsTF
         uegcf80PX0lhz54bJg/LLasJSyMC9VuaMH2ERxrYUhaBORRk9WE9pcwtHl1JMKNPfRxQ
         lsbw==
X-Gm-Message-State: APjAAAVjhmMrGLET7FAUMdYYOinws9i792pU9IBqEaGkoCgbtL+nM2fq
        hTq2b3ht7lMvkfRgq+u1AbFtACXP
X-Google-Smtp-Source: APXvYqyMaeunuV7Vj7sziBohnCF6Vc58HfBzrR/VK02Wj68UwbwSI7hYPC4fhkukpXk8MjC4XDSgBA==
X-Received: by 2002:aa7:928d:: with SMTP id j13mr64529514pfa.112.1554135602481;
        Mon, 01 Apr 2019 09:20:02 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id q80sm9265070pfa.66.2019.04.01.09.20.01
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 01 Apr 2019 09:20:01 -0700 (PDT)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Avi Fishman <avifishman70@gmail.com>,
        Tomer Maimon <tmaimon77@gmail.com>,
        Patrick Venture <venture@google.com>,
        Nancy Yuen <yuenn@google.com>,
        Brendan Higgins <brendanhiggins@google.com>
Subject: [PATCH 13/17] hwmon: (npcm750-pwm-fan) Use HWMON_CHANNEL_INFO macro
Date:   Mon,  1 Apr 2019 09:19:33 -0700
Message-Id: <1554135577-11889-14-git-send-email-linux@roeck-us.net>
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

Cc: Avi Fishman <avifishman70@gmail.com>
Cc: Tomer Maimon <tmaimon77@gmail.com>
Cc: Patrick Venture <venture@google.com>
Cc: Nancy Yuen <yuenn@google.com>
Cc: Brendan Higgins <brendanhiggins@google.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/npcm750-pwm-fan.c | 70 +++++++++++++++--------------------------
 1 file changed, 26 insertions(+), 44 deletions(-)

diff --git a/drivers/hwmon/npcm750-pwm-fan.c b/drivers/hwmon/npcm750-pwm-fan.c
index b3b907bdfb63..1dc0cd452498 100644
--- a/drivers/hwmon/npcm750-pwm-fan.c
+++ b/drivers/hwmon/npcm750-pwm-fan.c
@@ -629,51 +629,33 @@ static umode_t npcm7xx_is_visible(const void *data,
 	}
 }
 
-static const u32 npcm7xx_pwm_config[] = {
-	HWMON_PWM_INPUT,
-	HWMON_PWM_INPUT,
-	HWMON_PWM_INPUT,
-	HWMON_PWM_INPUT,
-	HWMON_PWM_INPUT,
-	HWMON_PWM_INPUT,
-	HWMON_PWM_INPUT,
-	HWMON_PWM_INPUT,
-	0
-};
-
-static const struct hwmon_channel_info npcm7xx_pwm = {
-	.type = hwmon_pwm,
-	.config = npcm7xx_pwm_config,
-};
-
-static const u32 npcm7xx_fan_config[] = {
-	HWMON_F_INPUT,
-	HWMON_F_INPUT,
-	HWMON_F_INPUT,
-	HWMON_F_INPUT,
-	HWMON_F_INPUT,
-	HWMON_F_INPUT,
-	HWMON_F_INPUT,
-	HWMON_F_INPUT,
-	HWMON_F_INPUT,
-	HWMON_F_INPUT,
-	HWMON_F_INPUT,
-	HWMON_F_INPUT,
-	HWMON_F_INPUT,
-	HWMON_F_INPUT,
-	HWMON_F_INPUT,
-	HWMON_F_INPUT,
-	0
-};
-
-static const struct hwmon_channel_info npcm7xx_fan = {
-	.type = hwmon_fan,
-	.config = npcm7xx_fan_config,
-};
-
 static const struct hwmon_channel_info *npcm7xx_info[] = {
-	&npcm7xx_pwm,
-	&npcm7xx_fan,
+	HWMON_CHANNEL_INFO(pwm,
+			   HWMON_PWM_INPUT,
+			   HWMON_PWM_INPUT,
+			   HWMON_PWM_INPUT,
+			   HWMON_PWM_INPUT,
+			   HWMON_PWM_INPUT,
+			   HWMON_PWM_INPUT,
+			   HWMON_PWM_INPUT,
+			   HWMON_PWM_INPUT),
+	HWMON_CHANNEL_INFO(fan,
+			   HWMON_F_INPUT,
+			   HWMON_F_INPUT,
+			   HWMON_F_INPUT,
+			   HWMON_F_INPUT,
+			   HWMON_F_INPUT,
+			   HWMON_F_INPUT,
+			   HWMON_F_INPUT,
+			   HWMON_F_INPUT,
+			   HWMON_F_INPUT,
+			   HWMON_F_INPUT,
+			   HWMON_F_INPUT,
+			   HWMON_F_INPUT,
+			   HWMON_F_INPUT,
+			   HWMON_F_INPUT,
+			   HWMON_F_INPUT,
+			   HWMON_F_INPUT),
 	NULL
 };
 
-- 
2.7.4


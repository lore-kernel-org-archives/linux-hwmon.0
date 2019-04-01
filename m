Return-Path: <SRS0=CoSo=SD=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D268CC43381
	for <linux-hwmon@archiver.kernel.org>; Mon,  1 Apr 2019 16:19:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9DE462133D
	for <linux-hwmon@archiver.kernel.org>; Mon,  1 Apr 2019 16:19:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fdHFm+hf"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728557AbfDAQT5 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 1 Apr 2019 12:19:57 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:39444 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728551AbfDAQT5 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 1 Apr 2019 12:19:57 -0400
Received: by mail-pg1-f195.google.com with SMTP id k3so5015955pga.6
        for <linux-hwmon@vger.kernel.org>; Mon, 01 Apr 2019 09:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=12Mr84x/LCXzxT+n+Sz9VGrbWBqGy2OlW0sK5mV/pz8=;
        b=fdHFm+hfwCd2acfGkKv+tl+p6/14sjniFOIXKkAFjqxI63kGbYiDCViHSofmixe/Q0
         t2Knu1oYo4k36SaJ4fEnlOb2rhvtKMFpCV4ZT2CBilbt9ZCjeB4l295WzB+G6M+Z1nP1
         zCMm0eQzsgFTHAhlI7yaC+hkv4GIVh+C4Y6eotTt2R7c53Zu3sfp4L4xpqyAbMfFO9y5
         sEdtXq/UIbFdzTAErn/Rg8Q/koMF+lpPYv2p0K193KPpi/fPk61JDtIUCusSIfI9SFKZ
         3kQHoxLKomM35BspAWtRfJjdNcXXXujmbfwFdd1j061opZ74jXJZcwxED45BRBSaG46U
         pG8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=12Mr84x/LCXzxT+n+Sz9VGrbWBqGy2OlW0sK5mV/pz8=;
        b=aOKE2sO23BbtR40dN3a7ySLF3xRoMKIXBdfsE5sguyAEMXx04TOpkrwbK6oTF2vF/E
         tGYCcaRNFWRVHYP5q6JJ0yGr/hHTgT0xiVU5s477ECAYLVpE5O/99NIP9ILt/TzPgsuO
         xhfBC+EeVsXj1PrYKfHvX3dCriWVg04DCuUpZuVyhZQqBQRLMlSB1154cUpzxPn7Qi17
         aCdwhnfB8KieIL647345IXhSPgOTBGwNOlTTHd/G8R9qzncIITdEWPa0LECIMN09PffE
         mjzq5eQzJj/0zDhBydT7nn1beDM8MVI7B6CXrUZgZzc/f1+kPWQ72UDft7nRu57Ju8gG
         gWoQ==
X-Gm-Message-State: APjAAAX9HVWbHsA4Bmk2VpGwXARaV93XiUtW6fZG1e0XAIFqKgYbCHBV
        Hroa0ctqcODNYMMW4TqB9IvAQ/aH
X-Google-Smtp-Source: APXvYqyxJBOP1afKWkAK/0gALWeUT5zKvnIJSKVdSmaCxLbAoWRwzPrdo7aPVdSQi6bwNta4j4dg4Q==
X-Received: by 2002:aa7:884b:: with SMTP id k11mr2343607pfo.49.1554135596320;
        Mon, 01 Apr 2019 09:19:56 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id p26sm22751482pfa.49.2019.04.01.09.19.55
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 01 Apr 2019 09:19:55 -0700 (PDT)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 09/17] hwmon: (ltq-cputemp) Use HWMON_CHANNEL_INFO macro
Date:   Mon,  1 Apr 2019 09:19:29 -0700
Message-Id: <1554135577-11889-10-git-send-email-linux@roeck-us.net>
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
 drivers/hwmon/ltq-cputemp.c | 26 ++++----------------------
 1 file changed, 4 insertions(+), 22 deletions(-)

diff --git a/drivers/hwmon/ltq-cputemp.c b/drivers/hwmon/ltq-cputemp.c
index 1d33f94594c1..570791f0e024 100644
--- a/drivers/hwmon/ltq-cputemp.c
+++ b/drivers/hwmon/ltq-cputemp.c
@@ -77,29 +77,11 @@ static umode_t ltq_is_visible(const void *_data, enum hwmon_sensor_types type,
 	}
 }
 
-static const u32 ltq_chip_config[] = {
-	HWMON_C_REGISTER_TZ,
-	0
-};
-
-static const struct hwmon_channel_info ltq_chip = {
-	.type = hwmon_chip,
-	.config = ltq_chip_config,
-};
-
-static const u32 ltq_temp_config[] = {
-	HWMON_T_INPUT,
-	0
-};
-
-static const struct hwmon_channel_info ltq_temp = {
-	.type = hwmon_temp,
-	.config = ltq_temp_config,
-};
-
 static const struct hwmon_channel_info *ltq_info[] = {
-	&ltq_chip,
-	&ltq_temp,
+	HWMON_CHANNEL_INFO(chip,
+			   HWMON_C_REGISTER_TZ),
+	HWMON_CHANNEL_INFO(temp,
+			   HWMON_T_INPUT),
 	NULL
 };
 
-- 
2.7.4


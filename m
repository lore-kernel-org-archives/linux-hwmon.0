Return-Path: <SRS0=CoSo=SD=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D086C43381
	for <linux-hwmon@archiver.kernel.org>; Mon,  1 Apr 2019 16:20:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EC71C21473
	for <linux-hwmon@archiver.kernel.org>; Mon,  1 Apr 2019 16:20:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W6+k0Rr3"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728038AbfDAQUF (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 1 Apr 2019 12:20:05 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:40679 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728007AbfDAQUE (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 1 Apr 2019 12:20:04 -0400
Received: by mail-pl1-f196.google.com with SMTP id b3so1749527plr.7
        for <linux-hwmon@vger.kernel.org>; Mon, 01 Apr 2019 09:20:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=2QuFrhoco3K1APxoFuVBJuXPknA98BsFcrMQ+DYi7DA=;
        b=W6+k0Rr3uM9j4D/6cYIanBCKxy3kQY/aYqKMOQtZelMAYNn7Q/XoPh7+Lh+SQYm0e3
         gLudjeFgtD7DNlDhrbWAVpmDzUg+R/F2uDWo/2urn7jisGVdwQTLwOOv+Zh0Npx01Cx8
         0f711TW5TEya7HJK6979BtcplsdJHgeL4eein4YvSud/hs8UUn0t8tI/MD1U6T0MLbRG
         wxXrd4OLmtbdONqTU6w4gLqTCWQoJZ91ycaVboyHEEiQG9N7xtDk4+X3A6QabBWGOHhh
         Me1usuopNB0B39C663fSYV+m0shFHAIQF+5C1YnEGuAK2M+stHjSGIsEOmFM4C/WrNBR
         xpjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=2QuFrhoco3K1APxoFuVBJuXPknA98BsFcrMQ+DYi7DA=;
        b=rFWiKE2F/pT5fECEMNZvxivBSkrHT4ZTqJtTYM5wQZQJBvibQEGrtbF/O/r4U0y6ox
         Ai3yvH8oWhlaEeGxt5JuCLzvOUovUmn0t1l7FHHJVEV1m4dO9BVd91mwajBVxTKAMnBl
         KBsuDWS1UnuV7tQpTot4EHwc/uOX6rj1miPaHYZh+ilJZWxIiGAmWehPtNLcxLkqxKLn
         kofOC8Kx1oM8hwaBvfoDRSut4ZNm6/aqsM9pUSCOwYG9KZCHzAOTVlg0/hqPHOyWnfXx
         L0fFx1wUe+iiFobSyPwFcsYUUXN1D4NajNvYM3sWWe0MCWMdj2WXSxMALIYCJcos3ZsV
         kAEg==
X-Gm-Message-State: APjAAAXerRHDlpyS0rJDrHWlQpRCC1wcXUZ67HhZgDQGlwZO2ojv6w6j
        zL1XE4FdhgiXdDA+qnXxe939nsFr
X-Google-Smtp-Source: APXvYqxSnTUL1SBxfFzV7rQvhJLPCiTDalq4/qQV/lpbmigL0kTLvJyfE1lDLRHpVG7MUFZfBCI87A==
X-Received: by 2002:a17:902:396a:: with SMTP id e39mr43130761plg.220.1554135603835;
        Mon, 01 Apr 2019 09:20:03 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id i79sm21741524pfj.28.2019.04.01.09.20.03
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 01 Apr 2019 09:20:03 -0700 (PDT)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 14/17] hwmon: (raspberrypi-hwmon) Use HWMON_CHANNEL_INFO macro
Date:   Mon,  1 Apr 2019 09:19:34 -0700
Message-Id: <1554135577-11889-15-git-send-email-linux@roeck-us.net>
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
 drivers/hwmon/raspberrypi-hwmon.c | 13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)

diff --git a/drivers/hwmon/raspberrypi-hwmon.c b/drivers/hwmon/raspberrypi-hwmon.c
index 0d0457245e7d..efe4bb1ff221 100644
--- a/drivers/hwmon/raspberrypi-hwmon.c
+++ b/drivers/hwmon/raspberrypi-hwmon.c
@@ -86,18 +86,9 @@ static umode_t rpi_is_visible(const void *_data, enum hwmon_sensor_types type,
 	return 0444;
 }
 
-static const u32 rpi_in_config[] = {
-	HWMON_I_LCRIT_ALARM,
-	0
-};
-
-static const struct hwmon_channel_info rpi_in = {
-	.type = hwmon_in,
-	.config = rpi_in_config,
-};
-
 static const struct hwmon_channel_info *rpi_info[] = {
-	&rpi_in,
+	HWMON_CHANNEL_INFO(in,
+			   HWMON_I_LCRIT_ALARM),
 	NULL
 };
 
-- 
2.7.4


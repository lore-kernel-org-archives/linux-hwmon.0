Return-Path: <SRS0=CoSo=SD=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA44FC10F0F
	for <linux-hwmon@archiver.kernel.org>; Mon,  1 Apr 2019 16:20:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7EB452133D
	for <linux-hwmon@archiver.kernel.org>; Mon,  1 Apr 2019 16:20:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yfu5U2Uj"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728645AbfDAQUJ (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 1 Apr 2019 12:20:09 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:34062 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728007AbfDAQUJ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 1 Apr 2019 12:20:09 -0400
Received: by mail-pf1-f195.google.com with SMTP id b3so4826329pfd.1
        for <linux-hwmon@vger.kernel.org>; Mon, 01 Apr 2019 09:20:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=HZhQJdFYJpn9QjzLHWBY8wUbt3gFrLZ/pDAMURPA6KY=;
        b=Yfu5U2UjJGmcWr9/cGDKndprGsFGprwrekUgrwzVhjCkjn/BNrI+YpOvJmWiYOzzbH
         RjNQxYgO0pXK3gqUfeCkjU8h5v9akSqrem6BWINuYNumNQhv43AhYsHkT7tGSMvueko9
         eHelbmJTby08YrMvP1P0m7gVnZvqGxOyuesIXUzTRmsBr0bySJKoa31sk+OyQLBqj2/+
         R7YPBZQ95KOV+C1CQGfJc/fIBp98p1KZAoB+u9i6QTqAA3qRlwfWXGeQnim+PHNJJ8c6
         XE8Eo/qgme6PqKDMuZWslAf90AR2B3ORIgpW4zd88eil0e9HYDzh2KtayNRSgL6JOfeR
         pyZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=HZhQJdFYJpn9QjzLHWBY8wUbt3gFrLZ/pDAMURPA6KY=;
        b=G0iyi646SYCWfWQGz7V5cZFDnrP7TqsiK/jql1YYESyKe8BZWI49zH2m5rrpU2Tpa+
         1dUbuJqf7ETrNQ3VFC91gKoPIv4f+k8WXAy1g1+dUGWui6uXji379RVeNG/D5duoCxVy
         NhwPTy+tanmvhItW7aPE7wDpPSt0QDqa+xhb+IYGKGuaAeNDr/zg9o/ZkpAXdhrS/I9y
         5XyEOmx+EHxV/rxv0N2NGcxPw7YwpqQCnsSJtWWCwrOhV9XvV/bmUuP8tn/iZAG57aUa
         ljJqOsUkImIZzb0im9YaJpql7cap0DtXbDmeBIKUFMpGIsqcP4KacRgfl5CKiA2d8pue
         UoMg==
X-Gm-Message-State: APjAAAUrm+09GOMkEXxOdgW5HqbaqpUUAzPoIMavgLPHYH1FG/Ue7Exg
        0rIcYE70ZCeqr6tVsc6I5Hd4JihQ
X-Google-Smtp-Source: APXvYqzsGOfnvQhcbrcXkKF4MZSPWoEi4+BDM1UtTVOlM8TrFeI/UI3GPTAJqRn/jEYJy8KPiUh1jw==
X-Received: by 2002:a63:4a5a:: with SMTP id j26mr51866310pgl.361.1554135608159;
        Mon, 01 Apr 2019 09:20:08 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id f65sm16276756pff.21.2019.04.01.09.20.07
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 01 Apr 2019 09:20:07 -0700 (PDT)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 17/17] hwmon: (w83773g) Use HWMON_CHANNEL_INFO macro
Date:   Mon,  1 Apr 2019 09:19:37 -0700
Message-Id: <1554135577-11889-18-git-send-email-linux@roeck-us.net>
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
 drivers/hwmon/w83773g.c | 30 ++++++------------------------
 1 file changed, 6 insertions(+), 24 deletions(-)

diff --git a/drivers/hwmon/w83773g.c b/drivers/hwmon/w83773g.c
index e858093ac806..1f34d885db52 100644
--- a/drivers/hwmon/w83773g.c
+++ b/drivers/hwmon/w83773g.c
@@ -237,31 +237,13 @@ static umode_t w83773_is_visible(const void *data, enum hwmon_sensor_types type,
 	return 0;
 }
 
-static const u32 w83773_chip_config[] = {
-	HWMON_C_REGISTER_TZ | HWMON_C_UPDATE_INTERVAL,
-	0
-};
-
-static const struct hwmon_channel_info w83773_chip = {
-	.type = hwmon_chip,
-	.config = w83773_chip_config,
-};
-
-static const u32 w83773_temp_config[] = {
-	HWMON_T_INPUT,
-	HWMON_T_INPUT | HWMON_T_FAULT | HWMON_T_OFFSET,
-	HWMON_T_INPUT | HWMON_T_FAULT | HWMON_T_OFFSET,
-	0
-};
-
-static const struct hwmon_channel_info w83773_temp = {
-	.type = hwmon_temp,
-	.config = w83773_temp_config,
-};
-
 static const struct hwmon_channel_info *w83773_info[] = {
-	&w83773_chip,
-	&w83773_temp,
+	HWMON_CHANNEL_INFO(chip,
+			   HWMON_C_REGISTER_TZ | HWMON_C_UPDATE_INTERVAL),
+	HWMON_CHANNEL_INFO(temp,
+			   HWMON_T_INPUT,
+			   HWMON_T_INPUT | HWMON_T_FAULT | HWMON_T_OFFSET,
+			   HWMON_T_INPUT | HWMON_T_FAULT | HWMON_T_OFFSET),
 	NULL
 };
 
-- 
2.7.4


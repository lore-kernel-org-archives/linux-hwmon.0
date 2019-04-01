Return-Path: <SRS0=CoSo=SD=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87E53C4360F
	for <linux-hwmon@archiver.kernel.org>; Mon,  1 Apr 2019 16:20:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5225821473
	for <linux-hwmon@archiver.kernel.org>; Mon,  1 Apr 2019 16:20:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZqoCc29l"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728040AbfDAQUH (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 1 Apr 2019 12:20:07 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:44420 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728007AbfDAQUH (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 1 Apr 2019 12:20:07 -0400
Received: by mail-pf1-f196.google.com with SMTP id y13so4806444pfm.11
        for <linux-hwmon@vger.kernel.org>; Mon, 01 Apr 2019 09:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=MR/TKnVL50MPfOUwfeH5b7w0uUtvHuJLwsuvoLJ7iuo=;
        b=ZqoCc29lagxUPZnkrNKaD3jxnR6FnhQSGL2TEm6HOPuWvGIKLF0aKzalq4o3sk71qT
         Slyc6U7t7BcnelrYSzqpf01lbOga7UwNhcwYjVTZFHDODYlFrPe4OM8lYiRGpOf6oHaG
         4ckXlcMWgpHQULV08bjNxnjiDuVc8ny5XBKg+us8biWFJ6LuDepyaClJ/wWalTmvuOPP
         i0QdV+TE7XU6rn140wawbXTxlYgPXkAzILcCfu8lbvryG2VkvPvxDCVeoCK04FSxCETy
         dSj05sv+FgkoA/P1CJcQXdOhku1qkEbWSHcnsOSAc32w0lU/E6JINP0fd0q9l1SsTHYh
         eE4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=MR/TKnVL50MPfOUwfeH5b7w0uUtvHuJLwsuvoLJ7iuo=;
        b=R4INAhtqcImUAUAWGStt9Q3DGrh+RysVVl8a4Cgv3H5lZsGwC6vOWEsVeLTs/s7ft+
         6WovetPcXBdzDlweJKdl6M6rg61a18PGZRFwchYjEjuZPXXB/wpwjI+N0bc0patAmsq+
         erQGKtaaq8iU2GFf3Hkga5GFC5lfyh8TlznI/YlHn0fe1m8PZYmkwf20cj/GdllN8aQN
         WssCBNe1ptFUi9KT7PWv8oWRaJBcUsIKMng0RDTMpSg3/uJCfHOHS/qg5c20rwMWB+CH
         iB7Eph7zPqBQn6ZVNNgxEw/O5O9233joR+3XWmEB9LYtdzJ8m3YTDWcOogP08a2YCizf
         aXDA==
X-Gm-Message-State: APjAAAV01kiTcQM+rHxquDfWWoGiqOAglMyjVexumg+JCpzMR45wYrC/
        5fhRU/Az1pFWPUi79Qgp3DK/ZRq6
X-Google-Smtp-Source: APXvYqxMqT6dPn8xhp0ABkxqp2dbPn8pekIBMO6CGLzshVQZC9pOAjHkoitqRxtA/bcIIIaQdKhDjA==
X-Received: by 2002:a63:4e4e:: with SMTP id o14mr62448208pgl.254.1554135606770;
        Mon, 01 Apr 2019 09:20:06 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id a17sm9481456pgd.30.2019.04.01.09.20.05
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 01 Apr 2019 09:20:06 -0700 (PDT)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 16/17] hwmon: (tmp108) Use HWMON_CHANNEL_INFO macro
Date:   Mon,  1 Apr 2019 09:19:36 -0700
Message-Id: <1554135577-11889-17-git-send-email-linux@roeck-us.net>
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
 drivers/hwmon/tmp108.c | 29 ++++++-----------------------
 1 file changed, 6 insertions(+), 23 deletions(-)

diff --git a/drivers/hwmon/tmp108.c b/drivers/hwmon/tmp108.c
index 429bfeae4ca8..2447af704424 100644
--- a/drivers/hwmon/tmp108.c
+++ b/drivers/hwmon/tmp108.c
@@ -281,30 +281,13 @@ static umode_t tmp108_is_visible(const void *data, enum hwmon_sensor_types type,
 	}
 }
 
-static u32 tmp108_chip_config[] = {
-	HWMON_C_REGISTER_TZ | HWMON_C_UPDATE_INTERVAL,
-	0
-};
-
-static const struct hwmon_channel_info tmp108_chip = {
-	.type = hwmon_chip,
-	.config = tmp108_chip_config,
-};
-
-static u32 tmp108_temp_config[] = {
-	HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_MIN | HWMON_T_MIN_HYST
-		| HWMON_T_MAX_HYST | HWMON_T_MIN_ALARM | HWMON_T_MAX_ALARM,
-	0
-};
-
-static const struct hwmon_channel_info tmp108_temp = {
-	.type = hwmon_temp,
-	.config = tmp108_temp_config,
-};
-
 static const struct hwmon_channel_info *tmp108_info[] = {
-	&tmp108_chip,
-	&tmp108_temp,
+	HWMON_CHANNEL_INFO(chip,
+			   HWMON_C_REGISTER_TZ | HWMON_C_UPDATE_INTERVAL),
+	HWMON_CHANNEL_INFO(temp,
+			   HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_MIN |
+			   HWMON_T_MIN_HYST | HWMON_T_MAX_HYST |
+			   HWMON_T_MIN_ALARM | HWMON_T_MAX_ALARM),
 	NULL
 };
 
-- 
2.7.4


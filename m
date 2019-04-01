Return-Path: <SRS0=CoSo=SD=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81E9EC43381
	for <linux-hwmon@archiver.kernel.org>; Mon,  1 Apr 2019 16:19:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 513832133D
	for <linux-hwmon@archiver.kernel.org>; Mon,  1 Apr 2019 16:19:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nVKp1KH8"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728196AbfDAQTq (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 1 Apr 2019 12:19:46 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:42894 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726854AbfDAQTp (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 1 Apr 2019 12:19:45 -0400
Received: by mail-pf1-f194.google.com with SMTP id r15so4805963pfn.9
        for <linux-hwmon@vger.kernel.org>; Mon, 01 Apr 2019 09:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=OWPZ9YldeUjXP3Qqs99sSZQ8OCpet5I0el3vEDSr++A=;
        b=nVKp1KH8gWZc88dL6O/TIippbUluNYlmKIqkVyuSJj+2JAv/NN+4UhLXMakofGcu19
         x3iiqrlWlxMkBAiPoBCfK3zUv0sQkXJQsBBVZ/S7ZGZybEn7/LHYI4zsEimOLi7tf7tX
         JhahGCzxhDi3ThioWU/ok4q3sWCzeP5Ws4WL+2k48LM5UVIt+rTJiVMco0EHW1GIhLnU
         2ofcJQ1oMvjWSZYCXFgL2iXlQuGFCOmzOBc3lXoeVmLUCI0jCBkiyFPL5kv5C7LVasTH
         qQ5l63n8McI9pw8e+fMsDNtCKjmJWY+0cpBAQReiDDqjzzmy2KT7vBFyAw3E6vNKpYuI
         vroA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=OWPZ9YldeUjXP3Qqs99sSZQ8OCpet5I0el3vEDSr++A=;
        b=b7ufDNjDfb688bCbAfqusDwExiQqFEg6UlrELFs01FGJDqvpPXMQXS4YuT8OGXy2M1
         dSWgfZ+atHGLt+FA86YGwrp1doGL4NWiBZONJG0VXeCI5ZJCyP/d0AistECm8HnX9wj7
         IJkVyiRtHWJz/tknO/jpyprH7QjaGsCmJNG8hhDYv298Oj/YP/pOme06MlKH6TVehRf1
         eciHJWcUMALKOTTXis4olGvvkuCSLuL8PziB0RlEKC5UTb44Y3oykdcKD06fQTEfBX6t
         ILSgSJbkxCtvUVWiyRT5wGr/p2RVlXOi4nzNkFFo4+mYuqO1Y4k6MUdbWa0e8R+mPDgP
         EdDA==
X-Gm-Message-State: APjAAAUaTuD/ck24HeJSI3JLZgPnYc0zrIBBowmozrgNnuW24z/s7Ha3
        5m1lCc2oWjONduNE89KQ3t3I4kEa
X-Google-Smtp-Source: APXvYqysdxdVX/iLThpd6FVUl40MNZWMeXUO5Ua9eyllryehsow5KQe01eNjHNkJm4umVRD1ZemUTw==
X-Received: by 2002:aa7:91d5:: with SMTP id z21mr32018159pfa.222.1554135584605;
        Mon, 01 Apr 2019 09:19:44 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id t8sm13318850pgp.5.2019.04.01.09.19.43
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 01 Apr 2019 09:19:44 -0700 (PDT)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 01/17] hwmon: (adt7411) Use HWMON_CHANNEL_INFO macro
Date:   Mon,  1 Apr 2019 09:19:21 -0700
Message-Id: <1554135577-11889-2-git-send-email-linux@roeck-us.net>
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
 drivers/hwmon/adt7411.c | 48 +++++++++++++++---------------------------------
 1 file changed, 15 insertions(+), 33 deletions(-)

diff --git a/drivers/hwmon/adt7411.c b/drivers/hwmon/adt7411.c
index b939f8a115ba..44a827b031cb 100644
--- a/drivers/hwmon/adt7411.c
+++ b/drivers/hwmon/adt7411.c
@@ -639,40 +639,22 @@ static int adt7411_init_device(struct adt7411_data *data)
 	return i2c_smbus_write_byte_data(data->client, ADT7411_REG_CFG1, val);
 }
 
-static const u32 adt7411_in_config[] = {
-	HWMON_I_INPUT | HWMON_I_MIN | HWMON_I_MAX | HWMON_I_ALARM,
-	HWMON_I_INPUT | HWMON_I_MIN | HWMON_I_MAX | HWMON_I_ALARM,
-	HWMON_I_INPUT | HWMON_I_MIN | HWMON_I_MAX | HWMON_I_ALARM,
-	HWMON_I_INPUT | HWMON_I_MIN | HWMON_I_MAX | HWMON_I_ALARM,
-	HWMON_I_INPUT | HWMON_I_MIN | HWMON_I_MAX | HWMON_I_ALARM,
-	HWMON_I_INPUT | HWMON_I_MIN | HWMON_I_MAX | HWMON_I_ALARM,
-	HWMON_I_INPUT | HWMON_I_MIN | HWMON_I_MAX | HWMON_I_ALARM,
-	HWMON_I_INPUT | HWMON_I_MIN | HWMON_I_MAX | HWMON_I_ALARM,
-	HWMON_I_INPUT | HWMON_I_MIN | HWMON_I_MAX | HWMON_I_ALARM,
-	0
-};
-
-static const struct hwmon_channel_info adt7411_in = {
-	.type = hwmon_in,
-	.config = adt7411_in_config,
-};
-
-static const u32 adt7411_temp_config[] = {
-	HWMON_T_INPUT | HWMON_T_MIN | HWMON_T_MIN_ALARM |
-		HWMON_T_MAX | HWMON_T_MAX_ALARM,
-	HWMON_T_INPUT | HWMON_T_MIN | HWMON_T_MIN_ALARM |
-		HWMON_T_MAX | HWMON_T_MAX_ALARM | HWMON_T_FAULT,
-	0
-};
-
-static const struct hwmon_channel_info adt7411_temp = {
-	.type = hwmon_temp,
-	.config = adt7411_temp_config,
-};
-
 static const struct hwmon_channel_info *adt7411_info[] = {
-	&adt7411_in,
-	&adt7411_temp,
+	HWMON_CHANNEL_INFO(in,
+			   HWMON_I_INPUT | HWMON_I_MIN | HWMON_I_MAX | HWMON_I_ALARM,
+			   HWMON_I_INPUT | HWMON_I_MIN | HWMON_I_MAX | HWMON_I_ALARM,
+			   HWMON_I_INPUT | HWMON_I_MIN | HWMON_I_MAX | HWMON_I_ALARM,
+			   HWMON_I_INPUT | HWMON_I_MIN | HWMON_I_MAX | HWMON_I_ALARM,
+			   HWMON_I_INPUT | HWMON_I_MIN | HWMON_I_MAX | HWMON_I_ALARM,
+			   HWMON_I_INPUT | HWMON_I_MIN | HWMON_I_MAX | HWMON_I_ALARM,
+			   HWMON_I_INPUT | HWMON_I_MIN | HWMON_I_MAX | HWMON_I_ALARM,
+			   HWMON_I_INPUT | HWMON_I_MIN | HWMON_I_MAX | HWMON_I_ALARM,
+			   HWMON_I_INPUT | HWMON_I_MIN | HWMON_I_MAX | HWMON_I_ALARM),
+	HWMON_CHANNEL_INFO(temp,
+			   HWMON_T_INPUT | HWMON_T_MIN | HWMON_T_MIN_ALARM |
+			   HWMON_T_MAX | HWMON_T_MAX_ALARM,
+			   HWMON_T_INPUT | HWMON_T_MIN | HWMON_T_MIN_ALARM |
+			   HWMON_T_MAX | HWMON_T_MAX_ALARM | HWMON_T_FAULT),
 	NULL
 };
 
-- 
2.7.4


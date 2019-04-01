Return-Path: <SRS0=CoSo=SD=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4D07C43381
	for <linux-hwmon@archiver.kernel.org>; Mon,  1 Apr 2019 16:19:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B36D42133D
	for <linux-hwmon@archiver.kernel.org>; Mon,  1 Apr 2019 16:19:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cx+S7tHY"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728255AbfDAQTv (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 1 Apr 2019 12:19:51 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:36609 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728019AbfDAQTv (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 1 Apr 2019 12:19:51 -0400
Received: by mail-pl1-f194.google.com with SMTP id ck15so3532551plb.3
        for <linux-hwmon@vger.kernel.org>; Mon, 01 Apr 2019 09:19:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=o/YcELKZvVaAdUrzaD8aWVjc6f0q+Yfm9C0j/Wvg9F8=;
        b=Cx+S7tHYYORs2vZ3hPX+8sU58ZeqXPN+HoqBe1hoPBJ7n9GajRLTqgb8KinSQkGZK4
         Sf/GQomEMdSCJtGlZyB6sVICmRge1oiR/cQOrQJrI86IrlWJTbIv7/6C+vJK4RIgfoFy
         5AO3UALp5dqfpySdCShAfGd8RNRWKVmqWTZx7GZm98FYay1vZBU8m6JtAhiM4v0qoHJ2
         fC2x8h7cBNQQBdL/YM94KwcisTJ3KnfQieuxBCXle7KaTVj0JMFarC51q6zGKdVX46by
         7aB0ZV5MWmIy/4m8on3/RwrA9I4td2j0wvOh/n9uvhxw63r5lR48zTnPlgmMprnQJru9
         ApyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=o/YcELKZvVaAdUrzaD8aWVjc6f0q+Yfm9C0j/Wvg9F8=;
        b=c26maQiqHJZU+6fiRVLq76THHK00GrhRfMVHQBGX0dVL/WluoWVA7qVge9gmW038gU
         DyxRdK8Sqn8KOF5YpDt9f2Z2EQhIhUf3x24teaE1x9IG4zRatiTeYlSKCpELxfHdU9tE
         6Aj488QbeoyCSDja8XorkEM/eSrzi5beBGFZwvziHz01Iwy0VRWIU70JEnD2bIg6eoki
         hg+VMosYYCZ0DeYpmfVCDxtQY3JSQZHkkFBssTzyjIPx2NrhZ0cpzydDix9NtMPWGl0W
         MWe792b+IGPa5vI4Q9jU4XdmSR4b7GK3yGiiCj2865T8XkGHWS3zbVdbGpXpIY20w/MP
         03EQ==
X-Gm-Message-State: APjAAAWizr3UKEXm7dY1l2PAXs8OP5DcG9G8PXVA/Nx6RlwuMdgd2SPV
        nmaAJbtCDHhJXKGgktEPK7A9IxT8
X-Google-Smtp-Source: APXvYqwNfP7l28j6ep4LCW2ZZ98jzcasjrYgXdGfxiZxY/DzSznCVlLKqerrXICAu30D4NZ+eQ1JJw==
X-Received: by 2002:a17:902:4681:: with SMTP id p1mr62771230pld.42.1554135590513;
        Mon, 01 Apr 2019 09:19:50 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id w3sm23789008pfn.179.2019.04.01.09.19.49
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 01 Apr 2019 09:19:50 -0700 (PDT)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 05/17] hwmon: (lm90) Use HWMON_CHANNEL_INFO macro
Date:   Mon,  1 Apr 2019 09:19:25 -0700
Message-Id: <1554135577-11889-6-git-send-email-linux@roeck-us.net>
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
 drivers/hwmon/lm90.c | 13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)

diff --git a/drivers/hwmon/lm90.c b/drivers/hwmon/lm90.c
index 480d70a51778..0f9c22b21ffa 100644
--- a/drivers/hwmon/lm90.c
+++ b/drivers/hwmon/lm90.c
@@ -1720,16 +1720,6 @@ static void lm90_regulator_disable(void *regulator)
 	regulator_disable(regulator);
 }
 
-static const u32 lm90_chip_config[] = {
-	HWMON_C_REGISTER_TZ | HWMON_C_UPDATE_INTERVAL | HWMON_C_ALARMS,
-	0
-};
-
-static const struct hwmon_channel_info lm90_chip_info = {
-	.type = hwmon_chip,
-	.config = lm90_chip_config,
-};
-
 
 static const struct hwmon_ops lm90_ops = {
 	.is_visible = lm90_is_visible,
@@ -1792,7 +1782,8 @@ static int lm90_probe(struct i2c_client *client,
 	data->chip.ops = &lm90_ops;
 	data->chip.info = data->info;
 
-	data->info[0] = &lm90_chip_info;
+	data->info[0] = HWMON_CHANNEL_INFO(chip,
+		HWMON_C_REGISTER_TZ | HWMON_C_UPDATE_INTERVAL | HWMON_C_ALARMS);
 	data->info[1] = &data->temp_info;
 
 	info = &data->temp_info;
-- 
2.7.4


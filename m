Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D073BC4332F
	for <linux-hwmon@archiver.kernel.org>; Thu, 12 May 2022 19:56:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358239AbiELT4Y (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 12 May 2022 15:56:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358251AbiELT4O (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 12 May 2022 15:56:14 -0400
Received: from mail-oa1-x2d.google.com (mail-oa1-x2d.google.com [IPv6:2001:4860:4864:20::2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE5981838C
        for <linux-hwmon@vger.kernel.org>; Thu, 12 May 2022 12:56:12 -0700 (PDT)
Received: by mail-oa1-x2d.google.com with SMTP id 586e51a60fabf-d6e29fb3d7so7981000fac.7
        for <linux-hwmon@vger.kernel.org>; Thu, 12 May 2022 12:56:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Owt6xWxjB7Gtk/Vy9gNjbL2TPJqjW6vw571EvSRoBSA=;
        b=mJNiABkaBN0B93fBtOZQxxfl0+CSVujkZcQdOO6j+Z8wQGgU6nezLBGvHQzYL3j6Hk
         5eMXEJV8Gz/ukX3L6waa0UJx3Hl6/j0YriXbB2Oy1JDKLrmk/0v0BT5+/JyF07vdv7ms
         L7xZdgquW0K+bYPGqtrjITMsRUyv75l4ROIjFks5dPYo+oylzR0am6EaTAjGmJTDuT8b
         v8l/ewmFUJQx1W8cC4NPjcQ9t57++e5crGYuM9pDHAL/K76uYfEwIzaslyfSGWcK7fKW
         iGqZeM01WRO4gFa4GA7hmJLfVCOfWYuKoeGvvKC1KKHsiVmvR27ANekI38wfR8TNNf1K
         omPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=Owt6xWxjB7Gtk/Vy9gNjbL2TPJqjW6vw571EvSRoBSA=;
        b=JyuMz543lUg4UTmJXD/46x6aqxMGg4dBbt7Q9X5WwwAJKcFagde2ZKTsyM+MBh3u6D
         n2LJ9RWzqaFcwQNLmsLqmi5IQF/D/bAfZfvHJjuSoQkDoC0A7BmPvTfsTj7E2WTkNlf1
         kUmN1veG9Y8cBuFlVrQjdxlg3UtCvN5pn4jfaOQQxdSJyirNz3lwvz/R5kdOiV1LhchN
         a12cET+LpeYeZqaIJik+Sbv4zDiDaNswhGh/xKN1CgWGC5Th6WbtcxzAFw9KOA4MUlUX
         EyU3k1FkHwKNiLuYge5XXSzJ3/fbSmB5FXdtHGfxF0gU8X2YoX8rUcJzzL+Ab4gtZdBC
         Vk/Q==
X-Gm-Message-State: AOAM531CT4qGaXzmxFhBPiez5OxHlKvjihCKYfAnaekOBy+JKlv2d1om
        S5k13BQXyYiox/oCDEFBzEjnemTgCHsffw==
X-Google-Smtp-Source: ABdhPJzw8P3WLy52ZqpW8PfSheYoko7P9Nho0w9NGcqC0CoSISsXHoRU7AU3A0Qt95BGCQaTfJOkhg==
X-Received: by 2002:a05:6870:524f:b0:ed:824:4238 with SMTP id o15-20020a056870524f00b000ed08244238mr792374oai.113.1652385371690;
        Thu, 12 May 2022 12:56:11 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id w15-20020a056830144f00b00606a6c09a0csm243100otp.12.2022.05.12.12.56.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 May 2022 12:56:11 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Michael Walle <michael@walle.cc>
Subject: [PATCH 7/7] hwmon: (sl28cpld-hwmon) Use HWMON_CHANNEL_INFO macro
Date:   Thu, 12 May 2022 12:55:56 -0700
Message-Id: <20220512195556.137741-7-linux@roeck-us.net>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220512195556.137741-1-linux@roeck-us.net>
References: <20220512195556.137741-1-linux@roeck-us.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

The HWMON_CHANNEL_INFO macro simplifies the code, reduces the likelihood
of errors, and makes the code easier to read.

The conversion was done automatically with coccinelle. The semantic patch
used to make this change is as follows.

@s@
identifier i,j,ty;
@@

-struct hwmon_channel_info j = {
-       .type = ty,
-       .config = i,
-};

@r@
initializer list elements;
identifier s.i;
@@

-u32 i[] = {
-  elements,
-  0
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
Julia Lawall for providing the coccinelle script.

Cc: Michael Walle <michael@walle.cc>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/sl28cpld-hwmon.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/hwmon/sl28cpld-hwmon.c b/drivers/hwmon/sl28cpld-hwmon.c
index e48f58ec5b9c..e2fc60bf40bd 100644
--- a/drivers/hwmon/sl28cpld-hwmon.c
+++ b/drivers/hwmon/sl28cpld-hwmon.c
@@ -67,18 +67,8 @@ static int sl28cpld_hwmon_read(struct device *dev,
 	return 0;
 }
 
-static const u32 sl28cpld_hwmon_fan_config[] = {
-	HWMON_F_INPUT,
-	0
-};
-
-static const struct hwmon_channel_info sl28cpld_hwmon_fan = {
-	.type = hwmon_fan,
-	.config = sl28cpld_hwmon_fan_config,
-};
-
 static const struct hwmon_channel_info *sl28cpld_hwmon_info[] = {
-	&sl28cpld_hwmon_fan,
+	HWMON_CHANNEL_INFO(fan, HWMON_F_INPUT),
 	NULL
 };
 
-- 
2.35.1


Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 081D5C433FE
	for <linux-hwmon@archiver.kernel.org>; Thu, 12 May 2022 19:56:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358226AbiELT4W (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 12 May 2022 15:56:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358243AbiELT4G (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 12 May 2022 15:56:06 -0400
Received: from mail-oo1-xc2e.google.com (mail-oo1-xc2e.google.com [IPv6:2607:f8b0:4864:20::c2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B9BF140BC
        for <linux-hwmon@vger.kernel.org>; Thu, 12 May 2022 12:56:05 -0700 (PDT)
Received: by mail-oo1-xc2e.google.com with SMTP id a23-20020a4ad5d7000000b0035ee70da7a9so2374576oot.1
        for <linux-hwmon@vger.kernel.org>; Thu, 12 May 2022 12:56:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jkkA68rw8RtU0yfUmCNXyoAoEbWNcmBb9A16ou7NvdE=;
        b=KBUGmLPWGSr5yz9npIOM11DpBHTNrzvgIjM0Odi4gFiXhz1An9J8/OZTPfvd1+lh/u
         vkI1t8g9LNew69nf4sDnlL6SYBQsMDvszDdWYVYjWAqoZeAo/TIKeodxsYvyxl0Ie9oA
         jvwD8WE831ZKfzp2FDFsPCB9seki4gTXyw7ybiXkroqpfRDnvnIyicyOMBZSEqEV0dDc
         9u6olgZ78DX4oKcUMi+IbuOVcgClY3oSZsj6FXwH68fzEKiSTVr2abtLO4553Nftsarp
         rAJFPDmHX/7jOipt08uG2T4x92nEqnksKvJOyDNJ33w4h4f/5g/QMAUm6LS5SSCz5+EL
         cfaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=jkkA68rw8RtU0yfUmCNXyoAoEbWNcmBb9A16ou7NvdE=;
        b=QKi3B/8eqKGeQCDtWNQ7DIeRXYvN5fGjU6AWjEIfN7qeQT+Eh5QjPK7zdVVH1basnt
         1XHuo9cYK2+bcUGYIaEeqaDqtt3dS9vDNd7PMuHQ42unnMF2DojXZ9d98UwzmsgoQMuS
         gygNax6JbtVW/91+D5en7ODBYwajEtTt5d4L3aS0PycLcuFAyV3KvFZkBilvxgGvZ11J
         MFwzk+h73B4vYZ/uqL3CqUr9uG/goB1WBZBdc56ugtKJP2CrWkW1ZRY86zx9JhR9SPDd
         O65gZyVhlL7hXMzw1l1JMUnEOzrbOZ3dUgd5mq0caFNoqFW5b+k/0bBl5iCSjV8PNvJs
         7VWw==
X-Gm-Message-State: AOAM5307JOoo8Pff+kXO8LzgI5E0I/3R/+4+a8hx8CQPB070Zww7jMof
        Lu/QgGtYnUiNqFyIc0ld8QuVx9xA1uGWhg==
X-Google-Smtp-Source: ABdhPJxXfnfj/88EwQw6uJX5oN5dYOCykc8odwnEDvvF6jFBSKZo8j8Ai2ocmCGEO1Y0TFcGAyT33A==
X-Received: by 2002:a05:6820:1517:b0:35f:5a69:8cc0 with SMTP id ay23-20020a056820151700b0035f5a698cc0mr687038oob.72.1652385364275;
        Thu, 12 May 2022 12:56:04 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id j26-20020a9d739a000000b006060322127bsm235685otk.75.2022.05.12.12.56.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 May 2022 12:56:03 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH 3/7] hwmon: (mr75203) Use HWMON_CHANNEL_INFO macro
Date:   Thu, 12 May 2022 12:55:52 -0700
Message-Id: <20220512195556.137741-3-linux@roeck-us.net>
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

Cc: Philipp Zabel <p.zabel@pengutronix.de>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/mr75203.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/hwmon/mr75203.c b/drivers/hwmon/mr75203.c
index 1ba1e3145969..26278b0f17a9 100644
--- a/drivers/hwmon/mr75203.c
+++ b/drivers/hwmon/mr75203.c
@@ -223,16 +223,6 @@ static int pvt_read(struct device *dev, enum hwmon_sensor_types type,
 	}
 }
 
-static const u32 pvt_chip_config[] = {
-	HWMON_C_REGISTER_TZ,
-	0
-};
-
-static const struct hwmon_channel_info pvt_chip = {
-	.type = hwmon_chip,
-	.config = pvt_chip_config,
-};
-
 static struct hwmon_channel_info pvt_temp = {
 	.type = hwmon_temp,
 };
@@ -555,7 +545,7 @@ static int mr75203_probe(struct platform_device *pdev)
 	pvt_info = devm_kcalloc(dev, val + 2, sizeof(*pvt_info), GFP_KERNEL);
 	if (!pvt_info)
 		return -ENOMEM;
-	pvt_info[0] = &pvt_chip;
+	pvt_info[0] = HWMON_CHANNEL_INFO(chip, HWMON_C_REGISTER_TZ);
 	index = 1;
 
 	if (ts_num) {
-- 
2.35.1


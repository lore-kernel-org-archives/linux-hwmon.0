Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 508ACC433F5
	for <linux-hwmon@archiver.kernel.org>; Thu, 12 May 2022 19:56:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358265AbiELT4Q (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 12 May 2022 15:56:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358240AbiELT4E (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 12 May 2022 15:56:04 -0400
Received: from mail-oa1-x30.google.com (mail-oa1-x30.google.com [IPv6:2001:4860:4864:20::30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C44A13E8C
        for <linux-hwmon@vger.kernel.org>; Thu, 12 May 2022 12:56:01 -0700 (PDT)
Received: by mail-oa1-x30.google.com with SMTP id 586e51a60fabf-edf3b6b0f2so7962888fac.9
        for <linux-hwmon@vger.kernel.org>; Thu, 12 May 2022 12:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KhWipZGHRMPTklvBPnwbbUW4qSNdrLmj6cSLwIrhPI8=;
        b=J99aQDqyPBrwjruthl1Zzuzh1WsF8RzTkW6AWjgkE1hAGS6KQJBN2HEgMJdeTkNVM9
         iYXqhanfklBY66oVQMIoCgBrm1RmIvcocYtOHS6LpjTldt06Y0KkZ0FAuL5+2phdYWid
         eDXfX9Q/r24nfnkwqs4udSbNfqEHilXzcfGBZc8+9j4qHdsGoMq8wMjaz/RdRY8/bL+Y
         njOIixWL01sC4lsqVS9BETJ1nv+0K8wYc9S9IFSCdciQRUXUmImtAGdAAz8HBGT0asTN
         CZyz7Aer85OHez9FCuRuKC4OKGvC/SiLDvjsN5/YuTXkxWiISgx5QH+4QvfpgQLqDQD8
         OSJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=KhWipZGHRMPTklvBPnwbbUW4qSNdrLmj6cSLwIrhPI8=;
        b=WwCSvnoS5XK0IgYy4KSm7oY+svaHgq/wJygmeblMbEd+rc3qeOWyOCeH32S59hifZg
         Ck+1ytanPYsbDrIUPkJLIJJH9jTS//UL/AEZxqGozMwihJYfSi//aEArMAgSUtO85o3O
         qHAE/cQMvBSOgfR87kOgZgaLPdvPaTvuf634KtICfGqHlucKZ18lyZGB1b0os1RQ6Zyq
         Azp8l2PgU9cOkQyry/FMcPXuiZpBgx4s766wsypeGMtY+uORg3HAS5jpDnUh3MXVQAMC
         Zq4w1hspMzz2465tHTRL3G5c3ThJQcE+l+OOIRdyWSGh/QCD2XALYSHAcc/sCzntI8LI
         5GKg==
X-Gm-Message-State: AOAM530fnycc/Onvn/IGJgmWXQ/c9ExIMGNzhRHlHmySNcnnZt29GaMz
        xjl35rUJGzm+RwCkTE+npak8K44HEICjvQ==
X-Google-Smtp-Source: ABdhPJyYgMB0hyBvVCIO3FtuV/0RKteXCvQMfhMtYEV7lo39ZU4DEyCgwy4lKRoZ7pZZjcEvDDMwzg==
X-Received: by 2002:a05:6870:618e:b0:e5:c2f3:e009 with SMTP id a14-20020a056870618e00b000e5c2f3e009mr844104oah.10.1652385360625;
        Thu, 12 May 2022 12:56:00 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id e68-20020a9d2aca000000b006060322123bsm259970otb.11.2022.05.12.12.55.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 May 2022 12:55:59 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 1/7] hwmon: (as370-hwmon) Use HWMON_CHANNEL_INFO macro
Date:   Thu, 12 May 2022 12:55:50 -0700
Message-Id: <20220512195556.137741-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.35.1
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

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/as370-hwmon.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/hwmon/as370-hwmon.c b/drivers/hwmon/as370-hwmon.c
index 464244ba8d58..63b5b2d6e593 100644
--- a/drivers/hwmon/as370-hwmon.c
+++ b/drivers/hwmon/as370-hwmon.c
@@ -76,18 +76,8 @@ as370_hwmon_is_visible(const void *data, enum hwmon_sensor_types type,
 	}
 }
 
-static const u32 as370_hwmon_temp_config[] = {
-	HWMON_T_INPUT,
-	0
-};
-
-static const struct hwmon_channel_info as370_hwmon_temp = {
-	.type = hwmon_temp,
-	.config = as370_hwmon_temp_config,
-};
-
 static const struct hwmon_channel_info *as370_hwmon_info[] = {
-	&as370_hwmon_temp,
+	HWMON_CHANNEL_INFO(temp, HWMON_T_INPUT),
 	NULL
 };
 
-- 
2.35.1


Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 964EDC4332F
	for <linux-hwmon@archiver.kernel.org>; Thu, 12 May 2022 19:56:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358228AbiELT4W (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 12 May 2022 15:56:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358244AbiELT4I (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 12 May 2022 15:56:08 -0400
Received: from mail-oa1-x30.google.com (mail-oa1-x30.google.com [IPv6:2001:4860:4864:20::30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07D6B165BC
        for <linux-hwmon@vger.kernel.org>; Thu, 12 May 2022 12:56:07 -0700 (PDT)
Received: by mail-oa1-x30.google.com with SMTP id 586e51a60fabf-e5e433d66dso7991017fac.5
        for <linux-hwmon@vger.kernel.org>; Thu, 12 May 2022 12:56:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=m4jaZv1sZFD3YYDa2z5L2zXbgYH6xsnqLEaLXVHLkLY=;
        b=PUANveeiWwP6vpWCaTpTMltkrl/hjsr7mbAgwmO6letZZYFCFYoxii+FTa3njhUQSL
         HZSn15QNqfIfbE4uyonQY9HJRj5QmAgdSPZCNiYdr6nOKzVpgA86zS/SQB7AovoNtOyz
         xiIe8iRVGRmW4Ow7raLnPDyq1T7SYpv8adzVSqdFa/HJNlpYcMreynu5DFcwo6iVt6tA
         QhvsmqtM0H1hBKhLS58GGFo8lu1tozNcL2ohrhOlO1xS9wPvQIt2xUrxWLySOKhN7yql
         dUqgzPa6XjXFYODKdjOc1h2Vhhk5YrpFAmoXkNeZJR/o6Ta7XJDqFWSjo/5DeUjomYSs
         OxRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=m4jaZv1sZFD3YYDa2z5L2zXbgYH6xsnqLEaLXVHLkLY=;
        b=6Jicd8O0Mkz67OncF1JtUqLw2SSv8enHHRnthCc8T5rZgIT1sxl39CQiMguwWChxi7
         lCY6NN1uSEy+C7GPvRHh7+UGenvJk4V+NoFKgaAZRcwbZjfYr4eR1rfTJ94MMmEy5CRQ
         Gjk5i3ZbOLJvwdLrIaLbxb+0UyTOihafuex+iXileOK5p4Kk4uHWRuxOXiSQ33GgnyTT
         cyAVoQgqR4iblNOl6/SOmjPUh8rF3wLkh7Js7JNK7d8v29Io+wyP68gvdGea2AcHsBAu
         mb9b46QtZ50J5Q9ZtvmdPvNgeIQi1SdgomNb1Y48Qy41/+DcS5Wnx8Nzhui0kX9DSyUy
         4Mvg==
X-Gm-Message-State: AOAM5337BHyqnOUKa5Ciug4jutQ/z9HkCjhZih6dIS3Nt4phdQPIGhS4
        EM9MFzYlmd84TtWYdLFfuZrcXzc6AIlhZA==
X-Google-Smtp-Source: ABdhPJweM/6AGmxBJveyDP6H9HDZ+fTcG/FkyUHxPesSDiiLrAitYtPrqrho0WChNPF+JJkl5lbGsw==
X-Received: by 2002:a05:6870:a70e:b0:da:31c6:1d20 with SMTP id g14-20020a056870a70e00b000da31c61d20mr827210oam.86.1652385366155;
        Thu, 12 May 2022 12:56:06 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id b14-20020a056870160e00b000e686d13891sm146140oae.43.2022.05.12.12.56.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 May 2022 12:56:05 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Iwona Winiarska <iwona.winiarska@intel.com>
Subject: [PATCH 4/7] hwmon: (peci/cputemp) Use HWMON_CHANNEL_INFO macro
Date:   Thu, 12 May 2022 12:55:53 -0700
Message-Id: <20220512195556.137741-4-linux@roeck-us.net>
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

Cc: Iwona Winiarska <iwona.winiarska@intel.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/peci/cputemp.c | 38 +++++++++++++++---------------------
 1 file changed, 16 insertions(+), 22 deletions(-)

diff --git a/drivers/hwmon/peci/cputemp.c b/drivers/hwmon/peci/cputemp.c
index 12156328f5cf..57470fda5f6c 100644
--- a/drivers/hwmon/peci/cputemp.c
+++ b/drivers/hwmon/peci/cputemp.c
@@ -447,29 +447,23 @@ static const struct hwmon_ops peci_cputemp_ops = {
 	.read = cputemp_read,
 };
 
-static const u32 peci_cputemp_temp_channel_config[] = {
-	/* Die temperature */
-	HWMON_T_LABEL | HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_CRIT | HWMON_T_CRIT_HYST,
-	/* DTS margin */
-	HWMON_T_LABEL | HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_CRIT | HWMON_T_CRIT_HYST,
-	/* Tcontrol temperature */
-	HWMON_T_LABEL | HWMON_T_INPUT | HWMON_T_CRIT,
-	/* Tthrottle temperature */
-	HWMON_T_LABEL | HWMON_T_INPUT,
-	/* Tjmax temperature */
-	HWMON_T_LABEL | HWMON_T_INPUT,
-	/* Core temperature - for all core channels */
-	[channel_core ... CPUTEMP_CHANNEL_NUMS - 1] = HWMON_T_LABEL | HWMON_T_INPUT,
-	0
-};
-
-static const struct hwmon_channel_info peci_cputemp_temp_channel = {
-	.type = hwmon_temp,
-	.config = peci_cputemp_temp_channel_config,
-};
-
 static const struct hwmon_channel_info *peci_cputemp_info[] = {
-	&peci_cputemp_temp_channel,
+	HWMON_CHANNEL_INFO(temp,
+			   /* Die temperature */
+			   HWMON_T_LABEL | HWMON_T_INPUT | HWMON_T_MAX |
+			   HWMON_T_CRIT | HWMON_T_CRIT_HYST,
+			   /* DTS margin */
+			   HWMON_T_LABEL | HWMON_T_INPUT | HWMON_T_MAX |
+			   HWMON_T_CRIT | HWMON_T_CRIT_HYST,
+			   /* Tcontrol temperature */
+			   HWMON_T_LABEL | HWMON_T_INPUT | HWMON_T_CRIT,
+			   /* Tthrottle temperature */
+			   HWMON_T_LABEL | HWMON_T_INPUT,
+			   /* Tjmax temperature */
+			   HWMON_T_LABEL | HWMON_T_INPUT,
+			   /* Core temperature - for all core channels */
+			   [channel_core ... CPUTEMP_CHANNEL_NUMS - 1] =
+						HWMON_T_LABEL | HWMON_T_INPUT),
 	NULL
 };
 
-- 
2.35.1


Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C95E5C433F5
	for <linux-hwmon@archiver.kernel.org>; Thu, 12 May 2022 19:56:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358230AbiELT4Y (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 12 May 2022 15:56:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358247AbiELT4L (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 12 May 2022 15:56:11 -0400
Received: from mail-oa1-x2c.google.com (mail-oa1-x2c.google.com [IPv6:2001:4860:4864:20::2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60575140BC
        for <linux-hwmon@vger.kernel.org>; Thu, 12 May 2022 12:56:10 -0700 (PDT)
Received: by mail-oa1-x2c.google.com with SMTP id 586e51a60fabf-edf9ddb312so7973066fac.8
        for <linux-hwmon@vger.kernel.org>; Thu, 12 May 2022 12:56:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lrGx3pMFJSZbjzB8D4KbDqkq3EwlgJL/3V4Bwp1quSM=;
        b=IfSWOPdtRS4AhpluvDtsDImVuoTDSeuKSxDBeJT6IouN2f+Qi/CuUW58yJo6KIe3rT
         +0yC+eyEsXoJW1fB8RV6z/XmKIsX6PZQTHDR3WLdW/RuyJM3dSONJEYOzTuCaW+Wo2Iw
         ZsVHanj8t15W3/e/Nj0ViTjsx16P/bXRO5q8o+Qom6BDOjDZCfqotNGCVZtslHDaV0cl
         OcLn2n+14+1IYG4FfRpXU90BclinIAmtSzfsuEIJAXQq6rbd9mg9sMW4juuABKRKx0el
         1/M4/zIvGEZpb/D9cCoxlWfBiQiP9kmEMbN+gq1cyZ/dhy31qT48h+CZ6YiZ6L4ahnZd
         MtBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=lrGx3pMFJSZbjzB8D4KbDqkq3EwlgJL/3V4Bwp1quSM=;
        b=SdG7fAr0KlxCwpwavJ6tY1qf2++at/1qLU6VuJV6Y0cPRr9GST0lRnxJxkfhe/N3ib
         GGfmbQ5RxMM6f3fauW6rZFvtkaK2z5ZljitOKv0LGchg5XG1ouW6CWCwM2FH3HQnB1Iz
         OLPuAVhGqU/6Gf9sff/5w16LpqHrDHUGD83N5/zFzdUVOjzNG+KT4QpxBYOJI0Fk87Zo
         8Z63fQVYW2IQj6jTrZF4OVRe0iISnazZ+xmgccv6DjgszuPsgdyo88lxcPAJlO/YvJP5
         gkuA+Mo6kEm5RU8JOItQyu8T3N7MurLKYaWp2w8qWGNjrgAOvVppxdgeSyw45OyGVnPW
         l4+A==
X-Gm-Message-State: AOAM533L0cOIJL1EouQt+cY199Y6TVsx5MNSgvt5jdRex44dDntTbyp4
        CMkpjcNj/qxUCqSSw1TN62gGMkchMsSSeg==
X-Google-Smtp-Source: ABdhPJxLnF1icrPWUQBUzcjEsA1dzS9COHyztFHJnHcC+IRU45RmevEExjzcbpU97sCuyr1VsUGcdA==
X-Received: by 2002:a05:6870:3c1b:b0:ee:1585:7a58 with SMTP id gk27-20020a0568703c1b00b000ee15857a58mr6704266oab.110.1652385369815;
        Thu, 12 May 2022 12:56:09 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id o184-20020aca5ac1000000b00328abf1e309sm292425oib.23.2022.05.12.12.56.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 May 2022 12:56:09 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 6/7] hwmon: (pwm-fan) Use HWMON_CHANNEL_INFO macro
Date:   Thu, 12 May 2022 12:55:55 -0700
Message-Id: <20220512195556.137741-6-linux@roeck-us.net>
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

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/pwm-fan.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/hwmon/pwm-fan.c b/drivers/hwmon/pwm-fan.c
index f12b9a28a232..6c08551d8d14 100644
--- a/drivers/hwmon/pwm-fan.c
+++ b/drivers/hwmon/pwm-fan.c
@@ -49,16 +49,6 @@ struct pwm_fan_ctx {
 	struct hwmon_channel_info fan_channel;
 };
 
-static const u32 pwm_fan_channel_config_pwm[] = {
-	HWMON_PWM_INPUT,
-	0
-};
-
-static const struct hwmon_channel_info pwm_fan_channel_pwm = {
-	.type = hwmon_pwm,
-	.config = pwm_fan_channel_config_pwm,
-};
-
 /* This handler assumes self resetting edge triggered interrupt. */
 static irqreturn_t pulse_handler(int irq, void *dev_id)
 {
@@ -387,7 +377,7 @@ static int pwm_fan_probe(struct platform_device *pdev)
 	if (!channels)
 		return -ENOMEM;
 
-	channels[0] = &pwm_fan_channel_pwm;
+	channels[0] = HWMON_CHANNEL_INFO(pwm, HWMON_PWM_INPUT);
 
 	for (i = 0; i < ctx->tach_count; i++) {
 		struct pwm_fan_tach *tach = &ctx->tachs[i];
-- 
2.35.1


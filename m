Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEC29C2D0A3
	for <linux-hwmon@archiver.kernel.org>; Mon,  9 Nov 2020 15:20:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5D548206E3
	for <linux-hwmon@archiver.kernel.org>; Mon,  9 Nov 2020 15:20:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K0o8HY+a"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730294AbgKIPUi (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 9 Nov 2020 10:20:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729289AbgKIPUh (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 9 Nov 2020 10:20:37 -0500
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com [IPv6:2607:f8b0:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3F7BC0613CF
        for <linux-hwmon@vger.kernel.org>; Mon,  9 Nov 2020 07:20:37 -0800 (PST)
Received: by mail-ot1-x342.google.com with SMTP id i18so9273804ots.0
        for <linux-hwmon@vger.kernel.org>; Mon, 09 Nov 2020 07:20:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id;
        bh=zO4sBPXmd8DucByygLkPQQZQmmH8PuLBfLEWsBLzSAE=;
        b=K0o8HY+a4G64ikUfb06Jsxm7CtRUooAeYxKYiIvjrzk+SH+oAINqxV7LBGSKADoDss
         +Rig9DSp+SR/k424KJ6qgTnsm8fMJeou8k+gfRaS1wL5seSiJZbrjySTBE+72CIjHhPB
         jgp60LiOzg/I0GckdCFVXUxqFnZRTQpzgK5ItGxGAxM2MrX1zqhuStl30fGErry+6a6L
         6sIAZMwZU5mpWihb/GeucuvE6r0xB4ggWblKVOxHhNvvClOKQyU7rkq69kyMd2bwN6NL
         9vhOh6IU4fZgccGKCa4nb2tcpo+vUSeEZ2MBdrdz1d+xssuHXkGHewRhRZX35rG1AE32
         RImw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
        bh=zO4sBPXmd8DucByygLkPQQZQmmH8PuLBfLEWsBLzSAE=;
        b=N6WHeSk56mv7U8OWGNOHuM2XaLJoGB1FauARHsC53LHZ+4HdBHP3hDrVHLg7TQT499
         wMdNxf8kV4tUJ8Z0PIpBckGV//o2joHboGAXt4BvYw+nZ6CbnXEUu7mik216tMwt+U+T
         emMo4dzZS7+FmK13IA5afCeyvs6JW9bd46GgOUQDD6RKl6M39bXYY9LDkZsMPtBPOj3y
         T75zZLzrTY68uNf191ppatT8KV+N73k1oK4kMMInx8fTjGEVO0ZGUst8UOPK42HFsYQX
         KL4QWq7E1/QHpGce6ek+rf7DTo4+FiK0r07ict5Nm0A99V1EiCr1FYMdy5O/GSUAFtCE
         Qucg==
X-Gm-Message-State: AOAM533KX0GVtfeJyH2ylzuQBDKAkyn6cBXrH+O5yqIirX2/euesiRtl
        JdNJ+qyk4O0yZzN7uU/zvrz3Za0EQwU=
X-Google-Smtp-Source: ABdhPJw3j3rczrS2TeZRYz7BYCNc+Dbdy4uWK+kAWVrmP4cJUo9TmO2WYB1w0J+HLCoW57GhULJ1Aw==
X-Received: by 2002:a9d:6f13:: with SMTP id n19mr9941759otq.173.1604935237007;
        Mon, 09 Nov 2020 07:20:37 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 61sm2646974otc.9.2020.11.09.07.20.35
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Nov 2020 07:20:36 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH] hwmon: (adm1266) Fix link in documentation
Date:   Mon,  9 Nov 2020 07:20:32 -0800
Message-Id: <20201109152032.59720-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Links to documentation files need to include the '.rst' extension.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 Documentation/hwmon/adm1266.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/hwmon/adm1266.rst b/Documentation/hwmon/adm1266.rst
index 9257f8a48650..2b877011cfdf 100644
--- a/Documentation/hwmon/adm1266.rst
+++ b/Documentation/hwmon/adm1266.rst
@@ -20,7 +20,7 @@ ADM1266 is a sequencer that features voltage readback from 17 channels via an
 integrated 12 bit SAR ADC, accessed using a PMBus interface.
 
 The driver is a client driver to the core PMBus driver. Please see
-Documentation/hwmon/pmbus for details on PMBus client drivers.
+Documentation/hwmon/pmbus.rst for details on PMBus client drivers.
 
 
 Sysfs entries
-- 
2.17.1


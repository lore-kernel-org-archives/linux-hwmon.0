Return-Path: <SRS0=kNNy=AZ=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D48EDC433E3
	for <linux-hwmon@archiver.kernel.org>; Tue, 14 Jul 2020 21:40:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AD7C32064C
	for <linux-hwmon@archiver.kernel.org>; Tue, 14 Jul 2020 21:40:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UJp6pBV9"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727938AbgGNVkA (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 14 Jul 2020 17:40:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726722AbgGNVj7 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 14 Jul 2020 17:39:59 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13F94C061755
        for <linux-hwmon@vger.kernel.org>; Tue, 14 Jul 2020 14:39:59 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id j19so8319427pgm.11
        for <linux-hwmon@vger.kernel.org>; Tue, 14 Jul 2020 14:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id;
        bh=js2v5AvygjQNPEJR1ofsckud9k3rgY011qhgk3rKlJc=;
        b=UJp6pBV9LxOL+bGkXh9H/vQX3KyJMY8npsbH7owpSWcyDYf/z+R8EUS8kjngOg5Hrj
         lc+bFhTc+LeKWn55pbaysuCJDExgLHFVlQDvxkLLuq2Iqk0FTgUXtmQ7KMclrb0jYJMn
         r4+SoDPPGSa+pLKlIi9TyhWVWRXDirMdMzqGsurx+w/i1FrqgCIJx+D/mL6XtMJbWm6i
         SoBtuFZSh1Uaa909WNTX6dczMYZhgPYz4J5iXGSuXiIESZACTqnjTC5Xoiv1l3CPE1xv
         rzVsNZup2R20bku+uiEgp3FSNAG3pGopOvls0r0sTur6A5l8/vGnfSsjJnCj2uWPapHJ
         mr6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
        bh=js2v5AvygjQNPEJR1ofsckud9k3rgY011qhgk3rKlJc=;
        b=jf+a2KTHbbcww+eayekqwGpr0khbmzuURHeTh3hnRM4NYc4deFfldGcV+GQRJQGW10
         5WLi4tTb4qBcAQmG0A9Pnkk1KrFSeXz+sTmBvsUZAang9IUR6F6Lhaent90yDWYSXaPP
         xvkE0Q+Abzf4yRznaw6erJYwcjy98IsNK6dyUJY8M8eNCAyUXVQkYxmFRGNqHC219Tp6
         /l52LzmuywVOKR6amP9ftzPMKsCgOXn3U/uximbMFR5enXWb/DoAoXVzyfgvHx8tABuH
         bCWMkukbRSyIk+5kvmNzN5qiQapwoY+bSh47gA9bD70Du6gZcA6Cgz/8aQtoX8lCf203
         ZrgA==
X-Gm-Message-State: AOAM5326vwmozDaxib/l9a7jWvAgd1Nsv+beCyJ0lG7iIMp87Xxj9Juw
        Uvd07wwMM4/Vs3IvGbdZKsosDdMHB7A=
X-Google-Smtp-Source: ABdhPJyntz+COtwiLJ6UIzDIxqkDCbQNm26xk5yR0vfx9KFLaVjOdenCq/W262eto/o+B4h6bbLK4A==
X-Received: by 2002:a65:63c8:: with SMTP id n8mr4970144pgv.232.1594762798274;
        Tue, 14 Jul 2020 14:39:58 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id w9sm111120pfq.178.2020.07.14.14.39.57
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Jul 2020 14:39:57 -0700 (PDT)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Stefan Dietrich <roots@gmx.de>
Subject: [PATCH] hwmon: (nct6775) Accept PECI Calibration as temperature source for NCT6798D
Date:   Tue, 14 Jul 2020 14:39:55 -0700
Message-Id: <20200714213955.144512-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.17.1
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Stefan Dietrich reports invalid temperature source messages on Asus Formula
XII Z490.

nct6775 nct6775.656: Invalid temperature source 28 at index 0,
		source register 0x100, temp register 0x73

Debugging suggests that temperature source 28 reports the CPU temperature.
Let's assume that temperature sources 28 and 29 reflect "PECI Agent {0,1}
Calibration", similar to other chips of the series.

Reported-by: Stefan Dietrich <roots@gmx.de>
Cc: Stefan Dietrich <roots@gmx.de>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/nct6775.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/nct6775.c b/drivers/hwmon/nct6775.c
index e7e1ddc1d631..750b08713dee 100644
--- a/drivers/hwmon/nct6775.c
+++ b/drivers/hwmon/nct6775.c
@@ -786,13 +786,13 @@ static const char *const nct6798_temp_label[] = {
 	"Agent1 Dimm1",
 	"BYTE_TEMP0",
 	"BYTE_TEMP1",
-	"",
-	"",
+	"PECI Agent 0 Calibration",	/* undocumented */
+	"PECI Agent 1 Calibration",	/* undocumented */
 	"",
 	"Virtual_TEMP"
 };
 
-#define NCT6798_TEMP_MASK	0x8fff0ffe
+#define NCT6798_TEMP_MASK	0xbfff0ffe
 #define NCT6798_VIRT_TEMP_MASK	0x80000c00
 
 /* NCT6102D/NCT6106D specific data */
-- 
2.17.1


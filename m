Return-Path: <SRS0=xywD=XI=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5C34C49ED7
	for <linux-hwmon@archiver.kernel.org>; Fri, 13 Sep 2019 12:44:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B2E8F20830
	for <linux-hwmon@archiver.kernel.org>; Fri, 13 Sep 2019 12:44:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kfeq0vHJ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729983AbfIMMoT (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 13 Sep 2019 08:44:19 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:40909 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726771AbfIMMoT (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 13 Sep 2019 08:44:19 -0400
Received: by mail-pf1-f195.google.com with SMTP id x127so18002117pfb.7
        for <linux-hwmon@vger.kernel.org>; Fri, 13 Sep 2019 05:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id;
        bh=mobFanCDTyWxMSVW2G6RmCJSurxpUjrH02AideTmxmU=;
        b=kfeq0vHJHtWqJNF/Q3oTGfzEmPmUw+YGfUamzVAb6+hvwqUJh0srkMKNtYf3gF4TAu
         GSCkTC1XTkTOoytRixqERc8ccaLscbFLciH326UaSqDSnFqbkouL+FlQeFbsyulzjjcQ
         spnyb9tB4d0Bh9n74nBZQwtHIBT6Utu8bGq7rPrKbse3p43pYnLfczynpCnWJY7ULTeu
         jRwTbzze0pd0dwPHJYKmxluAeD1N+dYxDcLdoa4a/uxMeSFTVt9/nG7uzIDxF+RYVakB
         ICAbflyBKurOUIlI7JzA6EE18BEJYUUvzIN7vrv16ExMyVqAMBwzC0tvCzkuodC0k6M8
         XjNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
        bh=mobFanCDTyWxMSVW2G6RmCJSurxpUjrH02AideTmxmU=;
        b=HdlkWQqL+WlF2wBrC7XQH1PZHtjnEu+SWl02BRd+ky7Twk44BFb25HwcLg5A8omeAL
         OLxGl9+0bQ3uYlJFGcxSoafp+iWQFttmslKbe641YBlnrIMp1FuNaxC0SUSL3HZID6Fp
         7HF+TGN6TjwoMx8KAGDBEPfV/LfVAL5TyR+J0PGx6aNchiwkRUfgV8QAPKv+dE+3kgaG
         9h3BHaTjAzq1/zh/LyvUga1OPOvkiU0SZ4+5Z1KvjvoMuhv2GgKtOwTiWkt7iMQ9qDKs
         5A4+sjEuEpO8I019kOkCbhg9lbBvDViwR/npjKkxLGcAxVCUnT2gxd0PDN50OG7rEQZk
         gRDA==
X-Gm-Message-State: APjAAAWMJjlyxb5F20jcUwhPyVeL0/F/3ME9ZyykQmM7el73NCTyb5GH
        DPqEUHsn0FaqFaybIWjVtRI7/tvL
X-Google-Smtp-Source: APXvYqwj6a0dQDaaO1sZv6I0MTv4Na4bfL9T1h4QVN4yl4BQCdd/Og9VzM5rgDk+ghSZNHlj7YOvSg==
X-Received: by 2002:a63:4181:: with SMTP id o123mr8965578pga.164.1568378658372;
        Fri, 13 Sep 2019 05:44:18 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id z3sm2512427pjd.25.2019.09.13.05.44.16
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Sep 2019 05:44:17 -0700 (PDT)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH] hwmon: submitting-patches: Add note on comment style
Date:   Fri, 13 Sep 2019 05:44:15 -0700
Message-Id: <1568378655-18162-1-git-send-email-linux@roeck-us.net>
X-Mailer: git-send-email 2.7.4
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Ask for standard multi-line comments, and ask for consistent
comment style.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 Documentation/hwmon/submitting-patches.rst | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/hwmon/submitting-patches.rst b/Documentation/hwmon/submitting-patches.rst
index 6b73dba32b89..9a218ea996d8 100644
--- a/Documentation/hwmon/submitting-patches.rst
+++ b/Documentation/hwmon/submitting-patches.rst
@@ -20,6 +20,10 @@ increase the chances of your change being accepted.
   errors, no warnings, and few if any check messages. If there are any
   messages, please be prepared to explain.
 
+* Please use the standard multi-line comment style. Do not mix C and C++
+  style comments in a single driver (with the exception of the SPDX license
+  identifier).
+
 * If your patch generates checkpatch errors, warnings, or check messages,
   please refrain from explanations such as "I prefer that coding style".
   Keep in mind that each unnecessary message helps hiding a real problem,
-- 
2.7.4


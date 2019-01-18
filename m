Return-Path: <SRS0=ckkT=P2=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 218B9C5ACD3
	for <linux-hwmon@archiver.kernel.org>; Fri, 18 Jan 2019 17:15:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E947520850
	for <linux-hwmon@archiver.kernel.org>; Fri, 18 Jan 2019 17:15:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bm8VQSOO"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728568AbfARRPT (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 18 Jan 2019 12:15:19 -0500
Received: from mail-pl1-f195.google.com ([209.85.214.195]:43762 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728486AbfARRPT (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 18 Jan 2019 12:15:19 -0500
Received: by mail-pl1-f195.google.com with SMTP id gn14so6612738plb.10
        for <linux-hwmon@vger.kernel.org>; Fri, 18 Jan 2019 09:15:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Oko7yOmqDZizdV4eY/YfQIKj8NLt2W1Ck20EtAYFwhg=;
        b=Bm8VQSOOe/fXrKJPUYuJtQEgUy0zMhVY9zfdhJLxq9nbU3UbHQlGj9MTuSR3YAnIjB
         30oe1cNGravxv4QzbmVb+ucgJio3SNN2iyxbJ2dk2M1NMCSpHadHN2rv65sm52ZneXLm
         HQRsq/vYn9QxeJeFx+benIZxaPc2QVhQYjmaFwEJg/s5w7siQNXB0b5jTk6BRhCOP0Cz
         CkGby6NR43wlLVeydw3ssswtgFcwmUfpM6ibGH9Wpsn8lKuiROiEb3jD+PdGj6i5GgbO
         YbUO/aRnPN+nW5RWBUnk42soGl4U6pFuKw57/oC1Y+DvYl24kaSIOjz1fB1etDRRojD4
         fikA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=Oko7yOmqDZizdV4eY/YfQIKj8NLt2W1Ck20EtAYFwhg=;
        b=rnGX6dTyazGMKpp/r8tTYIQGGW5e1I9F3T5BjipXhN5v4kLvy2bDPDbzSpb9qmRbZs
         uDRyQdNgHDesN9pabd219QVtbxBCeL8CiwYYEFW7iGciC09ciu7nGhCCNuYVzEsc5o0j
         ea4daVWVJrQnBKEsIxagYlgen2kji60qlvcxazR9SCucrk3/noGKJq4vtTFU7doXzjIj
         V4oE2GnvXSvuTWdZrPIBf1YxYpNWGLZZAjfz/Ao0b5qZu+R0LPC7U3rqpvBTDd92q8+b
         aO59JSRAGX2n91jUUODB0DGwH9RkZik2nMhC/8BdjHz4w/Q2xstFzhk3pG0RQs1nOT4r
         IkDA==
X-Gm-Message-State: AJcUukdQ2RtWpYo5U2hap0jB+PpxcreKkNqx0RAmKX4MRd3MESrifqe3
        KSb0hA9sRSNGIClU9YHh9QtBVIgB
X-Google-Smtp-Source: ALg8bN6Kg1zKFARrwiI5DtMfTWmzPlgSY1Z5C88ZyyOZiRpUqPaj9WsNsnaw1LVBG2S/yZ5LxM6IFw==
X-Received: by 2002:a17:902:8346:: with SMTP id z6mr19976988pln.340.1547831718485;
        Fri, 18 Jan 2019 09:15:18 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 12sm5177519pgt.33.2019.01.18.09.15.17
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 18 Jan 2019 09:15:17 -0800 (PST)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 08/30] hwmon: (max6650) Use permission specific SENSOR[_DEVICE]_ATTR variants
Date:   Fri, 18 Jan 2019 09:14:38 -0800
Message-Id: <1547831700-15865-9-git-send-email-linux@roeck-us.net>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1547831700-15865-1-git-send-email-linux@roeck-us.net>
References: <1547831700-15865-1-git-send-email-linux@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Use SENSOR[_DEVICE]_ATTR[_2]_{RO,RW,WO} to simplify the source code,
to improve readbility, and to reduce the chance of inconsistencies.

Also replace any remaining S_<PERMS> in the driver with octal values.

The conversion was done automatically with coccinelle. The semantic patches
and the scripts used to generate this commit log are available at
https://github.com/groeck/coccinelle-patches/hwmon/.

This patch does not introduce functional changes. It was verified by
compiling the old and new files and comparing text and data sizes.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/max6650.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/max6650.c b/drivers/hwmon/max6650.c
index 4752a9ee9645..61135a2d0cff 100644
--- a/drivers/hwmon/max6650.c
+++ b/drivers/hwmon/max6650.c
@@ -52,9 +52,9 @@ static int prescaler;
 /* clock: The clock frequency of the chip (max6651 can be clocked externally) */
 static int clock = 254000;
 
-module_param(fan_voltage, int, S_IRUGO);
-module_param(prescaler, int, S_IRUGO);
-module_param(clock, int, S_IRUGO);
+module_param(fan_voltage, int, 0444);
+module_param(prescaler, int, 0444);
+module_param(clock, int, 0444);
 
 /*
  * MAX 6650/6651 registers
-- 
2.7.4


Return-Path: <SRS0=ckkT=P2=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2229EC5AC81
	for <linux-hwmon@archiver.kernel.org>; Fri, 18 Jan 2019 17:15:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E71B020850
	for <linux-hwmon@archiver.kernel.org>; Fri, 18 Jan 2019 17:15:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OO4z97+q"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728510AbfARRPu (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 18 Jan 2019 12:15:50 -0500
Received: from mail-pl1-f194.google.com ([209.85.214.194]:40883 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727986AbfARRPu (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 18 Jan 2019 12:15:50 -0500
Received: by mail-pl1-f194.google.com with SMTP id u18so6623123plq.7
        for <linux-hwmon@vger.kernel.org>; Fri, 18 Jan 2019 09:15:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=XZX29Wzo7qfE82E8Y04jtVlPT+GTG6Trs3Oy5lIy+U8=;
        b=OO4z97+qGNveVDgrMxeJ0i0OHmwUFodiSFioisHDDmlGtxzpbUn0P32yo/3AkYf1ev
         nWXrT6dKjB4RWg8HLLiMszBRwLBwiIU/FD1xNVPoz1ErPpnbyCfImpU6g2F7Co9pzkDP
         7MRGGFi3B3UDf1SxkZ4XiJGXm0xl3k3suIp+iNC4aPr5RSdvjup73QcVmFJMNiQQj7E/
         TOfxyERLYovG4VKgEQ+AZ4g9fHs4QSS5Re9GizwbX+5te+1WGj3II1TSDEigmSibViWY
         IZWYq7hKONUWZ0l9y3pCT+aOO7qNpBxxh8n9vcpfEjfLCHLf4Ig0K3B9W7BEAuqfvcU/
         SFJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=XZX29Wzo7qfE82E8Y04jtVlPT+GTG6Trs3Oy5lIy+U8=;
        b=EntlAiJPyNFlK6hLYuDeDpfqfI8Xxg52YTuSd/sQ5wsCYSDksChWPIgDKSUnwGZBhw
         LOCMgV/Oo9OSapmSFGt/xC+sOQyv8SUeKji3gsX3OCwuqNVZ4/wRWyjqDGBnfebbcFw2
         4pzpbFb94ctmgntBUInDgzhMRuCyMw6nCi28qvrt7qTcsZ+16xOy/RekmWN22IKCkyAY
         5WnANi2tp5XjdyF8oy2YnbTMFLfoid7vy/ewtjJJ8qDiHL47oLFts3dk6bUK2RukafRf
         wyTMJv9hRqebuTp+RU2fndwsv9xyN1lN2bL67p8osST6K5a2VoAICxjwTks9IeDO7iea
         4Ccg==
X-Gm-Message-State: AJcUukel8CuZocCAc8MS9TuUB4aL9fN4M6FFKFljFIew4DDAF8/rYF8I
        A8pI42f3qHTZmoJxtIz5kk0xvsqa
X-Google-Smtp-Source: ALg8bN7IBNEA+O9q5q0KTFbuD2On54p0c8ZBeDl3PmSRxVHH5fjzKwlV/Emifnb1YyZHzPuCK/qRLA==
X-Received: by 2002:a17:902:9a46:: with SMTP id x6mr2656046plv.94.1547831749537;
        Fri, 18 Jan 2019 09:15:49 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id t24sm9396120pfm.127.2019.01.18.09.15.48
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 18 Jan 2019 09:15:49 -0800 (PST)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 28/30] hwmon: (tmp421) Replace S_<PERMS> with octal values
Date:   Fri, 18 Jan 2019 09:14:58 -0800
Message-Id: <1547831700-15865-29-git-send-email-linux@roeck-us.net>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1547831700-15865-1-git-send-email-linux@roeck-us.net>
References: <1547831700-15865-1-git-send-email-linux@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Replace S_<PERMS> with octal values.

The conversion was done automatically with coccinelle. The semantic patches
and the scripts used to generate this commit log are available at
https://github.com/groeck/coccinelle-patches/hwmon/.

This patch does not introduce functional changes. It was verified by
compiling the old and new files and comparing text and data sizes.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/tmp421.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/tmp421.c b/drivers/hwmon/tmp421.c
index 7053be59ad2e..2732a71f3b39 100644
--- a/drivers/hwmon/tmp421.c
+++ b/drivers/hwmon/tmp421.c
@@ -187,9 +187,9 @@ static umode_t tmp421_is_visible(const void *data, enum hwmon_sensor_types type,
 	case hwmon_temp_fault:
 		if (channel == 0)
 			return 0;
-		return S_IRUGO;
+		return 0444;
 	case hwmon_temp_input:
-		return S_IRUGO;
+		return 0444;
 	default:
 		return 0;
 	}
-- 
2.7.4


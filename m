Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C02DC433EF
	for <linux-hwmon@archiver.kernel.org>; Tue, 11 Jan 2022 16:51:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240945AbiAKQva (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 11 Jan 2022 11:51:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238513AbiAKQva (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 11 Jan 2022 11:51:30 -0500
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com [IPv6:2607:f8b0:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3888AC06173F
        for <linux-hwmon@vger.kernel.org>; Tue, 11 Jan 2022 08:51:30 -0800 (PST)
Received: by mail-oi1-x235.google.com with SMTP id g205so1626568oif.5
        for <linux-hwmon@vger.kernel.org>; Tue, 11 Jan 2022 08:51:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1pWD9vt2kj9gfWlBLbMoDglgEwpaNcbHn5GL0JmnGdU=;
        b=ke/cWzN6ikATs/caL+jVr3jYrWQvPGWXZrp9D/fYJqpO65rRyC/6omYvGOR1pyLYGV
         QbjXRBR+To8WN6APu1eqE/qjcDmxbpXciKDy2ZLESk/s41+/VSBxKrNA4VlRrV9/JCbj
         wmaNqKTa0Mlngxc+sjXkseAvJ6SETxItNRoFnqAJpIXEYZtiqkwST3E0i2uO3WvDWqfM
         1eu93d4lBbQH7JWGhPvGD9LEkhP0isp/mc0zWElnSE/cNSc2Y/h0T4v9xLT7+yshFU2U
         rCXgmZwW+cTHHGndlsLFIiRKKv1KryqqWnPzbRYQYM+CSxxx3NhFts578MRvoHi+KbRW
         Kr0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=1pWD9vt2kj9gfWlBLbMoDglgEwpaNcbHn5GL0JmnGdU=;
        b=VhNZmo88uXXDnEsBCgrueqj1kVZ6Oaa7zEpfF20/mdEgRK5TYS4F1aUUkhhXrnXenQ
         f0v7QOq8M2t/t7RQFSas5ymAezvRgIo3r5fEqzMlDkILKRBngRDCyGE8+epY4+mrCW+R
         9nU9Hgw//cxuz2dD3T9HzJ/8I5I1FQFDgJ9yEz5VmMjNqHLxsahVc0YEGxG20zjVfz67
         Vu8JcxorwAh2Q5CoKjR4g3csNDkKW5SCl8dddq5+HyFq395PMNEjgoKMh8bTNx+9i8Kq
         yh071uQFTJFW7Vgygg0CaIQJc3RpeQEDQ2S+MyEr7J7sDhKJiFjRA+zDjNjoSGWKza00
         E0Iw==
X-Gm-Message-State: AOAM530lvAaj6YQ26XZ94yAMlISHRUZ+4scPKqFibZ4kLGoCE95xn7c5
        GC3lKDsU1sF5kMdokG1NeYP14tJiDK0=
X-Google-Smtp-Source: ABdhPJyicht/WGF8WZA5PFZKvk84zyDxv0fDVsg5Tl5IXMQcnt5btxQ4uAJiPqeIe0hTUwvHXMt3rA==
X-Received: by 2002:a05:6808:1a1e:: with SMTP id bk30mr2432359oib.26.1641919889325;
        Tue, 11 Jan 2022 08:51:29 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id f9sm2112231oto.56.2022.01.11.08.51.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jan 2022 08:51:28 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 4/6] hwmon: (lm90) Mark alert as broken for MAX6680
Date:   Tue, 11 Jan 2022 08:51:14 -0800
Message-Id: <20220111165116.1298459-5-linux@roeck-us.net>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220111165116.1298459-1-linux@roeck-us.net>
References: <20220111165116.1298459-1-linux@roeck-us.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Experiments with MAX6680 and MAX6681 show that the alert function of those
chips is broken, similar to other chips supported by the lm90 driver.
Mark it accordingly.

Fixes: 4667bcb8d8fc ("hwmon: (lm90) Introduce chip parameter structure")
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/lm90.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/lm90.c b/drivers/hwmon/lm90.c
index 280ae5f58187..06cb971c889b 100644
--- a/drivers/hwmon/lm90.c
+++ b/drivers/hwmon/lm90.c
@@ -419,7 +419,7 @@ static const struct lm90_params lm90_params[] = {
 	},
 	[max6680] = {
 		.flags = LM90_HAVE_OFFSET | LM90_HAVE_CRIT
-		  | LM90_HAVE_CRIT_ALRM_SWP,
+		  | LM90_HAVE_CRIT_ALRM_SWP | LM90_HAVE_BROKEN_ALERT,
 		.alert_alarms = 0x7c,
 		.max_convrate = 7,
 	},
-- 
2.33.0


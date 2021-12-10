Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F040C433FE
	for <linux-hwmon@archiver.kernel.org>; Fri, 10 Dec 2021 20:01:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242314AbhLJUFU (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 10 Dec 2021 15:05:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240266AbhLJUFT (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 10 Dec 2021 15:05:19 -0500
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com [IPv6:2607:f8b0:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64196C061746
        for <linux-hwmon@vger.kernel.org>; Fri, 10 Dec 2021 12:01:44 -0800 (PST)
Received: by mail-ot1-x329.google.com with SMTP id r10-20020a056830080a00b0055c8fd2cebdso10704839ots.6
        for <linux-hwmon@vger.kernel.org>; Fri, 10 Dec 2021 12:01:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=aQroFgpoqsZDK7VslPHctf2JgED3OthtRhCfFPKi1C8=;
        b=eOJquqTgZyXZwN+WGugyiKqNP5S3YUPUUhEWZmwBY6JEttnBulKJvqPX+wS8z7cyag
         JrRa7y7nDVS+8ORr6fVadqJJuHcD6OlVm7FknFa6bGt5tXevjVMCYZVb6vK5QQcD9T7O
         5ZEyzZzdV3JHpLwSCbpqAkcX9ZcGN5KGGylmuChUnGi3vL2pIYSYkl3LVbiQDNrhucdB
         jZ+9Taly1PJeU2d+cuNcckyi3Z4WinQIibDXv4uEAMWND+VA329p1iQB5bCHMI9xSkEd
         85647oxxHNH20kfLQzzcOvuZuChcKaKI6cs4I+AZhyCdvPf30V2aV/+upGwUOFK6FK7a
         t8RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=aQroFgpoqsZDK7VslPHctf2JgED3OthtRhCfFPKi1C8=;
        b=0H7rlNeuoQJfsfUw7JJ2CF+cjGuo8K53OhLHO/fXirtfDjDT3CYFdw04+UV2gEdagp
         ulW/z0aLLsdfuVVYKIW9syXdRlOTyxi/XwNRi4kAbEF+qc5kjvMrkaYHEVZ2UPFHrY5W
         vRJMO7+e3839/TBfOjh4Jg64E7TC+wt1C2JRmHa9yeY47sgzaXnzjBI4GWDr7uHj3Pv5
         9bJOwOMzgTMQ7/u441et7aToORLoq0aOKMS2hRc2Jv/xYd+dHIAz8BFe/WTlQwppSiqj
         J1utSQS4xQgaUMJ0A+W+pcHImn6lRN7K/e0EPFT7c5oUv0nNfSCK2gBxH/UHmcsZan2P
         Hk/w==
X-Gm-Message-State: AOAM532oE152hTp+CsiHe5XnRrAGsOhY9318u6SzCEiauB1VXhPOYs8t
        0fDuXFiOrqlQQKfL/mLcBcUgs4s6buQ=
X-Google-Smtp-Source: ABdhPJzarB+3eCti7OCkBefBFEPa7NkPl33a1Fj5tb0VkcRyGxWSm/WHaOX6IKkPO9LctEeXWzzlGg==
X-Received: by 2002:a05:6830:1154:: with SMTP id x20mr12907596otq.205.1639166503379;
        Fri, 10 Dec 2021 12:01:43 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id v12sm660577ote.9.2021.12.10.12.01.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Dec 2021 12:01:42 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH 2/5] hwmon: (lm90) Prevent integer overflow/underflow in hysteresis calculations
Date:   Fri, 10 Dec 2021 12:01:33 -0800
Message-Id: <20211210200136.1662127-3-linux@roeck-us.net>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211210200136.1662127-1-linux@roeck-us.net>
References: <20211210200136.1662127-1-linux@roeck-us.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Commit b50aa49638c7 ("hwmon: (lm90) Prevent integer underflows of
temperature calculations") addressed a number of underflow situations
when writing temperature limits. However, it missed one situation, seen
when an attempt is made to set the hysteresis value to MAX_LONG and the
critical temperature limit is negative.

Use clamp_val() when setting the hysteresis temperature to ensure that
the provided value can never overflow or underflow.

Fixes: b50aa49638c7 ("hwmon: (lm90) Prevent integer underflows of temperature calculations")
Cc: Dmitry Osipenko <digetx@gmail.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/lm90.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/lm90.c b/drivers/hwmon/lm90.c
index b05d73c4fbe2..72969ea83d82 100644
--- a/drivers/hwmon/lm90.c
+++ b/drivers/hwmon/lm90.c
@@ -1160,8 +1160,8 @@ static int lm90_set_temphyst(struct lm90_data *data, long val)
 	else
 		temp = temp_from_s8(data->temp8[LOCAL_CRIT]);
 
-	/* prevent integer underflow */
-	val = max(val, -128000l);
+	/* prevent integer overflow/underflow */
+	val = clamp_val(val, -128000l, 255000l);
 
 	data->temp_hyst = hyst_to_reg(temp - val);
 	err = i2c_smbus_write_byte_data(client, LM90_REG_W_TCRIT_HYST,
-- 
2.33.0


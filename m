Return-Path: <SRS0=IuZw=6V=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A804C38A24
	for <linux-hwmon@archiver.kernel.org>; Thu,  7 May 2020 17:44:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 46095215A4
	for <linux-hwmon@archiver.kernel.org>; Thu,  7 May 2020 17:44:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XFwcqLro"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726467AbgEGRoM (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 7 May 2020 13:44:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726393AbgEGRoL (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 7 May 2020 13:44:11 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD00FC05BD43
        for <linux-hwmon@vger.kernel.org>; Thu,  7 May 2020 10:44:11 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id t11so3137617pgg.2
        for <linux-hwmon@vger.kernel.org>; Thu, 07 May 2020 10:44:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id;
        bh=6+lthxw1RcC6O9714Ly8gtNuZI1rivcqg7mcqA94vPM=;
        b=XFwcqLroivgc4Bter9SF1NkmmDAfxV1CxqFlun5dlcAFS/DULGCQ2vKX9oAlXsxXfW
         QIrIXa63lmGCbaGJfaG4rT0VbMSLStLB9hA8XOj5LFUqKS6R0642xAJpnCodIJ87wBu/
         3ng/v+0KXuFsk2nR2GeIwgH1pDCFwDkhpD3XXE30+9Z3o4icaIc/MZEkyj1qbNm4GBbO
         dVPAwFMLBC5ktkfx4IxgF6lJ/7aRmQbDC8Swj8Fdzy5G/xB0kIqNEgzZHP1PKp59C6lo
         aDoTqdFDYihjNPoMWVLcH/jFJ3FZoH+fiAOAckGFCHRwwfFfdodRWeF5l+1Q/dcOY97/
         tcmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
        bh=6+lthxw1RcC6O9714Ly8gtNuZI1rivcqg7mcqA94vPM=;
        b=aDySMbNiNouVK7RvArO7JrhiqA7Ek+ZiLSDsxY/znEfES+t9XjV/CEY2k+5Xewkjlk
         445Wcnxqw1pJz6YieKh1ppQ7PB9mHjygjxsE26jsGo8PZzC8Oy1X9gjecdsekCg59WtD
         ZlzcGTnI8KJ+Qj+DmqD2I6stLjfeo3An45eTwNbDJ4zKxD7u5L1kl5XfoUxFFmB44/Wv
         SxadYCKUWbPfDRr7zUoF8zuL55m0pp3W1WAe9H2AZbP0DAQU3sL25IF6T+sfIyrfhoAy
         pyZ3ioztuUV9KOIvmnnsunOpUWBg+BsH5/s/tbg2rskwRNKycRb/i5zVXtRyT9Y60SXm
         JQug==
X-Gm-Message-State: AGi0PuZCgEATKaUcyrefnku4wlCbxK/8bU7GD3BnSOe2IqVZHcmPy3xb
        va8mcgYY5V6ijZSWbC49BoZmiCSn
X-Google-Smtp-Source: APiQypKveulk8Wi3napClfHoR6KRkwl5dj9nrvrvWfC9tiDSCzV6bxFG7j7QMBkyfJw31DN4lI94zg==
X-Received: by 2002:a62:1a0d:: with SMTP id a13mr14554261pfa.229.1588873450929;
        Thu, 07 May 2020 10:44:10 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 10sm5430631pfn.204.2020.05.07.10.44.09
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 07 May 2020 10:44:10 -0700 (PDT)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>, Alex Qiu <xqiu@google.com>
Subject: [PATCH] hwmon: (pmbus) Improve initialization of 'currpage' and 'currphase'
Date:   Thu,  7 May 2020 10:44:07 -0700
Message-Id: <20200507174407.36576-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.17.1
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

The 'currpage' and 'currphase' variables in struct pmbus_data are used by
the PMBus core to determine if the phase or page value has changed. Both
are initialized with values which are never expected to be set in the code
to ensure that the first page/phase write operation is actually performed.

This is not well explained and occasionally causes confusion. Change the
type of both variables to s16 and initialize with -1 to ensure that the
initial value never matches a requested value, and clarify that this
value means "unknown/unset".

Cc: Alex Qiu <xqiu@google.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/pmbus/pmbus_core.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index 8d321bf7d15b..a420877ba533 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -109,8 +109,8 @@ struct pmbus_data {
 	bool has_status_word;		/* device uses STATUS_WORD register */
 	int (*read_status)(struct i2c_client *client, int page);
 
-	u8 currpage;
-	u8 currphase;	/* current phase, 0xff for all */
+	s16 currpage;	/* current page, -1 for unknown/unset */
+	s16 currphase;	/* current phase, 0xff for all, -1 for unknown/unset */
 };
 
 struct pmbus_debugfs_entry {
@@ -2529,8 +2529,8 @@ int pmbus_do_probe(struct i2c_client *client, const struct i2c_device_id *id,
 	if (pdata)
 		data->flags = pdata->flags;
 	data->info = info;
-	data->currpage = 0xff;
-	data->currphase = 0xfe;
+	data->currpage = -1;
+	data->currphase = -1;
 
 	ret = pmbus_init_common(client, data, info);
 	if (ret < 0)
-- 
2.17.1


Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3B19C32771
	for <linux-hwmon@archiver.kernel.org>; Sat, 24 Sep 2022 10:12:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230226AbiIXKMR (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 24 Sep 2022 06:12:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229745AbiIXKMQ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 24 Sep 2022 06:12:16 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB9C6A99FA
        for <linux-hwmon@vger.kernel.org>; Sat, 24 Sep 2022 03:12:12 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 63302B8069F
        for <linux-hwmon@vger.kernel.org>; Sat, 24 Sep 2022 10:12:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55B90C433C1;
        Sat, 24 Sep 2022 10:12:09 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
        dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="nmFYFlia"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
        t=1664014327;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=Puv/Zyvma45AfszReAiixijYaZAb//QFI3NBsq5uxdI=;
        b=nmFYFlian8R2AH02uPH2V86OEXl/gpjQ3sp2UfG6TaD1uRlmCAT9zk+ItAI7s/hsImuNh6
        32dnKsSNuifliztyus1hRAsNB+zs+TtLG3FVeXIxrItEHFjPqRREaCx8NivmFcUWm87vjq
        mAacXKCoarBkROgo4U6WVdFTWoNHRG0=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 59692ea4 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
        Sat, 24 Sep 2022 10:12:07 +0000 (UTC)
From:   "Jason A. Donenfeld" <Jason@zx2c4.com>
To:     jdelvare@suse.com, linux@roeck-us.net, linux-hwmon@vger.kernel.org,
        davidm@egauge.net, navin@linumiz.com, keescook@chromium.org
Cc:     "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: [PATCH] hwmon: (sht4x) do not overflow clamping operation on 32-bit platforms
Date:   Sat, 24 Sep 2022 12:11:51 +0200
Message-Id: <20220924101151.4168414-1-Jason@zx2c4.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 32-bit platforms, long is 32 bits, so (long)UINT_MAX is less than
(long)SHT4X_MIN_POLL_INTERVAL, which means the clamping operation is
bogus. Fix this by clamping at INT_MAX, so that the upperbound is the
same on all platforms.

Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
---
 drivers/hwmon/sht4x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/sht4x.c b/drivers/hwmon/sht4x.c
index c19df3ade48e..13ac2d8f22c7 100644
--- a/drivers/hwmon/sht4x.c
+++ b/drivers/hwmon/sht4x.c
@@ -129,7 +129,7 @@ static int sht4x_read_values(struct sht4x_data *data)
 
 static ssize_t sht4x_interval_write(struct sht4x_data *data, long val)
 {
-	data->update_interval = clamp_val(val, SHT4X_MIN_POLL_INTERVAL, UINT_MAX);
+	data->update_interval = clamp_val(val, SHT4X_MIN_POLL_INTERVAL, INT_MAX);
 
 	return 0;
 }
-- 
2.37.3


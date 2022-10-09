Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14ED6C4321E
	for <linux-hwmon@archiver.kernel.org>; Sun,  9 Oct 2022 22:31:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232099AbiJIWbG (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 9 Oct 2022 18:31:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232364AbiJIW3S (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sun, 9 Oct 2022 18:29:18 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D10212BE27;
        Sun,  9 Oct 2022 15:19:09 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 28A0460CF1;
        Sun,  9 Oct 2022 22:18:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7168C433D6;
        Sun,  9 Oct 2022 22:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1665353910;
        bh=tGduk6NkYZkVJ9uF+cMq9hjrPTghwEt6RVgQ/f8m48Q=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Xx/rTYfXKO2UaCbYesyvIgDyT0qnlEd4KN/bDOXEwv0x1YkQzCeluaET/iQby05ZI
         5NB2I0IUcheIIs2GTZcBtdQayDKbArAqaqxLMPkvBwfNjHVwbQDFu+zsqWDKKiKudx
         70qwpT3jjJtmNi4EKC+F+WYaCjsb20XSVlMf8tFEOwPVWFFei8w2Hih2I3zUNMkdfl
         Tn7MBzN3sZUms3N3A/Yv1HnZKS1g2LMBw8KFiums2KG+ivNRvwN2NaQRsmHz22B8tc
         ucsOkx35sEXCsAuXNiA/9myeruYSC2wE3nTEH1ooqo+iJTONUVeoKXfL8ms28Vctgk
         CUC7C+SkI4TKw==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     "Jason A. Donenfeld" <Jason@zx2c4.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Sasha Levin <sashal@kernel.org>, jdelvare@suse.com,
        linux-hwmon@vger.kernel.org
Subject: [PATCH AUTOSEL 5.19 63/73] hwmon: (sht4x) do not overflow clamping operation on 32-bit platforms
Date:   Sun,  9 Oct 2022 18:14:41 -0400
Message-Id: <20221009221453.1216158-63-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221009221453.1216158-1-sashal@kernel.org>
References: <20221009221453.1216158-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: "Jason A. Donenfeld" <Jason@zx2c4.com>

[ Upstream commit f9c0cf8f26de367c58e48b02b1cdb9c377626e6f ]

On 32-bit platforms, long is 32 bits, so (long)UINT_MAX is less than
(long)SHT4X_MIN_POLL_INTERVAL, which means the clamping operation is
bogus. Fix this by clamping at INT_MAX, so that the upperbound is the
same on all platforms.

Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
Link: https://lore.kernel.org/r/20220924101151.4168414-1-Jason@zx2c4.com
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Sasha Levin <sashal@kernel.org>
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
2.35.1


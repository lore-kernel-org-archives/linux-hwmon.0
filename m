Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8737C433F5
	for <linux-hwmon@archiver.kernel.org>; Tue, 10 May 2022 15:48:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346490AbiEJPw3 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 10 May 2022 11:52:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346948AbiEJPvq (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 10 May 2022 11:51:46 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CA299C2CC;
        Tue, 10 May 2022 08:46:20 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id DE2EBB81DF9;
        Tue, 10 May 2022 15:46:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCD94C385C2;
        Tue, 10 May 2022 15:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1652197577;
        bh=k7NdOnPBJCcgtgOHqgdMJ6TXBvkuxMVH2PFiZnYqYvk=;
        h=From:To:Cc:Subject:Date:From;
        b=eJIPiDFzR9eZeLeJJ/LGwnY+Ja8pZwMMleHCKTXA7Z6lYn6r5jp+Bpk81pvhWR8p4
         L652Aoh51XD/d+aaWwP6ub7N7a/LtktWLBvddJjJNnmvBdGLkkFUJDhF/3W/TY75eb
         ZP74CnLnJp5wqTvF0vEz9OX56pxd1WcRMw+AgQs5ONgXEM0MAo6C50AYjlw10ecg1b
         vYxDzS5m4/AENos9HTSNW5MTSgXIfDPlQiWZjTkK46p8IzcjeXZraujmMAtNpxOc/l
         bzGaHjtlT/tZNoANCTygsWxaI7gOsYy2AOR9cL84gDo3tNfusWswt1knHCPO02tvlh
         DGtKhLtytpQow==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     "Ji-Ze Hong (Peter Hong)" <hpeter@gmail.com>,
        Ji-Ze Hong <hpeter+linux_kernel@gmail.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Sasha Levin <sashal@kernel.org>, jdelvare@suse.com,
        linux-hwmon@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 1/6] hwmon: (f71882fg) Fix negative temperature
Date:   Tue, 10 May 2022 11:46:09 -0400
Message-Id: <20220510154614.154187-1-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: "Ji-Ze Hong (Peter Hong)" <hpeter@gmail.com>

[ Upstream commit 4aaaaf0f279836f06d3b9d0ffeec7a1e1a04ceef ]

All temperature of Fintek superio hwmonitor that using 1-byte reg will use
2's complement.

In show_temp()
	temp = data->temp[nr] * 1000;

When data->temp[nr] read as 255, it indicate -1C, but this code will report
255C to userspace. It'll be ok when change to:
	temp = ((s8)data->temp[nr]) * 1000;

Signed-off-by: Ji-Ze Hong (Peter Hong) <hpeter+linux_kernel@gmail.com>
Link: https://lore.kernel.org/r/20220418090706.6339-1-hpeter+linux_kernel@gmail.com
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/hwmon/f71882fg.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/f71882fg.c b/drivers/hwmon/f71882fg.c
index ca54ce5c8e10..4010b61743f5 100644
--- a/drivers/hwmon/f71882fg.c
+++ b/drivers/hwmon/f71882fg.c
@@ -1590,8 +1590,9 @@ static ssize_t show_temp(struct device *dev, struct device_attribute *devattr,
 		temp *= 125;
 		if (sign)
 			temp -= 128000;
-	} else
-		temp = data->temp[nr] * 1000;
+	} else {
+		temp = ((s8)data->temp[nr]) * 1000;
+	}
 
 	return sprintf(buf, "%d\n", temp);
 }
-- 
2.35.1


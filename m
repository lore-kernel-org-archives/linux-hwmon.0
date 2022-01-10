Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4723C433F5
	for <linux-hwmon@archiver.kernel.org>; Mon, 10 Jan 2022 02:47:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232626AbiAJCrR (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 9 Jan 2022 21:47:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232664AbiAJCrR (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sun, 9 Jan 2022 21:47:17 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F7A7C06173F
        for <linux-hwmon@vger.kernel.org>; Sun,  9 Jan 2022 18:47:16 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id x6so39275692lfa.5
        for <linux-hwmon@vger.kernel.org>; Sun, 09 Jan 2022 18:47:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6rE5T+jyGq0W8GmjlZq61FOrwbAcFYy7/aG4tooVUqM=;
        b=bqvg/AZTFjF1V0j7YZni1/MrHIP6bZOLsPuwKfNhqji5+qakg3yZt80+x7Py8kaljd
         L6dCunZvjXchRkvm+pY+VuniETIcFFdZQjpvmYCpCP8aDlCu84XzI6fJNAOF8VG0N8DQ
         obIa1wEvn8rcUvQBBUG8jlPGj/ZCAJajojfY9wOsFKwWKwTioLgL9sAtB66NqhEAd+wf
         lfN+LPRxdt5DNYvU0cOOBq7saaBsSQXYpJ3kNmoCLE+Wf8tWROKXxIfdcPkaHmg7dsaI
         UpM16A8QYK3cyGnXiHUnZfaIf662cRQFquH5XVqgl0gbYy3dIZgNkEVb2LHj0pg+3X2Z
         Q1xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6rE5T+jyGq0W8GmjlZq61FOrwbAcFYy7/aG4tooVUqM=;
        b=Nk9FNvH2zPB6yI1l/qmXzMxejpmN7Aegnvth7P1spX8zKB/fa2YC9CwwCfPp9YY60r
         zhY64BKruJccRguo/sgzEQqdrfy7tvD/Ul/640SQGvwondpj6rWcBZuLL1fjGG0dG4D9
         GsBLe7hmhaR179pK8uDMFTtSegr8dBwGHz5w3Ht8ZsYnUW5HlegQOe9OckU3l6E7uxN+
         TBzhxER1Y50H0NHZor1Y65FBSvj4GpjFbcUGaud+3EpeXYqXYu+969kvJUxtqpavvblJ
         PXcJqdBfenmqpZcyCxQXaymp1YwcqRfu5zM9tGwQsF+MW8A/4ht+VA6URMG/6vrogKZA
         znyw==
X-Gm-Message-State: AOAM532HxxsbFVolcbPGymt3aqa8+IKYXCaozHU8zrOdT5+rOtFJrgFE
        s3saqUsdd6Cmz4fW4TbDD+MvH35FIKKmzg==
X-Google-Smtp-Source: ABdhPJzUyijdIV4Ta4YEDOBOx3vDmk8x+Qkz1ImDLzuCGKC1bUFlV35Nm+R4WOnQaYsIsH3mTkI78g==
X-Received: by 2002:a2e:3c06:: with SMTP id j6mr50770388lja.132.1641782834724;
        Sun, 09 Jan 2022 18:47:14 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id i18sm846965lfe.281.2022.01.09.18.47.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Jan 2022 18:47:14 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
Cc:     linux-hwmon@vger.kernel.org
Subject: [PATCH] hwmon: (nct6775) add PRIME B550-PLUS motherboard to whitelist
Date:   Mon, 10 Jan 2022 05:47:12 +0300
Message-Id: <20220110024712.753492-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Asus PRIME B550-PLUS motherboards have got an nct6775 chip. Its resource
range is covered by the \AMW0.SHWM OpRegion, so the chip is unusable
when using SIO. However ASUS WMI access works.

Add PRIME B550-PLUS to the list of motherboards using ASUS WMI to read
data.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/hwmon/nct6775.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hwmon/nct6775.c b/drivers/hwmon/nct6775.c
index fd3f91cb01c6..616728598b57 100644
--- a/drivers/hwmon/nct6775.c
+++ b/drivers/hwmon/nct6775.c
@@ -4988,6 +4988,7 @@ static const char * const asus_wmi_boards[] = {
 	"Pro WS X570-ACE",
 	"PRIME B360-PLUS",
 	"PRIME B460-PLUS",
+	"PRIME B550-PLUS",
 	"PRIME X570-PRO",
 	"ROG CROSSHAIR VIII DARK HERO",
 	"ROG CROSSHAIR VIII FORMULA",
-- 
2.34.1


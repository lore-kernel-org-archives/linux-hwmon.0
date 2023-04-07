Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4247BC77B61
	for <linux-hwmon@archiver.kernel.org>; Fri,  7 Apr 2023 15:02:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240627AbjDGPCr (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 7 Apr 2023 11:02:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231585AbjDGPCT (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Fri, 7 Apr 2023 11:02:19 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE985BB93
        for <linux-hwmon@vger.kernel.org>; Fri,  7 Apr 2023 08:01:35 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id lj25so8959794ejb.11
        for <linux-hwmon@vger.kernel.org>; Fri, 07 Apr 2023 08:01:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680879692;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AtGb16tBjxkovykHXXbCrUa53MVGjlTZMOjOseRt8rM=;
        b=r0F33I2XoabXfti3UwTtIZJxPHe2Efl5b/RxPNaY8dTHUCMZloxcxvsGAD9Rmv8gjC
         G123r4wSWerz2Kfcz1VW0xrr2MXFCf/xjIDyBnBXuvCSYd2poCZuVlEkpsXsi69a8l2R
         JnexK4UyDqYufuOyTgVV64bTbAqDpD6LHg4d/ybhZaZXT2KgFphFkcecImeFUKVRMPss
         Y6X1bW238dUm1pipBSZe6oB6Lvzpl8RmqBq6pvrFpuphJODN6iP2Q+6KIj35XgREfG1C
         rMS/W8Vv4ZlAkrXwqbh8XVn3JoPrAh71Nmeq+zdClumEGEJWvl68JvMECSUM9ZKQh8Yr
         PUYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680879692;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AtGb16tBjxkovykHXXbCrUa53MVGjlTZMOjOseRt8rM=;
        b=OxaNJpy8pIb1vt4OLhOh7sTd4N1jLmttMjpW+Z0w6uISHrCr6px8grZgG7dUDpz3At
         qecLi466tGtgrQLJ+mGTOto8eb7pJbNsKTfiDEzFBVe1JLzb56l6nwjZERplrw5vXLuo
         Ll3OeDU5c+cIp+Sr0+WWuS6t88rCNxJRCOEoW7Arb5W9Gv3Wc4WXFVOGfH9cHRNtXIln
         JW1xvrWSauvRw48tLyS53sxNXXVjIO4X5loR5qrwP6espR1lb3hhUAvY/lVD+Xlpr/Yx
         NJ7p1jWFMc8PXwunrYqUXmU8RzSF99I1iQnmFHC1qESvaNr339GVXzDF3NjOt3xQzXxV
         /h5g==
X-Gm-Message-State: AAQBX9dfJgIAAPTLRfHWtq/A10obp5CMvA69AvOiL++qh4PSLFjp+1gV
        IYiLuOD/twC/E9pKobxEMhS7ghEJMNmpTvKgbxY=
X-Google-Smtp-Source: AKy350YVhdN7mbXAUhtrSYyehX5rFsHMmqNBdy8d7pxXyw9M8G06EIdOKjXdxuUZpKm/pSzkcl3Fwg==
X-Received: by 2002:a17:906:19d0:b0:949:cb8f:2640 with SMTP id h16-20020a17090619d000b00949cb8f2640mr2531331ejd.65.1680879692060;
        Fri, 07 Apr 2023 08:01:32 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:b20f:8824:c926:8299])
        by smtp.gmail.com with ESMTPSA id gr12-20020a170906e2cc00b0092595899cfcsm2127024ejb.53.2023.04.07.08.01.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Apr 2023 08:01:31 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Alvaro Karsz <alvaro.karsz@solid-run.com>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>,
        virtualization@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
Subject: [PATCH] vdpa: solidrun: constify pointers to hwmon_channel_info
Date:   Fri,  7 Apr 2023 17:01:30 +0200
Message-Id: <20230407150130.79917-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Statically allocated array of pointed to hwmon_channel_info can be made
const for safety.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

This depends on hwmon core patch:
https://lore.kernel.org/all/20230406203103.3011503-2-krzysztof.kozlowski@linaro.org/

Therefore I propose this should also go via hwmon tree.

Cc: Jean Delvare <jdelvare@suse.com>
Cc: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
---
 drivers/vdpa/solidrun/snet_hwmon.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/vdpa/solidrun/snet_hwmon.c b/drivers/vdpa/solidrun/snet_hwmon.c
index e695e36ff753..65304354b34a 100644
--- a/drivers/vdpa/solidrun/snet_hwmon.c
+++ b/drivers/vdpa/solidrun/snet_hwmon.c
@@ -159,7 +159,7 @@ static const struct hwmon_ops snet_hwmon_ops = {
 	.read_string = snet_hwmon_read_string
 };
 
-static const struct hwmon_channel_info *snet_hwmon_info[] = {
+static const struct hwmon_channel_info * const snet_hwmon_info[] = {
 	HWMON_CHANNEL_INFO(temp, HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_CRIT | HWMON_T_LABEL,
 			   HWMON_T_INPUT | HWMON_T_CRIT | HWMON_T_LABEL),
 	HWMON_CHANNEL_INFO(power, HWMON_P_INPUT | HWMON_P_LABEL),
-- 
2.34.1


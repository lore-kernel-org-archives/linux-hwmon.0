Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1404BC04A94
	for <linux-hwmon@archiver.kernel.org>; Thu, 10 Aug 2023 09:32:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234902AbjHJJcH (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 10 Aug 2023 05:32:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234888AbjHJJcG (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 10 Aug 2023 05:32:06 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B60B51704
        for <linux-hwmon@vger.kernel.org>; Thu, 10 Aug 2023 02:32:04 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-99bdf08860dso387510866b.0
        for <linux-hwmon@vger.kernel.org>; Thu, 10 Aug 2023 02:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691659923; x=1692264723;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VkJrp3SblDfFtU8UBVulMVwaS++B4Gjz65+AhL9Je5g=;
        b=p5Co+QHcKXiDm16tv14B+MoVn/yRUUsXSvj3aaV5MWoDdZkAeZ7lDRgQFUqTPo0ZHp
         osWCAWtP37rTALTSqyLgoBS2i+xhwifE4yAduqGXfN6fwJmINcCeVZu0oya1vUwzgsH+
         yEBJIhV2FTneqtFf5ins4phhXALmafN3gN8jpVjrRV10D+K22ctPOVjwKdDugCCl4aaQ
         5jQVvS4aL6nAlqjC37R+BLsR5VcBjjee2BVq1ufcoBZ3rROeOyNPyCbUNKyRjRbwCYvB
         +pRECRzwP9DfSMbb8CpLqpYckjyyOPzCoOVA4KvLoFfWZIbdL+QJFp1Ski/oIQ/nn7DQ
         vlcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691659923; x=1692264723;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VkJrp3SblDfFtU8UBVulMVwaS++B4Gjz65+AhL9Je5g=;
        b=MpFKdYzAMJ6Df3U3IJjUWkebjHROm9nqA1tJfQlLWY9seaAFlUQDLYbQb9isAgfI8a
         4USAw/6DHvMHt9WIvflhQUgRFFw+9LRUqxhDz2St+GD+Rl6OHHbXrbK+mLQQLBD+tZEH
         NienONiXQZJf7vIxp8Rl6tg+DPmdO8AbK6R7d8cZ2l+KqV9K3FUHhuMJW6C1+UpuOtWV
         ARAShPKHrOmauaSBMoimA1vQ8IfSam9ot1qRGR1KLkM3cFqVhQ8oRj6jM0dV3JzDTVyB
         HZzTYH0v5ULWQDc6eWG5BtKiCu5R7g+vRCE9Av8NzjZqJAEu8jbZ931XhdQPmAySTjdl
         dLPw==
X-Gm-Message-State: AOJu0Ywi/bygJCKGPKQgI6tcTccgnCsMK88BtJX/NVj1AkVhq1xEo1YM
        SG+TLdFyeiKnb+Z08WlNvA/0ZA==
X-Google-Smtp-Source: AGHT+IHcbnF8r8JpNPNsUEVv2dwzGbMLuNzvjnp9AGlmJq39aZJBhXg5iIpgJf7cYShzcKhcWsMT0w==
X-Received: by 2002:a17:907:75f0:b0:99c:602b:6a6d with SMTP id jz16-20020a17090775f000b0099c602b6a6dmr1849004ejc.11.1691659923274;
        Thu, 10 Aug 2023 02:32:03 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.113])
        by smtp.gmail.com with ESMTPSA id e22-20020a170906249600b0098e2969ed44sm667642ejb.45.2023.08.10.02.32.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Aug 2023 02:32:02 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Eric Tremblay <etremblay@distech-controls.com>,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Andi Shyti <andi.shyti@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 02/15] hwmon: (ad7418) fix Wvoid-pointer-to-enum-cast warning
Date:   Thu, 10 Aug 2023 11:31:44 +0200
Message-Id: <20230810093157.94244-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230810093157.94244-1-krzysztof.kozlowski@linaro.org>
References: <20230810093157.94244-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

'type' is an enum, thus cast of pointer on 64-bit compile test with W=1
causes:

  ad7418.c:256:16: error: cast to smaller integer type 'enum chips' from 'const void *' [-Werror,-Wvoid-pointer-to-enum-cast]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/hwmon/ad7418.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/ad7418.c b/drivers/hwmon/ad7418.c
index bcea66eac82b..4829f83ff52e 100644
--- a/drivers/hwmon/ad7418.c
+++ b/drivers/hwmon/ad7418.c
@@ -253,7 +253,7 @@ static int ad7418_probe(struct i2c_client *client)
 	mutex_init(&data->lock);
 	data->client = client;
 	if (dev->of_node)
-		data->type = (enum chips)of_device_get_match_data(dev);
+		data->type = (uintptr_t)of_device_get_match_data(dev);
 	else
 		data->type = i2c_match_id(ad7418_id, client)->driver_data;
 
-- 
2.34.1


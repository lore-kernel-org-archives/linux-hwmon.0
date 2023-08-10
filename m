Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2FC4C001DB
	for <linux-hwmon@archiver.kernel.org>; Thu, 10 Aug 2023 09:32:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234818AbjHJJcG (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 10 Aug 2023 05:32:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234685AbjHJJcD (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 10 Aug 2023 05:32:03 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B9F7D1
        for <linux-hwmon@vger.kernel.org>; Thu, 10 Aug 2023 02:32:03 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-51e429e1eabso860619a12.2
        for <linux-hwmon@vger.kernel.org>; Thu, 10 Aug 2023 02:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691659922; x=1692264722;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=G5U9OyHZkyp7R4jd9YJoYn9GiUGEosxVPGm88bMk714=;
        b=bQOP8BXZG+PsoDvWGzlAR+7vcIHL3exlHy/6+jJ30kM54Q+zPdID7gdUx250QyqPeK
         q4sqlsR57/tpGFynpq191xhLWBZRpBA3j9mWyZUfyv5B7Fkmc/tz5d2SZsuIb5u6bm9u
         HS9oafI2uZh2lOqXQGd/SUynude/mUHXQypQKmDHY5mNL0q3LDvJr4bAxGMBQFa0jcUr
         QEA8mlYFH4Dcr5G1aOvmCmBf1s+PVfMmWhyOV7vXPmJ3L/uG7VjQgRRuUnkZpvUW+kTT
         8m8cr0SZ4MTQw8NqdBthJqCfuIq3Gp6V22yb0si0lBVwWSK80swEBUS4eG+h44+kprkM
         FUfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691659922; x=1692264722;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G5U9OyHZkyp7R4jd9YJoYn9GiUGEosxVPGm88bMk714=;
        b=kxaX6FI6FJ6iHBlpHRiAIr9d/lupN2yeqM2dbimWFDD3W5yEYD6GgCaEDYZl9JUQM9
         mUs9NyAlRLhelc64l4NANuQUm3a4zN1javUhGYU2c5hnARvhesENlnzVkKEIB1QWy6vf
         TmkNWAd6lB9DkKBNriQrQP7hfDs4e//RL6TGw6mWOPRQHfTyggIEHVSDs8FynnrTKxTW
         7bz9Fe4xTb8FBHEOSejQU26lADPcRU6jEjI5L/BaZTOPD2USDEedZe/kfwOUmfbIX1qS
         ykEZtHtTHOOfp3XBxiPfY7E7kDCbmmHHk1q3vLU45xVV5aFouacrncyUhAXvIL+5VsJ/
         lRug==
X-Gm-Message-State: AOJu0Yyz4aWw6YeihbF6bbJmeHnz4XwhMFXHguDW8F6uZAdBhSXMG9dL
        M1eHLI535ZlapLGGI8a/QcIsAgjfILd7bw4fc5XeSw==
X-Google-Smtp-Source: AGHT+IH5Bqb3CQOStHITFc5O637GOa9y/gEBFquykoaU1GHTJzvzdpEXHn6jEdIpCthu9D3UsaaZNA==
X-Received: by 2002:a17:906:31d2:b0:992:9a5e:3172 with SMTP id f18-20020a17090631d200b009929a5e3172mr1473028ejf.59.1691659921724;
        Thu, 10 Aug 2023 02:32:01 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.113])
        by smtp.gmail.com with ESMTPSA id e22-20020a170906249600b0098e2969ed44sm667642ejb.45.2023.08.10.02.32.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Aug 2023 02:32:01 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Eric Tremblay <etremblay@distech-controls.com>,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Andi Shyti <andi.shyti@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 01/15] hwmon: (adt7475) fix Wvoid-pointer-to-enum-cast warning
Date:   Thu, 10 Aug 2023 11:31:43 +0200
Message-Id: <20230810093157.94244-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

'chip' is an enum, thus cast of pointer on 64-bit compile test with W=1
causes:

  adt7475.c:1655:10: error: cast to smaller integer type 'enum chips' from 'const void *' [-Werror,-Wvoid-pointer-to-enum-cast]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/hwmon/adt7475.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/adt7475.c b/drivers/hwmon/adt7475.c
index 5363254644da..03acadc3a6cb 100644
--- a/drivers/hwmon/adt7475.c
+++ b/drivers/hwmon/adt7475.c
@@ -1652,7 +1652,7 @@ static int adt7475_probe(struct i2c_client *client)
 	i2c_set_clientdata(client, data);
 
 	if (client->dev.of_node)
-		chip = (enum chips)of_device_get_match_data(&client->dev);
+		chip = (uintptr_t)of_device_get_match_data(&client->dev);
 	else
 		chip = id->driver_data;
 
-- 
2.34.1


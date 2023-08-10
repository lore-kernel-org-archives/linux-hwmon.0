Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50C3DC001DB
	for <linux-hwmon@archiver.kernel.org>; Thu, 10 Aug 2023 09:32:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233488AbjHJJce (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 10 Aug 2023 05:32:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235013AbjHJJcW (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 10 Aug 2023 05:32:22 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E42BA270D
        for <linux-hwmon@vger.kernel.org>; Thu, 10 Aug 2023 02:32:14 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-99c0cb7285fso100793566b.0
        for <linux-hwmon@vger.kernel.org>; Thu, 10 Aug 2023 02:32:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691659933; x=1692264733;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+dbxV8jDAq1EoaltQOufp2JeN4AM753+j4I8xFIO03c=;
        b=a/mebC3vqRxsk9e1v8FTIdm9XQg37pDn0sUWwIs+DasXgmnpOUZv+E3+yNXDTn+nPT
         L+Wq4EwAy75iQwEklQsHlOG3xk3AiA4sUcOkZSKqmXUZkAZShG5sdt7Zv101JjG1db/N
         1cLYxwQxCRr6Cd8tLjMlZ+8rJjt7RR7Rr2z4sdaQkk2ETuoH08NC4x692Q9FWCbPzzzX
         vNdWLzrYiuH53yrtCwNk98laH1KrBxrl9vJ7ypNDG84iZZCV/p4g70r4/XwtlouqNKg5
         9UMhfcbs8VpwkySUumaVbxIRo2B7vbQF9SDoxHbKG+Dv8Sw7rCokfjPVS5orm6H6t7ZB
         3ppQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691659933; x=1692264733;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+dbxV8jDAq1EoaltQOufp2JeN4AM753+j4I8xFIO03c=;
        b=Mvq41Z8o4vximeOAkceTNyKjglzHvXI9JD5XE3L46ubt4ChUHss6Ji1efM4B/JfIh6
         pthCZJQtVOWkjxgLFy0baeyR9Sb9mTsomiX0sm7ug5bO192hcYA/7q0DyZCSMno0zCeE
         08ZzwgnXlX8MMFzP/3TMQ8ThkgFaH+sKnS3D8M53RFBntoyPOGJfR1eJYqrws3nu9yLv
         QBlLuzdwlKJM5h8e2MOh0nz2UlM36Q4Ywzp//3UHwAMl6/hXs9k+twK3Je5claqKjo9d
         dcXubkKbA0EVDAakGIyhIE7klZPgQudcfelJ3GYqs1LuKM4BhX7NeSBi89NbpThzV6i8
         D+eg==
X-Gm-Message-State: AOJu0YxoupHt1lb5e3VcmsWq9TEb7MokEkVJ5Cr09+qYDK4ZR9+q5/5P
        DRA5gy0NR8CG7j7F5iOS1u+61A==
X-Google-Smtp-Source: AGHT+IG2az+RAiVp2KExWlf7/p/MwX3vfYCfcUUu9zYOMvNF3+CzvFrw09GKvHuTr/qMJrKkoz3zGg==
X-Received: by 2002:a17:907:7622:b0:993:d536:3cb8 with SMTP id jy2-20020a170907762200b00993d5363cb8mr1496599ejc.2.1691659933435;
        Thu, 10 Aug 2023 02:32:13 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.113])
        by smtp.gmail.com with ESMTPSA id e22-20020a170906249600b0098e2969ed44sm667642ejb.45.2023.08.10.02.32.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Aug 2023 02:32:13 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Eric Tremblay <etremblay@distech-controls.com>,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Andi Shyti <andi.shyti@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 09/15] hwmon: (max20730) fix Wvoid-pointer-to-enum-cast warning
Date:   Thu, 10 Aug 2023 11:31:51 +0200
Message-Id: <20230810093157.94244-9-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230810093157.94244-1-krzysztof.kozlowski@linaro.org>
References: <20230810093157.94244-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

'chip_id' is an enum, thus cast of pointer on 64-bit compile test with W=1
causes:

  max20730.c:719:13: error: cast to smaller integer type 'enum chips' from 'const void *' [-Werror,-Wvoid-pointer-to-enum-cast]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/hwmon/pmbus/max20730.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/pmbus/max20730.c b/drivers/hwmon/pmbus/max20730.c
index 6df4c5b75bdc..d56ec24764fd 100644
--- a/drivers/hwmon/pmbus/max20730.c
+++ b/drivers/hwmon/pmbus/max20730.c
@@ -716,7 +716,7 @@ static int max20730_probe(struct i2c_client *client)
 	}
 
 	if (client->dev.of_node)
-		chip_id = (enum chips)of_device_get_match_data(dev);
+		chip_id = (uintptr_t)of_device_get_match_data(dev);
 	else
 		chip_id = i2c_match_id(max20730_id, client)->driver_data;
 
-- 
2.34.1


Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A021AC04A94
	for <linux-hwmon@archiver.kernel.org>; Thu, 10 Aug 2023 09:32:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234955AbjHJJcb (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 10 Aug 2023 05:32:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235000AbjHJJcS (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 10 Aug 2023 05:32:18 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BC8C211F
        for <linux-hwmon@vger.kernel.org>; Thu, 10 Aug 2023 02:32:13 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-99c3d3c3db9so102899566b.3
        for <linux-hwmon@vger.kernel.org>; Thu, 10 Aug 2023 02:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691659932; x=1692264732;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jg2L3vi9gBJrOjVe0teUOiDg+bStvnc1pYKHQaDLRLY=;
        b=GVmzERpBcBK1W096yDEP1r1Pl3nC0+Ij76R5rvLYqaXAJ0rvNj4BqF10hsYPhtJGNw
         RUtDvGR97yY8MaMbsZJqxIz1QLyg7lTle3/MmTDX9CTfc3dqkRZQ/0IInpPNJYNx27c8
         IRNggJ1wO49lYHL/FuZdWIuD3pBTm3jvKM67Gku4PrR6avZydiG8aWbzGJk/lQLAhszX
         Ug5JKKHuAAO/PCiC+kIiEmPP1VPtGYa0XYuFMVSa43ywnJ6Q1Fl+c7M1wYmLFLjLyPZ4
         WNCbwu8MMcSJJyov1C5EDj9tT0mX5MC887Kb0WNGXPrPl+sY3DXpZ8peS7PbqK8WyXsW
         EVzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691659932; x=1692264732;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jg2L3vi9gBJrOjVe0teUOiDg+bStvnc1pYKHQaDLRLY=;
        b=aLIN7QNCXjodN6wsMdOAFkhtYEJKeRrgOcQ2/sJJVuz08KB5XBSWv0opu/TcFO6PRc
         pFT+kNzd3Rqs7lo1iIMvrG8PSA3mWoPyfjV1+4yxIlfjjyrpeWfOo8e9f02U9IoEZ+dY
         7eEGI6RuyPG4eNPbC9nfLY+FuNkcnKrO8RmDmIdFmdanetZo6cfM9qp8Dah5Du0BP6AH
         DbHQibv9AisKSvnYyNbbWbhrq/26wHcx/b7XRHOsslOOuc7N5BR8D1X0fkDxgh0yNeSR
         t4yXqxqArFUWeOqovV3NGgyhGc20x4DJGspKm4Y2S6i6nwQzf/oQSA8aMZmxd829q1Co
         TeGQ==
X-Gm-Message-State: AOJu0Yyt5omYCh9hAN93cZb2/+kMgD31vhzjE+otDddrem89OFPP3W2I
        DPydpZ7d2uA2aeePLc/IUcKlLA==
X-Google-Smtp-Source: AGHT+IHQZHg+OP3fP402UEuzmAjOFlYBsh9Wcsht2n1PcPuSiQDN5MAAQTdnWn5XqV+qqH5El/nZpA==
X-Received: by 2002:a17:906:3114:b0:970:c9f:2db6 with SMTP id 20-20020a170906311400b009700c9f2db6mr1489439ejx.63.1691659932008;
        Thu, 10 Aug 2023 02:32:12 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.113])
        by smtp.gmail.com with ESMTPSA id e22-20020a170906249600b0098e2969ed44sm667642ejb.45.2023.08.10.02.32.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Aug 2023 02:32:11 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Eric Tremblay <etremblay@distech-controls.com>,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Andi Shyti <andi.shyti@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 08/15] hwmon: (lm90) fix Wvoid-pointer-to-enum-cast warning
Date:   Thu, 10 Aug 2023 11:31:50 +0200
Message-Id: <20230810093157.94244-8-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230810093157.94244-1-krzysztof.kozlowski@linaro.org>
References: <20230810093157.94244-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

'kind' is an enum, thus cast of pointer on 64-bit compile test with W=1
causes:

  lm90.c:2768:16: error: cast to smaller integer type 'enum chips' from 'const void *' [-Werror,-Wvoid-pointer-to-enum-cast]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/hwmon/lm90.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/lm90.c b/drivers/hwmon/lm90.c
index b25ae8b7ec90..e0d7454a301c 100644
--- a/drivers/hwmon/lm90.c
+++ b/drivers/hwmon/lm90.c
@@ -2765,7 +2765,7 @@ static int lm90_probe(struct i2c_client *client)
 
 	/* Set the device type */
 	if (client->dev.of_node)
-		data->kind = (enum chips)of_device_get_match_data(&client->dev);
+		data->kind = (uintptr_t)of_device_get_match_data(&client->dev);
 	else
 		data->kind = i2c_match_id(lm90_id, client)->driver_data;
 
-- 
2.34.1


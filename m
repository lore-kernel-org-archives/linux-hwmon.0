Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2818C001DE
	for <linux-hwmon@archiver.kernel.org>; Thu, 10 Aug 2023 09:33:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235020AbjHJJdC (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 10 Aug 2023 05:33:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235095AbjHJJck (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 10 Aug 2023 05:32:40 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69EC42D7F
        for <linux-hwmon@vger.kernel.org>; Thu, 10 Aug 2023 02:32:24 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-5230ac6dbc5so856122a12.3
        for <linux-hwmon@vger.kernel.org>; Thu, 10 Aug 2023 02:32:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691659942; x=1692264742;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v6MccEidlFrbXaCtF9Hw+fIgxQgYPx1+FTmvr+egMSA=;
        b=lTlsdFPpOrk1PmhRa6o5gwo+xV+lOGLPDHQbkbSIhi0hopb3J1UOxKupM8ToyN7hMu
         wtCr/r79A8SAFpahPqEp850BHLZSlvU+wEiCPtTLzISouSaGr92sZzsEyxlNH/RzO8PR
         ZoMpWaRZsWMpSyq9gAwyE8Db6yM/7hvA2eqWqrQef9Cr2lm3jsOAJ9KBkrR6yK7wIsd0
         AnUbcBGqetkpXrQR4I+DwtbpBN5NqnAsoSPH22pbFI+Nu8kNg5YRK5zu15TAqVbHe0yD
         eZaS6vS/cRUVQuSdQenjJC78wxeXvxOP6yftX99JkbCVms6olyipb87PGcyC6Iw6usq0
         PWbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691659942; x=1692264742;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v6MccEidlFrbXaCtF9Hw+fIgxQgYPx1+FTmvr+egMSA=;
        b=OPPcVkGWv4jJSGppUp1k0NNC6mgH6QiVAgWJTexvAOx9XTd+N5NOMzGhx5MlkPqCHS
         TN4XwbLBWtWEwj+AW5mQPi5AyxEys6hWBqPD3KVJvbMvQF+/xMYRwwo/dBWYsGyNSov0
         9gLEhoW3R/wvv6eSRbuWlcyDtlDANc2IBiiA2/ZhubDbbUTFGmxg7OlNCvweAbpLbqKC
         TguvBWUzSvh5U2FtLT1Hq29/lCsh50s2LX0qoTqCX3yfxKFKoJP0CaBSqq64lB67UoVQ
         Qs7psr+iIPER9eg0zEz9BreGtVOO1+1wv9LoQLmGNZYQcXiW+QL0Rqrbvifot09NnggT
         2MXw==
X-Gm-Message-State: AOJu0YxfFNnK8B+65s60zJp4qj8FjhYhONDYAMr2c97iQ3P9sd+GWe2j
        krufTU8zzX6RphZ9WOi0albGJw==
X-Google-Smtp-Source: AGHT+IHK3Y7A+Uts3kdFgZJKKp9q6BtdcjNZ3xC7gdcT/zFV6kGQdOs1+X9Qni3xs6DKHL9qoAzk3w==
X-Received: by 2002:a17:906:23e9:b0:999:80cf:82fd with SMTP id j9-20020a17090623e900b0099980cf82fdmr1508234ejg.18.1691659942681;
        Thu, 10 Aug 2023 02:32:22 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.113])
        by smtp.gmail.com with ESMTPSA id e22-20020a170906249600b0098e2969ed44sm667642ejb.45.2023.08.10.02.32.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Aug 2023 02:32:22 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Eric Tremblay <etremblay@distech-controls.com>,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Andi Shyti <andi.shyti@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 15/15] hwmon: (pmbus/ucd9200) fix Wvoid-pointer-to-enum-cast warning
Date:   Thu, 10 Aug 2023 11:31:57 +0200
Message-Id: <20230810093157.94244-15-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230810093157.94244-1-krzysztof.kozlowski@linaro.org>
References: <20230810093157.94244-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

'chip' is an enum, thus cast of pointer on 64-bit compile test with W=1
causes:

  ucd9200.c:106:10: error: cast to smaller integer type 'enum chips' from 'const void *' [-Werror,-Wvoid-pointer-to-enum-cast]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/hwmon/pmbus/ucd9200.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/pmbus/ucd9200.c b/drivers/hwmon/pmbus/ucd9200.c
index e4aad64b2d94..7920d1c06df0 100644
--- a/drivers/hwmon/pmbus/ucd9200.c
+++ b/drivers/hwmon/pmbus/ucd9200.c
@@ -103,7 +103,7 @@ static int ucd9200_probe(struct i2c_client *client)
 	}
 
 	if (client->dev.of_node)
-		chip = (enum chips)of_device_get_match_data(&client->dev);
+		chip = (uintptr_t)of_device_get_match_data(&client->dev);
 	else
 		chip = mid->driver_data;
 
-- 
2.34.1


Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3E9DC001DB
	for <linux-hwmon@archiver.kernel.org>; Thu, 10 Aug 2023 09:33:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235072AbjHJJd0 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 10 Aug 2023 05:33:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234936AbjHJJdP (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 10 Aug 2023 05:33:15 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B01F35BD
        for <linux-hwmon@vger.kernel.org>; Thu, 10 Aug 2023 02:32:46 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-99bdf08860dso387619566b.0
        for <linux-hwmon@vger.kernel.org>; Thu, 10 Aug 2023 02:32:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691659961; x=1692264761;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vAUHyC66z7nc30Y9XWG6TM6gua2fmA0h+hpvdL87oQA=;
        b=SIc9Vy+JFPOPoOiR2XBsSQpfLsN7tRlkgT0YcgkFinNzyV0DHaPo8a01y66TdJj/T7
         wFPHJJEghR2vWS32YRlegJiP1fVhXQpKMNA9ksQGlJsqsz8JyRIJ+kAnDVgbeWQSNXU9
         W6qD9VbuVObn/oSvhSD3aCBmkQDxF7U+XTZWJoMHYnaxn7Tngu+6W2TAzi1dU5r/ZlqJ
         xpIGYxbWW8WIwZ7hJ2+wH1RUnOHJEjLJDZ+j7gixkmFHvJ5b9tsNEDaLqyF9lXrhMKua
         C5FDRpX7T3Vrmbu/I1qTfuyP3mfhkrKjA+sHIFRoY9FPNmi0YUkJ0jewRQYIbJ7K7yK3
         lvdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691659961; x=1692264761;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vAUHyC66z7nc30Y9XWG6TM6gua2fmA0h+hpvdL87oQA=;
        b=GnRLlQEHeO6c9AOtdiEmlCNy4D0OUl3wxnG/9O2qDqwMRMKGPy2IwlCr0BUHJ5z9G1
         EUQCmKFar2P4M5nMS4kLRxfBrB4k1qv9E0jfxSiNoifQ61Wy7NWTwZ6UUZ69w03k8/Fi
         emGsaqjlhqB3Pj181dcXLbxb6fsOxUWttFsCIWEDE4FseLmAUmjawgpUAPBJ5EoLlI9h
         iURv6xhSCXaCE3i1W3yai+n8NS24tOzXsryJv6Ze6yggiPOK33e9cFaH+rLBnMeC3Zor
         ZRGDPDApBvHAZ0Lg8/cpxOIgIdRF6it6RMNVVOGYUWl4nPp/k3rTXJS2zF3Fb8qC3w/I
         qfPA==
X-Gm-Message-State: AOJu0YyCgLU6LH8W/2Ktqb8hUX2MrPxZUoF7HTn0iSFRvKWsmRQ0BIIu
        yYL4WbPOPod/5sSFgfq42qAv4WQLPVwwJR6tjQPiRg==
X-Google-Smtp-Source: AGHT+IGNF/Vs6kB3N3MLb9XZ6oEiQnvfsiUtTgSjQi50K9OZa3V1kADiyNra0EjkW7lomY6apVyZVw==
X-Received: by 2002:a17:907:3f9c:b0:992:103c:43fa with SMTP id hr28-20020a1709073f9c00b00992103c43famr1820080ejc.30.1691659941241;
        Thu, 10 Aug 2023 02:32:21 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.113])
        by smtp.gmail.com with ESMTPSA id e22-20020a170906249600b0098e2969ed44sm667642ejb.45.2023.08.10.02.32.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Aug 2023 02:32:20 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Eric Tremblay <etremblay@distech-controls.com>,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Andi Shyti <andi.shyti@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 14/15] hwmon: (pmbus/ucd9000) fix Wvoid-pointer-to-enum-cast warning
Date:   Thu, 10 Aug 2023 11:31:56 +0200
Message-Id: <20230810093157.94244-14-krzysztof.kozlowski@linaro.org>
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

  ucd9000.c:591:10: error: cast to smaller integer type 'enum chips' from 'const void *' [-Werror,-Wvoid-pointer-to-enum-cast]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/hwmon/pmbus/ucd9000.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/pmbus/ucd9000.c b/drivers/hwmon/pmbus/ucd9000.c
index b1d1d4214e69..8d9d422450e5 100644
--- a/drivers/hwmon/pmbus/ucd9000.c
+++ b/drivers/hwmon/pmbus/ucd9000.c
@@ -588,7 +588,7 @@ static int ucd9000_probe(struct i2c_client *client)
 	}
 
 	if (client->dev.of_node)
-		chip = (enum chips)of_device_get_match_data(&client->dev);
+		chip = (uintptr_t)of_device_get_match_data(&client->dev);
 	else
 		chip = mid->driver_data;
 
-- 
2.34.1


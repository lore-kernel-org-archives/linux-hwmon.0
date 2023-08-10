Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89372C001DB
	for <linux-hwmon@archiver.kernel.org>; Thu, 10 Aug 2023 09:32:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235098AbjHJJck (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 10 Aug 2023 05:32:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235018AbjHJJc1 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 10 Aug 2023 05:32:27 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4021B271C
        for <linux-hwmon@vger.kernel.org>; Thu, 10 Aug 2023 02:32:16 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-99bf9252eddso106244666b.3
        for <linux-hwmon@vger.kernel.org>; Thu, 10 Aug 2023 02:32:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691659935; x=1692264735;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SAPHq/2faQFRdHRdxnpVtoGa5K248Zp7jEovND6Y81A=;
        b=re6V8ITHblI7w78bDJokneVY+PC+NFRy1eshKTlyfmqn9rli8ias9Vn7D0SvNK65Uz
         brXj7fHpcGmZFEucTpyQBsvTuqXpDYoDx9xRMpdcx0IENOtbMJIxZCPCG5T7C3JtewOc
         PaLXDPMx26QqxGCNTAYPOqK8lNrj3zw2SQmZyckxf/yJzT1GzV/a3wnYaNNHT/IM7jSC
         LTv3ncISPr++B3Gc2eu2fGrUQwm5Jmxss0c66KYml/kI7k+xpfHWs0kn3x83JNGki+WP
         leyn0gxPs1EjKwxR2iruoCLdVcDJwz+LkXvmcxD7EY2E676VWL4nFPuXl6SjTBuCEjsw
         p8Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691659935; x=1692264735;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SAPHq/2faQFRdHRdxnpVtoGa5K248Zp7jEovND6Y81A=;
        b=bHgIEye1rf/OFDBSGulEBlSyAdvImbVefumpjt0OB7dNjPa49kvh95QlN40fdQwsgx
         LRyvgUNFlLqMlrSmnGnkiWbwtuZ7Nydbli+Z2EICz5FLz/vS9zyWEj+7EovHmmqroMUW
         p1FtF2BO8v0XreWMCLI0XE3FM+0yWXaKxg3OMdd1YPUWF+Nxhmv4DyY5ag4dTRg2/D06
         C+WOYaRd95ifvI73T9qTPl0Vy+uHc2iYmGVkcjYp+mfVZ5e0rHMNS6FjKYDkbbffCUC0
         iPBmKMcfkvtzEcTlCsCN2s+LsOoxgqFfZ2MpZxlEeXOTNeO5FJ1BDA+Mfxrl0PkXAZeo
         27eA==
X-Gm-Message-State: AOJu0YwA/vux+T6BEA7vwSo7kjFl0//8Jq6TNPCfzi2uo+TYy194nok6
        /a8r/K8r5sN3m0J7Ib+dwA+vFQ==
X-Google-Smtp-Source: AGHT+IGXKlrxS0Q5Rl796sQlZfblf5KJ4MGAJVbPagX2emYOTc9mrjotrYOgLX7CAsWEGntK68/M5Q==
X-Received: by 2002:a17:906:cc0b:b0:991:bf04:2047 with SMTP id ml11-20020a170906cc0b00b00991bf042047mr1667208ejb.14.1691659934804;
        Thu, 10 Aug 2023 02:32:14 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.113])
        by smtp.gmail.com with ESMTPSA id e22-20020a170906249600b0098e2969ed44sm667642ejb.45.2023.08.10.02.32.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Aug 2023 02:32:14 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Eric Tremblay <etremblay@distech-controls.com>,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Andi Shyti <andi.shyti@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 10/15] hwmon: (max6697) fix Wvoid-pointer-to-enum-cast warning
Date:   Thu, 10 Aug 2023 11:31:52 +0200
Message-Id: <20230810093157.94244-10-krzysztof.kozlowski@linaro.org>
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

  max6697.c:705:16: error: cast to smaller integer type 'enum chips' from 'const void *' [-Werror,-Wvoid-pointer-to-enum-cast]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/hwmon/max6697.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/max6697.c b/drivers/hwmon/max6697.c
index fe826fcf9990..7d10dd434f2e 100644
--- a/drivers/hwmon/max6697.c
+++ b/drivers/hwmon/max6697.c
@@ -702,7 +702,7 @@ static int max6697_probe(struct i2c_client *client)
 		return -ENOMEM;
 
 	if (client->dev.of_node)
-		data->type = (enum chips)of_device_get_match_data(&client->dev);
+		data->type = (uintptr_t)of_device_get_match_data(&client->dev);
 	else
 		data->type = i2c_match_id(max6697_id, client)->driver_data;
 	data->chip = &max6697_chip_data[data->type];
-- 
2.34.1


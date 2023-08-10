Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D6B3C04A94
	for <linux-hwmon@archiver.kernel.org>; Thu, 10 Aug 2023 09:32:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231955AbjHJJcp (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 10 Aug 2023 05:32:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235038AbjHJJca (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 10 Aug 2023 05:32:30 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD7322683
        for <linux-hwmon@vger.kernel.org>; Thu, 10 Aug 2023 02:32:17 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-52307552b03so854037a12.0
        for <linux-hwmon@vger.kernel.org>; Thu, 10 Aug 2023 02:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691659936; x=1692264736;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HRt2wJT+y3TcPVT+A8n4hP2Nq8Fhpdk7oZd4Q1inZS8=;
        b=CimkTe7EIvNJBUwMLxH+aTzxbqFP6lv/uxA+9GH0SaWlE6VMOI3BDO+mnyPkxP8DSO
         QJ5RWQBrL7bx0HyGIELlKcreQUrp7MyHxMmkDmytP0ptLOk5tysPCdwmXWMOZeNuUtQ1
         bszfqFWvQEZNlnt51BRCFZMPphC449Sa6t3f6SqUvVXaZSLzWTbtcH54jTxW9RuChd0R
         VT5aUN5eietsVi41g+uAkLlP346IIqBEZyUvmlrRm9EyDQr3EEqsq9AAHFGQ+R37X0f3
         PVQBNP0/TOoZBhdoQVQKlMFVKRsNMzOrDt0M5fux5Bfd/IgqIL5mZEZP9kYKsqoM3NDq
         7BXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691659936; x=1692264736;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HRt2wJT+y3TcPVT+A8n4hP2Nq8Fhpdk7oZd4Q1inZS8=;
        b=ZJ51W0iZ11ho98yZcmr9VIPfBV+V40TijVNXAW28vYevaE3RBZvhESyinbsLYWJ+NM
         fYWcYIUIxM7VyFBnIaxYeYhOF1Ln2kmhmneewEGVQtpF3ZmoBLoyHo1Vrb0qj7ZGBt/L
         34BuYtI+5VIMHQQqIYMjmAXeiPd4HBqfoC5uC8mGn4QADCwWOVhxuh/5X7KefPEovJhJ
         qHLhRlH6jyYJqbQ60Ig6E3IDRnjwz9Hv0ZZhP+34aMxo20HtAsKYB0Ub5euUUVbD00rN
         vme7t1PA6h5gB9uPORuQaRuP7aQ3aKsvjUi8TjeaMAzFZH4zPtfDRiG3a8j3Mn4rstSB
         WW5A==
X-Gm-Message-State: AOJu0YyPRKC8DTPpCc2XxOD1FjIEMuLH7B295wYa+tBw8K1iCnJZHpQf
        m01K6zF4CmpUd/r4aO0XVbWPMg==
X-Google-Smtp-Source: AGHT+IHCshYEE0RT24l9GzuoDNfzXKTEV3FWEYZU7QyVW43TzPBu8dIFF/ZkItjPZdyXdMal1SgZ/w==
X-Received: by 2002:a17:907:7841:b0:992:a836:a194 with SMTP id lb1-20020a170907784100b00992a836a194mr1624953ejc.59.1691659936251;
        Thu, 10 Aug 2023 02:32:16 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.113])
        by smtp.gmail.com with ESMTPSA id e22-20020a170906249600b0098e2969ed44sm667642ejb.45.2023.08.10.02.32.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Aug 2023 02:32:15 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Eric Tremblay <etremblay@distech-controls.com>,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Andi Shyti <andi.shyti@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 11/15] hwmon: (tmp513) fix Wvoid-pointer-to-enum-cast warning
Date:   Thu, 10 Aug 2023 11:31:53 +0200
Message-Id: <20230810093157.94244-11-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230810093157.94244-1-krzysztof.kozlowski@linaro.org>
References: <20230810093157.94244-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

'id' is an enum, thus cast of pointer on 64-bit compile test with W=1
causes:

  tmp513.c:724:14: error: cast to smaller integer type 'enum tmp51x_ids' from 'const void *' [-Werror,-Wvoid-pointer-to-enum-cast]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/hwmon/tmp513.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/tmp513.c b/drivers/hwmon/tmp513.c
index bff10f4b56e1..7db5d0fc24a4 100644
--- a/drivers/hwmon/tmp513.c
+++ b/drivers/hwmon/tmp513.c
@@ -721,7 +721,7 @@ static int tmp51x_probe(struct i2c_client *client)
 		return -ENOMEM;
 
 	if (client->dev.of_node)
-		data->id = (enum tmp51x_ids)device_get_match_data(&client->dev);
+		data->id = (uintptr_t)device_get_match_data(&client->dev);
 	else
 		data->id = i2c_match_id(tmp51x_id, client)->driver_data;
 
-- 
2.34.1


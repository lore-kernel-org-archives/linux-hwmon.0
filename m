Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5CB5C77B7C
	for <linux-hwmon@archiver.kernel.org>; Thu, 11 May 2023 20:26:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238753AbjEKU0m (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 11 May 2023 16:26:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238768AbjEKU0l (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 11 May 2023 16:26:41 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B003A49C8
        for <linux-hwmon@vger.kernel.org>; Thu, 11 May 2023 13:26:39 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2ad1ba5dff7so70863571fa.3
        for <linux-hwmon@vger.kernel.org>; Thu, 11 May 2023 13:26:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683836798; x=1686428798;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l7CaYNZ9U1JfvEfZ2+MRy2xuPf+XGR/kMYoYJuvYve8=;
        b=AZ06hka/ZA3m+nQp4geXab+p/ssHR13CJUZtggyhdFq0im0m32UdITEowQeAvMAWoR
         r9K+Mq6VKWko2SGQw0UJmImJ7zyJSN9eX2WCZ3LJMCICPTpvGEPhSdxU36S166N1FVCM
         4rU7UdhlMJGs2cXt6FanC9iBjdgTJw6tuBqZb7mGGqmjegO5bGBuJKOT5uq5rVz6xm8N
         DIxkqDwjGVS/s6HdCd0mHIppHuDjPZhwlxoZLSeITE0JD89VWwzs07N78t3knOhsuQns
         G2FMcIY/p8UQBghzKF3vkiCdFbzWLPIaGjeDioMjwqhzCMVC086ok5S7QzTVZsYtJKlO
         vsZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683836798; x=1686428798;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l7CaYNZ9U1JfvEfZ2+MRy2xuPf+XGR/kMYoYJuvYve8=;
        b=fHP/CtfJdgarxOg7x9Gddcsac8erPhOc7Do01ekM1DiJoGR4zSaYLCG8SZHcBG4sQx
         bFrO0PFGGj5dfSpeD5onER/V5X44WHgOGoKf4y89T9HKNmktEyDgaGhvUBmt998TcZt/
         VqcUtGjauL715XQrPaspWtDX+dW+6y1YgcfWInR4kqcb8i81nKLH63m8nvKNbEz9NZXt
         ntJd2H2BCT5+x0iLca1ds2eQYxILg7XptTAmkmabjZGsvG3wMChGqZ9DKC9KcuC78pw6
         KnBJafW0oxBZo894GZJMZsMA8OWCkHROLkj9njXyaSFNrzoL0McP/cKn1CXMDo3xpIlK
         FhOg==
X-Gm-Message-State: AC+VfDzkVj0GU0w4d/gffrf+zkloliXSqRSJJTRXv1AGIYVhQJBqUbb4
        fDHG7xPJ7VoP/zrcjtEogArMjlN/L6z2OIm1
X-Google-Smtp-Source: ACHHUZ59O8jj0jl+vKEN9dk1FuuVGwBj7w63nE9QepPhIBzfjCzL4Ss1bUdhS561kaj8jTM6N6mdxw==
X-Received: by 2002:a2e:8559:0:b0:2a8:ca1e:b63 with SMTP id u25-20020a2e8559000000b002a8ca1e0b63mr3384340ljj.36.1683836797700;
        Thu, 11 May 2023 13:26:37 -0700 (PDT)
Received: from kirillyatsenko.camlin.tech ([89.151.41.1])
        by smtp.gmail.com with ESMTPSA id f16-20020ac25090000000b004cb23904bd9sm1235959lfm.144.2023.05.11.13.26.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 May 2023 13:26:37 -0700 (PDT)
From:   Kirill Yatsenko <kiriyatsenko@gmail.com>
To:     linux-hwmon@vger.kernel.org
Cc:     linux@roeck-us.net, delvare@suse.com, jcdra1@gmail.com
Subject: [PATCH 2/3] hwmon: (aht10) Refactor aht10_read_values function
Date:   Thu, 11 May 2023 22:26:32 +0200
Message-Id: <20230511202633.299174-2-kiriyatsenko@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230511202633.299174-1-kiriyatsenko@gmail.com>
References: <20230511202633.299174-1-kiriyatsenko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Exit from the function immediately if the poll time hasn't yet expired.
Therefore the code after the check can be moved one tab to the left which
improves readability.

Signed-off-by: Kirill Yatsenko <kiriyatsenko@gmail.com>
---
 drivers/hwmon/aht10.c | 67 ++++++++++++++++++++++---------------------
 1 file changed, 35 insertions(+), 32 deletions(-)

diff --git a/drivers/hwmon/aht10.c b/drivers/hwmon/aht10.c
index 87a433e570e1..17ceec9aab66 100644
--- a/drivers/hwmon/aht10.c
+++ b/drivers/hwmon/aht10.c
@@ -135,40 +135,43 @@ static int aht10_read_values(struct aht10_data *data)
 	struct i2c_client *client = data->client;
 
 	mutex_lock(&data->lock);
-	if (aht10_polltime_expired(data)) {
-		res = i2c_master_send(client, cmd_meas, sizeof(cmd_meas));
-		if (res < 0) {
-			mutex_unlock(&data->lock);
+	if (!aht10_polltime_expired(data)) {
+		mutex_unlock(&data->lock);
+		return 0;
+	}
+
+	res = i2c_master_send(client, cmd_meas, sizeof(cmd_meas));
+	if (res < 0) {
+		mutex_unlock(&data->lock);
+		return res;
+	}
+
+	usleep_range(AHT10_MEAS_DELAY, AHT10_MEAS_DELAY + AHT10_DELAY_EXTRA);
+
+	res = i2c_master_recv(client, raw_data, AHT10_MEAS_SIZE);
+	if (res != AHT10_MEAS_SIZE) {
+		mutex_unlock(&data->lock);
+		if (res >= 0)
+			return -ENODATA;
+		else
 			return res;
-		}
-
-		usleep_range(AHT10_MEAS_DELAY,
-			     AHT10_MEAS_DELAY + AHT10_DELAY_EXTRA);
-
-		res = i2c_master_recv(client, raw_data, AHT10_MEAS_SIZE);
-		if (res != AHT10_MEAS_SIZE) {
-			mutex_unlock(&data->lock);
-			if (res >= 0)
-				return -ENODATA;
-			else
-				return res;
-		}
-
-		hum =   ((u32)raw_data[1] << 12u) |
-			((u32)raw_data[2] << 4u) |
-			((raw_data[3] & 0xF0u) >> 4u);
-
-		temp =  ((u32)(raw_data[3] & 0x0Fu) << 16u) |
-			((u32)raw_data[4] << 8u) |
-			raw_data[5];
-
-		temp = ((temp * 625) >> 15u) * 10;
-		hum = ((hum * 625) >> 16u) * 10;
-
-		data->temperature = (int)temp - 50000;
-		data->humidity = hum;
-		data->previous_poll_time = ktime_get_boottime();
 	}
+
+	hum =   ((u32)raw_data[1] << 12u) |
+		((u32)raw_data[2] << 4u) |
+		((raw_data[3] & 0xF0u) >> 4u);
+
+	temp =  ((u32)(raw_data[3] & 0x0Fu) << 16u) |
+		((u32)raw_data[4] << 8u) |
+		raw_data[5];
+
+	temp = ((temp * 625) >> 15u) * 10;
+	hum = ((hum * 625) >> 16u) * 10;
+
+	data->temperature = (int)temp - 50000;
+	data->humidity = hum;
+	data->previous_poll_time = ktime_get_boottime();
+
 	mutex_unlock(&data->lock);
 	return 0;
 }
-- 
2.25.1


Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23AF7568522
	for <linux-hwmon@vger.kernel.org>; Wed, 14 Oct 2026 17:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791999265; cv=none; b=IWdnHI6Y6MT5fv5zYuCUBudmqItg5F/cRhQTJ5nMCj37juGwNdsXk52RJ+1WKDLiPKdddYd8TdEZeGqFMx9ZUorYaYK5FB351XTf9xbZeZq+63LY+rpogZ9E06xCRlLNrmLzIOrH+0YER/CR+QfQ/iWHLc6AeT8J3KYrm0uMY6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791999265; c=relaxed/simple;
	bh=z7urtDBdxm99lFCE+IrmBbf2satzNbCf6gZ5stCabWs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DDQ5ZZFcWFOR7jV013AznWA7pFC7enfuqdGWFM+0FUo7hiM7PorTiCdwnju/Ff2+CIQSbB3UNyXpWhkyGtxvpsUIjOOADCngp2TBaCRzGsE2wLSPa+pxifexfLNWzlXyLetrYwb0vLtkfW1VL+WZizlLmf/ZLiF036v2M32K8zY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n+mSPPOW; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n+mSPPOW"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c2acc1e170cso744889766b.1
        for <linux-hwmon@vger.kernel.org>; Wed, 14 Oct 2026 10:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791999260; x=1792604060; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zB3tFoTWkKu7OlBV0vwBAsWhdfh9JAYvpIVESUkex6Q=;
        b=n+mSPPOWi1qQU+GrPzZcN323A0iXlLc3Appp2pqsMZkYtZjOFDZPCVz1MPSfMN4bGB
         mOCKZ3ifLI7qvzKoHAd2LlphItwsN7DWpRtpZHx0/D+JEyTwjAgByxi31tD/FmffO3Gj
         jPrZP1htEKxznoWMzKZv71ynJcfDLMXxCAOiT4OcQv2zaRLX0/keaGDLmPjAmfG9ZsDZ
         OU1qiGh12ZAo6JgpH6g57v3Jfa3q+y/XkSfhOa9Z8UmuZxbpRho7vs1wdwvs9ql591yD
         b0znAaMGMp0Lvok1qmK7hFK3pnBTGxNPMR5CQ2dlSU2pcRuv5BrIUWJ7tQTphJ2WfUx2
         Ab2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791999260; x=1792604060;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zB3tFoTWkKu7OlBV0vwBAsWhdfh9JAYvpIVESUkex6Q=;
        b=TlGzIDjuvMiTaRebtXcfwJF6vBrZxkSbfm9X1daF7wofBACKPQAZPVq5ISj6p8TW2i
         AZRynUrjcz2Hh/ZgkMHZMn9gOWzJaXTaqgTPCxCbVSRW4L39T72we1NrTQPzZ3ZVbi2k
         o4x499+INEvJUVp3brISJuWePB19fE1N06De0a4yBdE3lZM3a8EHjIiYK0/7lFW4hXgs
         KxJly/kTzwOjQQM0S5Zw4OpAx7ueHELWJtwQSLT0mYR7ByXsJPKFnSwYYPSEX6tpaBLZ
         XLYrMdF1IgD7R1GinAw2pKnfhUyx54oNSozlcB/DuTr71H5N43PMRTayo2yHtDZhw3tZ
         ClBw==
X-Gm-Message-State: AFq9FYIXyGc0bfpHoUW+rmGvZ/puS+1nTh3SnWjf1cVd6G8EnEysMXXv
	TApynwpvO49HGOnDhD6os9xQR0D88PVCYFbfEIDFJDfGK3BJDCIAt5rHYvi9STYl
X-Gm-Gg: AYBFou344LGjRXmSWVVWfzf+9YM3zJByOjaVAiXRxN7Fb94QZQe6wPxn3y6ySkFuarT
	+0iBex8VBA0BNooYc5Wn5iCeEPa+VWJDzLIjYYjask3Txvzl3fVUi6ycHZXVpqprW8BGnNBIgq7
	kyARV2fQRHVnZdR7V/CmMfMygun0HOVwFkMjd6T6f0DG6PP2+Ivn/HaP5Ghcfz3P5lo5lgRlpQl
	UJiOqWacd9dqy6HEUu50AdLpLm4SqJTRrXkuYgh/Cvh8nX6GsKfqCB1SlVgDNjROH3GNNhqDqrK
	LFLUMfTmreCN4y8vUWvKnv3FeUK56YX+ZV25/5eyfPJ6clxgYf1uA9o5TIdyeEFOvjaKAUgWsQi
	eAAnrS/UzeGLy6DYA3tPNKrZIu4ZLZmXs5FYN7jG6DMEej2d8xj51fvyL7UVHt74na34rq7caZ/
	BS7k3Scqb9Z/TZo04f1NXnvp4BCX07Dziqp0NbLm6l20nCbTFNhiAfzVK8VKQ6zBCoVT3XpsW65
	sc9XbsXACeOSFhS
X-Received: by 2002:a17:907:3f24:b0:c29:f5d8:9c78 with SMTP id a640c23a62f3a-c31aa097abdmr1559370766b.39.1791999259865;
        Wed, 14 Oct 2026 10:34:19 -0700 (PDT)
Received: from [127.0.1.1] ([2001:4bb8:148:f08c:65a8:f8e5:f310:5a71])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3ed963cecesm9381366b.21.2026.10.14.10.34.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 10:34:19 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Wed, 14 Oct 2026 19:34:03 +0200
Subject: [PATCH v3 04/11] hwmon: chipcap2: defer probe when IRQs are
 unavailable
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-chipcap2_locks-v3-4-27ebfc2c5b9e@gmail.com>
References: <20261014-chipcap2_locks-v3-0-27ebfc2c5b9e@gmail.com>
In-Reply-To: <20261014-chipcap2_locks-v3-0-27ebfc2c5b9e@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791999252; l=1698;
 i=javier.carrasco.cruz@gmail.com; s=20260924; h=from:subject:message-id;
 bh=z7urtDBdxm99lFCE+IrmBbf2satzNbCf6gZ5stCabWs=;
 b=6rpaxMq+xy2PmF4OpjhzxOQV5VfNBDG6M0qQPkYFw4UJnTFEfzbjhn0A5cDC7pUYiVh9Y4BOc
 oBqhPv/FbkuCn9d6dDugwIDnVespG7Xn0Q+3wiM+ivI+mapzzwhrsvV
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=VV+hcMoOj1Sx6xSiY0W/FZNAskGZe2AagSMVj0PsmAs=

This device can work with or without interrupts, but if they
are provided and still not available, but if -EPROBE_DEFER is read,
its value must be propagated to enable probe retries.

Fixes: 3af350929e75 ("hwmon: Add support for Amphenol ChipCap 2")
Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/hwmon/chipcap2.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/hwmon/chipcap2.c b/drivers/hwmon/chipcap2.c
index aec4adf98658..37dbf6a76fbc 100644
--- a/drivers/hwmon/chipcap2.c
+++ b/drivers/hwmon/chipcap2.c
@@ -636,6 +636,8 @@ static int cc2_request_ready_irq(struct cc2_data *data, struct device *dev)
 	int ret = 0;
 
 	data->irq_ready = fwnode_irq_get_byname(dev_fwnode(dev), "ready");
+	if (data->irq_ready == -EPROBE_DEFER)
+		return data->irq_ready;
 	if (data->irq_ready > 0) {
 		init_completion(&data->complete);
 		ret = devm_request_threaded_irq(dev, data->irq_ready, NULL,
@@ -653,6 +655,8 @@ static int cc2_request_alarm_irqs(struct cc2_data *data, struct device *dev)
 	int ret = 0;
 
 	data->irq_low = fwnode_irq_get_byname(dev_fwnode(dev), "low");
+	if (data->irq_low == -EPROBE_DEFER)
+		return data->irq_low;
 	if (data->irq_low > 0) {
 		ret = devm_request_threaded_irq(dev, data->irq_low, NULL,
 						cc2_low_interrupt,
@@ -666,6 +670,8 @@ static int cc2_request_alarm_irqs(struct cc2_data *data, struct device *dev)
 	}
 
 	data->irq_high = fwnode_irq_get_byname(dev_fwnode(dev), "high");
+	if (data->irq_high == -EPROBE_DEFER)
+		return data->irq_high;
 	if (data->irq_high > 0) {
 		ret = devm_request_threaded_irq(dev, data->irq_high, NULL,
 						cc2_high_interrupt,

-- 
2.43.0


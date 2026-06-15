Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A84463C37A3
	for <linux-hwmon@vger.kernel.org>; Mon, 15 Jun 2026 09:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781517112; cv=none; b=QC77evA3WmfC01MB9vgtN5InG1DsmDaGKecbczcRhFnhleXAe2YCYC371Bd6gVy+Rv/h7DXUAfQVXVFEoliOL2MquhDFqXlnz18onLm1Gg2th5958AhUmqgvjAZRfSQ3vX3XYzbpND4+4AnB7/cYYNKOsc4+YchtdMqoSu8tC5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781517112; c=relaxed/simple;
	bh=ETGqMavWeBiOQjMJHU7tbf74DHMQeX6TYULgpbT74aQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ju79BpAqUbW82B3pRFh786x8BLsKAAjm3g+I6GRlV0S9n9SN4gv15lRnsF8lWZmyPqO9fktwqVXnY/+1i1JN614NxXUGn6azpVstjTmZMWe+M+58gmb7NH2GgjcP5a+WyZ0ogGItTXfkmojG3Lq3NFvHoWQmZ3N3huYqnwPvrBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qF/9v95P; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qF/9v95P"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-842338c18e0so2229528b3a.1
        for <linux-hwmon@vger.kernel.org>; Mon, 15 Jun 2026 02:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781517110; x=1782121910; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2nFkIvMOfm7ZS9BgOncXs0eGFftuYADS8e8/xvDEWbQ=;
        b=qF/9v95PCZkp9OGYx6K5UIrsDVFGUX7W6ydkvm1UvKnle3Dj3gC24/aJOVF3//Nso2
         JpTjoGMetXJZDLA4SqfSWkTUQdQa8BIGCdx8TMkXAGwc5ECe7doSH+Bi/Vj23oofioGG
         UA/pRzCasotJVEKuK/NlGPARxgihV7ln2TGanMsz3xPbWpPsRtUkX2+lqlCP9DoKWvPF
         V/f0r574+ErnnZ56TTcFrlSTDcB/VOf7VOfDuiahaMZIYxpjGdf0ZmPzUcqfoElCQYhy
         XX1E0KzHxqh/iY8X1UlZEkG0cYrkdHhFqkLDS77qYgwTfG+yiH6G7arbDDG+qLJ+b5s0
         iyqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781517110; x=1782121910;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2nFkIvMOfm7ZS9BgOncXs0eGFftuYADS8e8/xvDEWbQ=;
        b=P5JG2fDKpb8wQOEV2NLMgHuwgr+xLv3m3bviqvukadVNbL3HMGsG5zbQTSqmqKrNk/
         ofEeounvaHJ1RBDkgxeNteQRsyrQDE2YPLePGspPOa4Z9dQp3XD4vvXiu6Ksb9GpFD+3
         D04xf/WcsF3ZrjPQKv8SXemwaF8J+n7qVEfk0QwEf4OWbW7B673NAjLEo6Axob3b4WfX
         5g6VoTT34f1Y8qLhpHRznk6EM+noP1fZBxFu60HyaaxOHl6URsYhXh3AScTVI6iGYxJy
         vFIT7ttieZyBZz/6EHDS6V8CLWqKhlKhQiOMgJ6+v37Vk3h5/chtOoNH5VSZOSIWiVvN
         zUng==
X-Gm-Message-State: AOJu0YyU809F2TqAeCgJsBgnD8+a23TtnEtapR2n2IQ6q6CMTGvWQVFG
	elhqZcJ0nQNn8+u75PGs2d3yzKeblG/wrygjV9eIlMHpeGbQmWxgpaga
X-Gm-Gg: Acq92OEnpU6bNJ9g/GGVrxZg+I3npzDSWYFnmMpbNHL60iOzgjOoiq0pS9fhVnmtAEP
	Mw0uV8z7jg9ttPqMMi3IQd2eQRCzogoS6aUWiwmL2BEkOFHAsblBHY02XMtSffS/KmdyfcTw++D
	3CUXt4sy23UjUloVQX0qqxw0tuyZ80EV3z9hVETmsUUMioPfiUlYKfvu12kPkCZVJO6L9S12vee
	VXPXYdSjsvjhVX3jnZkdkxQ0gJSnv8U51VkOMTJKeK+Bt6eNtGw3LuOjVZnX7lV8TqqsRvB6LK0
	ZyL+EAcJCWIkx40EvL7kax4kfKlqGwG/kmxX3Su1u1l8f7cE/+a+CsNle5QKqnpj2Ktw0qGZG+r
	s4GJes46v1NW90Od54Gm/iGrK7RyZCw/eTb1r+Ry6w3QCk4mHo5nwxS1ukkwadUTDeH42XL1s5/
	REaj5CD5Tz/Tv6pcc2QHxlLeEBKd9g+pQjDMCXd8+6zYMqDJQ43/V/0KWNKgjdeGjxu1jc/S7Fd
	UiQ
X-Received: by 2002:a05:6a00:2d21:b0:82c:d986:e917 with SMTP id d2e1a72fcca58-844e1a2f1aamr10649157b3a.22.1781517110139;
        Mon, 15 Jun 2026 02:51:50 -0700 (PDT)
Received: from [10.10.15.228] (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434afc8a5bsm9922207b3a.33.2026.06.15.02.51.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 02:51:49 -0700 (PDT)
From: Potin Lai <potin.lai.pt@gmail.com>
Date: Mon, 15 Jun 2026 17:49:17 +0800
Subject: [PATCH v3 2/2] hwmon: (pmbus/lm25066) add current limit
 configuration support
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260615-lm25066-cl-config-v3-2-decb4f5b0b77@gmail.com>
References: <20260615-lm25066-cl-config-v3-0-decb4f5b0b77@gmail.com>
In-Reply-To: <20260615-lm25066-cl-config-v3-0-decb4f5b0b77@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Zev Weiss <zev@bewilderbeest.net>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Cosmo Chou <cosmo.chou@quantatw.com>, 
 Mike Hsieh <Mike_Hsieh@quantatw.com>, Potin Lai <potin.lai@quantatw.com>, 
 Potin Lai <potin.lai.pt@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781517101; l=2406;
 i=potin.lai.pt@gmail.com; s=20260522; h=from:subject:message-id;
 bh=ETGqMavWeBiOQjMJHU7tbf74DHMQeX6TYULgpbT74aQ=;
 b=FDP8Iq+zzz6ciIgFDabF/U/Du5LF+SBtaWRalK/5mSepbgKtRAtuNmJE4X5s32CiALU4zYxsH
 8MQNDluhGpfCbBlW5N+Td4kCSm94Azf7GOtvVFKGcFJqGRc0qjPV04a
X-Developer-Key: i=potin.lai.pt@gmail.com; a=ed25519;
 pk=j3/nMxzz1ZPpp1revghyZ8IqOnwi6RWfuxXN2XrNMRE=

Add support for the 'ti,current-range' devicetree property to configure
the current limit via the DEVICE_SETUP (0xD9) register, overriding the
physical CL pin setting.

This configuration is supported on all chips in this driver (LM25066,
LM5064, LM5066, LM5066i) except LM25056.

The property values "low" and "high" map to:
- LM25066: low = 25 mV, high = 46 mV
- LM5064, LM5066, LM5066i: low = 26 mV, high = 50 mV

The Bit 4 mapping to High/Low current limit is handled dynamically on
probe because it is swapped for LM25066 compared to the other supported
chips.

Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
---
 drivers/hwmon/pmbus/lm25066.c | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/drivers/hwmon/pmbus/lm25066.c b/drivers/hwmon/pmbus/lm25066.c
index dd7275a67a0a..53d274033d66 100644
--- a/drivers/hwmon/pmbus/lm25066.c
+++ b/drivers/hwmon/pmbus/lm25066.c
@@ -34,6 +34,7 @@ enum chips { lm25056, lm25066, lm5064, lm5066, lm5066i };
 #define LM25066_READ_AVG_PIN		0xdf
 
 #define LM25066_DEV_SETUP_CL		BIT(4)	/* Current limit */
+#define LM25066_DEV_SETUP_CL_CFG	BIT(2)	/* Current limit configuration */
 
 #define LM25066_SAMPLES_FOR_AVG_MAX	4096
 
@@ -484,6 +485,42 @@ static int lm25066_probe(struct i2c_client *client)
 
 	data->id = (enum chips)(unsigned long)i2c_get_match_data(client);
 
+	if (data->id != lm25056) {
+		int config_new = config;
+		const char *cl_setting;
+		int ret;
+
+		if (!of_property_read_string(client->dev.of_node,
+					     "ti,current-range", &cl_setting)) {
+			config_new |= LM25066_DEV_SETUP_CL_CFG;
+			if (strcmp(cl_setting, "high") == 0) {
+				if (data->id == lm25066)
+					config_new |= LM25066_DEV_SETUP_CL;
+				else
+					config_new &= ~LM25066_DEV_SETUP_CL;
+			} else if (strcmp(cl_setting, "low") == 0) {
+				if (data->id == lm25066)
+					config_new &= ~LM25066_DEV_SETUP_CL;
+				else
+					config_new |= LM25066_DEV_SETUP_CL;
+			} else {
+				dev_err(&client->dev,
+					"invalid current-range setting: %s\n",
+					cl_setting);
+				return -EINVAL;
+			}
+		}
+
+		if (config_new != config) {
+			ret = i2c_smbus_write_byte_data(client,
+							LM25066_DEVICE_SETUP,
+							config_new);
+			if (ret < 0)
+				return ret;
+			config = config_new;
+		}
+	}
+
 	info = &data->info;
 
 	info->pages = 1;

-- 
2.52.0


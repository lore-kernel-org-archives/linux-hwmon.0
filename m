Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC96634167B
	for <linux-hwmon@vger.kernel.org>; Fri, 19 Jun 2026 10:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781865152; cv=none; b=rkMcLrO1g+4S0hnEE5+2Yzw7w1KgP3WJmpvyth2FLzzagDe6Mu8c2fdEXRV2W06SNRiBUvvBl5rxoW1BiC14yrZaj4R7e0demzAArcy2HYPEtIs03BLBaH5AiDKwpjWRG3RuwCtC+FniN8eQe0cFbWAnqYSGnPkR27RkLXnUZ+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781865152; c=relaxed/simple;
	bh=J9wG/Cdl4USpUhFpFKP+Y2sEB08duLUmbk9/DdufrWk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iCa0xIFYLJZ15gEy5YerZc5dtFdsoAms1+P5o0QiOvZbwWQQXgd09Tl180dPVUvE56XJyfPy3ZKzUz7sOn8NUyuDXmBVWqTlSDYgWDQMoHQjnQTLTmM/MVukfSyrehNyYrkMiBDTX5MkqAv+IMxxLOB3dfpiyfQLcwiE2qn1qn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hb/DZ/Ge; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hb/DZ/Ge"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6974a6e54dbso1151360a12.2
        for <linux-hwmon@vger.kernel.org>; Fri, 19 Jun 2026 03:32:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781865148; x=1782469948; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kRx+fJTG2hf5P891qLhNE1tVHHb4cammpBgE+COZX/Q=;
        b=Hb/DZ/GemoxwhjrP5vxR0ieXRg1tbzDJz1wViX+lXsK9YNqj1beTDyLM9ipcPhW+qG
         0gj7qL0I8hfVqY7zRe1YfT3oipSKsrtPQpTthWQMfewx9anXp2OGmXpNG8ZyD68etUPQ
         10E72Fr7HhoYaWAYWWXSS4N9dK6md0AkRT12Lug3KSpv0WqZQi1MAESYTyYPZz3pRNUN
         J7OJJLgzoegPYMcQ2MfWdQqMCKCQ/HbKZd6Csb2K7dOszvA5hCczmzxjgV/vfEaS3hGP
         ZzL1ULWCLMI0oJ40VslQJLMXXLpS67QnHD5G70nQS5F16RtJ8cfehIkjMQ/BYYON0lhN
         5Pvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781865148; x=1782469948;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kRx+fJTG2hf5P891qLhNE1tVHHb4cammpBgE+COZX/Q=;
        b=FHzChphzfAZDqR0aNovxy5vGnkCP56rYqfCvM6zyD25C7Cz7CFgpiH9qQEHIQKT8Fb
         by0mRf+qojGscYK1k8UpmvyseJDVDcsDR4uLfzZHx7lkvNsHx1WSwmvelK4Xg1DmTuv8
         C2Ji2DHu4u3l5ARtEd+fCNvebV5SPetOhyhnrUnqxtzjdXriSQGpgoo1soQlwgaLp4PS
         Km2Orybg54qYqBspdD9FyUyanvPYgDUa4mfVbnW7ZikAYD1gPUrBRAJyW2jmVfmrnUJs
         BSsdHVwzbuoOwrAetbi7l+Yi1pqEMMTfm3e4UnkA2ZMBdHFE+7eia5WY5FqN4iUgwlzh
         Xxyg==
X-Gm-Message-State: AOJu0YwJ+BF3Vgl2wjP1V1P3Kv30xmUY+1Icwt+vT5J5PUc+oM98OwoQ
	Iv/LHjc4S+WW+uk86d0QRId2PokxZue0QLAqZWz+36ZZoIbM4PKh9HaS
X-Gm-Gg: AfdE7cka1+Qkoii9kwVSEj9SzA78fR/QdFOk8Ey/egKGBfpwbuh9Pu0Xj9TwRqEku+3
	pRwpWK++DQ91+ZK1bP2BTxx9+p7oZHMf0jPaDfXCLKTDjAY7t1oHAiBvzXnTJrb7ikFni6R7ZK9
	ABD0wIoufWkjt1ZfkEucln7k22KioaFvk/EeSGvYNwT3EvBgKNDcij+xmJztmncm3VRP/J9++cp
	1dxHnjgfRj0HugVzELHYbfxrHkHZY7Udv9P0aDF5977pnXCpXzkJTwz4qPk+EQfC2jsf/4kZKnI
	AX93zhleWoFNECbbBQWXxiNPgTxWyNQr7L8V+n23wJnY4Eb7v9V0hOrkpQyyI2yxrjuDSNjUw2+
	qoEExAh/7MgT3cqmU0a2yoqWjdXrpW12NTqEXdqrWn7SpEnNN4Sg7DSPzrBTER3ySnaWAxCG5Ce
	UITb/AbBFrqSAESFB7Sse/f/BFJ5b2uxg6QA==
X-Received: by 2002:a17:907:a0a:b0:bd9:20b:5117 with SMTP id a640c23a62f3a-c097cccb107mr151829666b.41.1781865147946;
        Fri, 19 Jun 2026 03:32:27 -0700 (PDT)
Received: from xeon ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0a8490cd59sm76702466b.16.2026.06.19.03.32.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2026 03:32:27 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] hwmon: (emc1403) Add regulator support
Date: Fri, 19 Jun 2026 13:31:53 +0300
Message-ID: <20260619103153.216444-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260619103153.216444-1-clamor95@gmail.com>
References: <20260619103153.216444-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for VDD power supply for this sensor. It is required on some
devices for the sensor to start up and work properly.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/hwmon/emc1403.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/hwmon/emc1403.c b/drivers/hwmon/emc1403.c
index ef1ccb40ed6c..d14bd90ce424 100644
--- a/drivers/hwmon/emc1403.c
+++ b/drivers/hwmon/emc1403.c
@@ -19,6 +19,7 @@
 #include <linux/mod_devicetable.h>
 #include <linux/sysfs.h>
 #include <linux/regmap.h>
+#include <linux/regulator/consumer.h>
 #include <linux/util_macros.h>
 
 #define THERMAL_PID_REG		0xfd
@@ -660,6 +661,12 @@ static int emc1403_probe(struct i2c_client *client)
 {
 	struct thermal_data *data;
 	struct device *hwmon_dev;
+	int ret;
+
+	ret = devm_regulator_get_enable(&client->dev, "vdd");
+	if (ret)
+		return dev_err_probe(&client->dev, ret,
+				     "Failed to enable regulator\n");
 
 	data = devm_kzalloc(&client->dev, sizeof(struct thermal_data),
 			    GFP_KERNEL);
-- 
2.53.0


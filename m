Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03ECE1A9F97
	for <linux-hwmon@vger.kernel.org>; Sat, 31 Jan 2026 15:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769872854; cv=none; b=lmw81HJbOF4KR/mvUdSFz5H8ZFVT4z2idynqRZ8fttVgP0CYJ2+KoIQ1cBZnPsLaJNvlndJw6/xv1fKSPnTuqkNQebFKOun/nLHmXjSLd8eATd0TRwzpJEaL3EgF14svpWXBE7WccqnxEMdDgZMdr3QPYLdHn3vdoxnr/iWIdCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769872854; c=relaxed/simple;
	bh=brd6QuE1xWxdj4Q+YWIR1nKdLeB/JLJMfiMXXwzu/Ao=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=F72ijhM8XXUMzvn78be5wW4LrgWjFdLAJR4AubspL65Xlnd2knEYdpO23duGEECSJfEJqOs1BHgg+VX8Z3JbaCOoKjBqoV9CsCB8ylGQOICK1Hj3WU10nomwmTOWfSco4hdhUzCD+ZVIbZ5EUhJ+8CCMOZCv+ykbB9kYImpPb3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a5a7VR7U; arc=none smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a5a7VR7U"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-2b704f08e73so1702690eec.1
        for <linux-hwmon@vger.kernel.org>; Sat, 31 Jan 2026 07:20:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769872852; x=1770477652; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=Wxdrp85hjXkAHWJHqthT+j6zlkIijuaGbBL2ELUE194=;
        b=a5a7VR7UB+5T/rZ3mctC6CXGpV0wp0h3qAVK0x+S+T+iyOEhKXeRbEykoC8wpwKKeN
         z1erQ3BjC02c4WEbGmJ5rG5V7G0q4L93XgURqgg/c+r1uifky/OdMaBSD+yyzd/JFM55
         ClT8v5Hwh75uoyyM4ZrHXxX9jffTvdFYDgQWC9kXuVwJFY2K7x7J2YvD+TzBvUvGHnXX
         tRF8c7aRlOOKcypeEUvRDF3HTUKswR0L24t/5SI9FPXqCuoQu6qtUeVRNYnEt2d9WLsq
         dv98s30LbVdLUgqU9Yqh/+wwiiAkGH5PYSfFZxAd8CB1HJ331MeVSo8PufwO6GF0AiMs
         Oi/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769872852; x=1770477652;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wxdrp85hjXkAHWJHqthT+j6zlkIijuaGbBL2ELUE194=;
        b=cdR22EzfZSRbYcNuxQfg465PMrJt9WdB8s2u5wajVHyuPO6vmkecLPWEhAE7yJ0+gN
         F5NaChq5Wiat/3x9u1eEDJOoI3TfekMB4C/biUQPIfeafC8Opzp5U3NItgp7/VP3vtd7
         ZUInp6HV3vuUeNbjj73EPeKEkjJDL3vV9Ai++a584gGvU9x6GxLxtHF+XhvT1hDWkjfc
         2HG292MJ+mrN6s33oVAew7XDmdegqORGWhOgFHnInTXq3lW/0BsH+NkF0Seq24MxOOg8
         EZWC/XQAj3XsXL8U2hUdQIxvWjtS/Oz6T/yAqKirp9bLGU6EnuuVas6amG+4DydbCTlQ
         08vg==
X-Gm-Message-State: AOJu0Yz2a80P3iZd+x2qR4PAFtQa5mxhMhh/xYNyJfmt2RiTWnSC3iEf
	eXTS7ShLSuWozl/fVWKSwqPYnf3rfaDTPuir1RB8LxK38g1zSg6l5Tin/9vqWbYn
X-Gm-Gg: AZuq6aJnsliC60dBKqJ10A4YekHVbZVKX3mJNu5T8OaZpvqJhHDuQCfMMPeheDRJvbM
	+gjBMyIGBevYLpj4bdGVjW+WPtbIV9kHjkIi4+qDA9kGHScjW62usTkblpVxg4CLBkfoefpLeN+
	I5GwNFG/Q4OWYhHm35DmnqB91JppH/NYrArzRv1GgMV4T7a71Hj2AqJ8v5ap1bN1jvIWkps70jw
	4R5cIX9SZkpDgY5e/Nc8FFmeR098hRhYy0d/IC82QshUNakfDZBXgeFsWMTUifI4SxiBAYl8yEu
	c922Q3tMyzRj5GITh5d3rQIRfT4jzalWLCTeJP9H+CJiDX2xqhnkMIsD37qAt+HES2YyiGPagKz
	nZwkVFWHmomFJda5bzzYG6qpFP4ci/4JnX6rVedAjplMalVni6HcI1yZdai1VNnwZbK9iXCVk12
	iNde/dKO2P4au1kqqpfCFQv2JB
X-Received: by 2002:a05:693c:3002:b0:2b0:6a03:f08c with SMTP id 5a478bee46e88-2b7b17a6dcdmr4522374eec.5.1769872851675;
        Sat, 31 Jan 2026 07:20:51 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b7a1af88c4sm15460654eec.31.2026.01.31.07.20.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Jan 2026 07:20:50 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>,
	Armin Wolf <W_Armin@gmx.de>,
	Kurt Borja <kuurtb@gmail.com>,
	Tinsae Tadesse <tinsaetadesse2015@gmail.com>
Subject: [PATCH] hwmon: (spd5118) Explicitly enable temperature sensor in probe function
Date: Sat, 31 Jan 2026 07:20:48 -0800
Message-ID: <20260131152048.2299403-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Instantiating the driver does not make sense if the temperature sensor
is disabled, so enable it unconditionally in the probe function.

If that fails, write operations to the chip are likely disabled
by the I2C controller. Bail out with an error message if that happens.

Cc: Armin Wolf <W_Armin@gmx.de>
Cc: Kurt Borja <kuurtb@gmail.com>
Cc: Tinsae Tadesse <tinsaetadesse2015@gmail.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/spd5118.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/hwmon/spd5118.c b/drivers/hwmon/spd5118.c
index 5da44571b6a0..d8834d4d980b 100644
--- a/drivers/hwmon/spd5118.c
+++ b/drivers/hwmon/spd5118.c
@@ -552,6 +552,20 @@ static int spd5118_common_probe(struct device *dev, struct regmap *regmap,
 	if (!spd5118_vendor_valid(bank, vendor))
 		return -ENODEV;
 
+	/*
+	 * Some I2C controllers write protect the address range used by SPD5118
+	 * compliant chips. This makes the chips effectively unaccessible since
+	 * the driver needs to be able to set the page in the legacy mode
+	 * register, and it needs to be able to disable the temperature sensor
+	 * during suspend. Check if writes to the chip are possible by
+	 * explicitly enabling the temperature sensor. Bail out if that fails.
+	 */
+	err = regmap_write_bits(regmap, SPD5118_REG_TEMP_CONFIG,
+				SPD5118_TS_DISABLE, 0);
+	if (err)
+		return dev_err_probe(dev, err,
+				     "Failed to enable temperature sensor (write protected ?)\n");
+
 	data->regmap = regmap;
 	mutex_init(&data->nvmem_lock);
 	dev_set_drvdata(dev, data);
-- 
2.45.2


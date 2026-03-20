Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8388123E35F
	for <linux-hwmon@vger.kernel.org>; Fri, 20 Mar 2026 20:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774038096; cv=none; b=E/d/rlpUCBcjTK8uv2qa2el0p9YkwuQW6lr2erWRmudPwCN47G2kItyODhNzjFW6JRPkJjDkLH8nbG0S71dPXoSRlvQCixO85jMJpTx/0jWWeuwBx/b4aZy08WmfQjDyseab8lkAUQsdyduDfnztVmxx8UcYw8vAGhgSz7cCcOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774038096; c=relaxed/simple;
	bh=Whi6Tzp24Q3TuFJY1F9CK6IPi4wKPXEsfMWn+Ig1YPQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZOpR2Fh8NDHkQBndKVgaZHTcCLIsUUFh138iqjYunZK2RW8Vsg01LC8mz4aXDCJFriJTw8HANUi5lzuzhpZcIXIO3rZKOf9yduqE0RXQduoHQvu/D+Vwpg2B/Dm4oJfVbtlU78BlYk2xoEzBIaZjbxTb09e7++ILdHAjDwr3hYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T0x/XmiU; arc=none smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T0x/XmiU"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-2c1092cc08cso2579249eec.1
        for <linux-hwmon@vger.kernel.org>; Fri, 20 Mar 2026 13:21:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774038094; x=1774642894; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=yhJnIk/btJip8OYTRquGe6hOpinAFyTkST7/N03xYIU=;
        b=T0x/XmiUsWd/bfbqqsz5pblBmS1U3y8z3cEFq25qWrxNgRIclCI6XjUzN1YWpVnIPd
         yglVF1Op91iADzDaP+Sp60t/LqB9IAgW4pFu+EFdt10xrQvg6u8tkCO1xYTwaholHEcO
         5YZvJWmsKmGdZUkT5mFDGxG/l9wb20K64UApBwzOKOZL11NiHtI3Qv0yEmYkMtjw59Q/
         KBakjoy/h/HFBToQMEJ+Cnp1LwRbOWTkFn9Ho/iBP/Wn1phqmSAatioFQXno6m/r8h83
         f2cIEb4Ui8dlwgjcMGbwVOVnycLQfNhRpvCmT2ZvKnuM3YPoGX0ugp8ReTVzQxphKsUG
         eRYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774038094; x=1774642894;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yhJnIk/btJip8OYTRquGe6hOpinAFyTkST7/N03xYIU=;
        b=Mki2uEvXtySGvnHd0mJG7+NhN0HOhwHfdIDqGSLtrSMFaGMcL+adR9R4ihlagnZrr8
         e+Rf/hGxgD414x/3YrKL4S+lFfW/EBAAcohfxm4RKOpfvtWcYWwa/cbNblXvwwF1jVhK
         VgdL6nZH1kFHF49ISdCkmipXVI0iF1tC356JlQZv7jKizxceQZn5Er1sHoySlyFFa+JA
         Wg0iPLFq8Xzx/tZvOt2SHC5fKzp1G63t2nudAyAj2878qZRsbINEK83RrtyLBFny75/r
         rg1yGjZBUdr9cyxlYmMdv1KhGkBfUrH7Y9m9Xen9RqDJwWhOkKbczUhHhXYm4DqfnV+9
         rbHA==
X-Gm-Message-State: AOJu0YwtBpKAO1u8RNHHJHRKkhpvCFfJLvJA+h/CN7GR8/1d6lAQn/pt
	1k6VxgPIF+iETuiz/H85pP0yVKK+/g1hsZZgyQCKVPpbqunNjMTLeNdATxgNtQ==
X-Gm-Gg: ATEYQzwjzX5P9RWTFdYB3VXBjf2YN0uKsrnqHFSAAic2K8gO00M4H1UZn8K7f3UO0AC
	faHHCEASuN3+o0phM9JMSUMcN8TrGgrXxVaKv1FIce/YciEmK8ZWS0x+1kV29FXD1VJbJEIEtyC
	1JSWN69Eq9RIfURWd6WoJdDxRVhmXbeHCIa8ugQvOfLSbhB/IkEuCPcpeGtPsLCkLlKKKp6eZ20
	aLX0RynGERDgNapXnZFPIpV3oUJTgkaqtkE7Eb0lfsg8vrpE5dQeXr5v8uN3NotG2fxjc0COm36
	o3+vg+KLr/svsc+vF71uFFbZ0eEDTFff3jy6HLwVhYbvh8tOVFbzN0BJ4Gk9D/9ZA9npEJD8MvC
	iqrG5d8fy0vkuOxPkhFJhRc6xBlvJLMTnPo+eZIuVzoiCYTRH66gE99w4yWX9YVHH3U07noVR2h
	ByAX1iG+Bht3sGfyXRYTOeQMhkUATA7Zv8UxF5
X-Received: by 2002:a05:7300:8ca6:b0:2c1:778:d897 with SMTP id 5a478bee46e88-2c109752f8dmr2020713eec.21.1774038093418;
        Fri, 20 Mar 2026 13:21:33 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10b2d673asm5640377eec.24.2026.03.20.13.21.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 13:21:32 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>,
	Naresh Solanki <naresh.solanki@9elements.com>
Subject: [PATCH v2] hwmon: (max6639) Fix pulses-per-revolution implementation
Date: Fri, 20 Mar 2026 13:21:28 -0700
Message-ID: <20260320202128.3863535-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The valid range for the pulses-per-revolution devicetree property is
1..4. The current code checks for a range of 1..5. Fix it.

Declare the variable used to retrieve pulses per revolution from
devicetree as u32 (unsigned) to match the of_property_read_u32() API.

The current code uses a postfix decrement when writing the pulses per
resolution into the chip. This has no effect since the value is evaluated
before it is decremented. Fix it by decrementing before evaluating the
value.

Fixes: 7506ebcd662b ("hwmon: (max6639) : Configure based on DT property")
Cc: Naresh Solanki <naresh.solanki@9elements.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
v2: Fix patch subject.
    Change variable type used for of_property_read_u32().
    Fix PPR value written into the chip.

 drivers/hwmon/max6639.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/max6639.c b/drivers/hwmon/max6639.c
index 9a3c515efe2e..5f40a95ae584 100644
--- a/drivers/hwmon/max6639.c
+++ b/drivers/hwmon/max6639.c
@@ -232,7 +232,7 @@ static int max6639_read_fan(struct device *dev, u32 attr, int channel,
 static int max6639_set_ppr(struct max6639_data *data, int channel, u8 ppr)
 {
 	/* Decrement the PPR value and shift left by 6 to match the register format */
-	return regmap_write(data->regmap, MAX6639_REG_FAN_PPR(channel), ppr-- << 6);
+	return regmap_write(data->regmap, MAX6639_REG_FAN_PPR(channel), --ppr << 6);
 }
 
 static int max6639_write_fan(struct device *dev, u32 attr, int channel,
@@ -524,8 +524,8 @@ static int max6639_probe_child_from_dt(struct i2c_client *client,
 
 {
 	struct device *dev = &client->dev;
-	u32 i;
-	int err, val;
+	u32 i, val;
+	int err;
 
 	err = of_property_read_u32(child, "reg", &i);
 	if (err) {
@@ -540,7 +540,7 @@ static int max6639_probe_child_from_dt(struct i2c_client *client,
 
 	err = of_property_read_u32(child, "pulses-per-revolution", &val);
 	if (!err) {
-		if (val < 1 || val > 5) {
+		if (val < 1 || val > 4) {
 			dev_err(dev, "invalid pulses-per-revolution %d of %pOFn\n", val, child);
 			return -EINVAL;
 		}
-- 
2.45.2


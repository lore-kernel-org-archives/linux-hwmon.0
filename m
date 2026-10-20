Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792482226;
	b=OJjlF33hVecLenHdNLFh9Q6m4idmYRRlc7LU2sdS+dgobe4uh/BNPsfS/60VxQcwcKtF
	 mcRCB+dvF1f9Bt0LC6QDCKn88BZ+VnmQ7c24sc607G03aORa7NWM8RydW2Ntke3lme2rX
	 ErulKVu0kpa4rAWMJHhZJH8yiOdU56XI+EweqFikfh2nhJXqRCAPBUvkE+9CbbsKesJlu
	 jtDpIwxOnwum+AmRNttrOpO3wUnuMZ3Bvz3pn/AkiB0nEwuT1wzP2Flv2xfn4pi5aqWZp
	 1R1QvDLxkst0DA2QSak5oblxbJcdIOFyJkBrFkO8y1CEEVHuBANebzWUU6L/e8NYSng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792482226;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=HQDZoYR9ptVERXu1PnS05h35SZuDJhq07Gs0Wdldq6c=;
	b=m1swjquuxsROHZq7OkSjCmQ1uy8L5Mmu3L6fTYtgtXP75vNledFbQT7YO3647PqNlpvy
	 f2nNcrZteF+RtS1pqTO5Sce9NOHTqHgr2IodiC5IkOTG+tTNebI9GN+suGoplEEen5Qw1
	 BY3Ea3swb8gvHPQ5higc5g3S4UNNa7MxjxVAlYI/lCDrsjmBKoh8LporXJIPMri7YVVfD
	 BrW4jvYEQgShv4rUxQjfBcF90/3HUABw1SFNNlKl3v8gHmS2q9/vAvqOMQmZ2HZ3+S3FA
	 cBlwETwZf56pgx3G18ZTQy5JFnd//LOAnAyXCpRPTx2UDTHG/IyeqLs2uG83TcynVJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nexthop.ai;
	spf=pass smtp.mailfrom=nexthop.ai;
	dkim=pass header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=A9LVEW1a;
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7EF9606A32D
	for <linux-hwmon@vger.kernel.org>; Tue, 20 Oct 2026 07:43:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7EF9606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=A9LVEW1a
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1517bda04a0so2464601c88.0
        for <linux-hwmon@vger.kernel.org>; Tue, 20 Oct 2026 00:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1792482225; x=1793087025; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HQDZoYR9ptVERXu1PnS05h35SZuDJhq07Gs0Wdldq6c=;
        b=A9LVEW1ahtVd4rK3jojo17a0NmbS8vil5bTZjaRBex8TDP2tkLxOpc4SwR6PcHYfus
         6K9i/2N7Y+1lebMWDZOGdgvSeL0wVwYExFg616y8v6YcY9cF8aIBt2AmqhSgAQMLSBuG
         qbEztE2WpqYmDyhBPqzYHlTa8uuC+cL3nwqpjMtXst9sNTPAa/R++xy+cN5cYBQbN4p1
         b3qW6xj/XiKm1K4sFv7wIAtd76bJV6pG3//Xu5dnC7ziLGMGdR+XLOd+tqM8i1FH4ms/
         OluqgofgWizx5kmVi8wR37IM9qiF2ewcYGzevg2a7PUssU0hzxIc5cCoSM9gRSEeaC7o
         nv8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792482225; x=1793087025;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HQDZoYR9ptVERXu1PnS05h35SZuDJhq07Gs0Wdldq6c=;
        b=TTfNbhi9FQ9h1njeu4FLYKuK6BU80Nbj/Xi3iAPO/ge6eM8T5QchYThx6kpVZiME3u
         KqtIohJRYpwUVku7lfvZdmOFovOG+GCRWJjUVPkkQyUngsJso6MfIrkB+S6j4hr7Vpke
         Gr/P9fkWn7D0AI6oAWc5y88XyClTQ7lETpY5AUBFVLUFwn6GvaObhopcNB4RAylHroGu
         9AQufMH4ERgDG/4UiFrn0VpFnDPcAFocGxNi1XDjGvOaMCTVWkGccehMvaD1x1FiOhZ3
         y0zap9DcWvnQeJyGxH0Nv7k/be6ZvrHL77eGEftJKLXIXhrVgp22NhnQuBTzFQQhhece
         gx5w==
X-Forwarded-Encrypted: i=1; AKwUvBylGs83qzGA1JbheVoKFoKvY0sI2Gnuwc1W2dISAi/k1J5Zte4FW1rCnw3r8/a1IPfIiZYTbp6lYpYDwg==@vger.kernel.org
X-Gm-Message-State: AFq9FYKfCBili0op65MMl2/R7+X1YYYz5LlMMtKqCNEwav8q3PT0nKyG
	l59gB/GkqpoXqXnpQ/UzRX5kKytx5Pb6siP0I7V8JgHXAFADJ99G8PiuAnmmg8bdnHA=
X-Gm-Gg: AYBFou18GM3bs8hQqcwoEFREYwYPOAkix6v5Cm6/vFcGatNjpoMYxBhC3f2UA765qJb
	k+dSacV/0ApJ/kQA98ek0SW04vHiglfB9tARq+tKrmX/yP3OZE2avdMoQFuUj6/LTnUnjOYSDr2
	LTrtop5Qiq/gRJIAkJe8fUbB/vL3R/aWLlR9DDsIXlMBeIIg79L3SE8Vr4gD4vBXz5IVTGgdakt
	AS1otmExk/ewSKaqkVC3JQ+8j4SejqvEftyzLBxCslixXU8yBhzt2yJg9ztzI09ylNTfgqXVuis
	5vJnWZQOOohEmJ7ha+XfNecsqdf71RC3+qXLYM0QpWR84ttaAXgpWgqA2C7CccKexRe9hUzEie/
	kuQkx79jtKvbUIT8ubbtmho1tUo66FgG1r+Xqkjp4y9F/Ae5IH0YVW/+bmyYE/0/L7BJ15WRHwW
	OzY7s9O3geWFbO5eR1wlkrGHpS1qpKJ0TOOiCywSYQku3NNLVmMfjF9VVNnhm60I/vDqO/lNK90
	a+m87HVjx7rsqXRHOKQ0vE9K8ozOCS7aL72tcBhvbLeBPFUMhkdMCtMML0=
X-Received: by 2002:a05:701b:251b:b0:14d:4c0f:48a8 with SMTP id a92af1059eb24-1851285dcf6mr14519220c88.26.1792482224766;
        Tue, 20 Oct 2026 00:43:44 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36083283478sm37010238eec.29.2026.10.20.00.43.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 00:43:44 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Tue, 20 Oct 2026 00:43:39 -0700
Subject: [PATCH v2 3/4] hwmon: (pmbus_core) Support relative encoding of
 vout related commands
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261020-hwmon-pmbus-fs1412-v2-3-3396c3a08251@nexthop.ai>
References: <20261020-hwmon-pmbus-fs1412-v2-0-3396c3a08251@nexthop.ai>
In-Reply-To: <20261020-hwmon-pmbus-fs1412-v2-0-3396c3a08251@nexthop.ai>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: Lars Petter Mostad <lars.petter.mostad@appear.net>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792482219; l=6374;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=+xhcznn3qa15squjGIpyfc1hdH0JXJOfXnxt7pxS8iI=;
 b=FbBAQbhKE6Iiw+pE3qdYad2NmqjdwfYB4AlJ1JxaQ5pvqFo1rK8RsGIpur4XUpOnm/pVWfqV5
 D9cRackDFxcDZs76lCCcsEAV7q6Xzoil4Jjf4hRYgoK6DnOS5SfXjvJ
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=

From: Lars Petter Mostad <lars.petter.mostad@appear.net>

PMBus 1.3 allows for relative encoding of voltages in certain output
voltage related commands. These commands are encoded relative to
VOUT_COMMAND. Support this when encoding/decoding commands.

Signed-off-by: Lars Petter Mostad <lars.petter.mostad@appear.net>
[abdurrahman: rebased; check VOUT_MODE for 0xff before testing the
 relative bit; use signed division and clamp the user value before
 scaling; reject a zero VOUT_COMMAND at probe; update the cached
 VOUT_COMMAND only after a successful write]
Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
 drivers/hwmon/pmbus/pmbus.c      |   2 +-
 drivers/hwmon/pmbus/pmbus_core.c | 103 ++++++++++++++++++++++++++++++++++-----
 2 files changed, 91 insertions(+), 14 deletions(-)

diff --git a/drivers/hwmon/pmbus/pmbus.c b/drivers/hwmon/pmbus/pmbus.c
index 7a7eac90d62e..dff1ef9c27f9 100644
--- a/drivers/hwmon/pmbus/pmbus.c
+++ b/drivers/hwmon/pmbus/pmbus.c
@@ -121,7 +121,7 @@ static int pmbus_identify(struct i2c_client *client,
 
 		vout_mode = pmbus_read_byte_data(client, 0, PMBUS_VOUT_MODE);
 		if (vout_mode >= 0 && vout_mode != 0xff) {
-			switch (vout_mode >> 5) {
+			switch ((vout_mode & 0x60) >> 5) {
 			case 0:
 				break;
 			case 1:
diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index 5f69c1420b4e..47dff264d28b 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -101,6 +101,9 @@ struct pmbus_data {
 
 	int exponent[PMBUS_PAGES];
 				/* linear mode: exponent for output voltages */
+	bool vout_mode_relative[PMBUS_PAGES];
+				/* VOUT limits relative to VOUT_COMMAND */
+	int vout_command[PMBUS_PAGES];	/* VOUT_COMMAND in mV, relative mode */
 
 	const struct pmbus_driver_info *info;
 
@@ -803,6 +806,26 @@ static void pmbus_update_sensor_data(struct i2c_client *client, struct pmbus_sen
 						     sensor->phase, sensor->reg);
 }
 
+static bool pmbus_sensor_is_vout_relative(struct pmbus_data *data,
+					  struct pmbus_sensor *sensor)
+{
+	if (sensor->class != PSC_VOLTAGE_OUT ||
+	    !data->vout_mode_relative[sensor->page])
+		return false;
+
+	switch (sensor->reg) {
+	case PMBUS_VOUT_MARGIN_HIGH:
+	case PMBUS_VOUT_MARGIN_LOW:
+	case PMBUS_VOUT_OV_FAULT_LIMIT:
+	case PMBUS_VOUT_OV_WARN_LIMIT:
+	case PMBUS_VOUT_UV_WARN_LIMIT:
+	case PMBUS_VOUT_UV_FAULT_LIMIT:
+		return true;
+	default:
+		return false;
+	}
+}
+
 /*
  * Convert ieee754 sensor values to milli- or micro-units
  * depending on sensor type.
@@ -1005,6 +1028,12 @@ static s64 pmbus_reg2data(struct pmbus_data *data, struct pmbus_sensor *sensor)
 		val = pmbus_reg2data_linear(data, sensor);
 		break;
 	}
+
+	/* In relative mode, val is a permillage of VOUT_COMMAND */
+	if (pmbus_sensor_is_vout_relative(data, sensor))
+		val = DIV_S64_ROUND_CLOSEST(val * data->vout_command[sensor->page],
+					    1000);
+
 	return val;
 }
 
@@ -1209,6 +1238,12 @@ static u16 pmbus_data2reg(struct pmbus_data *data,
 	if (!sensor->convert)
 		return val;
 
+	if (pmbus_sensor_is_vout_relative(data, sensor)) {
+		val = clamp_val(val, -INT_MAX, INT_MAX);
+		val = DIV_S64_ROUND_CLOSEST(val * 1000,
+					    data->vout_command[sensor->page]);
+	}
+
 	switch (data->info->format[sensor->class]) {
 	case direct:
 		regval = pmbus_data2reg_direct(data, sensor, val);
@@ -2736,6 +2771,20 @@ static int pmbus_init_coefficients(struct i2c_client *client,
 	return 0;
 }
 
+static void pmbus_init_vout_relative(struct pmbus_data *data, int page,
+				     int vout_command_raw)
+{
+	struct pmbus_sensor s = {
+		.page = page,
+		.reg = PMBUS_VOUT_COMMAND,
+		.class = PSC_VOLTAGE_OUT,
+		.convert = true,
+		.data = vout_command_raw,
+	};
+
+	data->vout_command[page] = pmbus_reg2data(data, &s);
+}
+
 /*
  * Identify chip parameters.
  * This function is called for all chips.
@@ -2753,6 +2802,10 @@ static int pmbus_identify_common(struct i2c_client *client,
 		 * Not all chips support the VOUT_MODE command,
 		 * so a failure to read it is not an error.
 		 */
+		if (vout_mode & 0x80) {
+			data->vout_mode_relative[page] = true;
+			vout_mode &= 0x7f;
+		}
 		switch (vout_mode >> 5) {
 		case 0:	/* linear mode      */
 			if (data->info->format[PSC_VOLTAGE_OUT] != linear)
@@ -2979,6 +3032,21 @@ static int pmbus_init_common(struct i2c_client *client, struct pmbus_data *data,
 			return ret;
 	}
 
+	for (page = 0; page < info->pages; page++) {
+		if (data->vout_mode_relative[page]) {
+			ret = _pmbus_read_word_data(client, page, 0xff,
+						    PMBUS_VOUT_COMMAND);
+			if (ret < 0)
+				return ret;
+			pmbus_init_vout_relative(data, page, ret);
+			if (data->vout_command[page] <= 0) {
+				dev_err(dev, "Invalid VOUT_COMMAND 0x%04x for relative VOUT mode\n",
+					ret);
+				return -ENODEV;
+			}
+		}
+	}
+
 	if (client->flags & I2C_CLIENT_PEC) {
 		/*
 		 * If I2C_CLIENT_PEC is set here, both the I2C adapter and the
@@ -3351,29 +3419,38 @@ static int pmbus_regulator_set_voltage(struct regulator_dev *rdev, int min_uv,
 		.data = -1,
 	};
 	int val = DIV_ROUND_CLOSEST(min_uv, 1000); /* convert to mV */
-	int low, high;
+	int low, high, ret;
 
 	*selector = 0;
 
 	guard(pmbus_lock)(client);
 
-	low = pmbus_regulator_get_low_margin(client, s.page);
-	if (low < 0)
-		return low;
+	if (!data->vout_mode_relative[s.page]) {
+		low = pmbus_regulator_get_low_margin(client, s.page);
+		if (low < 0)
+			return low;
 
-	high = pmbus_regulator_get_high_margin(client, s.page);
-	if (high < 0)
-		return high;
+		high = pmbus_regulator_get_high_margin(client, s.page);
+		if (high < 0)
+			return high;
 
-	/* Make sure we are within margins */
-	if (low > val)
-		val = low;
-	if (high < val)
-		val = high;
+		/* Make sure we are within margins */
+		if (low > val)
+			val = low;
+		if (high < val)
+			val = high;
+	}
 
 	val = pmbus_data2reg(data, &s, val);
 
-	return _pmbus_write_word_data(client, s.page, PMBUS_VOUT_COMMAND, (u16)val);
+	ret = _pmbus_write_word_data(client, s.page, PMBUS_VOUT_COMMAND, (u16)val);
+	if (ret < 0)
+		return ret;
+
+	if (data->vout_mode_relative[s.page])
+		pmbus_init_vout_relative(data, s.page, val);
+
+	return 0;
 }
 
 static int pmbus_regulator_list_voltage(struct regulator_dev *rdev,

-- 
2.54.0


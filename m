Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEC8D3314A4
	for <linux-hwmon@vger.kernel.org>; Fri, 17 Oct 2025 13:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760706204; cv=none; b=pnlHac6V5LY69cijJB5Qor6CAUHjXJyOa5QD+fLr/EXqA3o+xvBvK4rB1AxRhS7oC9aD7jrocbxKnafCB4IIx4sp4OXCFCoWnust4g/WuV1/9AxJ8liKnmzBShFdGdXgOBYqf5AeK/QBHuhYXmVpi/b37DewdImxWvDMeGs++GU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760706204; c=relaxed/simple;
	bh=pnqi7RIJGSya2X/ekI+/Rz9TubTChncw7hfLbUiY+8Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t5dqnoPRmDfae39IWQVlH4+4Z+GmnDBRy8YcMv9CLTAONJqdhSMl6YW3q2BoijdvkTNdg9xNM5tlfZUdvzmxc/4a88/YzQlEKqko7fZLvQ6jVd+HY6xe/lSz5ZgJB5qp6mPt/apWYM6jY2NQpbsZmkMGNUy0scL52oVVB0qoI6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jt+EOnjZ; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jt+EOnjZ"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-27eceb38eb1so21311255ad.3
        for <linux-hwmon@vger.kernel.org>; Fri, 17 Oct 2025 06:03:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760706202; x=1761311002; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kzyLgEyk4O2+tquzREtJLcnFdbv6Jo5E+iYw0yJxwck=;
        b=Jt+EOnjZEic0UGbxofzWUacjc8mUxXILHXKM7NQOru+h1ji7D4ZhE1PAdLsm2e7yWe
         Ozlz3qYJPVcFuOBJDW4LaC/9yRqeihV16uGP993+/cQxigg5zPryVrQ4FRiYD8njH7fi
         nQpf3UDFKhxF5NC7S4DaAVPuCRwR773m3P5amljVcOLXjHwJC6RhL7xzOnZfeIu/neDo
         k+o1kuV7UGlnYNojLFP1h9zlVVkBe2wE9MMNqpG7ezkn/ADWry1rL3SL/jllKGaHDKCp
         7RbMBWBn4Cu8z6257XIB4VtNhZSZIc6DA87rULJ7+LoOzim0a9jH3G94pePEg45g5u+j
         jYsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760706202; x=1761311002;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kzyLgEyk4O2+tquzREtJLcnFdbv6Jo5E+iYw0yJxwck=;
        b=aAEILYgSXJIL+5/0r+KZcmV+RLn4GunJOMfzHentMzM+mN+iRp3Hj1zgCjcdc+8L+1
         PAiT6g5a2QD07/q2T25ENpJdXXB0gHu1PxjiFc8v+nh0V7jYUFhcrP8iCI9PfTFxdgqZ
         8Z0+bkTFOBNG7VSZCFSbMsTkzcPu5brHpfCvrWAFrXXmY/oxE6IL3OR1k6rl9qoqzBq8
         RoNtaXrCXaVV836mScCoY94PN2xhuB6YLW7nysrrxEKBc3i0p+ip9gnb/I1lfP9U9SbN
         CNa4176xci3VD92aoTU4qu6ExFKrxdvA5eG0QCcAleivaJLwB1fKYjwijyno6QlmE+T+
         ogGw==
X-Gm-Message-State: AOJu0YyBEDvtt1Inqr1PfRdLCanfkO8qW7LJZLHrBVLQIwkYaSPQIqM2
	yUp4z/WgSYNl0+k2xv1+zLym6z8oj2RHInkDJib2fW4xHiapETZKXoNuOwGilQ==
X-Gm-Gg: ASbGncuSn/XPgUsCqHl7Q2l7xlwH+DSJUjMt6HSwrlTWXq+FTX77sYsjIk5UfWaVWnb
	HHgpLBLX8YO2qcseT4JpEFjSTShbUZsx9adQvPwCvmjc/5+3saUIKACJZuwFCaBjTYawo4+7JfJ
	4oJC8qH3tt/2/beyu24BqeCNd2BpH5f9yK5fMJkq5WPNITLuN0h9nZQT1YUTRbL4yRow4/NwSPu
	c6TbBFw3BZF7YxNTOXBFXYjt1KI7Ir9OY8p4DfUQAp/04eQhpbY+6A7dTTwckrREUK/dxACrLV2
	ZoGX9vIRxkAt3iS27P8aSsYP3rKh3refSJbKbFglv5b9loSq8fZrriajCQ3YymgvQXN5babMZNS
	N1DAiPVuYxdysPvKaVpB6BP3y4VgLyrbnTYtQ/MIiufwdZen4e4vWktTAHHwGfRsh9qo9bBSo60
	vwyiHil/r4oplG
X-Google-Smtp-Source: AGHT+IGLeCnf2HAntKxIpgrZbB62v4vTxK0zEirz2jSMaB6slqmdZ1yUhkE1jdLOzJIkDtt8dt0jWw==
X-Received: by 2002:a17:903:2c10:b0:278:daab:7940 with SMTP id d9443c01a7336-290c9d31115mr46008905ad.17.1760706202042;
        Fri, 17 Oct 2025 06:03:22 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29099348f97sm64373035ad.27.2025.10.17.06.03.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 06:03:21 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 27/29] hwmon: (chipcap2) Drop unnecessary include files
Date: Fri, 17 Oct 2025 06:02:19 -0700
Message-ID: <20251017130221.1823453-28-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20251017130221.1823453-1-linux@roeck-us.net>
References: <20251017130221.1823453-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The driver does not perform any locking, does not execute or use any sleep
related functionality, and does not allocate memory. Drop the unnecessary
include files.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/chipcap2.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/hwmon/chipcap2.c b/drivers/hwmon/chipcap2.c
index 9d071f7ca9d2..645b8c2e704e 100644
--- a/drivers/hwmon/chipcap2.c
+++ b/drivers/hwmon/chipcap2.c
@@ -81,7 +81,6 @@ struct cc2_data {
 	struct completion complete;
 	struct device *hwmon;
 	struct i2c_client *client;
-	struct mutex dev_access_lock; /* device access lock */
 	struct regulator *regulator;
 	const char *name;
 	int irq_ready;
@@ -558,8 +557,6 @@ static int cc2_read(struct device *dev, enum hwmon_sensor_types type, u32 attr,
 {
 	struct cc2_data *data = dev_get_drvdata(dev);
 
-	guard(mutex)(&data->dev_access_lock);
-
 	switch (type) {
 	case hwmon_temp:
 		return cc2_measurement(data, type, val);
@@ -600,8 +597,6 @@ static int cc2_write(struct device *dev, enum hwmon_sensor_types type, u32 attr,
 	if (val < 0 || val > CC2_RH_MAX)
 		return -EINVAL;
 
-	guard(mutex)(&data->dev_access_lock);
-
 	switch (attr) {
 	case hwmon_humidity_min:
 		cmd = CC2_W_ALARM_L_ON;
@@ -708,8 +703,6 @@ static int cc2_probe(struct i2c_client *client)
 
 	i2c_set_clientdata(client, data);
 
-	mutex_init(&data->dev_access_lock);
-
 	data->client = client;
 
 	data->regulator = devm_regulator_get_exclusive(dev, "vdd");
-- 
2.45.2


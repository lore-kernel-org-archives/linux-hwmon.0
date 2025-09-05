Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 926302C3248;
	Fri,  5 Sep 2025 20:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757104939; cv=none; b=BIT06Rz3oPH35s7VQbfZ8ac3RG9oUHW/eKwGMp2Vt9Rg/aQAputMO3ymXAM2ZG+8mD4ABV0sTIN/RYc4ZXULGaVHJMs/6FdHBbRhLlKCwmL61F1zsn2vXTdsg4Pa96W4liotzyA5H18otRobFSXXDU2yboesmnu9WQzd6TVLyxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757104939; c=relaxed/simple;
	bh=AZtBjEO8pS6KO+s9uu7YBUuX6rbBI/csveVaweQpPNQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SiWN8ltdaFU2AhoTWEikqhRfvpft8q2E5dY+bIIBIvsmKGryWM2eo4s5Rp7zFUPrwK643Fpdfq5Dklly3EJ+3lZ/O0zToP3YgC2rSoOda6I6gSLthejG0jyaUQX/iTgQ0cyH32aHm0cqXFeMQtMxYDZdf63yfQMxif5CmGFf6fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ka/QrQLv; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ka/QrQLv"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-24cd340377dso13527775ad.1;
        Fri, 05 Sep 2025 13:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757104937; x=1757709737; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/ajWF75CJJrjs+tKtnMrQLdR2slkjSZQukqf6rEvBPk=;
        b=ka/QrQLvq8QX86bcv4sf1y2EQcNyTjJ17vFPHMX/cJ/0GEW3avHyDn5y0jw9HTr/zU
         p1JjlFPnrMSBjmpgEdFnpgf0XcwZrgCA1wgtaLMFrSDXxG2rEwq3V0xtwa3mDZHLkanv
         nSC+CUMcL072MCAtf7dL+HbURopywWnAKGOdq7V0l3TT1UqT/0S0iB5F+qh3KREi71jv
         PxQ/1gYguB6Esuka/ewwUr3VKy8uqqLt0rgSiSwvcmXCrs1+ngLMyMUZLfQrZ1iaHmm0
         aiCa8nTChsnwQhOB00TeoggiTZt55Jg0ZtgvQ5YKJeSVnjubgR8ujxSSbdEuDk5D/q0H
         cB/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757104937; x=1757709737;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/ajWF75CJJrjs+tKtnMrQLdR2slkjSZQukqf6rEvBPk=;
        b=g/VU+3g3OT6XHaqvvck88z8ZpVeJbV7u6UtQ3WbUFC5cdHJABHiKTVZVbylJS0yH4M
         2kg1aXzgApu3EpPAxDsYNG5TfZ/AMDj9te8++mx1INKurBi8eZ6V7za8eGsFg4FznaWW
         6h2hIcjOMcixwHGH3FNJ7hmWQnDquRJaFlqsuZ+XqjtvyMhxA9fomYNci75OBztOQvox
         HOWtggCpNDM1MFWWU6UeB6n1gICjaDV96MJwtILFSZcvSFDWTV75tBTgQmc9tQzqfH7E
         RV2nZZYg5e5BHwvXDWok7+spw5gepRY1wVr9t8FN4NLpr9lVaTmsQer/o2gnrkqt7uLH
         KyGQ==
X-Forwarded-Encrypted: i=1; AJvYcCVen0FIb7Ai5AzKsmg9f+tWAOmwkuJK01MmNKCs4e6LbKkO3NGkYcQEE/bxLecMugzopyxXM/Xs8SiM@vger.kernel.org
X-Gm-Message-State: AOJu0YwpUyeXeMmMSBz/U6yQtBYTKUn1uhFemyLzKdFwzczpZueSTur1
	SpvdOvK67nuFcQxICrzFDnFeEbHSnrZt0k22E5UGxJ9c0x9OtYTW6C/HC672710a
X-Gm-Gg: ASbGncvfZ0X5ZK7Ecgl7BgpCDmK0MfE78oWQQBj8GFw/N1p7XLzndpVyyU7mDrSXGgY
	zAHkH61zB8SZUMLj3qBN/x73R7Bsn9PldStNpqgwwDHht4VXD0EbK89Bm3CGpRozjOU9tRjetSL
	p4VqFP6H2C9FlhJo9ye9AUNTaU5SljhYRO5WKg0j1XBeVQEXlxDLPS2mhFdSAb9sm1dzN14V1WB
	COpFl3XkIqTRED4b2axTbbWR9YNzGV5ZMAFpDKquyCkeiaDrRxX5eh4FjRhlfFuAvFmngQyWvza
	gWfQ/wHeDfpAF6o5VqS5k0zZwC9np8VU77djbeF8N9FGcFtuoUps9TEJDcYkBNed9X1dDqrnD8/
	9u2zzu+MAIeMiZTQc3Uecz9NwqxeqckSKyqeFD1polouyzQ==
X-Google-Smtp-Source: AGHT+IHwUdIINaXfEX1g+fPVRA7ogbEGFrdG90kBgZoSVth4Jh40qnZN7qfY2vVvqa42EKE+HpzMXQ==
X-Received: by 2002:a17:902:db01:b0:24d:e8f5:13b1 with SMTP id d9443c01a7336-25171bc0549mr346625ad.40.1757104936704;
        Fri, 05 Sep 2025 13:42:16 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24c9c2b12f9sm75948095ad.101.2025.09.05.13.42.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 13:42:16 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Christian Kahr <christian.kahr@sie.at>,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Chris Packham <chris.packham@alliedtelesis.co.nz>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 10/17] hwmon: (ina238) Order chip information alphabetically
Date: Fri,  5 Sep 2025 13:41:52 -0700
Message-ID: <20250905204159.2618403-11-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250905204159.2618403-1-linux@roeck-us.net>
References: <20250905204159.2618403-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Order chip type enum and chip configuration data alphabetically
to simplify adding support for additional chips.

No functional change.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/ina238.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/hwmon/ina238.c b/drivers/hwmon/ina238.c
index 97f12efcaef4..4681325f58f0 100644
--- a/drivers/hwmon/ina238.c
+++ b/drivers/hwmon/ina238.c
@@ -100,7 +100,7 @@ static const struct regmap_config ina238_regmap_config = {
 	.val_bits = 16,
 };
 
-enum ina238_ids { ina238, ina237, sq52206, ina228 };
+enum ina238_ids { ina228, ina237, ina238, sq52206 };
 
 struct ina238_config {
 	bool has_20bit_voltage_current; /* vshunt, vbus and current are 20-bit fields */
@@ -127,7 +127,16 @@ struct ina238_data {
 };
 
 static const struct ina238_config ina238_config[] = {
-	[ina238] = {
+	[ina228] = {
+		.has_20bit_voltage_current = true,
+		.has_energy = true,
+		.has_power_highest = false,
+		.power_calculate_factor = 20,
+		.config_default = INA238_CONFIG_DEFAULT,
+		.bus_voltage_lsb = INA238_BUS_VOLTAGE_LSB,
+		.temp_resolution = 16,
+	},
+	[ina237] = {
 		.has_20bit_voltage_current = false,
 		.has_energy = false,
 		.has_power_highest = false,
@@ -136,7 +145,7 @@ static const struct ina238_config ina238_config[] = {
 		.bus_voltage_lsb = INA238_BUS_VOLTAGE_LSB,
 		.temp_resolution = 12,
 	},
-	[ina237] = {
+	[ina238] = {
 		.has_20bit_voltage_current = false,
 		.has_energy = false,
 		.has_power_highest = false,
@@ -154,15 +163,6 @@ static const struct ina238_config ina238_config[] = {
 		.bus_voltage_lsb = SQ52206_BUS_VOLTAGE_LSB,
 		.temp_resolution = 16,
 	},
-	[ina228] = {
-		.has_20bit_voltage_current = true,
-		.has_energy = true,
-		.has_power_highest = false,
-		.power_calculate_factor = 20,
-		.config_default = INA238_CONFIG_DEFAULT,
-		.bus_voltage_lsb = INA238_BUS_VOLTAGE_LSB,
-		.temp_resolution = 16,
-	},
 };
 
 static int ina238_read_reg24(const struct i2c_client *client, u8 reg, u32 *val)
-- 
2.45.2


Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C325C409129
	for <linux-hwmon@vger.kernel.org>; Sat, 29 Aug 2026 17:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788023161; cv=none; b=ivq/o5AQ1UlgMN3faOJNOwBjXEPAmu0bpDPxFtIoAJoeecgqNX+udoRIBzVmcaoKPQ/87UkNdWIbA1gT3H8Me6DXaB9/KPJDDWtdl3TaXBxtYfXB0ltzx4IKjGLm1cB7ZBBqZIbD5pf/43kZWdzN18bu7OGgB0LKWbJRL50SuDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788023161; c=relaxed/simple;
	bh=0RQP6CHUutwhiHKR91TIkYyESgo602mMx5QJZYTve2c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nvj/X2WiJuJMNKVuY71G/WsHqkESW4kCUQ8/oUSouabqSljXyI5obmJ5r6v3T2B2eQUbnP56QEy+JGKD/xv8N0XZAsr9P0CFTilIoysdtI25tXM36Dd0VQjeE47WqwhQKhaHTHZiHrYvKzncLX/UD2Cv1X7OWwSnW+c9TyZA0B8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q2k1GSh2; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q2k1GSh2"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c197e7e4e94so291430366b.2
        for <linux-hwmon@vger.kernel.org>; Sat, 29 Aug 2026 10:05:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788023154; x=1788627954; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WVU/NL9OcCsh7NoMimF9YpAzSlDIoJEBxaWLFhSnYHY=;
        b=q2k1GSh2QxReOp6RlIAVenLRBDC2C3NP8Yi+m7bhVXvNwOU03rrRAxOahJhBYUIKx+
         E1zCey5yiDcYc4vxdvrTaJAvwJIi59D4+oU7RByAyrf4SInG/45SUm+vMMkb8BoWdnmV
         vXS4P2edQBUo9w/s22LK5VVvqQBVWDoArkYIOTP7EthgvwgBHHZVUgMWF5b5FUBb1GMG
         8Pi/DgBID40UseTd3v6dtSaN0suk9kLV7XskAn2IscxSDvX6yUZyzBsmiugZJuhphsOO
         xhBNnPDhC4zjZQFxWN8SC1e0jIYmlBLiCO5e/C8g8KnDlZVaurh830tYwWfnAqCti9mZ
         T7XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788023154; x=1788627954;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WVU/NL9OcCsh7NoMimF9YpAzSlDIoJEBxaWLFhSnYHY=;
        b=V6IFc5NYSJB18yRCjcv7Zju5nTu8DeL0RmPxirrVlQz46+JnhHVTNe90jen5FdUDKa
         LwdH9iH0fp3RBecKIjjLeGvJ6X3o9EwAPh5RpOmkfCGiv2Yp+p6VDnWzRLSRlnEeAWXN
         d1/Xuv2GAxThc9WD5KNd/h8RdsYGvwevPZM46qwQUzH6rY0DpMwSvP22TFYG7iVFYIB2
         DBowFIfsj1zCJi0y0xweBK1ibqkyJGv3nAARj2pNO5n4AZo7SsP0R6SXakZZzMEJ7Ig1
         FLEG6nafYeH6duwEnxR+W6ZWhsbsC8th7mmHXX09DNRRSDb8n7LTFJHO7CmJTvtEs46W
         sPKg==
X-Gm-Message-State: AFuF++mT1GA729skj/EJadmyu874GQPD85zcEwHeq4QUeo3FCl6N8p2z
	P0IqnzROaWYjGM8/2ExUGAU/VKM9vZ/9ZRDxFa208R0KW7Q76VC4js6d
X-Gm-Gg: AR+sD13tpDyutEHDrkEa6/WVb4iRdio4EV1BealjKpAJ/qpBvQn6fFnzmlvGBJu+Mn8
	NB9Q6bPth7wYPV+lSzig8Eu7dG29o2i87EymflmmVimzY31xk8DeU03pWCYO1tFKHop5d1DHIdE
	7oDWtfC2P+r6DIaGgdo4MnQkck1edd75o8v6+BeXjbhBxw/yGivAdLKMRV7uJjii6zagiEmeLXH
	K4VYXULyGW+a7VpD28Ra2EHAnzQPUFTZVorCWoy+ERYQKf0mUM4hd09JH0vhF+WJq11GAMrkcpX
	sAaYJYYNjWuPMhKykuNYLp+jsJmlsNOfqruKGPwY6RKKornQQi2rajFQYWXj9yHITxbR8/Xe0uJ
	pdhuaURwPaUrFrYnbVjQHILhal4MA6FWjqbKF9MoAcHCNUZERn3UQ5Bm8d+/5LD45qove/Mbss+
	FVnpfad4VNn/pRles1XHTaEtHLHxUbRVdZ1cG+Ka5Wl0WggBQ9sttWVVKxhb5k+V8+MqBUKh9Sr
	YN1Hi949ASb0NEc
X-Received: by 2002:a17:907:930e:b0:c12:3059:4071 with SMTP id a640c23a62f3a-c25571a8f8dmr1145815566b.15.1788023154114;
        Sat, 29 Aug 2026 10:05:54 -0700 (PDT)
Received: from localhost ([2603:5004:20a0:100c:cf7b:6b6c:bc26:7dfa])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c255ee2822esm213925366b.17.2026.08.29.10.05.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 10:05:53 -0700 (PDT)
From: Jerome Tollet <jerome.tollet@gmail.com>
To: Jean Delvare <jdelvare@suse.de>,
	Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	Benoit Masson <yahoo@perenite.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jerome Tollet <jerome.tollet@gmail.com>
Subject: [PATCH v5 2/4] hwmon: it87: prepare for extended PWM temp maps
Date: Sat, 29 Aug 2026 19:05:43 +0200
Message-ID: <20260829170545.33401-3-jerome.tollet@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260829170545.33401-1-jerome.tollet@gmail.com>
References: <20260829170545.33401-1-jerome.tollet@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "benoit.masson" <yahoo@perenite.com>

Introduce helper logic for PWM-to-temperature mappings so newer
register layouts can be supported without affecting legacy chips.

Signed-off-by: benoit.masson <yahoo@perenite.com>
Signed-off-by: Jerome Tollet <jerome.tollet@gmail.com>
---
 drivers/hwmon/it87.c | 199 +++++++++++++++++++++++++++++++++----------
 1 file changed, 154 insertions(+), 45 deletions(-)

diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
index 1c77f6c97..e077adbb3 100644
--- a/drivers/hwmon/it87.c
+++ b/drivers/hwmon/it87.c
@@ -252,6 +252,7 @@ static const u8 IT87_REG_TEMP_OFFSET[] = { 0x56, 0x57, 0x59, 0x5a, 0x90, 0x91 };
 #define IT87_REG_FAN_MAIN_CTRL 0x13
 #define IT87_REG_FAN_CTL       0x14
 static const u8 IT87_REG_PWM[]         = { 0x15, 0x16, 0x17, 0x7f, 0xa7, 0xaf };
+static const u8 IT87_REG_PWM_8665[]    = { 0x15, 0x16, 0x17, 0x1e, 0x1f, 0x92 };
 static const u8 IT87_REG_PWM_DUTY[]    = { 0x63, 0x6b, 0x73, 0x7b, 0xa3, 0xab };
 
 static const u8 IT87_REG_VIN[]	= { 0x20, 0x21, 0x22, 0x23, 0x24, 0x25, 0x26,
@@ -282,6 +283,7 @@ static const u8 IT87_REG_AUTO_BASE[] = { 0x60, 0x68, 0x70, 0x78, 0xa0, 0xa8 };
 #define NUM_VIN_LIMIT		8
 #define NUM_TEMP		6
 #define NUM_TEMP_OFFSET		ARRAY_SIZE(IT87_REG_TEMP_OFFSET)
+#define IT87_PWM_OLD_NUM_TEMP	3
 #define NUM_FAN			ARRAY_SIZE(IT87_REG_FAN)
 #define NUM_FAN_DIV		3
 #define NUM_PWM			ARRAY_SIZE(IT87_REG_PWM)
@@ -291,6 +293,7 @@ struct it87_devices {
 	const char *name;
 	const char * const model;
 	u32 features;
+	const u8 *reg_pwm;
 	u8 num_temp_limit;
 	u8 num_temp_offset;
 	u8 num_temp_map;
@@ -329,6 +332,7 @@ struct it87_devices {
 #define FEAT_FOUR_PWM		BIT(21)	/* Supports four fan controls */
 #define FEAT_FOUR_TEMP		BIT(22)
 #define FEAT_FANCTL_ONOFF	BIT(23)	/* chip has FAN_CTL ON/OFF */
+#define FEAT_NEW_TEMPMAP	BIT(24)	/* PWM uses extended temp map */
 
 static const struct it87_devices it87_devices[] = {
 	[it87] = {
@@ -336,6 +340,7 @@ static const struct it87_devices it87_devices[] = {
 		.model = "IT87F",
 		.features = FEAT_OLD_AUTOPWM | FEAT_FANCTL_ONOFF,
 		/* may need to overwrite */
+		.reg_pwm = IT87_REG_PWM,
 		.num_temp_limit = 3,
 		.num_temp_offset = 0,
 		.num_temp_map = 3,
@@ -345,6 +350,7 @@ static const struct it87_devices it87_devices[] = {
 		.model = "IT8712F",
 		.features = FEAT_OLD_AUTOPWM | FEAT_VID | FEAT_FANCTL_ONOFF,
 		/* may need to overwrite */
+		.reg_pwm = IT87_REG_PWM,
 		.num_temp_limit = 3,
 		.num_temp_offset = 0,
 		.num_temp_map = 3,
@@ -355,6 +361,7 @@ static const struct it87_devices it87_devices[] = {
 		.features = FEAT_16BIT_FANS | FEAT_VID
 		  | FEAT_FAN16_CONFIG | FEAT_FIVE_FANS | FEAT_PWM_FREQ2
 		  | FEAT_FANCTL_ONOFF,
+		.reg_pwm = IT87_REG_PWM,
 		.num_temp_limit = 3,
 		.num_temp_offset = 3,
 		.num_temp_map = 3,
@@ -365,6 +372,7 @@ static const struct it87_devices it87_devices[] = {
 		.features = FEAT_16BIT_FANS | FEAT_VID
 		  | FEAT_TEMP_OLD_PECI | FEAT_FAN16_CONFIG | FEAT_FIVE_FANS
 		  | FEAT_PWM_FREQ2 | FEAT_FANCTL_ONOFF,
+		.reg_pwm = IT87_REG_PWM,
 		.num_temp_limit = 3,
 		.num_temp_offset = 3,
 		.num_temp_map = 3,
@@ -376,6 +384,7 @@ static const struct it87_devices it87_devices[] = {
 		.features = FEAT_16BIT_FANS | FEAT_VID
 		  | FEAT_TEMP_OLD_PECI | FEAT_FAN16_CONFIG | FEAT_FIVE_FANS
 		  | FEAT_PWM_FREQ2 | FEAT_FANCTL_ONOFF,
+		.reg_pwm = IT87_REG_PWM,
 		.num_temp_limit = 3,
 		.num_temp_offset = 3,
 		.num_temp_map = 3,
@@ -388,6 +397,7 @@ static const struct it87_devices it87_devices[] = {
 		  | FEAT_TEMP_OLD_PECI | FEAT_TEMP_PECI
 		  | FEAT_FAN16_CONFIG | FEAT_FIVE_FANS | FEAT_IN7_INTERNAL
 		  | FEAT_PWM_FREQ2 | FEAT_FANCTL_ONOFF,
+		.reg_pwm = IT87_REG_PWM,
 		.num_temp_limit = 3,
 		.num_temp_offset = 3,
 		.num_temp_map = 3,
@@ -401,6 +411,7 @@ static const struct it87_devices it87_devices[] = {
 		  | FEAT_TEMP_PECI | FEAT_FIVE_FANS
 		  | FEAT_IN7_INTERNAL | FEAT_PWM_FREQ2
 		  | FEAT_FANCTL_ONOFF,
+		.reg_pwm = IT87_REG_PWM,
 		.num_temp_limit = 6,
 		.num_temp_offset = 3,
 		.num_temp_map = 3,
@@ -413,6 +424,7 @@ static const struct it87_devices it87_devices[] = {
 		  | FEAT_TEMP_OLD_PECI | FEAT_TEMP_PECI
 		  | FEAT_10_9MV_ADC | FEAT_IN7_INTERNAL | FEAT_FOUR_FANS
 		  | FEAT_FOUR_PWM | FEAT_FANCTL_ONOFF,
+		.reg_pwm = IT87_REG_PWM,
 		.num_temp_limit = 3,
 		.num_temp_offset = 3,
 		.num_temp_map = 3,
@@ -429,6 +441,7 @@ static const struct it87_devices it87_devices[] = {
 				/* 12mV ADC (OHM) */
 				/* 16 bit fans (OHM) */
 				/* three fans, always 16 bit (guesswork) */
+		.reg_pwm = IT87_REG_PWM,
 		.num_temp_limit = 3,
 		.num_temp_offset = 3,
 		.num_temp_map = 3,
@@ -444,6 +457,7 @@ static const struct it87_devices it87_devices[] = {
 				/* 12mV ADC (HWSensors4, OHM) */
 				/* 16 bit fans (HWSensors4, OHM) */
 				/* three fans, always 16 bit (datasheet) */
+		.reg_pwm = IT87_REG_PWM,
 		.num_temp_limit = 3,
 		.num_temp_offset = 3,
 		.num_temp_map = 3,
@@ -455,6 +469,7 @@ static const struct it87_devices it87_devices[] = {
 		.features = FEAT_16BIT_FANS
 		  | FEAT_TEMP_OLD_PECI | FEAT_FAN16_CONFIG | FEAT_PWM_FREQ2
 		  | FEAT_FANCTL_ONOFF,
+		.reg_pwm = IT87_REG_PWM,
 		.num_temp_limit = 3,
 		.num_temp_offset = 3,
 		.num_temp_map = 3,
@@ -466,6 +481,7 @@ static const struct it87_devices it87_devices[] = {
 		.features = FEAT_16BIT_FANS
 		  | FEAT_TEMP_OLD_PECI | FEAT_FAN16_CONFIG | FEAT_PWM_FREQ2
 		  | FEAT_FANCTL_ONOFF,
+		.reg_pwm = IT87_REG_PWM,
 		.num_temp_limit = 3,
 		.num_temp_offset = 3,
 		.num_temp_map = 3,
@@ -477,6 +493,7 @@ static const struct it87_devices it87_devices[] = {
 		.features = FEAT_16BIT_FANS
 		  | FEAT_TEMP_OLD_PECI | FEAT_FAN16_CONFIG | FEAT_PWM_FREQ2
 		  | FEAT_FANCTL_ONOFF,
+		.reg_pwm = IT87_REG_PWM,
 		.num_temp_limit = 3,
 		.num_temp_offset = 3,
 		.num_temp_map = 3,
@@ -488,6 +505,7 @@ static const struct it87_devices it87_devices[] = {
 		.features = FEAT_NEWER_AUTOPWM | FEAT_12MV_ADC | FEAT_16BIT_FANS
 		  | FEAT_TEMP_PECI | FEAT_IN7_INTERNAL
 		  | FEAT_PWM_FREQ2 | FEAT_FANCTL_ONOFF,
+		.reg_pwm = IT87_REG_PWM,
 		.num_temp_limit = 3,
 		.num_temp_offset = 3,
 		.num_temp_map = 3,
@@ -499,6 +517,7 @@ static const struct it87_devices it87_devices[] = {
 		.features = FEAT_NEWER_AUTOPWM | FEAT_12MV_ADC | FEAT_16BIT_FANS
 		  | FEAT_TEMP_PECI | FEAT_IN7_INTERNAL
 		  | FEAT_PWM_FREQ2 | FEAT_FANCTL_ONOFF | FEAT_NOCONF,
+		.reg_pwm = IT87_REG_PWM,
 		.num_temp_limit = 3,
 		.num_temp_offset = 3,
 		.num_temp_map = 3,
@@ -511,6 +530,7 @@ static const struct it87_devices it87_devices[] = {
 		  | FEAT_TEMP_OLD_PECI | FEAT_TEMP_PECI
 		  | FEAT_10_9MV_ADC | FEAT_IN7_INTERNAL | FEAT_FANCTL_ONOFF
 		  | FEAT_NOCONF,
+		.reg_pwm = IT87_REG_PWM,
 		.num_temp_limit = 3,
 		.num_temp_offset = 3,
 		.num_temp_map = 3,
@@ -523,6 +543,7 @@ static const struct it87_devices it87_devices[] = {
 		.features = FEAT_NEWER_AUTOPWM | FEAT_12MV_ADC | FEAT_16BIT_FANS
 		  | FEAT_TEMP_PECI | FEAT_IN7_INTERNAL
 		  | FEAT_AVCC3 | FEAT_PWM_FREQ2,
+		.reg_pwm = IT87_REG_PWM,
 		.num_temp_limit = 3,
 		.num_temp_offset = 3,
 		.num_temp_map = 4,
@@ -535,6 +556,7 @@ static const struct it87_devices it87_devices[] = {
 		  | FEAT_TEMP_PECI | FEAT_SIX_FANS
 		  | FEAT_IN7_INTERNAL | FEAT_SIX_PWM | FEAT_PWM_FREQ2
 		  | FEAT_SIX_TEMP | FEAT_VIN3_5V | FEAT_FANCTL_ONOFF,
+		.reg_pwm = IT87_REG_PWM,
 		.num_temp_limit = 3,
 		.num_temp_offset = 3,
 		.num_temp_map = 3,
@@ -547,6 +569,7 @@ static const struct it87_devices it87_devices[] = {
 		  | FEAT_TEMP_PECI | FEAT_FIVE_FANS
 		  | FEAT_FIVE_PWM | FEAT_IN7_INTERNAL | FEAT_PWM_FREQ2
 		  | FEAT_AVCC3 | FEAT_VIN3_5V | FEAT_FOUR_TEMP,
+		.reg_pwm = IT87_REG_PWM_8665,
 		.num_temp_limit = 3,
 		.num_temp_offset = 3,
 		.num_temp_map = 4,
@@ -560,6 +583,7 @@ static const struct it87_devices it87_devices[] = {
 		  | FEAT_TEMP_PECI | FEAT_SIX_FANS
 		  | FEAT_IN7_INTERNAL | FEAT_SIX_PWM | FEAT_PWM_FREQ2
 		  | FEAT_SIX_TEMP | FEAT_VIN3_5V | FEAT_FANCTL_ONOFF,
+		.reg_pwm = IT87_REG_PWM,
 		.num_temp_limit = 6,
 		.num_temp_offset = 3,
 		.num_temp_map = 3,
@@ -572,6 +596,7 @@ static const struct it87_devices it87_devices[] = {
 		  | FEAT_SIX_FANS | FEAT_IN7_INTERNAL
 		  | FEAT_SIX_PWM | FEAT_PWM_FREQ2 | FEAT_SIX_TEMP | FEAT_AVCC3
 		  | FEAT_FANCTL_ONOFF,
+		.reg_pwm = IT87_REG_PWM,
 		.num_temp_limit = 3,
 		.num_temp_offset = 3,
 		.num_temp_map = 3,
@@ -584,6 +609,7 @@ static const struct it87_devices it87_devices[] = {
 		  | FEAT_TEMP_OLD_PECI | FEAT_TEMP_PECI
 		  | FEAT_10_9MV_ADC | FEAT_IN7_INTERNAL | FEAT_FANCTL_ONOFF
 		  | FEAT_NOCONF,
+		.reg_pwm = IT87_REG_PWM,
 		.num_temp_limit = 3,
 		.num_temp_offset = 3,
 		.num_temp_map = 3,
@@ -626,6 +652,7 @@ static const struct it87_devices it87_devices[] = {
 #define has_scaling(data)	((data)->features & (FEAT_12MV_ADC | \
 						     FEAT_10_9MV_ADC))
 #define has_fanctl_onoff(data)	((data)->features & FEAT_FANCTL_ONOFF)
+#define has_new_tempmap(data)	((data)->features & FEAT_NEW_TEMPMAP)
 
 struct it87_sio_data {
 	int sioaddr;
@@ -655,6 +682,7 @@ struct it87_data {
 	int sioaddr;
 	enum chips type;
 	u32 features;
+	const u8 *reg_pwm;
 	u8 num_temp_limit;
 	u8 num_temp_offset;
 	u8 num_temp_map;
@@ -704,7 +732,9 @@ struct it87_data {
 	u8 has_pwm;		/* Bitfield, pwm control enabled */
 	u8 pwm_ctrl[NUM_PWM];	/* Register value */
 	u8 pwm_duty[NUM_PWM];	/* Manual PWM value set by user */
-	u8 pwm_temp_map[NUM_PWM];/* PWM to temp. chan. mapping (bits 1-0) */
+	u8 pwm_temp_map[NUM_PWM];/* PWM to temp. chan. mapping */
+	u8 pwm_temp_map_mask;
+	u8 pwm_temp_map_shift;
 
 	/* Automatic fan speed control registers */
 	u8 auto_pwm[NUM_AUTO_PWM][4];	/* [nr][3] is hard-coded */
@@ -786,6 +816,71 @@ static int pwm_from_reg(const struct it87_data *data, u8 reg)
 		return (reg & 0x7f) << 1;
 }
 
+static inline u8 pwm_temp_map_get(const struct it87_data *data, u8 ctrl)
+{
+	return (ctrl >> data->pwm_temp_map_shift) &
+		data->pwm_temp_map_mask;
+}
+
+static inline u8 pwm_temp_map_set(const struct it87_data *data, u8 ctrl,
+				  u8 map)
+{
+	ctrl &= ~(data->pwm_temp_map_mask << data->pwm_temp_map_shift);
+	return ctrl | ((map & data->pwm_temp_map_mask)
+		       << data->pwm_temp_map_shift);
+}
+
+static inline u8 pwm_num_temp_map(const struct it87_data *data)
+{
+	return data->num_temp_map;
+}
+
+static unsigned int pwm_temp_channel(const struct it87_data *data,
+				     int nr, u8 map)
+{
+	if (has_new_tempmap(data)) {
+		u8 num = pwm_num_temp_map(data);
+
+		if (map >= num)
+			map = 0;
+		return map;
+	}
+
+	if (map >= IT87_PWM_OLD_NUM_TEMP)
+		map = 0;
+
+	if (nr >= IT87_PWM_OLD_NUM_TEMP)
+		map += IT87_PWM_OLD_NUM_TEMP;
+
+	return map;
+}
+
+static int pwm_temp_map_from_channel(const struct it87_data *data, int nr,
+				     unsigned int channel, u8 *map)
+{
+	if (has_new_tempmap(data)) {
+		u8 num = pwm_num_temp_map(data);
+
+		if (channel >= num)
+			return -EINVAL;
+		*map = channel;
+		return 0;
+	}
+
+	if (nr >= IT87_PWM_OLD_NUM_TEMP) {
+		if (channel < IT87_PWM_OLD_NUM_TEMP ||
+		    channel >= 2 * IT87_PWM_OLD_NUM_TEMP)
+			return -EINVAL;
+		channel -= IT87_PWM_OLD_NUM_TEMP;
+	} else {
+		if (channel >= IT87_PWM_OLD_NUM_TEMP)
+			return -EINVAL;
+	}
+
+	*map = channel;
+	return 0;
+}
+
 static int DIV_TO_REG(int val)
 {
 	int answer = 0;
@@ -797,6 +892,11 @@ static int DIV_TO_REG(int val)
 
 #define DIV_FROM_REG(val) BIT(val)
 
+static inline u16 it87_reg_pwm(const struct it87_data *data, int nr)
+{
+	return data->reg_pwm[nr];
+}
+
 /*
  * PWM base frequencies. The frequency has to be divided by either 128 or 256,
  * depending on the chip type, to calculate the actual PWM frequency.
@@ -877,14 +977,22 @@ static void it87_write_value(struct it87_data *data, u8 reg, u8 value)
 
 static void it87_update_pwm_ctrl(struct it87_data *data, int nr)
 {
-	data->pwm_ctrl[nr] = it87_read_value(data, IT87_REG_PWM[nr]);
+	data->pwm_ctrl[nr] = it87_read_value(data, it87_reg_pwm(data, nr));
 	if (has_newer_autopwm(data)) {
-		data->pwm_temp_map[nr] = data->pwm_ctrl[nr] & 0x03;
+		data->pwm_temp_map[nr] =
+			pwm_temp_map_get(data, data->pwm_ctrl[nr]);
+		if (has_new_tempmap(data) &&
+		    data->pwm_temp_map[nr] >= pwm_num_temp_map(data))
+			data->pwm_temp_map[nr] = 0;
 		data->pwm_duty[nr] = it87_read_value(data,
 						     IT87_REG_PWM_DUTY[nr]);
 	} else {
 		if (data->pwm_ctrl[nr] & 0x80)	/* Automatic mode */
-			data->pwm_temp_map[nr] = data->pwm_ctrl[nr] & 0x03;
+			data->pwm_temp_map[nr] =
+				pwm_temp_map_get(data, data->pwm_ctrl[nr]);
+		if (has_new_tempmap(data) &&
+		    data->pwm_temp_map[nr] >= pwm_num_temp_map(data))
+			data->pwm_temp_map[nr] = 0;
 		else				/* Manual mode */
 			data->pwm_duty[nr] = data->pwm_ctrl[nr] & 0x7f;
 	}
@@ -1617,6 +1725,8 @@ static ssize_t set_pwm_enable(struct device *dev, struct device_attribute *attr,
 	if (err)
 		return err;
 
+	it87_update_pwm_ctrl(data, nr);
+
 	if (val == 0) {
 		if (nr < 3 && has_fanctl_onoff(data)) {
 			int tmp;
@@ -1636,27 +1746,30 @@ static ssize_t set_pwm_enable(struct device *dev, struct device_attribute *attr,
 					 data->pwm_duty[nr]);
 			/* and set manual mode */
 			if (has_newer_autopwm(data)) {
-				ctrl = (data->pwm_ctrl[nr] & 0x7c) |
-					data->pwm_temp_map[nr];
+				ctrl = pwm_temp_map_set(data,
+							data->pwm_ctrl[nr] &
+							~0x80,
+							data->pwm_temp_map[nr]);
 			} else {
 				ctrl = data->pwm_duty[nr];
 			}
 			data->pwm_ctrl[nr] = ctrl;
-			it87_write_value(data, IT87_REG_PWM[nr], ctrl);
+			it87_write_value(data, it87_reg_pwm(data, nr), ctrl);
 		}
 	} else {
 		u8 ctrl;
 
 		if (has_newer_autopwm(data)) {
-			ctrl = (data->pwm_ctrl[nr] & 0x7c) |
-				data->pwm_temp_map[nr];
+			ctrl = pwm_temp_map_set(data,
+						data->pwm_ctrl[nr] & ~0x80,
+						data->pwm_temp_map[nr]);
 			if (val != 1)
 				ctrl |= 0x80;
 		} else {
 			ctrl = (val == 1 ? data->pwm_duty[nr] : 0x80);
 		}
 		data->pwm_ctrl[nr] = ctrl;
-		it87_write_value(data, IT87_REG_PWM[nr], ctrl);
+		it87_write_value(data, it87_reg_pwm(data, nr), ctrl);
 
 		if (has_fanctl_onoff(data) && nr < 3) {
 			/* set SmartGuardian mode */
@@ -1707,7 +1820,7 @@ static ssize_t set_pwm(struct device *dev, struct device_attribute *attr,
 		 */
 		if (!(data->pwm_ctrl[nr] & 0x80)) {
 			data->pwm_ctrl[nr] = data->pwm_duty[nr];
-			it87_write_value(data, IT87_REG_PWM[nr],
+			it87_write_value(data, it87_reg_pwm(data, nr),
 					 data->pwm_ctrl[nr]);
 		}
 	}
@@ -1762,20 +1875,14 @@ static ssize_t show_pwm_temp_map(struct device *dev,
 	struct sensor_device_attribute *sensor_attr = to_sensor_dev_attr(attr);
 	struct it87_data *data = it87_update_device(dev);
 	int nr = sensor_attr->index;
-	u8 num_map;
-	int map;
+	unsigned int channel;
 
 	if (IS_ERR(data))
 		return PTR_ERR(data);
 
-	num_map = data->num_temp_map;
-	map = data->pwm_temp_map[nr];
-	if (map >= num_map)
-		map = 0;	/* Should never happen */
-	if (nr >= num_map)	/* pwm channels 3..6 map to temp4..6 */
-		map += num_map;
+	channel = pwm_temp_channel(data, nr, data->pwm_temp_map[nr]);
 
-	return sprintf(buf, "%d\n", (int)BIT(map));
+	return sprintf(buf, "%d\n", (int)BIT(channel));
 }
 
 static ssize_t set_pwm_temp_map(struct device *dev,
@@ -1785,45 +1892,34 @@ static ssize_t set_pwm_temp_map(struct device *dev,
 	struct sensor_device_attribute *sensor_attr = to_sensor_dev_attr(attr);
 	struct it87_data *data = dev_get_drvdata(dev);
 	int nr = sensor_attr->index;
-	u8 num_map = data->num_temp_map;
 	long val;
 	int err;
-	u8 reg;
+	unsigned int channel;
+	u8 map;
 
-	if (kstrtol(buf, 10, &val) < 0)
+	if (kstrtol(buf, 10, &val) < 0 || val <= 0 || !is_power_of_2(val))
 		return -EINVAL;
 
-	if (nr >= num_map)
-		val -= num_map;
-
-	switch (val) {
-	case BIT(0):
-		reg = 0x00;
-		break;
-	case BIT(1):
-		reg = 0x01;
-		break;
-	case BIT(2):
-		reg = 0x02;
-		break;
-	default:
+	channel = __ffs(val);
+	if (pwm_temp_map_from_channel(data, nr, channel, &map))
 		return -EINVAL;
-	}
 
 	err = it87_lock(data);
 	if (err)
 		return err;
 
 	it87_update_pwm_ctrl(data, nr);
-	data->pwm_temp_map[nr] = reg;
+	data->pwm_temp_map[nr] = map;
 	/*
 	 * If we are in automatic mode, write the temp mapping immediately;
 	 * otherwise, just store it for later use.
 	 */
 	if (data->pwm_ctrl[nr] & 0x80) {
-		data->pwm_ctrl[nr] = (data->pwm_ctrl[nr] & 0xfc) |
-						data->pwm_temp_map[nr];
-		it87_write_value(data, IT87_REG_PWM[nr], data->pwm_ctrl[nr]);
+		data->pwm_ctrl[nr] = pwm_temp_map_set(data,
+						      data->pwm_ctrl[nr],
+						      data->pwm_temp_map[nr]);
+		it87_write_value(data, it87_reg_pwm(data, nr),
+				 data->pwm_ctrl[nr]);
 	}
 	it87_unlock(data);
 	return count;
@@ -3422,7 +3518,10 @@ static void it87_init_device(struct platform_device *pdev)
 	 * manual duty cycle.
 	 */
 	for (i = 0; i < NUM_AUTO_PWM; i++) {
-		data->pwm_temp_map[i] = i;
+		if (has_new_tempmap(data))
+			data->pwm_temp_map[i] = 0;
+		else
+			data->pwm_temp_map[i] = i % IT87_PWM_OLD_NUM_TEMP;
 		data->pwm_duty[i] = 0x7f;	/* Full speed */
 		data->auto_pwm[i][3] = 0x7f;	/* Full speed, hard-coded */
 	}
@@ -3494,7 +3593,8 @@ static int it87_check_pwm(struct device *dev)
 
 			for (i = 0; i < ARRAY_SIZE(pwm); i++)
 				pwm[i] = it87_read_value(data,
-							 IT87_REG_PWM[i]);
+							 it87_reg_pwm(data,
+								      i));
 
 			/*
 			 * If any fan is in automatic pwm mode, the polarity
@@ -3509,7 +3609,8 @@ static int it87_check_pwm(struct device *dev)
 						 tmp | 0x87);
 				for (i = 0; i < 3; i++)
 					it87_write_value(data,
-							 IT87_REG_PWM[i],
+							 it87_reg_pwm(data,
+								      i),
 							 0x7f & ~pwm[i]);
 				return 1;
 			}
@@ -3558,11 +3659,19 @@ static int it87_probe(struct platform_device *pdev)
 	data->ec_special_config = sio_data->ec_special_config;
 	chip = &it87_devices[sio_data->type];
 	data->features = chip->features;
+	data->reg_pwm = chip->reg_pwm;
 	data->peci_mask = chip->peci_mask;
 	data->old_peci_mask = chip->old_peci_mask;
 	data->num_temp_limit = chip->num_temp_limit;
 	data->num_temp_offset = chip->num_temp_offset;
 	data->num_temp_map = chip->num_temp_map;
+	if (has_new_tempmap(data)) {
+		data->pwm_temp_map_mask = 0x07;
+		data->pwm_temp_map_shift = 3;
+	} else {
+		data->pwm_temp_map_mask = 0x03;
+		data->pwm_temp_map_shift = 0;
+	}
 	/*
 	 * IT8705F Datasheet 0.4.1, 3h == Version G.
 	 * IT8712F Datasheet 0.9.1, section 8.3.5 indicates 8h == Version J.
-- 
2.55.0


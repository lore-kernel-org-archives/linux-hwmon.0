Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795693119;
	b=VyoLhw1OUx2AmbPCJt5lF3vzw2AB5aRa26Fus1wFL9zch7M2zObr17WmtwFEUyiv9RJv
	 pilqz6CC0kJvJCmmlhFRpDZq/u+RI6XVv11yKt3WenTnu5mxMEZkzu2JDzS+CezjdTYJb
	 PF0+0ITl/25plhvKmt/iwdKuMXRJdwZz4oAlnS31+5xERjIdfQUIsB9FWaL2P7wasL/Vx
	 afrkuv3UKkcN2Vn+ccjJr3rf6mTe6Po90juSMROtcw17pDSmPxr076yqMSfp7j6dENpAr
	 iFdCZov/+64JCIwllJSAMyz8C3lO5yNhPKP+dCkQ7Af3ld62XyrCbawKqoK62GY2GEQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795693119;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:MIME-Version:
	 Received:From:In-Reply-To:References:Date:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=twftH/O+9Tvm355YgCHDy+xTcEW42BibUem6V86vQ6A=;
	b=26DXxjleY7c7wepeQR26iOSDBTKeLksd0aE6fLUcFcrRVNtpfRFCaSuNHo7iCTiN8ySq
	 +AQj8iH/Ogace4GGuGiI7zSOJapAGgXHhhe3w2ix/bh6U0gOYFTReYsYPIdBt5yKYSoMn
	 PucMmodcsLMm3UlHHPteMFpdFDZS79UwiICU6mzMG8rTFt0HTGC18p9sBcyeal7zm4ig6
	 c68IDxj9BqzaKnl8zvWxZxEMyiAkD7VUMgusPty4rcOyknPV1/XrNZcXjCG/4nZCHeIL9
	 p7xIH1tALoaSXlOJ9/BkjKOm2zx7FRPq1XEJdBuTHGd/Hc9hDG1hCB8H6m34DF8sVWw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JX5LvqVs;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.178
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E717A606A31E
	for <linux-hwmon@vger.kernel.org>; Thu, 26 Nov 2026 11:38:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E717A606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JX5LvqVs
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-55c4e670fc6so53377221cf.0
        for <linux-hwmon@vger.kernel.org>; Thu, 26 Nov 2026 03:38:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795693118; cv=none;
        d=google.com; s=arc-20260327;
        b=k4eJ2QopXOYjP4N7mA2tzZ+Wo+OE9RvE5k2WsmeoKdYOTiry9rM6VQsQ1RUKdcYjbG
         +VtMHwhMtDwgWuWDatZByoY4hx+96VfT2QF2qLKWr8eORs6tj2Nn3GVudEYtpw2FPRr0
         M3YniJDJwtEwtwgyQSJviJTOCoeNDN/iI8NPip4bHFfitRZ10eNvu9PTE5NlP1db8wcm
         SK3iFrNZnlzjolploVWdzK+79hN1TETADDkPWM/6KAmAhs6tAaasl/HpJo0xGLCBjnU/
         n5UJMGxJbxowxKPEYX/Ev0iB39aLJBuQ4TtJBgqgFj/PaiJc1tZfDXKsDNWiUn+bgK7N
         Rzzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:dkim-signature;
        bh=twftH/O+9Tvm355YgCHDy+xTcEW42BibUem6V86vQ6A=;
        fh=0C/NacxPb8rIaU32p77Pdl7otf8ET0q++Gp87p+c9qI=;
        b=bWKBfVciWVKXW1qV0GuFiU3q7PDS9G2e+19ZIWiBI4r+9EzPdd1Y2Sq4PZPYibm6H4
         SUYxxFSR6mdAnmc3dotRyROj+ZLwupP9kznJcTUG8knNgO05jsSn2/gUWzPvHGH9ml4K
         bC9aUmi76ulb/vz6QiCvGtXbfSSdmGv0ckICR8f/V/ZDYN+atG36Nq2+G2QhvIfFy7it
         garG4DZncY5Sey9B/mFXnAwWOxFjXNOKI+/GcPzdtmb0MXaV/fiLCOId0fMDYTh0xipO
         3qHtXhLJKaFm1CuNVfxSdZ+ntRYq2zZZdQ8AeFhgPGE3I7RTy3GUEqcpt4LH2g8NjtNe
         8D/w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795693118; x=1796297918; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=twftH/O+9Tvm355YgCHDy+xTcEW42BibUem6V86vQ6A=;
        b=JX5LvqVsefqInXa4t79u7o0ln299cW4edgAB71wtxP1+QX8dBnrrDb23RJ17nc0ADI
         ZCjqk3t3aEqb0QCkZ1DFgTMPyCRnVjyCquNnS4x4Dki9M1Cii8SYyBA9d8bxHgbin618
         pRqLsz3BxJTthOOhkKueXMJK8+fpK4YFJJNTfGGPhbQJ94wrkfVJAPYqtvCP0e2NF6ON
         /vobetnkPkyilCaw+EEREadh9Thyz/acpq76K1MFOWiVRjQ+J02qxPU1XBONDPilQaKJ
         k4xC0Z4V0brMB7ErTIoIdRTNEqQxEFozDkamy1V4XVw1g/SR+GRVHFPzIrnBbptRptkn
         OqIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795693118; x=1796297918;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=twftH/O+9Tvm355YgCHDy+xTcEW42BibUem6V86vQ6A=;
        b=toDhzdvsP+86w7u01KL19lyVJGd+prYMfA1BdworlmcYlEAhzDYBdlf5HxXgZXnTE4
         gD9GA1wZ7ZjjabH5BoMlFqVZOr/KPsw2mEQ19Y6Im94snCrerSKokXTUdINLpGViOuuu
         lSa0Eb8q4ZprFy3QYZ6GzLIXaAqgOceKZ8rAw00KTV5PNDwgMw+H9DOK1yx7/60YXuBe
         Zr9sSsE4ZlBudZ1VJogT77rUJwv1/ZaHp4Z82BpE36gNY5txVs45Agr7bauRprlO5Gsg
         sabDLq5TFnCpmwABua+vGXBoN00k4PZEgNJofIH6/VxPVGmK/evb7fbFfGkPHV8raG5r
         +14Q==
X-Gm-Message-State: APuU4Z++HdupP5RNoeTn69RNwFfIEAi+JPSQBBFZHNtvzFjfjmk+b8B4
	hA+ny6X3JLY4h3VMrdY8N3US1mxlveF1R218LmZuSICXrs+u2EJ10ykBMnjKPhTlokMag0NO/Zd
	03DotMPPRd4hdSpqVuluxNkeLm/cpoUanjw==
X-Gm-Gg: AZFdTZdF0VLjMOVL6MixM61AB6SwqAe+Lk0+5bhgMxlR8urtIcB04OFlS9hppVoScH8
	PSpQijaZpswbEByw7UzhYzscrzhuaZMB2xVWKl1q3ZsRfN+92ulHXP0b8/bSHNRv9PzO+A/lVQq
	Z5msNwK8NH0xlXNlp+ly7DglpO73LDSMqNm9LLRCFTIZRQm9dYqOczEEY+I5/o0zAqL2PbH7dih
	OU0brQVQgVXZzR116ab98b7EflBQ8G3tBNoPmoG3FcSDecDpZrPiL/9EqMORewWqHo781qJGzcG
	xBlKZmv2YQcrsQsTuAABUNsS0b4+4pPtebMqUaLlDjoUf5Y+z9wFPNz1egjwIJF1fVW3NVcpa2P
	wIYtsbK8ES3PXyqaY/3XGIOFN2uy19H+HK7ZLpA==
X-Received: by 2002:ac8:5a53:0:b0:533:8f29:e5fd with SMTP id
 d75a77b69052e-55d769e8b63mr400575511cf.18.1795693117805; Thu, 26 Nov 2026
 03:38:37 -0800 (PST)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 26 Nov 2026 05:38:37 -0600
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 26 Nov 2026 11:38:33 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Received: from 77377267392	named unknown	by gmailapi.google.com	with HTTPREST;
 Thu, 26 Nov 2026 11:38:29 +0000
From: jdenheijer74@gmail.com
In-Reply-To: <CAP-m2G6VwPqTOZ_uQEAsWnb=j4yFj+_N0V33gOTL5kRYwwYbvg@mail.gmail.com>
References: <CAP-m2G6VwPqTOZ_uQEAsWnb=j4yFj+_N0V33gOTL5kRYwwYbvg@mail.gmail.com>
Date: Thu, 26 Nov 2026 05:38:37 -0600
X-Gm-Features: Aa3M54q4-kZJy8wYz6_G3TvyADzkTSQbUuuemezROY7pVvFn93J4EOmHtZxowx4
Message-ID: <CAP-m2G5YnLTiAEnVEhCWEYdH7nyZsP3jfpOBCaKC=-OK+y-1nw@mail.gmail.com>
Subject: [RFC PATCH 3/3] hwmon: (asus-ec-sensors) add MAXIMUS XI HERO EXT thermistors
To: linux-hwmon@vger.kernel.org
Cc: eugene.shalygin@gmail.com, linux@roeck-us.net
Content-Type: text/plain; charset="UTF-8"

BIOS 2004 maps the three optional Fan Extension Card thermistors to EC
bank-0 registers 0x60, 0x61 and 0x62. Its getter writes 0x68=0x07
immediately before each read.

Reproduce that sequence only for the opted-in non-WiFi XI HERO and
return -ENODATA for firmware-invalid values. The bit-level meaning of
0x68 is not established.

Signed-off-by: John den Heijer <jdenheijer74@gmail.com>
---
 drivers/hwmon/asus-ec-sensors.c | 27 ++++++++++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/asus-ec-sensors.c b/drivers/hwmon/asus-ec-sensors.c
index 45beba10f..09bfccf58 100644
--- a/drivers/hwmon/asus-ec-sensors.c
+++ b/drivers/hwmon/asus-ec-sensors.c
@@ -49,6 +49,8 @@ static bool enable_ext_fan;
 #define ASUS_EC_EXT_FAN_RPM_MIN	0xa5
 #define ASUS_EC_EXT_FAN_ENABLE_REGISTER	0xd4
 #define ASUS_EC_EXT_FAN_CHANNEL_REGISTER	0x89
+#define ASUS_EC_EXT_TEMP_PREPARE_REGISTER	0x68
+#define ASUS_EC_EXT_TEMP_PREPARE_VALUE	0x07
 #define SENSOR_LABEL_LEN	16

 /*
@@ -413,6 +415,13 @@ static const struct ec_sensor_info
sensors_family_intel_300[] = {
 	[ec_sensor_temp_t_sensor] =
 		EC_SENSOR("T_Sensor", hwmon_temp, 1, 0x00, 0x3d),
 	[ec_sensor_temp_vrm] = EC_SENSOR("VRM", hwmon_temp, 1, 0x00, 0x3e),
+	/* BIOS 2004 properties 0x06030032, 0x06030034, 0x06030036 */
+	[ec_sensor_temp_sensor_extra_1] =
+		EC_SENSOR("EXT_Sensor1", hwmon_temp, 1, 0x00, 0x60),
+	[ec_sensor_temp_sensor_extra_2] =
+		EC_SENSOR("EXT_Sensor2", hwmon_temp, 1, 0x00, 0x61),
+	[ec_sensor_temp_sensor_extra_3] =
+		EC_SENSOR("EXT_Sensor3", hwmon_temp, 1, 0x00, 0x62),
 	[ec_sensor_fan_cpu_opt] =
 		EC_SENSOR("CPU_Opt", hwmon_fan, 2, 0x00, 0xb0),
 	[ec_sensor_fan_vrm_hs] = EC_SENSOR("VRM HS", hwmon_fan, 2, 0x00, 0xb2),
@@ -1409,6 +1418,15 @@ static int asus_ec_block_read(const struct device *dev,
 				if (status)
 					goto restore_select;
 			}
+			/* BIOS 2004 performs this write before each EXT probe read. */
+			if (ec->ext_fan_enabled && !bank &&
+			    register_index(ec->registers[ireg]) >= 0x60 &&
+			    register_index(ec->registers[ireg]) <= 0x62) {
+				status = ec_write(ASUS_EC_EXT_TEMP_PREPARE_REGISTER,
+						  ASUS_EC_EXT_TEMP_PREPARE_VALUE);
+				if (status)
+					goto restore_select;
+			}
 			status = ec_read(register_index(ec->registers[ireg]),
 					 ec->read_buffer + ireg);
 			if (status)
@@ -1562,6 +1580,10 @@ static int asus_ec_hwmon_read(struct device
*dev, enum hwmon_sensor_types type,
 	    ec_sensor <= ec_sensor_fan_ext_3 && value < ASUS_EC_EXT_FAN_RPM_MIN)
 		value = 0;
 	if (sensor_info->type == hwmon_temp) {
+		if (state->ext_fan_enabled &&
+		    ec_sensor >= ec_sensor_temp_sensor_extra_1 &&
+		    ec_sensor <= ec_sensor_temp_sensor_extra_3 && value < -50)
+			return -ENODATA;
 		if ((environment_temp_sensors & BIT(ec_sensor)) &&
 		    is_blank_temperature_value(value))
 			return -ENODATA;
@@ -1663,7 +1685,10 @@ static int asus_ec_probe(struct platform_device *pdev)
 				   enable_ext_fan;
 	if (ec_data->ext_fan_enabled)
 		ec_data->sensor_mask |= SENSOR_FAN_EXT_1 |
-					SENSOR_FAN_EXT_2 | SENSOR_FAN_EXT_3;
+					SENSOR_FAN_EXT_2 | SENSOR_FAN_EXT_3 |
+					SENSOR_TEMP_SENSOR_EXTRA_1 |
+					SENSOR_TEMP_SENSOR_EXTRA_2 |
+					SENSOR_TEMP_SENSOR_EXTRA_3;

 	switch (ec_data->board_info->family) {
 	case family_amd_400_series:
-- 
2.53.0

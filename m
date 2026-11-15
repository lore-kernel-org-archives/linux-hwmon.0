Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794753471;
	b=3I60lSSt7xMPlnaMo8xvk5Y773keba0oCWsqR18Jj51FEU2GuigAPxWu2+dACWpdUTwJ
	 MGo7KA6IAELojEIqqnODVaA73vbnzonZixVhExKwu2NkGtzvGStJMTm7EhA8OEaYhgoTB
	 zgg1jJtxAdDHo9aolReLOGsecgHHbAWiJ5BTQYG6wecO4Omn/Drxc03plHUALMV2fG3CF
	 mwNCCQG7SML+LeWhvecoNe5VRpVKou+2lyeiYC2stqNPBFeXcUt5kvXI8kg9m9OmaexU6
	 fqLfuY3/pOSHSXQmgNqNOh0WTh4bZndKBfLyN/uKvJdPMm4YKIMXuxwzJiRze7dYxRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794753471;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=zDUExgrMaoh/VU17XaoUnPzz6JzmJmPUUbcmokU34d0=;
	b=tLzaCsgno8QjZwNkOHZUuHwa0Oqqk/bFAL6C3cTPbOMd2VMEMWZ/HEiuhdlWseb0ns1l
	 oCmujjqMHcE3SlDWuXkzjV2rtU6cBrpzuepgTDNmkE0BE3Ph27FqM4nsvlkg/3sROGT8R
	 tvR4Qc/Zc0Iyb7o5DtoO9sMAmqebMXoB8IOmtfx0LNAJtPcasu8geCdkKbpHtWyl5O3Xr
	 vlujmexaAUHqFLhHt+64ms/otSksAE/SUe6r0lcuwXihmn0LA4CwQCju3yfwBdGAeOMYv
	 86BfTxQ4mge8G4QsfXDr+zUQmA6PyQBnUPDPZsL33CzDIHNRCxRt9YsYZZ2NCEowCGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x6Z8Fjkv;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81DF6606A32E
	for <linux-hwmon@vger.kernel.org>; Sun, 15 Nov 2026 14:37:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81DF6606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x6Z8Fjkv
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4bb55cda775so10843685e9.0
        for <linux-hwmon@vger.kernel.org>; Sun, 15 Nov 2026 06:37:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794753470; x=1795358270; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zDUExgrMaoh/VU17XaoUnPzz6JzmJmPUUbcmokU34d0=;
        b=x6Z8FjkvPsyI6t8OWPV7fRL05lfNGs4g3260Btsy1QNaVVax1BMoaAgiTNar5b1gim
         TRO1dP4cJe0x1CGpgH3X943I/hs/M/ri+Ma8YoA5ycJblZcfAFkf63JVluLerfrZjNgh
         EmWTtpM8ltUQnHjw2pauH0cpbQauU0imoCMMONs+VyHN0z945NTGHr1e0K4l9/Qb6l3S
         tx80cgEweFHH0V0sRXUUnbPS3obLKxPAo1kgTMgdCvgvdSxv+/W/++fVOVbCWAWdlQ8G
         /WssIRjdsoB0UQTyQ005GD424K5WehYgOWZ3esGDvBX4tAnSrbhZvU1q5m+/gI3/9ZQC
         lUtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794753470; x=1795358270;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zDUExgrMaoh/VU17XaoUnPzz6JzmJmPUUbcmokU34d0=;
        b=pPeo/MXi4HeKZ8aX0jYRWlKxd8bagkuxHQn68u8NtCejsPOzbnLH8ujm7xNtL8mSTq
         75gVZ582XHmOesTQ8Sxc+gHBHu0cdgQ+uKUdjNlacAN8WXkKwyaJFneoxzrQNdtSvIUf
         zDHx8wpHY1DhopbbgbgOfVZXex5CRwEwJbjr6omIQ0Q9mHXST5Oi2uc5YiEwTnCXFHGP
         d4fTq3LaOuSTU6KhNM9c13sQlftrG4Dmkwceh7SBWQgKRIXOcgTuKHT6hK93pFQxu//C
         taWZEwXd28QWRQYnuxGDvk/AlUPMetGRwN9SD1HFGnnsRV5A7lX128COG2+pO6LeUD9h
         K6bw==
X-Forwarded-Encrypted: i=1; AL+hErFi6Yl7OgttQeTKfFTwJiNulmcmu4aspSh1OQzX72g9xCPrZtwZJBwH2F5snqjedhlHOq1ri+1pqaXJDA==@vger.kernel.org
X-Gm-Message-State: APuU4Z8+MPIo/HQQLmMB+9kgdRmzEv6p53wApbRH2N9NPqb+q66qcfzc
	WEtZTeHpT/jhY+qT/be/yRBws7HNjVgD+K9QjQ1iQ0F9uivWWqCFoACQ
X-Gm-Gg: AYBFou2Cdj0dfLUUy4ymu1/PiHJlM5jrbHmd75QwYos4qrjp3/fm5fes9lzmeiYjLPR
	PGjihAyquMNqGfLOqK9rYx5Pi9fxaUr1HiSbVoa7ygbbCj9+xU9lkP2NqaE8KReZaF9NcXHYU8Z
	ruxLst1UbaY6m+1a5uP99uKaKer9B/gAcYLLp3fDBX3M63Zg4O2ZBYdISxERoDmdZDRl3GqpEN3
	snfHmBp3jef3fofayheYrxk8lW9Jz7gd2gfHu57fHJz1KiTa0lLawXEeC11ir4KKYzc8KLEMI1S
	F6p3k9Q1hbzQvHsx9QtGBFQhv4IKtc3VbWZWW0BJaaU2gHobsqXDhf3X39En1DdQzjiCPGq6kIE
	HkhtCpdh+rT3CD6O4DvQ2jXh4rSaXStqnsNFuKPOYn0KTN9M9qDk/muzPc2WRi+1ambWbmawtjq
	IjQv80coyTghnz+YtIDZjAqniU7wL9Agn4peiW5q75/cQ1u6ulrdBOsB9nqQY9zZJrpqp86YNTD
	d3QCQiimppzNbIOEg+xGzYdF5ks0TYmCSGd/XUCby8E9pVcwiSwULVH8vZWSr/t1U6Ak9sdDG6I
	lY/SIshNS8PbwqyXriyA8dmF6rHguvDF8LNXswEc0+BIWBGvQdKqRo4wAOuY7x7VRnd3PkUIZSR
	AhXw9HAlxjjfQX1Yf
X-Received: by 2002:a05:600c:1906:b0:4a1:c6f5:2450 with SMTP id 5b1f17b1804b1-4bb55ac2a34mr181475635e9.17.1794753469741;
        Sun, 15 Nov 2026 06:37:49 -0800 (PST)
Received: from puma.museclub.art ([2a00:6020:b326:d300:d19:a765:d8d7:bedc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb55ac1159sm196174025e9.4.2026.11.15.06.37.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 06:37:48 -0800 (PST)
From: Eugene Shalygin <eugene.shalygin@gmail.com>
To: eugene.shalygin@gmail.com
Cc: Kostiantyn Korn <korn@korn.im>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] hwmon: (asus-ec-sensors) Add support for PRIME Z590-A
Date: Sun, 15 Nov 2026 15:25:38 +0100
Message-ID: <20261115143708.492883-2-eugene.shalygin@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261115143708.492883-1-eugene.shalygin@gmail.com>
References: <20261115143708.492883-1-eugene.shalygin@gmail.com>
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kostiantyn Korn <korn@korn.im>

Add support for the PRIME Z590-A board.

Signed-off-by: Kostiantyn Korn <korn@korn.im>
Signed-off-by: Eugene Shalygin <eugene.shalygin@gmail.com>
---
 Documentation/hwmon/asus_ec_sensors.rst |  1 +
 drivers/hwmon/asus-ec-sensors.c         | 22 ++++++++++++++++++++++
 2 files changed, 23 insertions(+)

diff --git a/Documentation/hwmon/asus_ec_sensors.rst b/Documentation/hwmon/asus_ec_sensors.rst
index 6d1fa99acefc..b22bd5c8f491 100644
--- a/Documentation/hwmon/asus_ec_sensors.rst
+++ b/Documentation/hwmon/asus_ec_sensors.rst
@@ -10,6 +10,7 @@ Supported boards:
  * PRIME X570-PRO
  * PRIME X670E-PRO WIFI
  * PRIME Z270-A
+ * PRIME Z590-A
  * Pro WS TRX50-SAGE WIFI
  * Pro WS TRX50-SAGE WIFI A
  * Pro WS X570-ACE
diff --git a/drivers/hwmon/asus-ec-sensors.c b/drivers/hwmon/asus-ec-sensors.c
index e3d7c293b8a3..6c4565b0ce2f 100644
--- a/drivers/hwmon/asus-ec-sensors.c
+++ b/drivers/hwmon/asus-ec-sensors.c
@@ -234,6 +234,7 @@ enum board_family {
 	family_intel_200_series,
 	family_intel_300_series,
 	family_intel_400_series,
+	family_intel_500_series,
 	family_intel_600_series,
 	family_intel_700_series
 };
@@ -433,6 +434,15 @@ static const struct ec_sensor_info sensors_family_intel_400[] = {
 	[ec_sensor_fan_vrm_hs] = EC_SENSOR("VRM HS", hwmon_fan, 2, 0x00, 0xb2),
 };
 
+static const struct ec_sensor_info sensors_family_intel_500[] = {
+	[ec_sensor_temp_mb] =
+		EC_SENSOR("Motherboard", hwmon_temp, 1, 0x00, 0x3c),
+	[ec_sensor_temp_t_sensor] =
+		EC_SENSOR("T_Sensor", hwmon_temp, 1, 0x00, 0x3d),
+	[ec_sensor_temp_vrm] = EC_SENSOR("VRM", hwmon_temp, 1, 0x00, 0x3e),
+	[ec_sensor_curr_cpu] = EC_SENSOR("CPU_Current", hwmon_curr, 1, 0x00, 0xf4),
+};
+
 static const struct ec_sensor_info sensors_family_intel_600[] = {
 	[ec_sensor_temp_t_sensor] =
 		EC_SENSOR("T_Sensor", hwmon_temp, 1, 0x00, 0x3d),
@@ -636,6 +646,13 @@ static const struct ec_board_info board_info_prime_z270_a = {
 	.family = family_intel_200_series,
 };
 
+static const struct ec_board_info board_info_prime_z590_a = {
+	.sensors = SENSOR_TEMP_MB | SENSOR_TEMP_T_SENSOR | SENSOR_TEMP_VRM |
+		SENSOR_CURR_CPU,
+	.mutex_path = ASUS_HW_ACCESS_MUTEX_RMTW_ASMX,
+	.family = family_intel_500_series,
+};
+
 static const struct ec_board_info board_info_pro_art_b550_creator = {
 	.sensors = SENSOR_SET_TEMP_CHIPSET_CPU_MB |
 		SENSOR_TEMP_T_SENSOR |
@@ -938,6 +955,8 @@ static const struct dmi_system_id dmi_table[] = {
 					&board_info_prime_x670e_pro_wifi),
 	DMI_EXACT_MATCH_ASUS_BOARD_NAME("PRIME Z270-A",
 					&board_info_prime_z270_a),
+	DMI_EXACT_MATCH_ASUS_BOARD_NAME("PRIME Z590-A",
+					&board_info_prime_z590_a),
 	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ProArt B550-CREATOR",
 					&board_info_pro_art_b550_creator),
 	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ProArt X570-CREATOR WIFI",
@@ -1586,6 +1605,9 @@ static int asus_ec_probe(struct platform_device *pdev)
 	case family_intel_400_series:
 		ec_data->sensors_info = sensors_family_intel_400;
 		break;
+	case family_intel_500_series:
+		ec_data->sensors_info = sensors_family_intel_500;
+		break;
 	case family_intel_600_series:
 		ec_data->sensors_info = sensors_family_intel_600;
 		break;
-- 
2.56.1


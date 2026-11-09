Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794231386;
	b=RhGvMnhkotea+5Nob10pECmecTFF/Kx29978QqzS3Si1nt6qlP50tOVT8OMSja9qfwwZ
	 jYr6xVuB4Fd0RQvM3RfPQi047dd4a0ByiJYw7jLnI254AlJwfgC9LIXPUn2nkCsyKoO3Q
	 4wI1QtoYLAIp2jhM8+4zaGFxgaD5b+KHcFL10V5lRSPNOAdKLs1W+OGk1Kwz+iaU3YUYt
	 zi3fN/uBqPVilCnmMUV1OJQN+KcuT1fvCR3tqwGqwsjlNiKXHH7QcEcPuob+p/lIGaOVn
	 qlhUxSTn1c+42iJGLj9FUBPx5d/2zFUS5DWZ10Dhfswacv5p7vF95F2fFOj2j9ydjNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794231386;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=aMvX3lMVhde+dpD02Zhdv5iVN1tqXxXup7u4GL5+IOk=;
	b=H4QND7X4MO4W4URw7YCBrmDPeeYgFpdX3YTuPqMy7r2mPT+3az8pSKrURnC0H1V0Hr98
	 eDjCWq4oMO40UrFy0ZL/bjpMsswOoArqzr97TK6Y2s1vy7tReRIHVwZaVM9dw4Hl2V2AI
	 UA5bM6uYMhXQ73wqTRaB6Bn1aNaATKNPygSfC83aro/Zkp+oQBrt2YRg6bXDkDrPCTbuJ
	 L6vCR6dnxYH5xQYAH++AbwIHThLaKyFjQS/erhNmYN6HoAPk+LTNnhd+pBy+SDE82bHPs
	 IEwKFiU80qbeiXLNz2yZkfPRCm3cUkxeQrVuYnCIzQ/508MDgI7hgpjcdObIHa3ugBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sartura.hr;
	spf=pass smtp.mailfrom=sartura.hr;
	dkim=pass header.d=sartura.hr header.i=@sartura.hr header.a=rsa-sha256 header.s=sartura header.b=DhbqdIST;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBF30606D822
	for <linux-hwmon@vger.kernel.org>; Mon,  9 Nov 2026 13:36:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EBF30606D822
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.a=rsa-sha256 header.s=sartura header.b=DhbqdIST
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a215e64962so10260195e9.1
        for <linux-hwmon@vger.kernel.org>; Mon, 09 Nov 2026 05:36:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1794231384; x=1794836184; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aMvX3lMVhde+dpD02Zhdv5iVN1tqXxXup7u4GL5+IOk=;
        b=DhbqdISTHqi9/Qrm2erP+otVKZ/GKoXVYTzI0mDD8dzKKOk2bTA3XAqVHTdt8jz8Bs
         3lniUKiPn7PK/8g1HEh86/lxDxd1eY5alocIc5OAlms4m1RgN/P2kv/zz6O5NlSc9hIw
         WVNz9mkw5dW+WQfBn33R5DydtwtBrFNu2SrJpgRLs3BQZZQzYFeYWeR2ye06kopsy40A
         9ra87uxZ3AD6ACCufHE8xaiqiEUMX3LLxibViSRSv1cYpfBu86Nw5hCGI7RUeoeH2zJJ
         FIzjtbIOiTuHeydUPqEweAI8u3nZdqGBssPMprCoIPZ59IXpu+5zrQ2n/sRT1nr+FCN5
         Du5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794231384; x=1794836184;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aMvX3lMVhde+dpD02Zhdv5iVN1tqXxXup7u4GL5+IOk=;
        b=UlpAn/DtW6gVPlbDWU/NRGYBN/xdg43qtYPHTiMQKsYpdz1lFDZqcrg3teJAEoWmGI
         nwzJXyiV60A5WDZyz/mcsh0Z0zwSSpjvQl6cJuREPRyYLAYQy2apdeQiYIypfMqNqity
         10woRyKKxsj933Wg1SeTkNPy8WyvVc9/0a/HNIBDsq4AcrB7BtNzDdrsiVcGiEmlbhSA
         RPJKWqkTBAqS75KOfC89UJQlQr4nVMFGa4SSmBMhqn6VDFAHCNHUZ4vDQBE2Zc+IQWnn
         RPrDZNidXmuJ2zE5ov1ugAHtLc+0/pkjzgJq3WoKLcAmAIod/xMFVfX7kMpGqYQ+enqd
         qpLQ==
X-Forwarded-Encrypted: i=1; AL+hErFsrR9VvLygWsdbeyGeMIBbHzaRS03fCB47Z+vAW2SfKTb14wGdSHoFrI/5MEBlFJGZ4pL6HMSY9GPzvw==@vger.kernel.org
X-Gm-Message-State: APuU4Z9X7S3qklwDs9a8boW8TPkYoGhAaH0Hckz/LcHENKu7JivSy/Vs
	dl6LqMoorobDDRFoUzaAtp/MlV+k16TumlZunPFzyazFDMpjx0ER+Z6BdTspSnHYnos=
X-Gm-Gg: AYBFou2HJgZjqyREgXEDSE7WSHi2NZQxyY3uX3xUtG66/oNwzYjqwi0mU/eGOqul6QS
	26RqhkSPdfMlf1gp1kww3X5VreDTgv1DX2F2kwl22BTI5/L84Pbb18a4DrXerWHASP81sb1whCV
	lQM7Wx0YMc/IPGNcuTCxa9GN/oTQ4ErFRTETj2/COhxyasJp8CD7kemrgnm5LvSlK9ntUDPakLq
	p8fHCtmUNIh0mWQfSu3C7sX+mCWbV2lu0vd64xVE+dWUMqFVglky5vajN6YYb6fE0reYv+2ai+C
	dleKWYRVZvi3/5snVGLZI+S4q8T2COMFrEac4w+H7B1VpLcabU7G0HOweig2xCp99z6TvgKP2jG
	kWE6r2WGVSI7pgadq/HXZRnHzuK9L8pFlRoZubcsQvW4duWGkUiHayn8GBZnFAb/iUbL8w4gaHM
	46FQVICmRmeIpw3lZGe8+6RHE/FuOuUR7h91i8qyWIS3xxb4Lmo5WgzPmPmd5pwRO9M/tJ9THlV
	GJEUO8AvXA1ToBsZ4kNjBBJrywCNAKp0fqH3Vjo8Gmt99+hbBGEuZvQgojBaTpPSpr4PkXCyzWd
	M51zEhg/sfmhXEoY0h+Y5Y8iTbKrk0LOW78b2ue4zG0gGWgfa5idy8J5wJG5Sjoa4PHGLhBkt1k
	eFR7E7Ca1S/BYH6H99pu5nV/eZ7UVm81jgISXv8GmbY406VEiDNexD51YB8zvWZEubwI229fl7z
	iej5gSsVSA9bCT6t282kD5kpJ81Q==
X-Received: by 2002:a05:600c:a312:b0:4a7:7d22:c50c with SMTP id 5b1f17b1804b1-4b94d7632aamr58126985e9.2.1794231384302;
        Mon, 09 Nov 2026 05:36:24 -0800 (PST)
Received: from threadripper-fedora-workstation (cpe-109-60-83-229.zg3.cable.xnet.hr. [109.60.83.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7efb1b64esm245418915e9.13.2026.11.09.05.36.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 05:36:23 -0800 (PST)
From: Robert Marko <robert.marko@sartura.hr>
To: linux@roeck-us.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	Steen.Hegelund@microchip.com,
	daniel.machon@microchip.com,
	UNGLinuxDriver@microchip.com,
	nicolas.ferre@microchip.com,
	claudiu.beznea@tuxon.dev,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH v2 2/6] hwmon: sparx5: separate temperature reading from sensor dispatch
Date: Mon,  9 Nov 2026 14:35:06 +0100
Message-ID: <20261109133609.810876-2-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261109133609.810876-1-robert.marko@sartura.hr>
References: <20261109133609.810876-1-robert.marko@sartura.hr>
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

Move temperature conversion into a helper and dispatch reads by sensor
type. Preserve the existing temperature calculation and error handling
in preparation for adding fan monitoring.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
Changes in v2:
- No changes.

 drivers/hwmon/sparx5-temp.c | 54 +++++++++++++++++++++----------------
 1 file changed, 31 insertions(+), 23 deletions(-)

diff --git a/drivers/hwmon/sparx5-temp.c b/drivers/hwmon/sparx5-temp.c
index aa91780737446..0fd5c147f8167 100644
--- a/drivers/hwmon/sparx5-temp.c
+++ b/drivers/hwmon/sparx5-temp.c
@@ -37,38 +37,46 @@ static void s5_temp_enable(struct s5_hwmon *hwmon)
 	writel(val, hwmon->base + TEMP_CFG);
 }
 
+static int s5_read_temp(struct s5_hwmon *hwmon, long *temp)
+{
+	int value;
+	u32 stat;
+
+	stat = readl_relaxed(hwmon->base + TEMP_STAT);
+	if (!(stat & TEMP_STAT_VALID))
+		return -EAGAIN;
+	value = stat & TEMP_STAT_TEMP;
+	/*
+	 * From register documentation:
+	 * Temp(C) = TEMP_SENSOR_STAT.TEMP / 4096 * 352.2 - 109.4
+	 */
+	value = DIV_ROUND_CLOSEST(value * 3522, 4096) - 1094;
+	/*
+	 * Scale down by 10 from above and multiply by 1000 to
+	 * have millidegrees as specified by the hwmon sysfs
+	 * interface.
+	 */
+	value *= 100;
+	*temp = value;
+
+	return 0;
+}
+
 static int s5_read(struct device *dev, enum hwmon_sensor_types type,
-		   u32 attr, int channel, long *temp)
+		   u32 attr, int channel, long *val)
 {
 	struct s5_hwmon *hwmon = dev_get_drvdata(dev);
-	int rc = 0, value;
-	u32 stat;
 
-	switch (attr) {
-	case hwmon_temp_input:
-		stat = readl_relaxed(hwmon->base + TEMP_STAT);
-		if (!(stat & TEMP_STAT_VALID))
-			return -EAGAIN;
-		value = stat & TEMP_STAT_TEMP;
-		/*
-		 * From register documentation:
-		 * Temp(C) = TEMP_SENSOR_STAT.TEMP / 4096 * 352.2 - 109.4
-		 */
-		value = DIV_ROUND_CLOSEST(value * 3522, 4096) - 1094;
-		/*
-		 * Scale down by 10 from above and multiply by 1000 to
-		 * have millidegrees as specified by the hwmon sysfs
-		 * interface.
-		 */
-		value *= 100;
-		*temp = value;
+	switch (type) {
+	case hwmon_temp:
+		if (attr == hwmon_temp_input)
+			return s5_read_temp(hwmon, val);
 		break;
 	default:
-		rc = -EOPNOTSUPP;
 		break;
 	}
 
-	return rc;
+	return -EOPNOTSUPP;
 }
 
 static umode_t s5_is_visible(const void *_data, enum hwmon_sensor_types type,
-- 
2.56.0


Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA548381B0A
	for <linux-hwmon@vger.kernel.org>; Sat, 16 May 2026 11:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778931786; cv=none; b=iu+Wy5AP+VwJmGZfSDjrmDy0523V1w+zPZWuTGry6wNaTpdBkaS1Rr0eMbxKdr1AABxc+uZTueOy7234jEMPJTIFW/wWFqO0xyI64+44pGQp4768I7T10VWCih71G+7Ck+VvGrqavFFf0A8vA/i5zJZK0B5WmNVChrUU/jM1zf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778931786; c=relaxed/simple;
	bh=mnxArjqKRTfIrpYc361uWLOceGD8kzcyxwpPl6ZH7JQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ewYVWC6Z3bLtFVT3dZHFVZNUM6cH/KPz7USgkxlqf8m6RGZrRqEw7M63nG5PhClO7j/CTBrncu+293GGmrv8MdEscpRHKbiGif4eLnBleYH/+SLMggIevxPpAhd3YgTIya4fOqHLBI8jePyBDj04DJDhZ5Od4EWTwR9Jtb4Sm+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PB4Hn6jM; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PB4Hn6jM"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4890d945eb4so9494715e9.0
        for <linux-hwmon@vger.kernel.org>; Sat, 16 May 2026 04:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778931783; x=1779536583; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U3hqCzoKyO+ism6BEu/Ppfw42b3pMsGKs85NtiUnc+0=;
        b=PB4Hn6jM1BhcoDMpA+AFQsXNdtKr0WXD2hIYun4+UDsKT1CqzAV/+6lauq3y2+qPYf
         sDZ0L7bUajlgUfS2WQX0ksl1WaQ2VE0HwS10LZ+97mWB5cD5AlBXigQUd9+dA3kuVxZT
         +cXAv50qNBoDey2LIaDebNzK7CT1PoGvKfRxqfHqhdlcj4JRIEY4HkbN7tiUSz0wRNMZ
         /rpV6IvfjMwCyJRs1xDRrj5hNafZ2htLLSM4iZ31CBm01snWsHsdt04cHekcIqEH1Wae
         yqw4/ZL3btXmKTudnGCa8/gN4ht1YzZchwJmc9F6Pi64qPahXYwPLD7ZLZ14iFrXRJGp
         XQ2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778931783; x=1779536583;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=U3hqCzoKyO+ism6BEu/Ppfw42b3pMsGKs85NtiUnc+0=;
        b=nPDOrwkshUXIB82XSZ+IfJG4YTP40iJVB8iV9lhAbhhf0oB+C3IaDVpH8VNW6ms5hf
         YcWVr7rTNp3/2w7qr4sxpzXBkeWEyiUz2QDbruVHLjO3gt3V9eCpjIEz3eDDjR6pwzv4
         ykq7AOVwKaGfUeBwH5/TJONAGFohas3fZFhOPoJfKVBhhtZrWC5JB1s4gq4wisqZy9mM
         6DNEx1J+MKYeFWcJqvRxhIu8ElqAgbo3gQyV9oJ9fgSFAHKkfaR1t5p7069OY0AZmXqg
         iNaBbcQtvIZ/cn4xjfFR8LLXwDOP8xIemMxM5na7mKuU3Q5Wt6MbFwZxFLG2rTJr660Q
         jjzA==
X-Gm-Message-State: AOJu0YydQftYC1ZITTfGfyxM2OxQzx/LuMEtmBdP5UBYuDOjATzQUp3v
	sabXG9uk26NDRtDtjbsCZ1gSW/lD5o4RtkGg1xmVwcQa3oRxKcGk+EZQ7erBTR3g
X-Gm-Gg: Acq92OFdVGStpN+k2/48SMuUJ4zyCFf4ImDvqCR77NiCF4U1rE6YO3GVpgAKy+18bRO
	bnzu72HXV7uanvpzad48gnlpXIc8NHeAwOqiEwXHOa8vVshseWYHzqIH98GjwTGoAKxohAJkYaC
	CsdytBXfaJw6XIfOv3LcsKLm2JKi2mXUhQLNvrs/+EWdZqSnKCSUPFK3MqfZW1ciN3hXwkY3wNf
	K86th7umwrzAYDt8VG4dXvKNIUUvectXkuQrxiB5wjoW+aNVkkYsDdCjm6zZdHtv5l+To58eqYc
	UWAHSvx7oAaT57gkqRB0VdEpPG4gOeVaJkVHUFyOG1EC/FVgAmRNGnIlQ0R3AsWgDJ+b6ZGWrx8
	pAlrV1phvf3tlRunz86SmP2m9p9bYqbWKtQrrWbJmDOre3ODZ9nlRy7bv0vBphfh8FRnWyo3q4j
	3qks8RZ5MNg6IakFbsHS7NnRM7AeqyeKF7CrqivrW1KRhb0iifXb1FnGt0Boppy+uC6m9x7xm6/
	8Y=
X-Received: by 2002:a05:600c:4851:b0:48a:79d8:a8d6 with SMTP id 5b1f17b1804b1-48feea99dc7mr43623185e9.7.1778931782877;
        Sat, 16 May 2026 04:43:02 -0700 (PDT)
Received: from arch (mm-28-201-122-178.mgts.dynamic.pppoe.byfly.by. [178.122.201.28])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45e6a135f0csm3914941f8f.27.2026.05.16.04.43.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 04:43:02 -0700 (PDT)
From: bakshansky.lists@gmail.com
To: linux-hwmon@vger.kernel.org
Cc: linux@roeck-us.net,
	Roman Bakshansky <bakshansky.lists@gmail.com>
Subject: [PATCH 1/2] hwmon: (coretemp) replace hardcoded core count with dynamic value
Date: Sat, 16 May 2026 14:42:52 +0300
Message-ID: <20260516114253.5466-2-bakshansky.lists@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260516114253.5466-1-bakshansky.lists@gmail.com>
References: <20260516114253.5466-1-bakshansky.lists@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Roman Bakshansky <bakshansky.lists@gmail.com>

The hardcoded maximum of 512 cores per package was first defined by commit
34cf8c657cf0 ("hwmon: (coretemp) Enlarge per package core count limit")
and later kept as a fallback with a TODO in commit 1a793caf6f69 ("hwmon:
(coretemp) Use dynamic allocated memory for core temp_data") because the
actual per-package core count was not reliably available at the time.

Now that topology_num_cores_per_package() is stable and suitable for use,
it's time to complete the TODO and allocate only the needed amount of
memory for core_data.

Signed-off-by: Roman Bakshansky <bakshansky.lists@gmail.com>
---
 drivers/hwmon/coretemp.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/hwmon/coretemp.c b/drivers/hwmon/coretemp.c
index 6a0d94711ead..c722b1d8e480 100644
--- a/drivers/hwmon/coretemp.c
+++ b/drivers/hwmon/coretemp.c
@@ -39,7 +39,6 @@ static int force_tjmax;
 module_param_named(tjmax, force_tjmax, int, 0444);
 MODULE_PARM_DESC(tjmax, "TjMax value in degrees Celsius");
 
-#define NUM_REAL_CORES		512	/* Number of Real cores per cpu */
 #define CORETEMP_NAME_LENGTH	28	/* String Length of attrs */
 
 enum coretemp_attr_index {
@@ -485,13 +484,7 @@ init_temp_data(struct platform_data *pdata, unsigned int cpu, int pkg_flag)
 	struct temp_data *tdata;
 
 	if (!pdata->core_data) {
-		/*
-		 * TODO:
-		 * The information of actual possible cores in a package is broken for now.
-		 * Will replace hardcoded NUM_REAL_CORES with actual per package core count
-		 * when this information becomes available.
-		 */
-		pdata->nr_cores = NUM_REAL_CORES;
+		pdata->nr_cores = topology_num_cores_per_package();
 		pdata->core_data = kzalloc_objs(struct temp_data *,
 						pdata->nr_cores);
 		if (!pdata->core_data)
-- 
2.53.0


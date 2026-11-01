Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793530022;
	b=YD65ds2lxd0vGzKRZDRIYOG1v/mT2b2bmKLgAxITvgRBqvqtPxwyOZg4qCfKhVl6N/Rb
	 8KEZrDUIju7UnQU21molssQS0wHbtYk6x8eIV0zaWYM5ZdkVPPB+K+H26P1Q+M4DqJG0Q
	 bYZA35Vmpie7Rlp5YCWJ2ZOGNIdTOoJuWRKQBfJdJjFcQ7rGhavYhH4T+xGKChw1OrUcf
	 +cS7gzWdzgC6YKpswakfRlgfuBbGEC9NrhDiifnSPagAR8GRvQOg9nI9TwlaP+hTdxY8R
	 kyXWhB6u4IWKHlEpaiJpPYndVZoN58YBk+LtTLCeenpI6XJevEGXMcfBNx3QieeCmkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793530022;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=hqMFp7OoaihnU8SvIdhdeXnsjyjS2fMQMMOIfDJThPc=;
	b=3Tt/bY+fTusHWOnvGFCS9hDO0IcvbsvbIfuMwHFsQ4gtQCsJ8/t8M8uQugKTO+/5o1PZ
	 Evbt8wxm1NCW/uvz89tGOk42oFmGLDZIJBqlss9wPd3VsCQlE5wmdwOzTa8rXAWf2S6Z+
	 4BNn+ZX5Kx/wHzmPOdCOcmJQO2NPYq+cVt2oW1GYx2FkwdT5bo6mg3+FBRDfsYEaC1NTS
	 4xDCMA4XcjqzaiFjZ96GEVNtE4SScg515kBdc5y5bS8aL+Y94hgDktTaZQ2we8Od4Zl1V
	 LDXr5JJ2iB8A2oE/Y5eE7eM0OBGrnh0C6x080JK2HzG1iCfdV8klqKHY0WAV3clO5gA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dMyzMMgo;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10FB5606A333
	for <linux-hwmon@vger.kernel.org>; Sun,  1 Nov 2026 10:47:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10FB5606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dMyzMMgo
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a215e64962so19504675e9.1
        for <linux-hwmon@vger.kernel.org>; Sun, 01 Nov 2026 02:47:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793530020; x=1794134820; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hqMFp7OoaihnU8SvIdhdeXnsjyjS2fMQMMOIfDJThPc=;
        b=dMyzMMgoxz7oJACKph8xEWuaqrJKYCGA9WlXHE/rkVINGGmcpWoadzTxxGpjROCj8y
         m0o5xGih1eEtO7+IydlNA6ibzyL3dnkR9y5pGuNn4W/3MuOLzLrlRTswTRGPHwUuQ33P
         wxjiRMozLBjqwe5Ayk1dydUutBzLTPRMwjB6eEKu/vTNcNatIZ8gAJMmFa+etbwFwjLf
         NjWmXTdy5RIfpfj76FlRgqqRII4zS1j1AJkhlh+ehpej7x4SJrpAi67Dl3hv1pHytrTV
         KEoNeZJwAyM0koJaEVsl6TpYOBp5hQVNuOClY/A8qCEBZnvnSW4dXWMjFFVMD/2UScLc
         sehg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793530020; x=1794134820;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hqMFp7OoaihnU8SvIdhdeXnsjyjS2fMQMMOIfDJThPc=;
        b=fbsaEfEl0cqaNq9lHurwK2FdTVlJa5MIktSjFGMFfQNliJO7nTdcaFxRDIHaYWVlCE
         kC14VSPUlfvIeVKkCMgFOvDOGhNG1Vcd9D+79bnYqvHVbbmCwPTd+1dFUeuVNUZ0XSjo
         I7xB305pX3j7cMWXXlxIZ2BbBcRHFBLwaEo52UqFtgH7cKqZKWzcc75nWrrMWLWv1C5g
         GcVoGfhrycr9aNspaFCI18RPe7Jt8aqC2hcEf1camGbuyoAlhROURQ1tB3WpA75bOlRk
         LV9rK/rSlHgu/U6lEOzbUiHeHVg3lFpNyU84ZWE9Hf0jZftBtHz60QR3YywJgpQ46q3a
         0Njg==
X-Forwarded-Encrypted: i=1; AKwUvBx7G8YLaNCork2IOIiW0E7D5cxzcvk6CRxSqIGSo4bn8tvHtz5Ierhhi9RK/gH8I6A+CHu/BOE8OZ8QEA==@vger.kernel.org
X-Gm-Message-State: AFq9FYIueCIM/znkbL6f+1Y8ETmWr37AT3L0+QwGWRgbPHHr+jnoyGwc
	c8GQoTpRn47hmIZ4FC++l2GFWbykv9jdWLgbAVZuGRHKXElzKT1BamFV
X-Gm-Gg: AYBFou37JTeTcxZ5XXD1PUtj+dLdxeFwCZrVSh1TbkqFtiqSTq/MMq+H/0MYCWYysbh
	0zB4SDP9E32dUdAMqBkKb+8Z0K8rr9Z4gvjmwzw3OXxQrGkwSchZWC22/g741pukdOje1vDEfQt
	BrSYlQT4MTLa1AMq/qdpaL2vVEjRTqXNylLch+6tM/xHzN5xjlV1qNapJQCv5QWcdZLdCsKOZ+W
	WftqUFoWrFW5Zh3XroxfiWS9/TD5YXJydyqJIjwuVck4qHZKVYM0L+nWj/eTOgHMQFlB9VC9+40
	LZ1SrahBryWUWt25KytvGqH2x5PEy40TNawRCZq30yPIAO6V28LlL3Ui4BUJOFq2urYLnzTpeh8
	9DB7hOxVpkOfoXRQNxPI84hsa6nnTOTe4ThQ/Y8t0dyxpIug9GfQBT/3gLJ/hRZZ1M88OVdGQ8s
	+mC+2T1WSOZ1NZbRBp3BPiCItJkdYvg4XcsBvRDaalDbUbR2xTV7WgEu08BNeixl1UzOQnyyjx/
	U/R6QUy6zqsfFkMS7ZEWiYXRPvnK56e5liVyXMcNLfaGss8vCJvINvPN1aLpGugH4RQjI7NdxnI
	jmFDiyBfi1OwIqYrbv4hiNNyY6Y=
X-Received: by 2002:a05:600c:1f93:b0:4a0:1fb9:2f51 with SMTP id 5b1f17b1804b1-4ac182dbc34mr156760555e9.14.1793530020382;
        Sun, 01 Nov 2026 02:47:00 -0800 (PST)
Received: from [127.0.1.1] ([85.105.252.11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa7f322c46sm255602715e9.2.2026.11.01.02.46.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 02:47:00 -0800 (PST)
From: Bartu Alev <bartualev@gmail.com>
Date: Sun, 01 Nov 2026 13:46:42 +0300
Subject: [PATCH 2/7] Documentation: ABI: document the ASUS custom fan curve
 attributes
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
Message-Id: <20261101-asus-fan-floors-v4-v1-2-b8d1c31a99a9@gmail.com>
References: <20261101-asus-fan-floors-v4-v1-0-b8d1c31a99a9@gmail.com>
In-Reply-To: <20261101-asus-fan-floors-v4-v1-0-b8d1c31a99a9@gmail.com>
To: Corentin Chary <corentin.chary@gmail.com>, 
 "Luke D. Jones" <luke@ljones.dev>, Denis Benato <denis.benato@linux.dev>, 
 Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>, 
 linux-api@vger.kernel.org, Bartu Alev <bartualev@gmail.com>
X-Mailer: b4 0.15.2

asus-wmi has exposed custom fan curve attributes since 5.17 for CPU
and GPU fans, and since 6.6 for the mid fan, but the sysfs ABI was
never documented.  Document the existing attributes before adding the
firmware fan floor tables.

This includes several embedded controller quirks: point Z is limited
to the temperature decade [30 + 10 * (Z - 1), 39 + 10 * (Z - 1)]
degrees Celsius, the EC clamps uploaded thresholds to that decade
while reads return the raw byte written, fan speeds step without
interpolation, and downward transitions use 5 degrees Celsius of
hysteresis.

Signed-off-by: Bartu Alev <bartualev@gmail.com>
---
 Documentation/ABI/testing/sysfs-platform-asus-wmi | 59 +++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-platform-asus-wmi b/Documentation/ABI/testing/sysfs-platform-asus-wmi
index f9825c6150b5c..775ea88625c0d 100644
--- a/Documentation/ABI/testing/sysfs-platform-asus-wmi
+++ b/Documentation/ABI/testing/sysfs-platform-asus-wmi
@@ -238,3 +238,62 @@ Description:
 		Set if the MCU can go in to low-power mode on system sleep
 			* 0 - False,
 			* 1 - True
+
+What:		/sys/class/hwmon/hwmonX/pwm[12]_enable
+Date:		Oct 2026
+KernelVersion:	5.17
+Contact:	Luke D. Jones <luke@ljones.dev>, Denis Benato <denis.benato@linux.dev>, Bartu Alev <bartualev@gmail.com>
+Description:
+		Enable or disable the custom fan curve of the CPU fan (pwm1)
+		or the GPU fan (pwm2).  Reads return 1 while the custom curve
+		is enabled and 2 while the firmware controls the fan.  Writes:
+
+		    * 1 - enable the stored curve,
+		    * 2 - disable the curve and let the firmware control the
+		      fan again,
+		    * 3 - reset the stored curve to the firmware defaults and
+		      disable it.
+
+		Enabling validates the curve: temperatures and duties must
+		not decrease from point to point, otherwise the write fails
+		with -EINVAL and the curve stays disabled.  Writing any
+		writable pwmY_auto_pointZ_temp or pwmY_auto_pointZ_pwm
+		attribute disables the curve, so a changed curve has to be
+		enabled again.
+
+What:		/sys/class/hwmon/hwmonX/pwm3_enable
+Date:		Oct 2026
+KernelVersion:	6.6
+Contact:	Luke D. Jones <luke@ljones.dev>, Denis Benato <denis.benato@linux.dev>, Bartu Alev <bartualev@gmail.com>
+Description:
+		Same as pwm1_enable and pwm2_enable, for the mid fan (pwm3)
+		of laptops whose firmware exposes a third fan curve.
+
+What:		/sys/class/hwmon/hwmonX/pwm[12]_auto_point[1-8]_temp
+What:		/sys/class/hwmon/hwmonX/pwm[12]_auto_point[1-8]_pwm
+Date:		Oct 2026
+KernelVersion:	5.17
+Contact:	Luke D. Jones <luke@ljones.dev>, Denis Benato <denis.benato@linux.dev>, Bartu Alev <bartualev@gmail.com>
+Description:
+		One point of the custom fan curve of the CPU fan (pwm1) or
+		the GPU fan (pwm2).  _temp is the temperature threshold of the
+		point in degrees Celsius, _pwm is its duty in pwm units
+		(0-255); the driver scales the duty to the percentage the
+		firmware expects when the curve is enabled.
+
+		The embedded controller binds point Z (Z = 1..8) to the
+		temperature decade [30 + 10 * (Z - 1), 39 + 10 * (Z - 1)]
+		degrees Celsius and silently clamps the threshold into that
+		decade when the curve is applied, while reads return the
+		value that was written.  On TUF series, the controller steps
+		from one point to the next without interpolating, and a point
+		is left downwards with 5 degrees Celsius of hysteresis.
+
+What:		/sys/class/hwmon/hwmonX/pwm3_auto_point[1-8]_temp
+What:		/sys/class/hwmon/hwmonX/pwm3_auto_point[1-8]_pwm
+Date:		Oct 2026
+KernelVersion:	6.6
+Contact:	Luke D. Jones <luke@ljones.dev>, Denis Benato <denis.benato@linux.dev>, Bartu Alev <bartualev@gmail.com>
+Description:
+		Same as the pwm1 and pwm2 curve points, for the mid fan
+		(pwm3) of laptops whose firmware exposes a third fan curve.

-- 
2.56.0


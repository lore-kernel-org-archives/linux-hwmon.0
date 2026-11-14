Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794637233;
	b=2jYYhGxX33aKJZCbJfQP4jvMbPJmAIBpr4Yge7NAx8E6FFLyHwTNug3rxys4+1BWgzzc
	 ndDGPaSRFEwztvHDaYQhMkDDKxBfr9tQF5CV9yoAUBTyM8+hcL+/0y+4rEdRl0k9HgFH+
	 CvYriT3xZVQp3sd3w0VV6vmB7iRiMBMQv2LIWcreJGztEAECF0VBY6irq6L2JCOQzcy81
	 Nwht9uskjA1DjQ9beu8C0hUz/R0GrUyr/7BLJdc3DxisKWhmHPKBAMP/+feUwFJNmUiaO
	 fJeeZWajR2ZClLNUNJAegzZBpA4IvPxrs4RGxJuvNrvgkz5D9Lhm68wss4thg2KNrGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794637233;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=1uCcHgkncnGN0ELDXdD9eUikACgv1tfu6wW8ercvTQI=;
	b=1mbzwf/+9+LRTu6ubcWbh0Cjp6syD3zhMuPq15LjKrFVKKgmcRotj8tt+sQ5ynFGFtZt
	 CbJlqH1AfMuDfix4/fKFk3AdssjZ30pos3i5ZU1UaSYOmvQfzm9c02pHzICqQ1fNORNPJ
	 ObapP9v6zJokdgEUpXk/sylGd6yj3HpzxgdQW3BdGGBaR7X6yu4yNED1U/WgrO8kNpEyz
	 KOpojy2A7X0KVSQCDe89wtyIg5PPU3KJ4+NTdQMaW60YOJ+C2WK0cvw681vzBRJVvsuAj
	 WU4Gr8jcoF8soXIo1k2Yx+hRZ3MsNUxumshSm/zjEHLYydFRAauz3wjTop+IoCHmLnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=e1+MJVgc;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5B8E606A336
	for <linux-hwmon@vger.kernel.org>; Sat, 14 Nov 2026 06:20:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5B8E606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=e1+MJVgc
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso3305507eec.0
        for <linux-hwmon@vger.kernel.org>; Fri, 13 Nov 2026 22:20:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794637232; x=1795242032; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1uCcHgkncnGN0ELDXdD9eUikACgv1tfu6wW8ercvTQI=;
        b=e1+MJVgcRc9Epn35HjhtJxhkjV9XWXESgdOr4r+JvaZ1VT5sXq6aP8SQ6WfLUxosjh
         btQc08dVr1WGAtAJqqK3VRnxCNTYH+D7TjWDJKbLr746qe8wk0iiT4wKfhmyJtJcZgsc
         dKF0prJ7NHh6Y6i5IIHolUHJ1Js0+2qrsPtY22Dnnck08up6vrJE68EscS3lemBr6Z9e
         FzWbCpg2Cdo2zsnWBZDytlULbKQ5WMSGxCUDnp5CZsGIws7Xl2+ixIZZpjgg8EnkHuzd
         w+Xtx0aAE356eayWbP687DR3gC2a9Rk/oKaiLc35ZArN5EhpE1u6AQ8vUBqc8q6jUe/K
         tz2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794637232; x=1795242032;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1uCcHgkncnGN0ELDXdD9eUikACgv1tfu6wW8ercvTQI=;
        b=g9ZtxdLoHfawFXPhVP/j3qLTR7O4vQ7FfnisJW+0v12sGmA6oUTkfqdwBc2NVUQ6q2
         A+n7moqauzNOEzr0t7jyQmmRLWkAAboSIP6EjNPZQDQKWyZoOh4nYH2ZZoI3PLoVuLzj
         HcjYo2YeEjdRwdH4g7T2JhzXU2ThVYBZHeb0kqyvarETW6tP0P8B++IDd84ebZAe3Wpb
         7/FyJS4Clp2qppAUBRSprATS0Lj5VeJhoE98RdNqUWfyrZKEhZubr595SksM57chUwAe
         sha8p0Ot5AAEHKw/YDTrwYJKmOuH44/fktdoM4aO/p+LYPjPLZZHGoIqPQjMzFfEK28C
         8Iag==
X-Gm-Message-State: APuU4Z/5DhpAHdZ5Ld/yg2fagWP3R0LTthF5MSL1HcGUE2rd12P+M43o
	268ff4uET2Off9vfA+wz7EqZ1+LVMfVoFWT5j9Sdig5MGgXIMklOLyow
X-Gm-Gg: AYBFou3v10f9dJ2IiyCY7qmhTA7dU/JCm/PUsYJAaYglZBgP1Vs2xU/A8udlV2VsZs6
	7SZqjGntjUWD/kxbUVsSyG4ooB/vHr9LqvAN8ow5qhnnNuSOoilcFUyaJROkROHglJ3/fjMaSK7
	xUdG1zfgpsmp+uFni8qsgE/2JIcc1llXu1YtrScQzHl6vxHnGbLEr1URrMWedHr9KO93bn3A3hG
	vovneC91KVEgljsbW64H9okROk/3ssPgyEylxLj2KLd2biHANyhtaVPzOHr81o3JKvoZE3b+KS1
	SQBLxHY4u0FaCOZ6B7FrMnnEOS9uwXm4MGurOqWf0wRWOB3cprjBNwHkTc5UUwt1VnWvJI4TToA
	SxG8fbRsxMxYVhoHlwMAZqawTq6yz3i81xRn3Qm6ms/SQAB4GJv8wSOGIWqnh4w5JsjtAoaQE10
	Woi2qRdehAuYE3jSP2HcImpkYlWDmY59kEDILst4paxOT3wqgWOjWO+Tf//+8mrHlQhMBwm06F+
	+38EUZd3dBixHa0sj7fsLN8Xp+YKovaGqaNCZF8do1iy26zftSoiQ5hG4v8vNsmxY8L2DTdnayQ
	Z4awPTJZItpCNU5oo4PF91/Uw5xdJ8Y7IMRLxPwGh+BUmZtzEs7cj8Les2Xi6OnC4qBDv4DrX0e
	cAnumD03eWv0rtWr+ylcZGSI8QeiYp7jO2px7ltDVSBcIbNVyaejwZph+tinh7j02fH52LumtAO
	iS6G4EhOBB7/qEtvp198JhB3s=
X-Received: by 2002:a05:7022:1583:b0:195:e4b9:d326 with SMTP id a92af1059eb24-1b503112a76mr4605504c88.12.1794637231910;
        Fri, 13 Nov 2026 22:20:31 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031b98e5sm13305738c88.14.2026.11.13.22.20.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 22:20:31 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] hwmon: (dell-smm) Clamp the pwm value before scaling it
Date: Fri, 13 Nov 2026 22:20:22 -0800
Message-ID: <3c36959a51788bbc5d08f364fe7d922b5c4d4d87.1794633179.git.rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <cover.1794633179.git.rosenp@gmail.com>
References: <cover.1794633179.git.rosenp@gmail.com>
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

dell_smm_write() scales the value written to pwmN with

	DIV_ROUND_CLOSEST(val, data->i8k_pwm_mult)

before clamping the result to the valid fan states. The rounding adds
i8k_pwm_mult / 2 to val first, which overflows for values near
LONG_MAX and wraps to a large negative number. That is then clamped to
0, so writing a huge value turns the fan off instead of running it at
the highest speed. With the default fan_max of 2, writing any value
from LONG_MAX - 63 up to LONG_MAX selects fan state 0.

Clamp val to the pwm range of 0 to 255 first.

Fixes: e7f5f275c62a ("i8k: Implement hwmon based fan speed control")
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/hwmon/dell-smm-hwmon.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon.c
index 5ec487843faa..e8b4e8a29e8b 100644
--- a/drivers/hwmon/dell-smm-hwmon.c
+++ b/drivers/hwmon/dell-smm-hwmon.c
@@ -1030,6 +1030,7 @@ static int dell_smm_write(struct device *dev, enum hwmon_sensor_types type, u32
 	case hwmon_pwm:
 		switch (attr) {
 		case hwmon_pwm_input:
+			val = clamp_val(val, 0, 255);
 			pwm = clamp_val(DIV_ROUND_CLOSEST(val, data->i8k_pwm_mult), 0,
 					data->i8k_fan_max);
 
-- 
2.56.0


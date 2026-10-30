Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793392546;
	b=KoDPXE+olC+aXYlVq7TkTklrpdAth1TcOwgo1X7QGQFecwKGieIVPbjkNSoqenfnCUSO
	 IXckjHL+UAEALlv9TplvvFYUavYdwPQDE1M6Gvs97NAg6uwKOBDh1NTuuaJC1+1eaTszA
	 fYiYQ9lfXu82vW1BE2fdXDthez4nYDIT62HPVxpg0DNpoal3Lkfima6nfWazYsUeZjWfz
	 uKwLE3q5Yc1QKDIOiqf4NTWjvp3qYoB9zDax49Zl7NNaMRALs7kRLSA2ZmQtGjZcUqQCE
	 3xrFxON0UYjytZ8QWCCFh9fEjjiBYuPb/td0lpL7Arh32TH1/wi5hBdM115OMSNMQAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793392546;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=SN1nku32vaFiTenqE1IuYVioDYWxzqsexpbb3IFiLMA=;
	b=Rrnk50JIag7E9sT0Q65CBgtUY/nTM/JFI1wPTeoGf8xlGfWpfSH/MhToeUQGjWl/CZu0
	 Lt9n7jlWcl2nNdh1yg6PQUJFQR/efioPO2HcCvlEGQUBwBpGyN4+qwvAgC4Har/VDqady
	 zXUMDqHq0VIbiMpnoFocmny9MOn9c+6u9LCvuiJyEyXErBvsyXX6QpFIlrcBaHAlStAE2
	 g9WTDRVsvnLxrLTxXycUDSKDmi1T/K+Ors4SqvGAvgOGiykW+75eJ9/64Lgay3B5fwMcT
	 ieNZrd03OktTmwBId0mJNODdofhlJxRTGp+y90RVxMlCRW7EktHMmgZ0vVgZHSilJDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nexthop.ai;
	spf=pass smtp.mailfrom=nexthop.ai;
	dkim=pass header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b="DTlfrjQ/";
	arc=none smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F284606A31E
	for <linux-hwmon@vger.kernel.org>; Fri, 30 Oct 2026 20:35:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F284606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=DTlfrjQ/
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-1a2761c69fbso138892c88.0
        for <linux-hwmon@vger.kernel.org>; Fri, 30 Oct 2026 13:35:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1793392545; x=1793997345; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=SN1nku32vaFiTenqE1IuYVioDYWxzqsexpbb3IFiLMA=;
        b=DTlfrjQ/VHNxMLfWO6pvlc5ajLU1MYy8EDBD/923WefzkcYMPYXJTMQaOqCdT0VbcU
         TmVzApEgUoKReUCNLlW2Ffw6rqKbIui/Fx21a54XebtlnplJphN4JnfQ9QrVWQJhJxc7
         9TAhPbNMVSc0scZmk/zRTblZ2zrP78gg6IPKJBA0ko26IQ6mgDJLq0ZpO/Wzw+0ckN/l
         /tIKhcBSLvTyBhi67UEKRfwMyq2fc990wiBUSfPFaNxahhC3jNgm0LZqWuVj8PrDZ4KC
         81M73Mgs+3P1K9Nt2kdIJULcgN414SlSqiEDBku9aS8QzhB3t/+uXW3bY/2sAtBAdgCF
         HyTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793392545; x=1793997345;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SN1nku32vaFiTenqE1IuYVioDYWxzqsexpbb3IFiLMA=;
        b=WZbwRTt10gG9D4e5V8JeK9jiQ8ztxfWM0c5ZIFNpMM+zyztuzdPMOl0mb6eXlJx41y
         04QlHdJvYXd+Nv++ZW9ftL9El+Jfxuk8pLHXDjQbcgHdTZTNz3Z+D0sldpi4lejCyoNX
         D82sOEHQlcGYqoFIv/7J6tr7NauEkCtivDnpEhBQys3zC52W2FcM2VbGD7uVRyODrB6q
         Gpb0nakJ6t3HBbDAQ1EAm3Da8r6oYGIb1VscF8jBHxDtTCXJo8hD9ZH+yk7mmR4WU8iV
         TOjkfVLiaEg/4QMJWyr4Sb/6r+p8OidsFCl3qOfA5Tm//QxUgyfQrMwZlaVKBscW9qIj
         Cw0w==
X-Forwarded-Encrypted: i=1; AKwUvBzyXRNtTsY39r2xVfK6aOyUBZ4IIRXM3m1QpYFpw4xAlY/RBfiAgqLIKhWzVdKpxyjZS7FhtxjTZ709Uw==@vger.kernel.org
X-Gm-Message-State: AFq9FYIAp7sQMFeIIp4zm9rb3Ef7uUDvcJ0eqOQ59/j8F/x6hH8Wtxs/
	bIHEx8zSQr70GAwIlgLcPo7SM4U7zpAvmYu48UnGaQUMmq9nDlXI78MMNAnTypP9WkMeWGAC5oy
	IBbSjfsw=
X-Gm-Gg: AYBFou1quiOYAxIX0xJDAxxeCLoWXPCgyTkT7KCrK+6WMUNSBDbVTLS55rXKRZOdBXh
	IiiqY4M2DnVWifpKr/+Ilv2BQmYaUMCG5OZAs8gfh0+SfXcvwXEiBxAiHJnHwb6hpYlANfoltfl
	/vGl7JbtKJx8v/GOknh5EedDGM3u2SaeuvBkScLKHDqBvlIpttntTXc4b2FmNvWxsoJ6QmF2eS2
	IYNEAOVIj3tdkJqKf/JJRlBfj/kjjMyg/ATziNXnaVimcvY2KynLDLbIMzMVkKb1kCpWxCfXnvH
	HPsaI/30IyINCvXC0nYDK94G9TokfY7k/J5NigrdwLoTBDX4EwXPhzLvHBCFUSy3A2c3vDGykR5
	yiEREEAsWvJhB1WYP/FXuNXuX2IV0+5pjjp0W35/Ybwg358SKPM1rb777hyUY9EDi3FT1zLa2Zf
	neDjiAr8NzqmbHKFtroOXCRAIe3OWGxfznVbnJz6tjB5HyJTj5RLr9PlDV9X6oVwsrPN8oqw79K
	e1rSqQz4+vQkZ6cpfM0UyMQXhVpyG6GhU5KNBBbYkQEGTiJxZPypG52VB71QdbYCg2uHZl0jrpy
	u0to0YlwdRz09rVx7zZx+P4m7ZHC2e7QfCf556UjU/2b
X-Received: by 2002:a05:7022:281:20b0:1ac:91b6:8dfd with SMTP id a92af1059eb24-1ade9e3e335mr2396890c88.31.1793392544510;
        Fri, 30 Oct 2026 13:35:44 -0700 (PDT)
Received: from [127.0.1.1] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1854d925sm15120020c88.7.2026.10.30.13.35.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 13:35:43 -0700 (PDT)
From: Kevin Jia <kjia@nexthop.ai>
Subject: [PATCH v3 0/2] hwmon: (fs1603) Add driver for TDK FS160x and
 FS1006 uPOL converters
Date: Fri, 30 Oct 2026 20:35:36 +0000
Message-Id: <20261030-fs1603-v3-0-6f8963a74def@nexthop.ai>
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
X-B4-Tracking: v=1; b=H4sIAJj/5GoC/1WPS07DMBRFtxJ5jJH9/IkTIcQ+EAN/XomR8iFOQ
 lHVvWMnalWG17rn+N0LSThHTKStLmTGLaY4DjmIp4r4zg6fSGPImQADzRnX9JS4ZoKCkkZ4hcG
 rmuTyNOMpnnfR+8eR0+q+0C+FLo0upmWcf/efNl56N2lzk26cMmpsODU1CKM9fxvwvHTj9GwjK
 dYNHjhgdw4yxxqTH2urfIB/3PU4Z8bvNc9bjhtJjynZfV5bvdyF3U8/DnTq3ZqKXHKgm8xyqNG
 jRCkCkw/y1zLM2YTUj30fl7aSjDnUjeLKC6g9Bs2YAZf5gA0Da0IjvAsun3X9AyIhysZ9AQAA
X-Change-ID: 20261016-fs1603-25483c5edc57
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, 
 Kevin Jia <kjia@nexthop.ai>, Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793392543; l=3249;
 i=kjia@nexthop.ai; s=20261016; h=from:subject:message-id;
 bh=cTgLvVzXaKHSwBE678iEgA8UVGNfgBCAPJmAjE3eC88=;
 b=Vu7zVw+XBh1ibGSRgqoa6lb8P65/Wi0lgWnaO1NKouSN3Dltk2HRiB2+5WY0rOBTJfEOI5YHO
 BkAYsjPhrSMBOYx+cNrHCJ5MpxAjqf1sVpPccYMgN2Ml3AnTkHg9Fpd
X-Developer-Key: i=kjia@nexthop.ai; a=ed25519;
 pk=TcHV4RjX7qo9R0iryPJ/gWzq3O9yq1SUw0VO2QXQ3Zs=

The TDK FS1603, FS1604, FS1606 and FS1006 are uPOL DC-DC converters with
an integrated inductor. They report input and output voltage, output
current and temperature over a proprietary I2C register map. They are not
PMBus devices, and their register numbers collide with PMBus command codes.

Patch 1 adds a devicetree binding, and patch 2 adds a read-only hwmon
driver. The model cannot be detected from the part, so it is declared
through the I2C device name or the devicetree compatible. Parts that
encode telemetry like the FS1603 list tdk,fs1603 as a fallback.

The TDK vendor prefix is added by the FS1412 series, which this series
depends on:
https://lore.kernel.org/all/20261020-hwmon-pmbus-fs1412-v4-0-27ece4e43d04@nexthop.ai/

Tested on FS1603, FS1604, FS1006-3300, FS1006-5000 and FS1606-0600 parts
with the driver backported to 6.12.

Signed-off-by: Kevin Jia <kjia@nexthop.ai>
---
Changes in v3:
- Drop the vendor-prefixes patch, the TDK prefix is added by the FS1412
  series (Guenter).
- dt-bindings: Move to a dedicated tdk,fs1603.yaml, where the FS1604,
  FS1006-3300, FS1006-5000 and FS1606-2500 fall back to tdk,fs1603
  (Krzysztof, Guenter).
- hwmon: Drop the OCSet probe check. OCSet is a programmable over-current
  level and not really an ID, so it warned falsely on boards that
  reprogram it.
- hwmon: Match only tdk,fs1603, tdk,fs1606 and tdk,fs1606-0600, and share
  driver data between parts that encode telemetry the same way (Guenter).
- Link to v2: https://patch.msgid.link/20261020-fs1603-v2-0-0986107a5cd2@nexthop.ai

Changes in v2:
- hwmon: Scale in1_crit by the feedback divider ratio measured at probe.
  Further testing after v1 found that on boards that raise the rail with a
  feedback divider, as the FS1606-0600 is used, VOUT_SET holds the 0.6 V
  feedback target while VOUT reports the rail, so v1 reported the
  feedback-pin trip point (about 0.72 V) as in1_crit on every such rail.
- hwmon: Use named initializers in fs1603_id[] (Sashiko).
- Link to v1: https://patch.msgid.link/20261019-fs1603-v1-0-8adf972386c1@nexthop.ai

---
Kevin Jia (2):
      dt-bindings: hwmon: Add TDK FS160x and FS1006
      hwmon: (fs1603) Add driver for TDK FS160x and FS1006 uPOL converters

 .../devicetree/bindings/hwmon/tdk,fs1603.yaml      |  53 +++
 Documentation/hwmon/fs1603.rst                     |  75 ++++
 Documentation/hwmon/index.rst                      |   1 +
 MAINTAINERS                                        |   8 +
 drivers/hwmon/Kconfig                              |  11 +
 drivers/hwmon/Makefile                             |   1 +
 drivers/hwmon/fs1603.c                             | 498 +++++++++++++++++++++
 7 files changed, 647 insertions(+)
---
base-commit: 400be69515c327ced60082b27ede902a8d93cbdb
change-id: 20261016-fs1603-25483c5edc57
prerequisite-message-id: <20261020-hwmon-pmbus-fs1412-v4-0-27ece4e43d04@nexthop.ai>
prerequisite-patch-id: 48986e9a4b228cab399cc8b28ab5cebedebbca09
prerequisite-patch-id: e9d346bc8703fcb8032b663bddb7514ce31f2c1c
prerequisite-patch-id: 460dc5083895fdd9fc430ce886736561151571bf
prerequisite-patch-id: 34cc05e38fdf5462d315c20f186a2c2904a572f2

Best regards,
--  
Kevin Jia <kjia@nexthop.ai>


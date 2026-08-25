Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C13C3F0765
	for <linux-hwmon@vger.kernel.org>; Tue, 25 Aug 2026 09:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787649958; cv=none; b=pvWWDpnWhwzrgZT6xH+L79XEgOjGGYhgbThWbdfZ58bPiAcOYV6GLtBHkLUiK6OEcDVWvTfY+0XBj1EkA9kKERvVrvTfE1Gs84Aq+MgmrmTmvIvWeLYQrNh2XYDqVh2Cp7kFmZSJvx85E/4wFPY6gZhqjf3SADCW467GJktZ8mE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787649958; c=relaxed/simple;
	bh=gNbMxqUlA6wa4NuZncaIpEqWzCwySUvzyrK2sISa1Ng=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YbdOFToWMqpShLuAhx/XepB3XDX8bQaFWFmqpLjhEJJkVoNEvAMPZHgvcXvpkccW63ZrL/l8l+Jv3nzuoL4aROCo9UzjOmbCgMlkZsWhKSElF91SdJx4d+E98vMvGhYBau6TDrTHNQKNE++4Rzmqv4vwEUj26UsLR5/w1m2ePdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UqlKnHX1; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UqlKnHX1"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c160420289bso653769366b.0
        for <linux-hwmon@vger.kernel.org>; Tue, 25 Aug 2026 02:25:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787649955; x=1788254755; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=j2rSGrpetz4sib6pgIqVxIKVNTVPOp3P2Cb6kEKa91o=;
        b=UqlKnHX1wSj25cS5angTIDbbehrqU22GyODjgeQyvc7pkKXFnOqPGhsVQIhPparGME
         +YW0JZwzvfTfKGcwgIdCZjdtn22gNm5PNuhDPToBE+YrvURsegUYRWZyc/Qpp20HIjMl
         83iGeu0Tm7gOkRcpwg4GUx0rQPI78UKv8RKrBlYiJWQx/OmghIpSYaL1Q6vQz4BnYRb7
         fbSzghmzS2pe1kWG4Q3UI9vKS4E+lSFyf1E9EPeYX3looAf9KPluSod409oonmEPMm24
         zaplVCFMj8Yu4WQ9reWt5id3WHP2kARGB+3XNXdnZ2qbWRfrduAy2OERr/T0aUAkST6/
         Wh7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787649955; x=1788254755;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j2rSGrpetz4sib6pgIqVxIKVNTVPOp3P2Cb6kEKa91o=;
        b=jBKeORvE2F2UUO1QU7t2kksvFtFs0zSLmLiCqeMS1bBwk2Rgo9i7G8pmRfMuBBT0Hu
         0wTLP1nKx67lqj5nq5vdqBHx1kupu/GZnnxzm6l9xkuEghvKcnVbWveBlZk5FTSKTPqO
         0BnLeSbeaV7h3PhTp3TbR81nzDvkpX8FfJ+Ilq1rCf4fNFxWs0E7lq0uBGagCbq7pJ+o
         giHaEu+qyk21dQgDTMWdnUIEzhTvfiUZUXZM4b/OZbHlMbBAYXR3GNZH2CMwU35ET0L1
         S1TB8QlitQCU1r6hkzEaKJkR+Eh2bpBqhOCPJ7uVJBUjrT415J64BWoFVPhJm5U63sdv
         9UnA==
X-Gm-Message-State: AFuF++nTd+k51JwrYJtHZKBDDSxXs2Ru/iO1u4odapRX0Em/VJcH2izx
	cvXHHqRHiktSRZxjRfEmNct8SH6sqDmHhoSIJJrWqjteR0+/GtisYpzJ
X-Gm-Gg: AR+sD11so3M+6EHjp9wwI1eIQHOagDO57wqFhr54tCvavdP3Kni1gxNVBXODSwpWmx5
	mcDDYLltwzY/HQHtL7N/mzPloxbGc4CxbVXfyjFREyenP+QoOPXD0F+sR3fiS7kB+LlkENe4Ice
	IdD7x/7TnYJd57mqWD9BVlz5BAVlULhXVoBksXHSftoqZKdfhya5Ifu+iBCGswGHxss6ka3Fitu
	hyQ6YZoaxJn0SRwU7yZ7sQI0Pbn8RS5vvru+0pKbhMFkF8cX2GKAXiGxmoZ2x3bvV3tNlVZO3oA
	Upvp0u7mxggJ4jB5TO5UzV5b03rg4ElFzM6jaHRX+lsgg5ikQ917MStB7BvUOfQBE6HAxIHjnT3
	2Z/dmuk/ym0aF0176SUwyvznMBCNYFU0+hWRzb2p2SJOCLA38bv6OU2Zuforp5P0JdousZCxMsA
	IV/zvIjyeJTRxB8mNRtjx3eZrPC9cZtHBxRzUerPXhB0N8y4ZaMRfWhcW8bWzi7fD8ItwzzDQjY
	vLONN47mThSRCpT/C5SoDKHFKGFChpI8AdasW4vENLhygf/0B18aILEnhayIH10zlvfC6gdjuNI
	BEAGR2eza9BJNFVa3aAWIPQcVU69XHUMVw==
X-Received: by 2002:a17:907:934d:b0:c20:9447:bd5e with SMTP id a640c23a62f3a-c246a5f6d65mr3680207766b.9.1787649954768;
        Tue, 25 Aug 2026 02:25:54 -0700 (PDT)
Received: from fractal.tuxedo-gray.ts.net (c-78-82-25-228.bbcust.telenor.se. [78.82.25.228])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249606bd05sm1612570866b.2.2026.08.25.02.25.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 02:25:54 -0700 (PDT)
From: Johan Dahlin <jdahlin@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Dahlin <jdahlin@gmail.com>
Subject: [PATCH 0/5] hwmon: (nct6683) Fan control for ASRock B850 Steel Legend WiFi
Date: Tue, 25 Aug 2026 11:25:41 +0200
Message-ID: <20260825092546.669450-1-jdahlin@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fan control does not work on an ASRock B850 Steel Legend WiFi (NCT6686D,
EC firmware 1.0 build 10/29/24). The driver does not recognise the board's
customer ID, so it only probes with force=1. Its pwm attributes are then
read-only, and even once writable the EC ignores them until the fan is put
in manual mode through register 0xa00, which the driver does not expose.
Writes that do get through are sometimes silently discarded, because the
settling delay in store_pwm() is too short on this firmware.

This series fixes those one at a time. Patch 1 stands on its own: a write
that succeeds on the first attempt issues the same register sequence as
today, so boards that work now are unaffected. The fan control changes are
exposed on verified boards only.

With the whole series applied, all six fans report and pwm[1-6]_enable read
2 after probe:

  fan1: 815 RPM   fan2: 631 RPM   fan5: 386 RPM   fan6: 354 RPM

With pwm5 in manual mode:

  written   applied   fan5
  60        60        337 RPM
  100       100       443 RPM
  150       150       627 RPM
  200       200       794 RPM
  255       255       933 RPM

Writing 2 back returns the fan to the EC, as does unloading the driver.
Without patch 1, two of six writes were lost and the fan kept following its
previous value.

Each patch was also built individually. I have no access to Mitac, MSI or
Intel hardware.

Johan Dahlin (5):
  hwmon: (nct6683) Retry pwm writes until they take effect
  hwmon: (nct6683) Add customer ID for ASRock B850 Steel Legend WiFi
  hwmon: (nct6683) Add pwm[1-8]_enable
  hwmon: (nct6683) Restore fan control mode on driver removal
  hwmon: (nct6683) Enable pwm control on ASRock B850 Steel Legend WiFi

 Documentation/hwmon/nct6683.rst |   7 ++
 drivers/hwmon/nct6683.c         | 124 +++++++++++++++++++++++++++++---
 2 files changed, 122 insertions(+), 9 deletions(-)

-- 
2.53.0


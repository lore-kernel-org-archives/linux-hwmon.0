Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64240336ECE
	for <linux-hwmon@vger.kernel.org>; Tue,  6 Jan 2026 16:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767715441; cv=none; b=OHZEBz7mq5zbzi+7h7uqfk2p2sSXsd4fPH7q2Sv+CzavZUc6dJlMiROhor8aFE0gJsLW0S5s/osYYNSe59WqAxs7myYZHi11dfDy8YLJQrgCNf2e0rHlFAK0dpW6vNSuvD5goSpQ3gI7j86uZkWMimkzUTl5a+3eQQl3KBjWhEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767715441; c=relaxed/simple;
	bh=I0zxWpz+WdShjD2pMGdi2UhhCOsQ+dRFjOiqpqzQPZY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QTKNHKuBlQOWpj4YJfoTbns/bFq2BftXfeUhw8aC2u3e6iElIX6WGG3QgYWR3f57gadR9TXN/A4E5M6yOW5cAAcMp9Rm3KmnMme1F0mE9tcACLZAcaRYlNwBy1pNyy8vaZsG8392i30+0liD5QKYPD0O6XDH0rxim1zrWIfa768=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LCSE8S4+; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LCSE8S4+"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-64b560e425eso1519043a12.1
        for <linux-hwmon@vger.kernel.org>; Tue, 06 Jan 2026 08:03:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767715437; x=1768320237; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xQLRuTGhgEXwZ/IQ+OAx9oAMT59BlPYHzpxFvRzsfUI=;
        b=LCSE8S4+eEHrVAnO0r2lzGjyQpbtK442V+TeNU99Wa20rlhNlYGSD2LTSfB5m8yoZu
         FYUruRloUCXLa1qPEaFaal+7wb/F5xGb8rqyewAjLGnzhmlacM7aYgt7Ng0CRoBqtaTo
         3iWc/l0DFgDyr3OKk0bPve/mTCvHem0FKU0ACiLQK6tt3rCnsoBSPtmHHHzNpNEyDcmk
         yk3wwooefoomD+bjTTb5YatyggNm8HUyREmfOMBy/8EDofER+cXJXfqCr5GJXnJHHrkh
         Lj+B8vSNOcC6wbd+y2YPvJodJSqxfELz3QuIFXAGuWA4NGShbM6EhVEq9aPzQTW8yeHV
         arhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767715437; x=1768320237;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xQLRuTGhgEXwZ/IQ+OAx9oAMT59BlPYHzpxFvRzsfUI=;
        b=KoSN47qqw0rDYjhaWs4dHTpZYEfRp/cID2rvX9qzqyXPxdEVIVB1AzwPgxQymbqbEI
         dQ7qQsKI9I6BXcjsq5u7JSDEPV9esO50Vp2o6JEvpXO+tJVu1/8xIQta/7+zEznpqzrZ
         0sMwX+p7/Rz2oidTtzxru4TQx0iqyyveXboL+6tW4S2J/YpQtHmTdXb3b8g5J9pBT2ep
         oIHSpY4AkhoJrdtSpSdO0932+abxbqdIIV6m+q0zSdEys/3HcN5D05nw0z2ZpDj8Ufy2
         pmKyorxPXIQQW70R6cMn7EG5lXV/e5VqA2rCB6shT5r/4Vl3CV/0ZjJoBWwlnT4P2Zc0
         /u2Q==
X-Forwarded-Encrypted: i=1; AJvYcCXbn5SVPkvz05YwPi4T49BjiHutImfDNzz/SN71hFsNZaO1oXwHFP+m4EfXRiuaeIWBI//EgWAbzlLZmw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxexuEagwzL5AoSEVpNH1UayqK8VutGFO0SCFNxVp09yHpPV8gw
	0arC41XX4gzvqvJzZTifutAfCtWTYvDXy13h2xpog2l0jJH4qIqWddi8
X-Gm-Gg: AY/fxX7wl/WgBHyegHEoAs5yol0kkjkJt6LZZ49Lmx8lv79z3eNRCdmdYdxtnS5x9+L
	WXhqgSi/gC7b7KQserp7z5RFd7fZaAE40tZ1OoOpg2bEf8NnAJV4zGKexlwEAN2aUkpdqoUWAbw
	DDJvs3t/mxaVX10wDPmZn3qrAuTY3LlGxE/99x0gDjVSgmDQn6DNZKSfgb4bhzTU24ZaRhDM7ha
	Lh3UjyhqI+/chSvbex8EhTPvdjm5hHF+x19PSWZx+4/ylxwtKLX/8CCTPfWvooH6NtlbDJu3ldM
	qB6g8iPzMJsoqZIXegyVyp0UeV2ajxghDjb67hRH9igZkcdS2x75FZSd9SgQyKIh/fOkioP11ct
	RzTbJPodC94eb3Br7t6bedkS7Ih+13UFIzBY0owRdkXL/oxGcri4TFiaDZCwTzR96EcLkBpwrGn
	JCmkjiYsxSv6ZKITN8JNV7vlA=
X-Google-Smtp-Source: AGHT+IHmXCVGX+Kat7e6+urgJ0JLM+ij8FS1Zj4byI1uScqqDLQYyO7sz0Nhw6oxtw/w3yBCbK2uyg==
X-Received: by 2002:a05:6402:2356:b0:649:aa69:dc07 with SMTP id 4fb4d7f45d1cf-65079321af6mr3038310a12.12.1767715436346;
        Tue, 06 Jan 2026 08:03:56 -0800 (PST)
Received: from vamoirid-laptop.. ([2a04:ee41:82:7577:80f9:d6dd:93b5:e2ef])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-6507bf65ca0sm2474912a12.24.2026.01.06.08.03.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 08:03:55 -0800 (PST)
From: Vasileios Amoiridis <vassilisamir@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux@roeck-us.net
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Vasileios Amoiridis <vasileios.amoiridis@cern.ch>
Subject: [PATCH v1 0/2] Add support for HiTRON HAC300S PSU
Date: Tue,  6 Jan 2026 17:03:51 +0100
Message-ID: <20260106160353.14023-1-vassilisamir@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Vasileios Amoiridis <vasileios.amoiridis@cern.ch>

Add support for the HiTRON HAC300S AC/DC switching power supply in
compact PCI format, with a 300W rating. This is a simple PMBUS
compatible device.

There is a small caveat with the internal registers of the device and
more specifically with the PMBUS_VOUT_MODE. As it is already described
in the driver, the device does not support the PMBUS_VOUT_MODE register
and at the same time, it returns the voltage output values in Linear11
which is not adhering to the PMBus specification (PMBus Specification
Part II, Section 7.1-7.3). For that reason the PMBUS_VOUT_MODE register
is being faked and returns the exponent value of the READ_VOUT register.
The exponent part of the VOUT_* registers is being cleared in order to
return the mantissa to the pmbus core.

Vasileios Amoiridis (2):
  dt-bindings: trivial-devices: Add hitron,hac300s
  hwmon: Add support for HiTRON HAC300S PSU

 .../devicetree/bindings/trivial-devices.yaml  |   2 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 Documentation/hwmon/hac300s.rst               |  37 +++++
 MAINTAINERS                                   |   7 +
 drivers/hwmon/pmbus/Kconfig                   |   9 ++
 drivers/hwmon/pmbus/Makefile                  |   1 +
 drivers/hwmon/pmbus/hac300s.c                 | 152 ++++++++++++++++++
 7 files changed, 210 insertions(+)
 create mode 100644 Documentation/hwmon/hac300s.rst
 create mode 100644 drivers/hwmon/pmbus/hac300s.c

-- 
2.47.3


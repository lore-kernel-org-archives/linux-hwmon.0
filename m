Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0605A245031
	for <linux-hwmon@vger.kernel.org>; Tue, 23 Dec 2025 01:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766454641; cv=none; b=Iv4URmLI7mNtFfhTofQ1kqzoqjI2oBE8CKsB4ioBBVKxnwzSPjLITMeZQur0DPR2w3xFpjiboxisIAwI/dF2SrHPD7j320OkKY8IlG+t0Of2QZoL/pbhWEnnOUSDyZb0hMqvQZ+y4sZA7fh4EUgNMk6784glduy3on1lEy0/j5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766454641; c=relaxed/simple;
	bh=q0MXU2V4yXyG9Dt8boTEYRc02KHOaBnXIrWKxjNu/rs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=DWst1C89NlSEowpefdBPUpGmBW9kHyTjrbU/xDGAUpbCghlF0JOeryeGz1BOM2f7t/LD7mf7gps54zOlLIvl884KXE2OFYFLyNvYgMIPnQLlIg1GJW7GcfR3NllTSU3jpLfLk8eodVJkc9Vs3uytMsVOpD89TON08rAq6kJIpWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ax1IsyRM; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ax1IsyRM"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2a12ed4d205so39352845ad.0
        for <linux-hwmon@vger.kernel.org>; Mon, 22 Dec 2025 17:50:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766454639; x=1767059439; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xscG6RZGK6mPQrxphjn8rTShXaTt3nErGk5YzbghIBo=;
        b=Ax1IsyRMESMAzOm7/biofvpHE/ScxEpJ4shxHE01jD3fUEiW2Qow75LyGfIc4Y/Qhf
         0y0Uov3K3cTHLoVlIdpIq3JGkFMSWSAgOCQGGYl1mgJ9T4F5mgvNlGQ5tL/uDACG5Jbr
         HTVsciZc4iCOBZ1gxdbgtpYq+JWdxBzoOAITPljkzZ7NWS9/5+faDu09/PwJm3Q3Ikkm
         Eycn73c/9n7+XK4Dcx5NPYT/IlNMLrsam+G4g7rZXYYNW2Rp8pINNiYGJFtua5f7mDvI
         EyjVTn+fsYkbtwE3slvsLxlumQM76B/DYPVwK5ECTeYbbjPVr8xtsOSQIuFoeOjP+OFt
         dbdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766454639; x=1767059439;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xscG6RZGK6mPQrxphjn8rTShXaTt3nErGk5YzbghIBo=;
        b=GaffYgZ2+E+xmZ5nfbu+biQzvNSpi9mudqI40B+ARyMibV8QKk0745t51uTa9BL05P
         y8INNhcYA882MtueNWOk/oRu1WrgR0t66FTX19YwhnQJQMRVEKWRVjrAn973ZZKEwcc3
         T8RGHbd6rcI55iSnbRWKyng/hm0T4lJIWH5d18endOCBPdlnH4LOHE2BrclknlTU6B4j
         JsTTTKLzHQgdLvAEbJxeFazKwSDv8hBJzgzAzVVFq1oh/+c2xb1FFMeK/aGSyqA0I4o2
         7W3zqvcdw8MKJ4AXrY26zYqLdB8W/tqGtbtMXmIWhrwlyUQv9ZGrOlwtCrmxpNNmrtlu
         2hQQ==
X-Gm-Message-State: AOJu0YxcfsHiHk4liakVU84kUlIQH+Ncw8bBQghOn0jAoO8MLjB7NX/4
	OXWRbI+oq4RS4axTb5oIYb/PNWZHowg2vvug+Fcx18PPfcVJ8kqGolh9GHtKjIvq
X-Gm-Gg: AY/fxX4mNxA0oe97zwEZC0PAmXTdMDArX3C1scfBuCeH4HRMyMxLrx89Rr2UsDkSCoA
	1kxior4lXWQ0z5yNkO86ppRAe83l802WyLVIZemghdLwGjrWVO49kghnfvI9VSFtYUkDdcTwgm+
	Vf0SdUOyLa7yVPHuPAaUbhBHcqY7pBoRIVwEoAO7eLqdTj65llNEklaYVRcQmBk3G23B20nZBCW
	mRccbrausZPA8p5qq6hG9ODzMO4nt3rybaZmAgx+FTu4gBm99Zv8clPqw5DVBaH7OOUQqzg5GgT
	TWvHrMu5zlAg46xwVgOk6CSTyUYE29/GHhOz3mcRFMT3pM18xMkHdw6007pRykAfgQVPuSuouRD
	carlu8jc0TYjne259ArxOFXTjxVynSK4bJFYbQceDYPmoY05Zr5maopW9RqsVfV88f959xPl+lV
	kISOANg20Qztf0m12aQQCdIcnXYeLgbBx7UX6eZlE0l6uV6rTIyqXcfLFKXn3yPw9R2BELTE73V
	nQheF/4/Zrq/TPhQvFOy/FU1x4dqNg=
X-Google-Smtp-Source: AGHT+IEUcD+B/8rPGyakTek4aNTU9jw6ozofbVuGAW/e6r2m680KkKenDeJ2iflpi617B8bEK2YU3Q==
X-Received: by 2002:a17:902:c943:b0:295:9db1:ff3a with SMTP id d9443c01a7336-2a2f2735164mr131611775ad.28.1766454639100;
        Mon, 22 Dec 2025 17:50:39 -0800 (PST)
Received: from charles-System-Product-Name.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c66834sm107316205ad.9.2025.12.22.17.50.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 17:50:38 -0800 (PST)
From: Charles Hsu <hsu.yungteng@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Charles Hsu <hsu.yungteng@gmail.com>
Subject: [PATCH v3 0/2] move STEF48H28 to pmbus YAML
Date: Tue, 23 Dec 2025 09:48:30 +0800
Message-Id: <20251223014832.1813114-1-hsu.yungteng@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changes in v3:
- This patch series moves the STEF48H28 device tree binding
  from trivial-devices.yaml to pmbus/STEF48H28.yaml.

Changes in v2:
- Fix the entry added to trivial-devices.yaml by correcting the
  comment and compatible string ordering.

Charles Hsu (2):
  dt-bindings: hwmon: add STEF48H28
  hwmon: pmbus: add support for STEF48H28

 .../bindings/hwmon/pmbus/st,stef48h28.yaml    | 46 +++++++++++
 Documentation/hwmon/index.rst                 |  1 +
 Documentation/hwmon/stef48h28.rst             | 73 ++++++++++++++++++
 MAINTAINERS                                   |  7 ++
 drivers/hwmon/pmbus/Kconfig                   |  9 +++
 drivers/hwmon/pmbus/Makefile                  |  1 +
 drivers/hwmon/pmbus/stef48h28.c               | 76 +++++++++++++++++++
 7 files changed, 213 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/pmbus/st,stef48h28.yaml
 create mode 100644 Documentation/hwmon/stef48h28.rst
 create mode 100644 drivers/hwmon/pmbus/stef48h28.c

-- 
2.34.1


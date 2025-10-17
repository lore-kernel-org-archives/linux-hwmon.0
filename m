Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7A92328B66
	for <linux-hwmon@vger.kernel.org>; Fri, 17 Oct 2025 10:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760698696; cv=none; b=m2gDCISTIxf+U2efMKa27Ns+Up1ZL2oS89e6R3TaAJwC7SgHVLqpem0s4kexzsbJSLCzhoHDl1DCvgbfvt1ZmHvkt11YWKV4EMJbm5L68WaJ/vRIZmtLF7vSbT0znV69MIT78mMVlhgOGAsCu7OkaAmPVVQpEeJyYLapCRwwRy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760698696; c=relaxed/simple;
	bh=jYLh1g0/g+YswT19wb8sGFf9meznkL5gtg/UsZXCKQU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZKID6rs5PyXRSW9Kl+Ur5GcNFX19gPpYtNPaukM5KFtbxy1KuancqOw2IBbzl9AuE6C4mr6ciKes+Y9/h8GdBUA6FISeczrdKIhl7brOifQQL15RUATribPCndy5YUTC8S6Ry5iGI0iYtCkHABYwA4WjTzS4nKyR90/NOodcvuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MQvPPquH; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MQvPPquH"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-7833765433cso2451055b3a.0
        for <linux-hwmon@vger.kernel.org>; Fri, 17 Oct 2025 03:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760698694; x=1761303494; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5eRznc/oLGLRRb/vl90nQzjbWZjbdpkXCZdSvk3IxGA=;
        b=MQvPPquHetcTsZXKOgOgZDvfn79VR8+oaoGUGlKshsGPSw+HpHSISnRIX4ZDFVepA7
         EFrntiYNqWRunGfdlRio+/Li7+gKOKWqffi2kG6QTBMFCQ3k4TMRpQEaZ5kvGBQMt5BR
         brWXNiCNT9eq5sLI59Ta+1mHAAIbfnCf8g7GQL0e9vJqMwC77/RLW8eX7Qrp7mEql4kV
         gMG851XdJPB9bSpBZgH5UQhWL3gTnkSHrZ/dehhQDTk9Vnm/Lwu9tj5CBcXXk+5Wgf3z
         ujDGbxLwnI5JXSgdaFBD323fQ16o8vgX3RijRoWMAq8d/uFKj+NSU40tigU3Jx+jgLHn
         I8Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760698694; x=1761303494;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5eRznc/oLGLRRb/vl90nQzjbWZjbdpkXCZdSvk3IxGA=;
        b=R5izDOQxeooN/a7JitWTyDbZpIpctUpE3CZpiRwecpypq77tpKTvD+JR+Az+Axnu1c
         He/wHUNIM3aTczoDH1o5bhKh66alULzLdE4JFYGU+T1gixOv0uhOM5NCJ1PtI/K4+Rjv
         iUvEY/oRxG7SyhQUBWU9vy4K0JGGssuCmotNWW8F6lifry+e0dKqWqaJTaDNLLhCr9Um
         PSCuNCad+3FpEpgq9GoHoopSFWnRJDQUu/xHWb7y6gcOi0og0UyZF1BThNvJmsMKaI7I
         6ogKnA+DeMTOUYvhu1ckKoRinbz/TXAHl1Cbgf+bg6d0s3TBBzNJxrA73nEmzorfQIVm
         Y4cg==
X-Forwarded-Encrypted: i=1; AJvYcCWVnlBGl+CnGaezfvJIMNBKVIb7Ps2QGjLkIuOmPWWsISBGzKRiu+swAQAi/WZmixPulQh/mlAJQZpWkw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxW9KLbm/qc1jR/MRYrZZdwVoDCbePIzwpfS8mR6Z9BMr45kzlJ
	CMEk1EejzlMUdJ45ZrBiIAmE4vzIoBvlUbceuAG8a2vHe4YWB/fYT4Ry
X-Gm-Gg: ASbGncvpFc3VIsw0jFmNRAAAbo/DZ9ikK+lxcwFBEh9C5g7H4UYp1ut1j3l4BVEruOh
	i2WiGGi8dJDQ2b/8Sj81vrm71KDmQXQL5+R94DcNaz22MaJ86/CU+RO2Z7+oHsdEFjIHzihr0Nf
	7cnoAiqBQb1+qSMxrCwD/TQVtV78C0ICJ+aB/DDv7ek9jsEkMfA9X0v7AJfkkPm3R3YWK0ZKaXN
	d8Ox2WDIKg3VwggnoJl6FekfyxplWTV+UwAuq4BMH2X2egpXf9YlyCgCwE/4t2lrMxL1a1/jogm
	71qr+jZ6vTkIR2ZA6AghAQh48DuzQQKpsc3VrjEJcgMLaA2YEzfF69teLLq8N3zqvghSb89/SCo
	yGuwrs8DVB3PasxuLUwXpCt/1qlvJ8Yvnk698NO2rJP2UP92nDV6ceQ1WCf/dgPtnsliYItMZ6x
	jPuSMF3w==
X-Google-Smtp-Source: AGHT+IFqhscQ7885gKuszm90YTf0KoEGYReUi6/2alYhWRhod7rmgZECRMNtrRBswwS4tMpqwgKgtg==
X-Received: by 2002:a05:6a20:7489:b0:32b:721e:ced1 with SMTP id adf61e73a8af0-334a8617237mr4808979637.36.1760698693905;
        Fri, 17 Oct 2025 03:58:13 -0700 (PDT)
Received: from tixy.nay.do ([2405:201:8000:a149:4670:c55c:fe13:754d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992b639cc8sm25407571b3a.20.2025.10.17.03.58.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 03:58:13 -0700 (PDT)
From: Ankan Biswas <spyjetfayed@gmail.com>
To: linux@roeck-us.net,
	corbet@lwn.net
Cc: skhan@linuxfoundation.org,
	khalid@kernel.org,
	david.hunter.linux@gmail.com,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	Ankan Biswas <spyjetfayed@gmail.com>
Subject: [PATCH 0/3] docs/hwmon: Fix broken and missing Maxim chip links
Date: Fri, 17 Oct 2025 16:27:15 +0530
Message-ID: <20251017105740.17646-1-spyjetfayed@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series fixes broken or missing links related to Maxim chips in several
hwmon documentation files. And updates a the links that get redirected to analog.com
to their analog.com links.

These changes remove several warnings generated by `make linkcheckdocs`.

Patches are independent and touch multiple hwmon documentation files.

Ankan Biswas (3):
  docs/hwmon: Fix broken maxim-ic.com links to analog.com
  docs/hwmon: Add missing datasheet links for Maxim chips
  docs/hwmon: Update maxim-ic.com links to analog.com

 Documentation/hwmon/ds1621.rst   | 20 ++++++++++++----
 Documentation/hwmon/jc42.rst     |  6 ++---
 Documentation/hwmon/lm75.rst     | 13 +++++++----
 Documentation/hwmon/max127.rst   |  4 +++-
 Documentation/hwmon/max15301.rst |  8 +++++--
 Documentation/hwmon/max16064.rst |  2 +-
 Documentation/hwmon/max16065.rst | 16 ++++++-------
 Documentation/hwmon/max1619.rst  |  4 ++--
 Documentation/hwmon/max16601.rst |  4 +++-
 Documentation/hwmon/max1668.rst  |  4 +++-
 Documentation/hwmon/max197.rst   |  8 +++++--
 Documentation/hwmon/max20730.rst | 16 +++++++++----
 Documentation/hwmon/max31722.rst |  8 +++++--
 Documentation/hwmon/max31730.rst |  4 +++-
 Documentation/hwmon/max31785.rst |  4 +++-
 Documentation/hwmon/max31790.rst |  4 +++-
 Documentation/hwmon/max31827.rst |  5 ++++
 Documentation/hwmon/max34440.rst | 24 ++++++++++++++-----
 Documentation/hwmon/max6620.rst  |  4 +++-
 Documentation/hwmon/max6639.rst  |  4 +++-
 Documentation/hwmon/max6650.rst  |  8 +++++--
 Documentation/hwmon/max6697.rst  | 40 ++++++++++++++++++++++++--------
 Documentation/hwmon/max77705.rst |  4 +++-
 Documentation/hwmon/max8688.rst  |  4 +++-
 Documentation/hwmon/pmbus.rst    |  4 ++--
 25 files changed, 158 insertions(+), 64 deletions(-)

-- 
2.51.0


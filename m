Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFD3542643A
	for <linux-hwmon@vger.kernel.org>; Tue, 11 Aug 2026 23:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786491594; cv=none; b=MvtRvMABC8g/orGEvw7lF952aiMZSO6UtPosT7zqwBvLXEz/IlTSHAxiTtW0f4bNVh+39U8d99wNeRZMuM9N5a1tfXbGT7xN5667hByPAfzVdbAtQcmIwPSv3LC3J092/wJ2Qv/44F2gnI5SFMWBGvjuMx5weikeVPn5Er8bfDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786491594; c=relaxed/simple;
	bh=P2Nu5DboX2X/QOjXC1DDaUwYxFadnmJxF7unDtxTDtU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=af3eG9wkeOOfBPQa+CYUnDk2ecqs75Kq9NYOkdgramMqcI3hr18EFFLKIByQofcQrlQxvhp8DZcheohqnGfsq5N6IMizDV6GlvNqWe3SU4u3ChVBFNyHMf0vt5J1yD1kRlCnDFoWxIgpWcL3ztvcKaRj+SdcHSO7WgS3CpLQzfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arimil.com; spf=pass smtp.mailfrom=arimil.com; dkim=pass (2048-bit key) header.d=arimil.com header.i=@arimil.com header.b=X0X0KTbl; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arimil.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arimil.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arimil.com header.i=@arimil.com header.b="X0X0KTbl"
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-8ef1dc934d1so3778086d6.0
        for <linux-hwmon@vger.kernel.org>; Tue, 11 Aug 2026 16:39:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arimil.com; s=google; t=1786491592; x=1787096392; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PbLKe0f/gFmgvetaYSGWDLxHRbYEkDJwTXG4WsOrCbE=;
        b=X0X0KTbl/XKPWldZvmFc6Ig6zuvs7YJ+lCDW/DN5nJVQJ/6EG2NZRsQsL2kdS+53fr
         4YhGpuZEjHNXqxyKPifgRD8zDM09Gy/ixRdjDYAFns80IbFBJn/UWBbQgN/HBod9uxnB
         VWaNX1HiwFkcJ4EYfQ/xLnUMtuhDAXg9005D/7q2w90NHUxiRBcTGsn1iRNXjdlqUEu8
         M+dhTF0Al2jlQ3GbzbEC4++I9+lMPMPaiPcAstUeKGTAs402hgEcQncmMOO881mrUcFA
         jjktxMHZoeV5fPhjzy/e1qySYSVUCp7DEiBoN2kGrlwuARsjZWfrKZpeNehuPOHnXyxT
         zPHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786491592; x=1787096392;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PbLKe0f/gFmgvetaYSGWDLxHRbYEkDJwTXG4WsOrCbE=;
        b=rOQXega3GldNZIpOX72jTxsiO7HeuHKjq/zuviKLwHozdP1VGumivF5P2rskDa1Ofd
         1zCLUkatjKsMI/3VxezqRc5IQV3ELmimDbd4Rh0GExc+PHzxyNLRSaZL5rosokITz1wU
         bqK1RFWgC2iICdEVuTvRWNAGIUWtpOuhOcbzjA62qc02bepBAtyXUSYowbVo2X3xZW3Q
         AffB2gDnEGkZH3nuNBqmeK0uKC9fkP9XfwtH4A7BQQwl0izlwrXTQcKL2K2Lwwo0X1Rb
         tnIFK88Vr0dMHqpdIiWbi8/DfbBeDrCHm/ksShZ6o//1kIWKOpiqRd7VC+p+RcoxyXWU
         wcuw==
X-Forwarded-Encrypted: i=1; AHgh+Rof+UZI7++PGI8xgdgVQ5OgYTvmC4BFat64yY3nISUp6URItyD54IAKb91WZ4pZ7mb2kx7hpvvBkqdTTw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyifRj1vjK5ajjY6DBj/ZN5oI2vflxY+sW9QOMySxmhEUlzQo2H
	hyV9vYV+fcoBcCdGUJ3RWz5XwXBDkaWPkI13KzzOC38k6yJU/GMfvPf9GZqAhX5DPBo=
X-Gm-Gg: AR+sD11LucRnPcjR6mTribQ0rc6L9k9fDnPcgkJyPpx3dj4fA1LQSFDJROsscEsZZYd
	zJdQgvvnhwCRxIjIchuAI4IlIAKbMlDb/p8IgbDx03ZgwQC1rdLKrPanplthbvjhZILkBOGcV2g
	a+6R3rx4EQ9ECQ/POAAl3S5N+XYGvJUrU2LGF/5uiQLamcd++wr0vAUyep+U1erEAW5ND4BDnHR
	gL2gTOU0YRU4IH/NWCBiCpKUucWx88CTZv6k0z6O2LqVrSII06Su8MBLQWnxXEF5GeYjVF7kQ8c
	hAuo/z8vnHjSuZ34Eq3l/dx45Sr2aHc2FkdFMpyX1v3QUqe8pwisB8D1Ql/0+ven8NysmViqitr
	vRGzfOcCQ5aONOOMdeN9ViYTpK1jCvbuIRyab7rIePzSaY62o4WWH6rjNmm1iFxp9I6lalgbj7B
	7mVfHrxny2uuhm0/E7AUCIYpTBxWqsVSioDMQ13Ey/0OSfB8E71qmKPRijm5+JEo529oSdZLOfY
	pYqHJIEwAifWqnvZRapySd51TLfqLIghA==
X-Received: by 2002:a05:6214:2b82:b0:8f1:617b:2692 with SMTP id 6a1803df08f44-90a707b3c4amr4839956d6.10.1786491591787;
        Tue, 11 Aug 2026 16:39:51 -0700 (PDT)
Received: from camelot.arimil.com (24.229.171.193.res-cmts.sm3.ptd.net. [24.229.171.193])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90a6c3c1d73sm9607256d6.34.2026.08.11.16.39.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 16:39:51 -0700 (PDT)
From: Arie Miller <renari@arimil.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Aleksa Savic <savicaleksa83@gmail.com>,
	Will Smith <github@notthatwillsmith.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arie Miller <renari@arimil.com>
Subject: [PATCH v2 0/4] hwmon: Add ASUS ROG Ryujin III support
Date: Tue, 11 Aug 2026 19:39:39 -0400
Message-ID: <20260811233943.319729-1-renari@arimil.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add hardware monitoring support for ASUS ROG Ryujin III coolers.

Compared with the Ryujin II, the Ryujin III uses different offsets in
its status reports and a different cooler-duty channel. It also does not
expose the Ryujin II's external fan-controller channels. The first patch
moves those details into per-device configuration, and the second adds
the Extreme and EVA Edition variants. The third patch, authored by Will
Smith, adds the White Edition USB ID. Will confirmed his authorship
sign-off and tested that variant on his hardware.

The fourth patch rejects HID devices without per-device configuration
before that configuration is dereferenced. This prevents dynamic new_id
bindings from causing a NULL pointer dereference.

The Ryujin III implementation and White Edition were tested through the
linked project pull requests. The EVA Edition hardware was tested by me.

Codex using gpt-5.6-sol assisted with porting the changes to the current
hwmon tree, organizing the patch series, updating documentation and
commit messages, and running build, checkpatch, Sparse, and Sphinx
validation. I reviewed and tested the resulting changes on ROG Ryujin
III EVA Edition hardware.

The v2 series passes git diff --check and checkpatch --strict. The driver
object compiles in-tree with W=1 in both built-in and module
configurations, and Sparse reports no findings for either configuration.
The range-diff confirms that the first three patches are unchanged from
v1.

Changes in v2:
- Add a final patch validating per-device configuration, as requested by
  Guenter Roeck.
- Rebase the series onto the current hwmon-next branch.

v1: https://lore.kernel.org/r/20260807000107.1786892-1-renari@arimil.com


Arie Miller (3):
  hwmon: (asus_rog_ryujin) Add per-device configuration
  hwmon: (asus_rog_ryujin) Add ROG Ryujin III support
  hwmon: (asus_rog_ryujin) Handle missing driver data

Will Smith (1):
  hwmon: (asus_rog_ryujin) Add ROG Ryujin III White Edition

 Documentation/hwmon/asus_rog_ryujin.rst | 25 ++++---
 drivers/hwmon/Kconfig                   |  4 +-
 drivers/hwmon/asus_rog_ryujin.c         | 96 ++++++++++++++++++-------
 3 files changed, 87 insertions(+), 38 deletions(-)

Range-diff against v1:
1:  af53cbee3303 = 1:  686fd2251bea hwmon: (asus_rog_ryujin) Add per-device configuration
2:  603a2e86b65c = 2:  68d87330a2f7 hwmon: (asus_rog_ryujin) Add ROG Ryujin III support
3:  0f4a66284361 = 3:  c3d95809f962 hwmon: (asus_rog_ryujin) Add ROG Ryujin III White Edition
-:  ------------ > 4:  e9558b907537 hwmon: (asus_rog_ryujin) Handle missing driver data

base-commit: 54743b5ab981d686b885c3da639d4ed6cc995e8b
-- 
2.55.0


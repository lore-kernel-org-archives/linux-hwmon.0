Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7F332DCBF8
	for <linux-hwmon@vger.kernel.org>; Sat, 30 May 2026 22:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780179246; cv=none; b=c79uCsjprheFI3Jzk/lM0oauO7iyiXKjcEiZ0fE4UKGn6nIUC9uHclMMfKR4RyFCM4g5a0WcMdvoNMyx400tRPGvLVlQjYDatCJCdfB/UjoyNgKYg7Lv1i6zCqxUPr31UKpS/ZbFkK75S3YgzwKRreia2Qd3Xm/fydmQAJPLQ7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780179246; c=relaxed/simple;
	bh=a7LxwJSjal9O3gE+BXiz8kyhWbrY5N/b0EYbMiYhfls=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TRvYS4QAmC06HTIt89D4gMaRRTGgNNVmn0Uz4ezm5WBFp7be52WM3lbinfDn9GABFWq/FC1SckoNaxtumRYAuiLN4RbYXxnOx7PSfsPgY3+T70YN34LPuuZPgSXhU23d6ay9X8LIZ3uKeRTD1yR9ugqQit6TeJzrtiS3VFlYxZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mX3gHl85; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mX3gHl85"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2c0c3546924so1026465ad.3
        for <linux-hwmon@vger.kernel.org>; Sat, 30 May 2026 15:14:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780179244; x=1780784044; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=F/Ni752JghWW4YLrsrvzIiGy8TjLmlqaR6Xdz5gy6ik=;
        b=mX3gHl852QeIHgvO9DdxmtAnjuwZaSLcMkPwzYd0C8yjMaC8HSizeDJJT09iosIGyT
         +ayRjFX0L7fAPVdTnpwziLzhiW2bZU4UnBLIXFEgQKh0xarwmoSG1v0e8Kipi8j0P6rb
         K0PNOklCJZ4yhABK2nlHdYtpqR6LIxnkzipM3KJynQWjXsrbwn6EDQZSgrDDTvpPbiCu
         7v5uiVX1JfsywnC13s564p3zGTEtEWhxvoDEPJxPU+52yFKK8fpqaNg/P1AOqDW1ahEP
         eirOI0W887d9zYaeVCXmam6erxRhQPq+9W8ytt1vxNvqBkpPqbHgh+XtdbZxQeOcX736
         DcNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780179244; x=1780784044;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F/Ni752JghWW4YLrsrvzIiGy8TjLmlqaR6Xdz5gy6ik=;
        b=Gjt6L6EU6U9PSy8NYTQfccYHPaDcYwJ3imGt52fhP3D1eaYAbHyYd4fVZU8wQPLlJP
         uZIgXe2oe8ilFq5DXPx54/xEZu5gwJPUPQJDi7lASqOuTC82wxgD4NrnnRuPvi/hiMCz
         fyavnFofdTbsV2b0WuA/MNsq5dePVPXl3DsiPYtBI/3vgc6irLLnkXhS/s9kglp+oCkV
         Gh+rs5IR3H6G4lBVviCQ3IPVd4j5GlJs/ComP8oVdS/OyogOorOw9x2rqk39IaVfo/pW
         nalFrMNogo60zB/IolS5Y79Jtj+vh7mCjyI55h1rZaiLG/80hiYQmpgl8TTwZRb5krOm
         hRcQ==
X-Forwarded-Encrypted: i=1; AFNElJ+/S/NmxYUgXNjpcoMR0PKNaxVChtHZVgKRrpxYhyXq2nc+qpoL/kz/DF/N9387UdRDtimwHPgzqm+Dxg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyBDCJMd0461a8urXSeFJIHN9WWnNt34yXFugxLUfMphpu1c8JO
	tCRKLCoszu8UsKjGnnhFSOUOKJBKt/GkvmRSUuc7xNC2goGrj5mEkokJ
X-Gm-Gg: Acq92OGSkPvWh/M8Hbh3nNDITA8q6qs+jAb/jVlukV7StDPLWyzpABpUxssH85BCeWt
	iWOhfz1KX4ZSr/L/vDVMUvWV3WyjSlvG1yw106GIQ0oES91yi68NVskNrkStuk3PdBpQVNPcubn
	9xkZwUDqdFZD68odG7VnjmstYmGkQgWsFkDW33jdpX7fR5ZEWLLjfSQJ7Viw/OLhBUDrgzGwWSU
	o399OLVUw3/icFbvVQNjcXrZhA5rXa9Ne+DGyAdRHMHchTNlZgettClxFrH2eDBRfe5Jj/umrFD
	yxY5mqHujNk+mLulZ1S/WmA6czcrPsGP48B9Sqj9aROojDk7dQRAla6ML6tXhJgvReJ9gZTdGdT
	RirA6d0Dey8BT5e4zJ41xONYDBzAcbUBi0RBm2gH8RSHCmabYktAj84ctAEQ0RivkB1fuuhMdJ+
	YMELDBQnsYJCXT9FOouzEk8LjNu+tjQf4EqA/rCR2e39DjxXEEff5Y0+YViffxv0mJnPfh+6EqA
	Kkgew0kL3t3wfU=
X-Received: by 2002:a05:6a21:46c9:b0:3b3:bdf5:1166 with SMTP id adf61e73a8af0-3b4281dbab7mr4887536637.39.1780179244043;
        Sat, 30 May 2026 15:14:04 -0700 (PDT)
Received: from Ubuntu.. ([49.37.171.82])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85771a9299sm5515226a12.7.2026.05.30.15.14.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 15:14:03 -0700 (PDT)
From: Manish Baing <manishbaing2789@gmail.com>
To: linux@roeck-us.net,
	jdelvare@suse.com,
	nuno.sa@analog.com
Cc: abdurrahman@nexthop.ai,
	bartosz.golaszewski@oss.qualcomm.com,
	linusw@kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	me@brighamcampbell.com,
	manishbaing2789@gmail.com
Subject: [PATCH 0/7] hwmon: zero-initialization instead of memset
Date: Sat, 30 May 2026 22:13:45 +0000
Message-ID: <20260530221353.159461-1-manishbaing2789@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

This patch series cleans up memory initialization across several
hardware monitoring (hwmon) drivers by replacing explicit memset() calls
with empty brace initialization (= {}).

Following similar cleanups in the IIO subsystem [1], this series updates 
these drivers to stop using memset() for stack memory initialization.
As noted in those discussions [2], using empty brace initialization (= {})
is the preferred approach. 

Beyond simple replacements, a few drivers (nct6683, nct6775-platform, it87)
were using memset() inside a for-loop. To fix this, the variable 
declarationwas moved directly inside the loop and zero-initialized there. 
This safely resets the data on every iteration and makes the code much 
cleaner.

Testing:
- Compiled all modified files using `make W=1` with no warnings or errors. 

[1]: https://lore.kernel.org/all/20250611-iio-zero-init-stack-with-instead-of-memset-v1-0-ebb2d0a24302@baylibre.com/
[2]: https://lore.kernel.org/linux-iio/202505090942.48EBF01B@keescook/

Manish Baing (7):
  hwmon: drivetemp: Use zero-initialization instead of memset()
  hwmon: f71882fg: Use zero-initialization instead of memset()
  hwmon: ltc2947-core: Use zero-initialization instead of memset()
  hwmon: nct6683: Use zero-initialization instead of memset()
  hwmon: nct6775-platform: Use zero-initialization instead of memset()
  hwmon: pmbus: adm1266: Use zero-initialization instead of memset()
  hwmon: it87: Use zero-initialization instead of memset()

 drivers/hwmon/drivetemp.c        | 3 +--
 drivers/hwmon/f71882fg.c         | 4 +---
 drivers/hwmon/it87.c             | 3 +--
 drivers/hwmon/ltc2947-core.c     | 4 +---
 drivers/hwmon/nct6683.c          | 4 ++--
 drivers/hwmon/nct6775-platform.c | 4 ++--
 drivers/hwmon/pmbus/adm1266.c    | 4 +---
 7 files changed, 9 insertions(+), 17 deletions(-)

-- 
2.43.0


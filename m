Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9FD63B9D80
	for <linux-hwmon@vger.kernel.org>; Tue, 28 Apr 2026 11:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777374590; cv=none; b=Y5Cntzh1y9cEQI9aEJdbUL4Zqrut1ztcl7awz1PpLZCR0kodaBusXyUsEtG+CsDvXszHeptgdZufAX03sXPtkphHMinU0Iro9Rj7C756Uf/ixuy+DTGHKuYhAp6USqmG7Wl30IGCb81//MKnXCYYXYKVVo3FRvr22JCuU2VUHgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777374590; c=relaxed/simple;
	bh=1Vp7zKw7I/5rzaasqJeo7lI+OEf8xK5r+iIbzLGBYeU=;
	h=From:To:Cc:Subject:Date:Message-Id; b=e/K5l672c9XPel48+MOYLXbhPSzgJGM9E3+DsfLrtsO6U5ZCm7gC1SKkPjqDs2no89ZyxxrQ8RK/+ya00x8IuDjykFDcL/tEFB43HqLCRO+nHYem1XDR49fh0VuOhDEjJTNGfuzVZIn/IK5HYUquQxIfGAMaXtx3Ulnm0u/CU8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZLuqNV44; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZLuqNV44"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2aae146b604so75572305ad.3
        for <linux-hwmon@vger.kernel.org>; Tue, 28 Apr 2026 04:09:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777374588; x=1777979388; darn=vger.kernel.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bkt/IQyJtwb/Crw+ebjNGvQqMlted9pWU+2ZKnZfT1M=;
        b=ZLuqNV44ha0eT5hB+0ggERgyBRBBh3t3w78rXve1FHzvyqhuKeoW7XYGPAifjdH+b0
         7OPf2kc0MerIR7J3RwBQRTy5adktE20ztWUG98OAeexS5R3A9loAOLdyJJxSVGAwqJcZ
         8MuDw/+L51TnW3CiyQN2NC9/COrPpD8GO7u4ZA90QzPbNXD/aniTubCLzn2Kd9sahaHs
         lxxJjw5nruVSStUuPHStGDxa/YXFaV0/dp/BZup9sWoswea6ebPbKKy2k5UsdseSIdRv
         uFxEzOdjNIKjWhyO3j6RTkiey3no70GLFedWdiGFHmV8g51Sm4EM+8VdkU7GWCUMxkKu
         Fbzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777374588; x=1777979388;
        h=message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bkt/IQyJtwb/Crw+ebjNGvQqMlted9pWU+2ZKnZfT1M=;
        b=m6kkOK5d5OFdqk5H/hz7Rp7Gz1YUQDPGI9WAmYslpdrxDs02SAzns6965uVnIQ6Pxo
         JydaW00esAzfdXxUNtFKjJjFhldRS2U4OfsOpUqEaENi7jowfaMp8ltMbadEaKcH394t
         kXO35xJt7/OD59xtb+2GoIsbJtjJGhm1MwHR75uIoxeNrj/iiLg+YJKAx7rNkAyjaeCT
         Vg1LXT+K4qKD1mpfhn/woe8xrmV6KQ5li649RoP0bETWbKySHYcJrrCPPQn8vEFOLY6F
         aWy3ssR0jvflJ3iYwRqbiyDn5B2TmnS8wk4UVMYptheYZMnyw1tLAsqVmklPzcsUEXYe
         NOHQ==
X-Forwarded-Encrypted: i=1; AFNElJ/ZgkX593zyhni3WnLhFtCS6NB/jXdMvSYhp1lzcENWmqhRynuM+mGKAyy6BSuSdYv/JKMjdIcHA3cEqA==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywtsdi5LMm2A7pV0ZUpfA0yR5rzS3aZOWs8PP0N17P2CyPRTXys
	XomYsyZZ4c7q825m8V6npyYRCns21doFszqRS5JvyPc+YlGwR7Q0+sz/
X-Gm-Gg: AeBDiev9gUxJ2OKT3eNi+vjv3/e9xEHwdqJvrr5Ga9HUg9urhDd/mYysw5ztwYIfz++
	Uzg+2CUeqDusTVgYnjO5GgZx5Tle8ebweYSm86N4AOnJRzcLstBGr5OI9kiygUx0vYKgMZJLlEt
	s7MI1KlxGdhwf7Jw9MRuN3fLLZ5u9Z2rfXksbIF2oZMJ+cFSqC5moLw23XWzlxrbeZDqEfDlzT8
	9LpgDFw9gtkwB1N+TnE84c4YtX8xPFkUQDRhs7TfAvBgsaN/Nl7g0D4+ubWTShrBJRqdD/dT0ZQ
	5wM0kl55OQun+OzCsMpodCS2OyLr/LKTJgMi/xv1NVWbi4zcK9X7x0+SIeRyJjfonu3LVzRDgEa
	Vq5AWm7f+ULnDMTxH/VHa63NBfWKgw+ZiA6Nbx9a9KZh/sAM99S+jL0OiS6WHu7oLQcG7GP+QJV
	3/cs4Ydbeakc8KHT7iw2KQHLmpw5c6YslSjGKBEDaa3tqYy0nIaRuoiOcFZ9vm1c0=
X-Received: by 2002:a17:903:94d:b0:2b9:6458:1a2c with SMTP id d9443c01a7336-2b97c4370damr28735835ad.13.1777374588015;
        Tue, 28 Apr 2026 04:09:48 -0700 (PDT)
Received: from ubuntu.localdomain ([27.217.83.168])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b97aa93bd4sm22828885ad.23.2026.04.28.04.09.45
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 28 Apr 2026 04:09:47 -0700 (PDT)
From: Zaixiang Xu <zaixiang.xu.dev@gmail.com>
To: linux@roeck-us.net
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	zaixiang.xu.dev@gmail.com
Subject: [PATCH v6 0/4] hwmon: (sht3x) Add support for GXCAS GXHT30
Date: Tue, 28 Apr 2026 19:09:25 +0800
Message-Id: <1777374569-59233-1-git-send-email-zaixiang.xu.dev@gmail.com>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Hi all,

This v6 addresses the feedback provided by Guenter on v5 regarding the 
Sashiko results.

In v5, I attempted to rely entirely on the I2C core's fallback matching 
and moved the devices to trivial-devices.yaml. However, as Guenter 
pointed out, the driver requires a proper of_device_id table to pass 
DT checks and function correctly.

Because an explicit of_match_table is necessary in the driver, it is 
no longer appropriate to list these sensors in trivial-devices.yaml. 
Therefore, in this v6, I have introduced a proper, dedicated YAML 
binding for the Sensirion SHT30 series and GXCAS GXHT30.

Changes in v6:
- Dropped the trivial-devices.yaml approach from v5.
- Added a dedicated YAML binding file (sensirion,sht30.yaml).
- Added standard devicetree support (of_device_id table) to sht3x.c 
  as requested by Guenter.
- Split the patches into 4 logically separated commits (Vendor prefix, 
  YAML binding, Driver DT support, Driver GXHT30 support).

Changes in v5:
- (Attempted) Move to trivial-devices.yaml and drop of_match_table.
- Dropped wildcards, added specific models.
- Wrapped commit messages to 72 characters.

v3 & v4:
- Standalone YAML binding (but incorrectly used wildcards).

v2:
- Fix placeholder "Your Name" in MODULE_AUTHOR.

v1:
- Initial submission.

Zaixiang Xu (4):
  dt-bindings: vendor-prefixes: Add GXCAS Technology
  dt-bindings: hwmon: Add Sensirion SHT30 series
  hwmon: (sht3x) Add devicetree support
  hwmon: (sht3x) Add support for GXCAS GXHT30

 .../bindings/hwmon/sensirion,sht30.yaml       | 67 +++++++++++++++++++
 .../devicetree/bindings/vendor-prefixes.yaml  |  2 +
 drivers/hwmon/sht3x.c                         | 22 +++++-
 3 files changed, 90 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/hwmon/sensirion,sht30.yaml

-- 
2.34.1


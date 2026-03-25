Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE468347BC1
	for <linux-hwmon@vger.kernel.org>; Wed, 25 Mar 2026 09:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774429707; cv=none; b=ZcUv0fPSVrUFy6i+SBfnqCrderx9MjTpo0s9mBg7qEETDgvGInSt/jVxhmTSO80Q7Zod/xwHyZTt46/ZJULiwVq+wg7+Apepwjz7qTbWbLUnyagJvvK0DdOjh1/38tpva+Vdz3g5MJ0u6Yh2W85BqOyWue2qvaHu+dBpwTjQVWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774429707; c=relaxed/simple;
	bh=vFjMqoedNXI3dxHPj9c7YUFENQqetZZML12rAuXgJvE=;
	h=From:To:Cc:Subject:Date:Message-Id; b=ozeFSjglf5v8+W4IAO91uAAmqWRdb4ADbfWYPBYB642WfD6smnjuHaWg1UC+fRy7fqeofIQZdhSRJXJqVdebZoXqISqq6zvOYsnjqjdiZQJVSnQbWz6Pdkx8R96UvxhmAXy3eMqRZVPSTigzR7a9HhgNc8okThdrN7jdNjNPSGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HEP/TEeS; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HEP/TEeS"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8296d553142so1206986b3a.3
        for <linux-hwmon@vger.kernel.org>; Wed, 25 Mar 2026 02:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774429704; x=1775034504; darn=vger.kernel.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LvlxsqZ3I4bHXEeUCqqTryq5BgQFW2GJzRWk9m4n5Qk=;
        b=HEP/TEeSSDhQnyj5ZSA7fFeuHqMRRtT0nYCfPYkHFsiUftN5ld5KO/PTVY2V9k49Jy
         cD6VckBVKeYBwHgDRNy/FWZ1aR70LjrNhQhwj7o/Xd2eZhcbmP4/kiSmk7r8uoBL5+C1
         QxXhXoWTCF8SM6ly6Aw/QT3RCiDALuQ54dAsxItr8xSPWtnu54LwjPvvk8llE94um62+
         tdDi6N2XfmO2EaGHenT5IXtGWR8WZc94pf5EuzUxWUs4L4bIueKvPAATiqleRDwMam2n
         RoEC+V11Rq/0pt4jrzqdfLYGpU/ORBb7xwnw5pFuhgYGY8++Kb9rkMvAOA5KFRrFMqab
         i3nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774429704; x=1775034504;
        h=message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LvlxsqZ3I4bHXEeUCqqTryq5BgQFW2GJzRWk9m4n5Qk=;
        b=o2n9nnr5zNTcvLddVKnU7l9+MWP/vqCEgkQgb7Rmp/fTwHLyKmfItkmGQxGU/qANK8
         3+YEXxcHKuG6U6GkBGFpXaPVXyLvLlHvRRXYpsAAiumV4kDIfdEKXwxGmimgDEC+T4cY
         WLIY1nKVo5RxrwK4VCr0cGt/bWvK1BetfCdnxawggvGzxsvvQ6Z/y1dciI3+4CsxfE5C
         VdH0LK4k+9YGTv/sXOcqENHmC3C9k/cuUg1+1Ax+wTA36Fakq2a1Sn+/irELchTK9/Qq
         YvCKKO3tjaCR2qEfxzw2vIHbl0EGFBezmk4YWB4oxQZCjfPw8LGAS9h/ZumYaxIZPkdx
         ENyw==
X-Forwarded-Encrypted: i=1; AJvYcCU1RKdCOWiLrcFHA4xKYwi0AcVvWtPiBTjq4Vmwop5n3YDWZqXwvNmjpA3lJO3JRl4Q2LDMDCCx7xPxug==@vger.kernel.org
X-Gm-Message-State: AOJu0YxSoeoupdfzmzS6P4eNbgoSuKkOZNnDlpoLnmVX0o6K/EcJQtg5
	g1ZBkfaRb7MkLa4DBGllmhXq+tR+X4zVrsEKBDZ53qUbW70/BjMFmTs3
X-Gm-Gg: ATEYQzzdYdCiq/pR5pFQ+uZMhsXQBQLGpMO+MUEH8No8Q0Y67gnt8enY0WkO6tsjued
	bpXEGSur04TDpp0+aj5TC/J/q9s6pg0jGqSOiLtjTIwAOF79uFNUmN/ZpyEDyw/C86tXlWcrgkz
	w0uAyKGZL+OSY8K1QVFXPvT2ER/r215KMHNUKnt70jlz/GuUTtwiBIa5TfOV8/IjlnfvJYFZPSn
	FZqSnvZSfGkb8EcLmLJEs76JF+1e9JaodqDciEfM9P+fsC6q4bBGddcPM6/Ej6seLHXzFg+Ld/p
	uSMMul2R8uwXcE6jQF/9MhefrONS9GZqKmjZBVbCe9AadKrwWFpV8rHkulauZnD5MJWfOx3lWqE
	Tp9r5s1AQZaB12PR4zUU0cy4qr0OoXdzIz4zs4bT1fT/Ap4CMrZ1pJXeDVyrUdv5l1bi5m1gh5+
	S+ad3Mre/XLjiKwjSatoA4vVcLbKm6Bre1nchGd/pQGmooaWL4kDipDwlhsYnOmiw=
X-Received: by 2002:a05:6a00:94fd:b0:82a:7678:36a0 with SMTP id d2e1a72fcca58-82c6de9ee22mr2817719b3a.16.1774429704089;
        Wed, 25 Mar 2026 02:08:24 -0700 (PDT)
Received: from ubuntu.localdomain ([27.217.83.168])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b03bc6881sm17476982b3a.22.2026.03.25.02.08.20
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 25 Mar 2026 02:08:23 -0700 (PDT)
From: Zaixiang Xu <zaixiang.xu.dev@gmail.com>
To: linux@roeck-us.net
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	zaixiang.xu.dev@gmail.com
Subject: [PATCH v4 0/4] hwmon: (sht3x) Add support for GXCAS GXHT30
Date: Wed, 25 Mar 2026 17:08:06 +0800
Message-Id: <1774429690-129139-1-git-send-email-zaixiang.xu.dev@gmail.com>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

This series adds support for the GXCAS GXHT30 humidity and temperature 
sensor. The GXHT30 is software compatible with the Sensirion SHT30 series.

This series also introduces the missing YAML binding schema for the
Sensirion SHT30 family, replacing wildcards with specific model names.

Changes in v4:
- Use match data (.data) to correctly distinguish between SHT (humidity/
  temperature) and STS (temperature-only) sensors in the driver, fixing
  a logic error where STS sensors would report bogus humidity
  (suggested by Guenter Roeck and AI review).
- Update YAML bindings to use fallback compatibles for compatible chips
  and add optional 'interrupts' and 'vdd-supply' properties
  (suggested by Guenter Roeck and AI review).
- Simplified of_match_table to only include base models due to the 
  newly added fallback mechanism.
- Renamed binding file from sensirion,sht3x.yaml to sensirion,sht30.yaml.
- Include Conor's Acked-by for the vendor-prefix patch.

Changes in v3:
- Split driver changes into two patches: one for DT framework and one 
  for adding GXHT30 (suggested by Guenter Roeck).
- Fixed commit message line lengths (suggested by Guenter Roeck).
- Removed wildcards 'x' from compatibles and used specific model names
  (suggested by Conor Dooley).
- Added manufacturer website to vendor-prefix patch (suggested by Conor Dooley).
- Fixed missing newline at end of YAML file (reported by kernel test robot).

Changes in v2:
- Fix placeholder "Your Name" in MODULE_AUTHOR.


Zaixiang Xu (4):
  dt-bindings: vendor-prefixes: Add GXCAS Technology
  dt-bindings: hwmon: Add Sensirion SHT30 series
  hwmon: (sht3x) Add devicetree support
  hwmon: (sht3x) Add support for GXCAS GXHT30

 .../bindings/hwmon/sensirion,sht30.yaml       | 50 +++++++++++++++++++
 .../devicetree/bindings/vendor-prefixes.yaml  |  2 +
 drivers/hwmon/sht3x.c                         | 16 +++++-
 3 files changed, 67 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/hwmon/sensirion,sht30.yaml

-- 
2.34.1


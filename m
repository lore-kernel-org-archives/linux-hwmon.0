Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B82930E834
	for <linux-hwmon@vger.kernel.org>; Sat, 16 May 2026 17:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778951265; cv=none; b=cctAdoCyDQvH7RDdTdeqmI38IiIuSwgG04XbxrDhHU+GchwuFPmWbQc712V2bLxHKoI+2wLDptRVMrYd9iTw3+4gHgm1k3Pe53B3QWm8g8+XUezHUg37OH7pedngDxLHPRB+m8WjQGfBk3QsMax8go5uJbjILk8tBZ99jw6v6+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778951265; c=relaxed/simple;
	bh=4e+bn1uubIZw9wql/1SJXdIru++gUkvx4CTwKY8VeGs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Em/VvOAqccxL2W5ZSm+qlmqMBfDMGP8cyGPYhvyuTIHd9RiAIcBaghu84gz2On3g/HFVL2rgv60J35sF7NYYiAxxoSROtKV+1o8E1AKCjjXTa/oT4FkoaViyGvhhFGrVSbQInUbaKc7Z1FXVLUqGBu2XFEaLfSGbfE/vEQfBE0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ONz6HPXI; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ONz6HPXI"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-369576666d5so390236a91.0
        for <linux-hwmon@vger.kernel.org>; Sat, 16 May 2026 10:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778951264; x=1779556064; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y5EcwcuLp5lxGviQ6k0KGxmJmfzJ96X9EE9tFSv1iWA=;
        b=ONz6HPXIcRz2T4PoGARtgwke7nFBMNk78GFFbDnX9LE9eqYUD1BH6uGhkYbBSDCumg
         nppj8qKvMFd4VFig9wuK+h0ByG4Bqrtd0b/0eZwH0ZAS7O3Ag0EGUql/YHCqlDuy7ca9
         xUcaimaBzsxw4NXp18ULHaYKM8gsHL1sC+pgjFzQ0ttolfJWM92aP1B1dunzgHoBxGgS
         wp/T726RGk+/sQw7EQeVOtSu0nd/UVgIjLs5ao2pLQQbRkWRh04GM9R458hlhcvbsiGO
         y+t5epWZzRKpf6wTGEJuq6OZnhsxjQi4QS5tlD6UI1aLhrc6soqFFnakvVndg7QsCC1M
         eDGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778951264; x=1779556064;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=y5EcwcuLp5lxGviQ6k0KGxmJmfzJ96X9EE9tFSv1iWA=;
        b=iDo1Zid2G+ZajO5/3GlPISWf1QYVf8+dEU5kOS6MTKITNQRU4VFMTbPd9NUG8eUnrP
         VgZ+YhfoYah6KkRqR3FH3b4/RisenEazxOPTuStzMng/6HUy49rGEGvf6ORf+uK3e6p+
         CdoO2cObRdY8qIECNwZh4+CXP2ORKAyOQRIV2CKYBLXzHDGX9eAoFL012VOFkVDzX5RD
         whDx9DrLaspd17Oudqylve98F9X+jrt2a7FrR5VFpS/+oxn8CWEt45b9HOxNx4D7NepY
         QTyh+mXiR3SQpBaiC8mlxrNv8XU/kV2ENuJq/exQ8OLO/6yv43mhwg5dnV8Xz8WYy1TF
         0p9w==
X-Forwarded-Encrypted: i=1; AFNElJ/RPAV5GKJJ57dYKwIyi47KzwUr4QMrcYYBoHa1P+g2uctyddZ9lxpAf4WZXKFNwucTe74NZzC0os+d5w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzMmOAzegoTjXARgckUplW2BsVr2brUjZOuAuwmo+TL5LNfEQjz
	x2gMzl9LdUZ8Qg7mx+6iWBk1c1xUPyhbg7I41bbJ1/3b/nhZbApTHCpV
X-Gm-Gg: Acq92OGPpY/NZ8qojL9Z522KPcufitH2cb5x0E+ttxsEjFt8T9GdfMzBZ/soG7eJiGa
	KF/O45KvFfm8ju1Nj8WkXuYPyfOaFx7tlbspRTed6IISis1IkK1fyO8gFo5dmUKsGPfF27YZMv+
	uiOzzEZsRItFaSNBQyXCIej6nm2E4vS3PYml2paBhTj32eBpr9/mbrA1jL0MBIlZZHAfcS1RqyU
	KSQyyZkcaIklfId/QdWUaGvf6pIfma/2wR7DwYTgFHkpSwFEwXtSmJeuwgTlMJmznKU3w0PTLdW
	MwAvLOc4u1Ns/yUKlM9w8ETsaupK6h5d4/xkNRUzn8EyW6gioMtGEMaNTnYWeq6ryKdLzbYYTWK
	pnDdnDHtZzdAAYReuH7LBu1j2A6sRDyd8DisJdJtFSjmO132F9N29e6l45Uk2jQgO/Kf0wHXxY+
	QBLhUqp7FjH3sd6GVrFILLNc5yMioYhfFDNd757HtvvHMJAZL012KYrCI0hBEJLV9lVGMsLWJ7b
	xcAIplgj2jgHU6e/zEZd4xwxiDWvWpDfqf5JxGBdBacWzhqyWHkrfu72+kwxVo=
X-Received: by 2002:a17:90b:2742:b0:368:cefe:ddd0 with SMTP id 98e67ed59e1d1-36951b82f8fmr9282400a91.15.1778951263902;
        Sat, 16 May 2026 10:07:43 -0700 (PDT)
Received: from ERIC039ERIC.localdomain (1-170-184-71.dynamic-ip.hinet.net. [1.170.184.71])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-369514aecaesm6308994a91.17.2026.05.16.10.07.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 10:07:43 -0700 (PDT)
From: Chen-Shi-Hong <eric039eric@gmail.com>
To: linux@roeck-us.net
Cc: corbet@lwn.net,
	skhan@linuxfoundation.org,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen-Shi-Hong <eric039eric@gmail.com>
Subject: [PATCH v3] Documentation: hwmon: lm75: document sysfs interface
Date: Sun, 17 May 2026 01:07:27 +0800
Message-ID: <20260516170728.2066-1-eric039eric@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260516160823.1461-1-eric039eric@gmail.com>
References: <20260516160823.1461-1-eric039eric@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the sysfs attributes supported by the lm75 driver.

The driver exposes temp1_input, temp1_max, temp1_max_hyst, and the
standard update_interval attribute. Some chips also expose temp1_alarm,
and temp1_label is available if a label is provided for the device.

Add a sysfs-Interface section to Documentation/hwmon/lm75.rst to
describe the supported attributes and clarify that temp1_alarm,
temp1_label, and the write permissions of update_interval depend on the
chip.

Signed-off-by: Chen-Shi-Hong <eric039eric@gmail.com>
---
Changes in v2:
- Document temp1_label as conditionally available when a device label is
  provided.

Changes in v3:
- Add changelog requested during review.

 Documentation/hwmon/lm75.rst | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/Documentation/hwmon/lm75.rst b/Documentation/hwmon/lm75.rst
index 4269da04508e..fa8ddcaa0c2b 100644
--- a/Documentation/hwmon/lm75.rst
+++ b/Documentation/hwmon/lm75.rst
@@ -181,3 +181,28 @@ is supported by this driver, other specific enhancements are not.
 
 The LM77 is not supported, contrary to what we pretended for a long time.
 Both chips are simply not compatible, value encoding differs.
+
+sysfs-Interface
+---------------
+
+================ ============================================
+temp1_input      temperature input
+temp1_max        maximum temperature
+temp1_max_hyst   maximum temperature hysteresis
+================ ============================================
+
+If a label is provided for the device, the following attribute is also
+available:
+
+================ ============================================
+temp1_label      temperature channel label
+================ ============================================
+
+If supported by the chip, the following attribute is also available:
+
+================ ============================================
+temp1_alarm      temperature alarm
+================ ============================================
+
+The standard update_interval attribute is also supported. Its write
+permissions depend on the chip.
-- 
2.53.0


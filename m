Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BC492E2EEE
	for <linux-hwmon@vger.kernel.org>; Thu, 16 Jul 2026 00:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784161561; cv=none; b=Q2SCCy7DHSroPpr2ZvuOoROPx7XL6rS4ra11NEkTXlStqZOdBN5BdZo6vuLMZqgMNH6ukpON21vrika5+q2/HaAkvgLyWB8OBY3Rsv2dMglxev0iKmKig7EvqjOdiP3q7UYglQCdj1kDEAlCMQIbB2rAqJhAMtHRhxO1FizSEt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784161561; c=relaxed/simple;
	bh=1e1N6xH7vqyO+MHhocu8Qhs6l+hP4MaAsyqHKWudrgk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SqnfV4fIaJCld1FklLzrHgs7M4A8djvtL/t6df75X9C9aSZ9aiOIcOId1q4LCI6vANtit+hLrUtQWI4z8AKS4K+NdBKLbs58BO4kgLqHZ8/M3clOooggcYVN8y2hy3yC0KgJRHlD/capDZBx8yaHsFfjrqQ6HaHXxfgZKYpbFDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NpR2IrzN; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NpR2IrzN"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-8485bd28dd0so7013814b3a.2
        for <linux-hwmon@vger.kernel.org>; Wed, 15 Jul 2026 17:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784161553; x=1784766353; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=T08FRuPIa7+44bxWiq0MXIRsXwFq6punNAYb/5OuNU0=;
        b=NpR2IrzNBqVsGmR4l0n2dDDXAeteHyX1LukgaRYb2MJtQBWx5JVKBlICcYaVshBSf1
         JwN56nlgS0SknwLoQ9Gu3xwReAG+GDYSHOyP/yfsEcR5rc2EcrHjnQVff7nwRcrXV9hr
         FmXzhIvxl+oNjdYZRFY4WtKtJH0rXGHmu0IsUX7OoWiVInQzmr2NuMTDAzSFotzyIzIg
         QVGRHJTUNxKq3dh6FS/sZV+Iu7axZ0IZMwh0epnjvwtnXzvGbClJKytMhEARHADNWSjG
         4WvP0D3D/CY+XRmDLw9Keq6QLS9wBsk2svsFtQcLG51yoF98CQxwY/SAlkYndOZGw4zw
         DKiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784161553; x=1784766353;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T08FRuPIa7+44bxWiq0MXIRsXwFq6punNAYb/5OuNU0=;
        b=dhHyY9okKVDwDErlUZibffodrS903SCrbChPu2q4BmfBQioaAt5cSyPC0XceCNOf/q
         lLf2seisLnsJdI1h4QGenLZrR0uLlMwdTECe5Uizz8HG8VJ90sO8o0ahSpj1ccz9WGYu
         oRl3/JvM+Ao0ycLqjKs7MqCKXhJ0pNtFi4oto35f0Af8zex1xai5kH4WhEQb++qSomdt
         i5tM6LuzqF1NQp3sP1FAmv7jYC0GY5YyAJ+hrb/Z7FxVy7oMEI1E0uhvk+kHsqSaqNM5
         MO0XSs4eLkczqv46QT4bJXNt7+8UQyNseTXL2z6xiVtY+ozckqMT9oUzp5+7aFbWuhn/
         enkQ==
X-Gm-Message-State: AOJu0YxRn67zsQO2cSAFPOGbZlzHJqr6FS0tbMWtlY0k6PvWaBzyRsRK
	yUW9y/PjgsSN9yv7m+9l3jyJV8inGDQ3/zqm6mRf4Cs2knW9pmygDZOt
X-Gm-Gg: AfdE7cmlHJR/ed+2ekpSjJphj1KEPRAUyufM0EpuSwFMlwd85NVqW1hMDbb0XCXYDlL
	8KhB5ShbyMv8M1bZtwmvxXMeZyXPDr55/8tlSdy73gYnHoYsM5MKDbI4QehtS9waBap58IpMJEp
	mwQcX6OA11Ps0g4QFYFSZidlxQ+Hjl6eNNnLUXsuTGumZRbxW7F9H/N/x0uvXommj1KuWF+3nhp
	LKbHlUBQkp8unLstQLg/CU740ev/16X/9Xm1XA16f1wMWVSvmTE0qFiScV7OiOqCi3oqcUeIQFq
	PiosT0kpaTcJNgRVppmEQse16DN/sSwD6+QubdleIqDjFkGY29rpCH3IuteH2grUTdnPAKT8I/l
	NxuhNjiF8iAjqLUCEwvhuivnQB7g1d88cFOdofzakjUmCUpvIjB0/4xoHyUFYawIP41+YMATq0t
	7XqmH4FCWssfSZkW5XPHkuEIVzULtRC0h5xsuBtrJ7dyGiSfzrEuKXM0fDSseLTyELFIFdV9o8v
	M/VvSU+E2JO
X-Received: by 2002:a05:6a00:2d03:b0:847:5ec6:3afe with SMTP id d2e1a72fcca58-84a5146e82dmr8476286b3a.31.1784161552958;
        Wed, 15 Jul 2026 17:25:52 -0700 (PDT)
Received: from bloom.localdomain ([2604:3d09:178e:e100::9dab])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a4f6bf5ecsm3898485b3a.29.2026.07.15.17.25.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 17:25:52 -0700 (PDT)
From: Ivy Lopez <skunkolee@gmail.com>
To: marius.cristea@microchip.com,
	linux@roeck-us.net
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ivy Lopez <skunkolee@gmail.com>
Subject: [PATCH] hwmon: emc1812: reject channel index 0 in device tree config
Date: Wed, 15 Jul 2026 18:25:43 -0600
Message-ID: <20260716002543.26711-1-skunkolee@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Channel index 0 is reserved for the internal diode and is set
unconditionally before parsing child nodes. If a child node specifies
reg = 0, it silently overwrites the internal diode label

Reject reg = 0 in child nodes and improve the error message to
include the invalid index value.

Signed-off-by: Ivy Lopez <skunkolee@gmail.com>
---
 drivers/hwmon/emc1812.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/emc1812.c b/drivers/hwmon/emc1812.c
index 68575c27d090..143c3c07dbaa 100644
--- a/drivers/hwmon/emc1812.c
+++ b/drivers/hwmon/emc1812.c
@@ -809,9 +809,10 @@ static int emc1812_parse_fw_config(struct emc1812_data *data, struct device *dev
 
 	device_for_each_child_node_scoped(dev, child) {
 		ret = fwnode_property_read_u32(child, "reg", &reg_nr);
-		if (ret || reg_nr >= data->chip->phys_channels)
+		if (ret || reg_nr == 0 || reg_nr >= data->chip->phys_channels)
 			return dev_err_probe(dev, -EINVAL,
-					     "The index is higher then the chip supports\n");
+					"Invalid channel index %u\n",
+					reg_nr);
 		/* Mark channel as active */
 		set_bit(reg_nr, &data->active_ch_mask);
 
-- 
2.55.0


Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 697453BBF0
	for <linux-hwmon@vger.kernel.org>; Fri, 13 Feb 2026 00:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770941721; cv=none; b=ks73xGMot1ImCLShSTjZit7hNEK6CUwIKB0i434LkoDtvido64LsnRBKf8zn130FwZoMVTT96vH9w8/EHfV1N88gwu8ERS5kHZpYs7/RUiaVJTILwEYqkzZfDzwczyBhiSzHM/U5Q129XB0ifGvLJBocLIOrGk2ZcAa45WTZx6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770941721; c=relaxed/simple;
	bh=/59rGIqsmF4WshNdFxUG9ogPXvNXVfB7MoZDczfEldg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=JmO6TjHXxAK7UmusAMxa58mWS9JfR3Vtyk5q9lg0H4MhVDVw+CG40sNmePRiR19b/lmqOyxAqmseqQ9P41NYmGddjOR+m8+JshMd17P7fEvatlMj/k3UD4HHfrLApLdyW87CsGHOC/I9wSTnvbIh2MNGd5Oezi9Meo138L6ws28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=ByKOXRJY; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="ByKOXRJY"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4836e3288cdso2209745e9.0
        for <linux-hwmon@vger.kernel.org>; Thu, 12 Feb 2026 16:15:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1770941717; x=1771546517; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iBcBAJOpsKdY0lf+0KvuBm9F2SiCUmZwqgnRHrAG5Ag=;
        b=ByKOXRJYP0hFvfdXG9g4Zx5PGYv2chrA8Pg1XuyECYpmbH40mRCt4Mw4NAT+EoIvrL
         TskvzXYDrLoIp3VdbP8/43hS8LHO7v3mglyEZgZGek1dSbgUNcF67Sw1p0qeMoE4o0G9
         tEgGCv8Dc7Q/6ZsVnOfnNsWXN8iq90u5MGkdzJeD/mltMgbJD44r9YL31yFlQ44/Vgi8
         fMaK53Hk8+yXagWXhET3YxWtntTzdVhLhi1YeYiO0P+I+YE3F0MGtKa0C5IyK+bYzgy5
         fnHov9qptwZ8BMvUCHA95HUxBfLhBsn+36k9aT2IH6eZvqdquQb3RyOYzi1vIt20wOWZ
         2KKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770941717; x=1771546517;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iBcBAJOpsKdY0lf+0KvuBm9F2SiCUmZwqgnRHrAG5Ag=;
        b=gEGu6aRZKjEVsPy8WLLUJraBMg5OY+OLVuf+5JIt1WQTa7jCeuAmhuRgdsN6uaLaSg
         3PdlBJlF+LnnvtgVIfdvs3maWx5yc10TvOwP9JzcvoE0c0XgNDlpcmfQHFxmOTRTRZi3
         8yHxtHFWT97Fk1i5oYuzmcRi3N5oFOQj04AukXCQR79Z/NgNiRO3BcqUcLzFnPOlGpc/
         p8MKpmwftRw8eFClEai1nWTchF9VEtTfETXgfff5IWUYTTWw45m5EcqL2vxcjCgBOpob
         76/aqtr/kS6h3xiDyxzLDgrY54tt1XTgA/+qXG231+x0iCz+Gp41r1e2ge64xOHAXrZ2
         jvHg==
X-Gm-Message-State: AOJu0YzAGZT1nL6sN7nZxvbyYbPyzFknticew47tC/N06qhM1G++PGEq
	sYwC5eWU1aN96o9drgRqOFqsqOqUL0NII0c2lZaSMCLOpk7iPI0JDiM7nM5kCB56Rds=
X-Gm-Gg: AZuq6aJ7EyjeXELnDl9g77q5So6iQfGWMYLoI0hwB8fsgR6Rn558b1tBcMDaBap0u45
	Yshw7hiBee81Qe8xqU1xPLrxic+zZeWLTq0VILl+ZJWh2o0gMgTZA4ia8LQ8M343tFsLo3CToRJ
	t0nz2IRUCenZci0F5ImnKJ2obk+OeA10q7ILvvhdSf88iOiNP039SH19RU9ytDQM7NJ7hcuG6hi
	xcQwyh0AIX+ycGZISVr+FbhhkAR54NwIGYN99C8KHX3dU8h9GHybETMl0Gr9WqdAitu3ybBVWHc
	f20fyb4Ju0hkLljfqjMvELJP31rgpQraPCIreht7pSnCzkxktKqv9hv/317x2zBd6cI9f6ySflq
	5g2qVljoM5yjjP3sPl3PIh66YmDsYQMgFzieV83v41DlKYs3BSenhKbX6WYDFYhXZnnXvJDtTIv
	LcX+QELWyIhzkq0PcpT4jPPZrCguYolq7L7LEoAdslRI5hecOTVXdCXXIzjOeOMc3+1Rh8DNBIT
	QZ4QnoAsw==
X-Received: by 2002:a7b:ce14:0:b0:477:991c:a17c with SMTP id 5b1f17b1804b1-48372f1dd02mr872455e9.6.1770941716393;
        Thu, 12 Feb 2026 16:15:16 -0800 (PST)
Received: from silence.. ([46.10.240.40])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4835d99497asm234440945e9.6.2026.02.12.16.15.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Feb 2026 16:15:15 -0800 (PST)
From: Stoyan Bogdanov <sbogdanov@baylibre.com>
To: jbrunet@baylibre.com,
	linux@roeck-us.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org
Cc: linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Stoyan Bogdanov <sbogdanov@baylibre.com>
Subject: [PATCH v2 0/3] Add TI TPS1689 pmbus eFuse
Date: Fri, 13 Feb 2026 02:14:05 +0200
Message-Id: <20260213001408.2454567-1-sbogdanov@baylibre.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rework TPS25990 eFuse pmbus driver to provide more unified way for
non standard direct conversions.Remove existing defines for TPS25990
conversions and replace them with enum listing all supported parameters
and structure using m, b, R. Add functions to covert raw to real value
and real value back to raw. Add data structure to hold pmbus_driver_info
and local_direct_values for direct conversion.

Add support TPS1689 support to TPS25990 driver, since both
chips are sharing a lot of similar internal functions with exception of
work range like Voltage and Current.

Change log 1v -> v2:
- Fix error detected from kernel test bot
- Add Acked-by to dt-bindings commit
- Drop "support" from dt-bindings commit subject

Stoyan Bogdanov (3):
  hwmon: (pmbus/tps25990): Rework TPS25990 non standatd direct
    conversion
  dt-bindings: hwmon: pmbus/tps1689: Add TPS1689
  hwmon: (pmbus/tps1689): Add TPS1689 support

 .../bindings/hwmon/pmbus/ti,tps25990.yaml     |   4 +-
 Documentation/hwmon/tps25990.rst              |  15 +-
 drivers/hwmon/pmbus/tps25990.c                | 185 +++++++++++++++---
 3 files changed, 171 insertions(+), 33 deletions(-)

-- 
2.34.1


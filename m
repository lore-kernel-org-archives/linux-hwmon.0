Received: from mail-pj2-f42.google.com (mail-pj2-f42.google.com [74.125.227.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDFBE54707D
	for <linux-hwmon@vger.kernel.org>; Fri, 18 Sep 2026 08:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789720874; cv=none; b=T4kj46+0AQDsNHSKwtISfq30n2D7JoDuj7BrftwToLpvIBq+93oPzHLhPzoa7ASfnWmKLKisYavqv2YxJgmEN8PRw96Ovq2r8BkIQ49vMP2WOOlHd50XDAWTs+Rm9VTjb5rbWRVPLHatUh6Xyl2Ph7FQtm35Fs9HtG7rtSPIF64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789720874; c=relaxed/simple;
	bh=WrikJip0qJOgok3Qs2ZtaWrzosdRo3ElwXEOugSPauE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iHJlW6j52DX0SLJNu+fsvr0I5ZxKjTCgiEaPqGjIr4KU0eyCSNOaiKvGd536CwFaKCj52/KQuFhqA0QHmtW/FOjVxg+qCgSE6QjPBfYgOJqPELb3K1gmDyasq6VEjhmaP07H3kIBD12Q+AEeAPpxQfFCHr3XOUxEHMHZISHVFxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g0KjbbkF; arc=none smtp.client-ip=74.125.227.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g0KjbbkF"
Received: by mail-pj2-f42.google.com with SMTP id 98e67ed59e1d1-396ccc09d65so479398a91.3
        for <linux-hwmon@vger.kernel.org>; Fri, 18 Sep 2026 01:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789720872; x=1790325672; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3c072zXp/Vpm7bvY0KHx0Qzz0xCebd4dsUebv1vmGqU=;
        b=g0KjbbkFqTOq/rusBan+flMeOnWuZH0usHBSdl7kLsnCs76mW3XYe8mYwvsoNX4odA
         6RDtwfHjLdLP8rBzipWGFzfVQM6EbHMG9HjLgM9aCFzYojQiK+/ybk9cGweX1wiPjuLT
         T1KvJDOFwcmc4YHCMxz0MJAV61mbfP40W1OSNgAGfMwi/AUtzMZTAb1lmbM6Xuxje0eD
         tiJEwgR04hbih5/t0bHWj0kboH2k7yW4eq2apBygmTMAXPGPZAM88qeKzXNi+JCoxEO3
         yAMn/671NQdUbB14FiqUgjse1PrDETeGm/+xeRHB8OEAkI8JNioWGtnbTgjxPrpdZka1
         mcNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789720872; x=1790325672;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3c072zXp/Vpm7bvY0KHx0Qzz0xCebd4dsUebv1vmGqU=;
        b=rVctwjA2i22o/v23dMiKXqqt1gH1Um7TTFLmBQ1fOX2RYNjsCMms+0uI7nYWGrWd2H
         mxl8uZjzitpOqJ072qLpXv0L97xlvi3KpXHgrHrAc732ZYuTVodWIwV8UEpBxPB1eane
         AZOkA/nDiZEDiS61WkqqrdXPgx/oDANLm/clX5Bg5FMFkQ0xTae6VdL4lcDiepIljAiO
         DsMcanAznA91P4sfHQyF1D/pfw/1ZmGY4meWjDLfK8hJ1/onCNVgZ9P/lNBy7RY3NuhH
         eDBg/VcDY4RBjxjcEB8tf1qXufYnmQii3Yl06GfpRBUnvqTK1PqVO2qGCzGmM72vJlRX
         YM7Q==
X-Forwarded-Encrypted: i=1; AKwUvBylk+cFnVR2FU1Gqz9/UdQQj2Xukcbyeg8I9Ts2kSJJK4D2I10DuwG2Aoyj52CVZE63QYlFsgIOUMHS1w==@vger.kernel.org
X-Gm-Message-State: AFuF++kycj86omz/NJKLzzwDbPqS+YEa2nnM/eIBIWpeYfRy8EAJGMYh
	9q/WCoL0gue0EzfjWJvDGnFvN8P/8SCKYFiTyt8tNUxE9cHp/dfmL9jS
X-Gm-Gg: AYBFou208pvyDix0VYwYWON8s2HHrhUK3HPFA5QDJuxF/1PjzPMdFkYyrkd3L1i4DoP
	pdraSXZgX7t4zHfkiaNvGwi+XwCsfmQGDkmsB9Spylo9EvOMbOoXmLNTpnvg8S02n1zQYG5eYGf
	FVVQqi2wvxKyJHCuUmMqUU5dlmCtlKd8YSWcf4OA31wmgbY6HnJGCNXcjGei2heDvM2vQ8OhDyQ
	NBNGgdDZLAfdKMa981QptHPJdoBPGbnZQhz9FRkUBwZT4P87hanif9E3dgK7e7agmxZy/IQm5y6
	XgeS8kpZRGuGLtAx80Zrto67GIrAdzN47AHzDpSeO/RdEKWSaj3kH4jFytSqHsJilHrvQj+MetN
	hw5eySJjU4j0OTO5ndYmq5QA5r0kqGQ1/TncXNdIg9fzRjEa8C0vY7dRkzLUheea3N5aBBeoGiv
	LMuDS3VtXUQyzZ/+HZHmcQHuudRTq0K1fQvkMhGMkAYAw7gqbNPoIrxg5V7ctwKpYcNXdE5kcmW
	VKavGkszaj0jGuMcGqucS8ERMer4aUhK5wLQca1oA1hHKm25tR1/N4+QXsqQnkZhUEfewQ3wp3y
	eg==
X-Received: by 2002:a17:90a:e7d1:b0:39d:f2a1:31 with SMTP id 98e67ed59e1d1-39e54e77eb2mr4097035a91.17.1789720872095;
        Fri, 18 Sep 2026 01:41:12 -0700 (PDT)
Received: from cs00-MS-7C09.. (2001-b400-e35f-d966-bfea-f724-5ada-7374.emome-ip6.hinet.net. [2001:b400:e35f:d966:bfea:f724:5ada:7374])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e5a50d332sm2093716a91.9.2026.09.18.01.41.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 01:41:11 -0700 (PDT)
From: hsyemail2@gmail.com
X-Google-Original-From: syhuang3@nuvoton.com
To: Guenter Roeck <linux@roeck-us.net>,
	linux-hwmon@vger.kernel.org
Cc: Sheng-Yuan Huang <syhuang3@nuvoton.com>
Subject: [PATCH v4 0/2] hwmon: (lm75) Add support for Nuvoton NCT7715
Date: Fri, 18 Sep 2026 16:40:39 +0800
Message-ID: <20260918084042.19541-1-syhuang3@nuvoton.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Sheng-Yuan Huang <syhuang3@nuvoton.com>

This series adds support for the Nuvoton NCT7715 temperature sensor
to the lm75 driver.

The NCT7715 is compatible with the LM75 temperature and limit register
layout. Its 16-bit configuration register shares the TMP112
configuration layout.

Changes in v4:
- Split the Device Tree binding changes into a separate patch.
- Allow interrupts for the Nuvoton NCT7715 compatible.
- Correct NCT7715 conversion-rate initialization during probe.

Sheng-Yuan Huang (2):
  dt-bindings: hwmon: lm75: Add Nuvoton NCT7715
  hwmon: (lm75) Add support for Nuvoton NCT7715

 .../devicetree/bindings/hwmon/lm75.yaml        |  2 ++
 Documentation/hwmon/lm75.rst                   |  6 ++++++
 drivers/hwmon/lm75.c                           | 18 ++++++++++++++++++
 3 files changed, 26 insertions(+)

-- 
2.43.0


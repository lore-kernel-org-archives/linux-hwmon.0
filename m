Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9558D15574C
	for <linux-hwmon@vger.kernel.org>; Mon,  6 May 2024 15:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715011189; cv=none; b=eXcYMx6zREwYlz5TsJuqYdGRgvWtAH7a4vrbXQaEzrxNCR5PXqLn4IQuU7YVBSFAZXD2jXhfozyrhuuaa9dtHqXgde3RVcfRtS0Fa/+oYIIa05uI5BZL1Hrsjg0Ln0waYt9T49Iu1WwnGIoMNLw1b/p6PhAxUQTukyJIv7KAMTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715011189; c=relaxed/simple;
	bh=NWQalUwgvKZ+gYMS5Cl6dnoDKl2lnNy/Vx8YXjT1Dmg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=daX5HHkEPK4enfYjvZsADmtJ+GB+GL/RjbxKCrTSJpR6A6BcBTyYlZbsvnpEIA7mPcFlm3f52PhB1PD0tdt9Zu5Vm6bgrX6phTmr/8yRjDY3SGhJ1ngApioaOgFZvqRa/7amV7eCHuz6Oe6IOeHnD2a9Yj/pST13a4tJZcYzNbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=pohQlC9Q; arc=none smtp.client-ip=209.85.160.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="pohQlC9Q"
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-23f9d07829bso544722fac.3
        for <linux-hwmon@vger.kernel.org>; Mon, 06 May 2024 08:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1715011185; x=1715615985; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tvzML3HN54hxCFzVP+Buz9BOHRIZhVNBrB1oFonWPC4=;
        b=pohQlC9QRudRBpde5r+UHFe/Wn2Crys/drK1x0Mw5cADBvMnKs6hPu21paIsUEaKlR
         SWGc9ZHbqD3rBQiJxTHam3Ya2r3tcLKwi6/cWuqjasmj/ZrdyBIG3uXwcN7ip/82eTxd
         fCM9UTtIhISjxsMG2oj2s95rwg8vx+cDXiMimAOv9PNzDzvQKNjP/qW2M1SKCNnTZhlo
         RDlIv4vCmVHT7NX0UhzHxShuiSN8MxZp0oqjp62WIp242Dl82GOFUlsPtBNPHy+H271s
         ocSLMFI1o1Wr5TtkmoLvGIhId6GcyhIYZfWyMN1nZJtvCsfp716+6FeJhvHeUM+VmETo
         SJYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715011185; x=1715615985;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tvzML3HN54hxCFzVP+Buz9BOHRIZhVNBrB1oFonWPC4=;
        b=n/JP6L6fsUU7+xvyf54kSpRGBWh9MvhQ7KXyKckgzcOwuA1S9OhcMsLXHGlsrzMG+x
         DZs4mwvAUeEpRm8Gz0dv9uQcjpl9yhS/aGLRrqcCVpGHTAd4fVORsoXAp/lkq6r1ICYW
         UjGjOdtB26053OnCFeCQMYew9fbs10w5LiEKRKCPRa8gOunSr4wxIBanlQSLHqPIKuCX
         NOxy3BTqZasLYhbfzpN/QdC1pb01eDo5f13BpV/ZWmrQj72M3PMGb6DENWt3RWAa6138
         IoYe02jnHZcyT02LXdwnQ7Ahls1lVVO23e7wTNcO6ox7DOasdGtzIu3fkQ03ReJMBR3x
         VmPQ==
X-Forwarded-Encrypted: i=1; AJvYcCXiZ9OP67s/VohxwKgf5THrDMf3JWsxYGHth2/xBwn2yDO5JxbR4jnBbTYMmjwvANDCk/zT4X+gXKxhDfRYLiJw1PBD5flbX9Y0NmA=
X-Gm-Message-State: AOJu0YwCdvV17+BBvCTRLMj0i3SVmDVaQy0lSZ6S//58ODVe2j2MdJ1A
	eiiYXHFh0KmhiY8+TPccYzGkfSXUKrmYWed+Mr7le2iOfYd1uJl0JcNyEpM6ZlDtaHKfWODQ2qR
	7BDg=
X-Google-Smtp-Source: AGHT+IHRHaLdY4f1Kvd8SPz1wJzBCQY+/OSJXQdknXR6UC9RXSlBsqZsZGQL72WyxXjhocrMn62CdA==
X-Received: by 2002:a05:6870:6393:b0:239:701f:fc32 with SMTP id t19-20020a056870639300b00239701ffc32mr13019235oap.9.1715011185410;
        Mon, 06 May 2024 08:59:45 -0700 (PDT)
Received: from freyr.lechnology.com (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id e17-20020a056870451100b0023c82e5be0fsm1955226oao.7.2024.05.06.08.59.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 May 2024 08:59:44 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org
Subject: [PATCH 0/2] regulator: devm_regulator_get_enable_read_voltage fixes
Date: Mon,  6 May 2024 10:59:14 -0500
Message-ID: <20240506-regulator-devm_regulator_get_enable_read_voltage-fixes-v1-0-356cdd152067@baylibre.com>
X-Mailer: git-send-email 2.43.2
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.12.4
Content-Transfer-Encoding: 8bit

I was going to send a v3 of [1] with these changes, but v2 was partially
applied so here they are as additional patches.

[1] https://lore.kernel.org/all/20240429-regulator-get-enable-get-votlage-v2-0-b1f11ab766c1@baylibre.com/

---
David Lechner (2):
      regulator: devres: fix devm_regulator_get_enable_read_voltage() return
      hwmon: (adc128d818) simplify final return in probe

 drivers/hwmon/adc128d818.c | 4 +---
 drivers/regulator/devres.c | 2 +-
 2 files changed, 2 insertions(+), 4 deletions(-)
---
base-commit: 4f6454d1bf73255e49c02d0a7b3bb85146863098
change-id: 20240506-regulator-devm_regulator_get_enable_read_voltage-fixes-b1f2277763fd

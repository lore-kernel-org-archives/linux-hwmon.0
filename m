Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CEBF1D5ABA
	for <linux-hwmon@vger.kernel.org>; Mon,  9 Mar 2026 00:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773017134; cv=none; b=kW5Ab1uhF2ruIFJ1wLLMNL/GtIMCOWeHnoNbEitLX88dgyuvm/i5/ktA+BhlJaj7JchYl98xMpUZqWYqHlOqNqBBjajQ1/xUgfwlkfd+74aJ2dVaq4pR2cTK0tmjuPsJMXPdR9SGOpcb3mHhkBmlCfRpIUcaz6TdGkF8K22uoPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773017134; c=relaxed/simple;
	bh=Z2WC+T44vZv36HJ9LB3k8rtYSZuJtp5EHsW584XWTZk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=TNBuakveb0vIZxkqkgRdvzQJE97pLFloPN0WHY5QwClcPCBHUkCfA9qTOS/dJHIhuPOHiuTMsOtAhULKoQOs6jQ/6SbTIYWwFt4PTf+v2KLEY0M3mHEhvT4hdo1QeUZEBpg071mJLWoky9iyY3QSmTcbPX+wkYvwhPF4BVz6fk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YT2Q9a14; arc=none smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YT2Q9a14"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-2be3bdfda8eso4129174eec.1
        for <linux-hwmon@vger.kernel.org>; Sun, 08 Mar 2026 17:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773017133; x=1773621933; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uBR4plYfhG1YvXoyQZA+wjr+zEYEMIT2HuNQ1S4zVVs=;
        b=YT2Q9a14wHSZN+QbhP0ffdic277zQ3FTa0wzZAdRXDEfeEHqJd2cpDqHCplRO7VmH1
         QJPNTsbpF/B2VmpEfe734DYN84A1/u4ZCslM58XrrgEBL2MYnmqA1Cnm1EfDltMUEcL/
         zcTaNo3DG8N4FYKs+ED9FMgFGQPOC0Po/qdOTk0fwPPX18fgocqqpPi+S6x8O76KUds7
         AXsygXoHEwuowducSUCRpvWeW4gK2KIsPIeKFjDRu6O4aImUYIYYOfbmJtym2VEwgGvi
         BWQFar0q4Oqu25bIM9u8oW9HNbEciChUOfSgAEKYkPTTw7Grth/hF3hqiQu17wMyDur+
         fS3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773017133; x=1773621933;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uBR4plYfhG1YvXoyQZA+wjr+zEYEMIT2HuNQ1S4zVVs=;
        b=L7D8nh78COqy50MrXeYz3//p7YeRGR7SnedAS+UALCUrSxxTFgpu+EEi2LasaQiq1c
         736f6ckYAUWFNgsp6jL60za2LinHsu6J36FjBZpVT5pMWrRgCW25LPya6thoVZczEBSi
         vy+z/5vQ+Yh/piYZ2O4RTtMGZflrnZ7dBNnsvVHE7gCasEhe84oy8AbCdRwdlV/penVG
         1PIddyidsXHb1u7Z2J9bE1MaTRtUe1Z3etMd5mVTYBQlelbxBo3+txUv3TPZJY9azlya
         liTbYSGE5LQNKISKIX7bD+Y2h/+kDL+MjiZh3ZfVBQe0AvPF03cjgTlZO86/AFzMVAWi
         Sg2w==
X-Forwarded-Encrypted: i=1; AJvYcCXhHl0XntyKUceKXGA9POgTBO3cLnvnMOyhHpz6luW5fBA92GG9V0Df98t8XXYWSMywf2JwZMoPyjMp0Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6XOiGcDu110JBrNRXkeALLRlKbA6VR+cvKqITxNDfmFEB3PMe
	I6QzD9UTpLIgsAUguGbu/aQ4jTPInGm+XnUTFF2YJ4SKwuAy1LRW7w7r
X-Gm-Gg: ATEYQzzKuPw3zgiqj9PvwzCqQ45pCLQEs44VzzIekYL8MRYbrhX5eCEJ/zA4x2bJ46C
	oGK2SxeFjwoLAsYelFT5nfUuUTu49cMceE+9cjwSmp+oqij+uc5weNPFgvNXzZ7Ot2zOmsbhGVP
	0qf4V7FF3Fa3Og5I89BjFMBHFs3FzezKPxbSo4VdTaw+0HC8fwJ4oObHrj15MvVwYlkDQ6crv5p
	0RI3ugZaqnSFKwKZQodbyMv5AkFYqvQ0H5n1IA6spNIxJJ7VS35vJ2tRrsSOyws15wD7p622o8f
	/d9GS6Oapp096OBELZeId8A59KmL6343/V1s2J8ojVhDNxftN/ttAndAK2RmeSWB11MZ9X1cM2+
	HSBKC1rimLn3f4/e7k3NQ5hgLYYYlg6ViMMAONoLNO1847jFbAmsuj32NaclRtAMyLLLr6PGjc9
	YW594TsKdtl8iCGuV9DhamArZd31QbwNlL6DMibLVVVdQq6JKXortqY4mr3R9+ywycyBWh3nPWv
	vV7rrE=
X-Received: by 2002:a05:693c:6096:b0:2be:70b4:fd62 with SMTP id 5a478bee46e88-2be70b5165emr135654eec.4.1773017132603;
        Sun, 08 Mar 2026 17:45:32 -0700 (PDT)
Received: from localhost.localdomain (c-67-164-93-214.hsd1.ca.comcast.net. [67.164.93.214])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be4f948631sm7240105eec.19.2026.03.08.17.45.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Mar 2026 17:45:32 -0700 (PDT)
From: Sanman Pradhan <sanman.p211993@gmail.com>
To: Sanman Pradhan <sanman.p211993@gmail.com>,
	Guenter Roeck <linux@roeck-us.net>
Cc: Sanman Pradhan <psanman@juniper.net>,
	linux-hwmon <linux-hwmon@vger.kernel.org>,
	linux-kernel <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 0/2] hwmon: (pmbus/max31785) refactor inter-access delay
Date: Sun,  8 Mar 2026 17:45:06 -0700
Message-Id: <20260309004508.78609-1-sanman.p211993@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Sanman Pradhan <psanman@juniper.net>

Thanks for applying Patch 1 from the previous series.

This v2 series addresses the feedback regarding the raw i2c_transfer() 
error path in the MAX31785 driver. Instead of relying on local 
usleep_range() calls, this series exports the PMBus core timing helpers 
so the driver can utilize the core's delay management.

Changes in v2:
- Dropped the i2c_smbus_write_byte_data() wrapper cleanup (applied upstream).
- Patch 1 (New): Export pmbus_wait() and pmbus_update_ts() from the PMBus 
  core, and move PMBUS_OP_* macros to drivers/hwmon/pmbus/pmbus.h.
- Patch 2: Replaced the usleep_range() sandwich in max31785_read_long_data() 
  with the newly exported core timing functions. Placed pmbus_update_ts() 
  before the error check to ensure the core accurately tracks the bus 
  transaction even on failure.

Sanman Pradhan (2):
  hwmon: (pmbus/core) export pmbus_wait and pmbus_update_ts
  hwmon: (pmbus/max31785) use access_delay for PMBus-mediated accesses

 drivers/hwmon/pmbus/max31785.c   | 184 ++++++++++---------------------
 drivers/hwmon/pmbus/pmbus.h      |   9 ++
 drivers/hwmon/pmbus/pmbus_core.c |  13 +--
 3 files changed, 70 insertions(+), 136 deletions(-)

-- 
2.34.1


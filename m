Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com [209.85.215.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5AF943ABC
	for <linux-hwmon@vger.kernel.org>; Sun, 22 Feb 2026 17:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771779821; cv=none; b=SZISc8aQEZb5lA3j/8kbc30+jY7ngKxtY/0VIbkKWfwqIzeP6Wkyk0n4G4zfAABcSn5WsOkAeopr53Nzn5UYjw5sENF83NQ8u/K96SeLyR1O3tAIYHAm1ciER//0RiPL9M4y8JSpYIc6xffoBG1Jbe4Rg3W8QBq5B+vGpmR6lBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771779821; c=relaxed/simple;
	bh=qyBT8n5O6+MKl7BzylObPbKmEBgQ7XYFBPyc3ux7mtU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=kUXq13FWlMKUkrE4FWb1/A0RRmsz6/NdnuTpeOw2Ypz/eQxuQNj0Xf78qXCw+joLfU5xDsUPGPAvAoMIDzGi+cUYdnoO300Kk+EdKhsMuA/2IUCjskhnhoUMtZdFl+oSnM5eKhnAQzy5tM5dtAn3MtUQzAGhzWPYVwJ01nCjejw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ChXdbWVM; arc=none smtp.client-ip=209.85.215.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ChXdbWVM"
Received: by mail-pg1-f193.google.com with SMTP id 41be03b00d2f7-b6ce6d1d3dcso1267823a12.3
        for <linux-hwmon@vger.kernel.org>; Sun, 22 Feb 2026 09:03:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771779819; x=1772384619; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SL6Z6ZLekQLW+WR7jvePWE8kJEkT+rRvrksfgSGlNBw=;
        b=ChXdbWVMYq871fiDQmsVUh5J6zNHe88JbyBdRjtUW0V/5W9puFPf2yi8qL+QZKzmXV
         oAe3lzmnrug+Q0SorOphfxWrDvbwa+R5jDXM3TGEOMmbUgayhWOn8GpOHgJ6P8snVsRa
         iK80sh8GbeuRjwZmDGKXVh2toAQNSZdyBOEUZOjZfOfOsWRsncoxjYi+J6iUK+yW4+A3
         qkZvJwvwUNO+2pBBqGqsUA3Toj1A5zZjijTaRd2A47p/KZFOrK7zvbnxDTK4ZR7j0/na
         EiKeKcPVItkBGbdBocopAokALvykk7PYTLmY7+UoEMrWPrkLe5sAJbVMc/LZVRpiRd2Z
         iyeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771779819; x=1772384619;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SL6Z6ZLekQLW+WR7jvePWE8kJEkT+rRvrksfgSGlNBw=;
        b=W7UOLiapHiAPQgrRf13qHFvDzOPakZwNtgE07M5Inj+kG6H7LFLtFC+pXv/opUcYNT
         8v4ZZqJqfvaPoMhgzmiE1dqgrwRyzO3yf0oxsq+3KbaBq7CxDT758C92pccgIsdFMr94
         0w44HbTWdlk5eB7Hrvm4syzj5eKh61TQRNccxm7YKOD+Ca9yc+lWBk4P7N2i+hEvfcEM
         ynkB9Ffz8UYdi5g4+yF74zglUkAkLMMAnW+RxTOCj6s2ZIzjbk6Zzfg6O9z6Il6CTlg1
         ol63Z7nSFcIDqzoDjLfIWIm9zfufFWRO2M6eTZU/jU37y82u6ZmWuDkfWy8QcnPXGlPk
         klgA==
X-Forwarded-Encrypted: i=1; AJvYcCXeH/ae7xwy0jVVJTRhDE1gNohsG5ViqksrWEOY7CCtbg7Apmkxq5RNbjAfs8hPxuuBkKovWd8TRmMtLw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwKSCQ27c4FUO/msrrRaTH9vZVbcmL7R29QbG1v7st4Ir67wTqe
	LZcz2TkG+56RmSxkP8bJFLRWhlaxhgsy5jEndbdoZ7fcgp+d1ChMou62
X-Gm-Gg: AZuq6aK2DOfBoAn2wvbD2ZjZPLv5mxXkkCSh/jPQD3LNtnKsVCtDfFB3aVoV8XaseiY
	fJ2zfPpDSU25ME+/j2Z/X01ZcsXNsOwOZbzcmK3zae8v9wITWRLm8yqJfY7DdlIDIpWNBRpYH0F
	r48IaUqsKQfjdm1bKVNijQxCpYe9eKh+95/r0T+mxyQ7jOP23lEafRnVxaL7JHUwsZcbMhrTljs
	m1dRoGELUiWDLk8fRuuuIQtBiGbw1lA7sDXhPm7fnHrhNmUC5LsRRLWxecjx2BiVy4scalBkwuc
	skYHey40FcLQMRwYiHAiolbzJ72hiJz2o9u7HRCVH1wU+dWJPnRDky54mYAhW5b5l70i5BlPuvf
	G91j/ejVZJ0tusxiZACPqp6D1ygYbjgmmgBkwO0XVVr3L6lzQF7/Z4RnkwtIo62moqRnLpwZYg2
	lr+KbTLpdMCR2VCjEp
X-Received: by 2002:a17:903:2445:b0:2aa:dad4:d34f with SMTP id d9443c01a7336-2ad74515d10mr47068725ad.27.1771779818908;
        Sun, 22 Feb 2026 09:03:38 -0800 (PST)
Received: from yu.. ([120.242.225.43])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-358bf39ba25sm1555688a91.2.2026.02.22.09.03.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Feb 2026 09:03:38 -0800 (PST)
From: Hao Yu <haoyufine@gmail.com>
To: linux@roeck-us.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: jcdra1@gmail.com,
	akhilesh@ee.iitb.ac.in,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hao Yu <haoyufine@gmail.com>
Subject: [PATCH v2 0/3] Add AHT20 sensor bindings and fix driver initialization
Date: Mon, 23 Feb 2026 01:03:29 +0800
Message-Id: <20260222170332.1616-1-haoyufine@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series adds device tree binding documentation for Aosong
AHT10/AHT20 series sensors, fixes the initialization command sequence
for AHT20, and adds Device Tree support to the driver.

The AHT20 sensor was tested on a rk3566_lckfb board with the I2C-2 port.
Temperature and humidity readings are now accurate after fixing the
initialization command.

Changes in v2:
- Split the driver patch into two separate commits:
  - Patch 2/3: A fix for the initialization bug (includes Fixes tag).
  - Patch 3/3: A feature patch for adding Device Tree support.
- Improved the commit message for the initialization fix with a detailed
  explanation as requested by Guenter Roeck.
- Fixed indentation in aht10.c (ensured tab usage after macro definition).

Hao Yu (3):
  dt-bindings: hwmon: add aosong,aht10 family
  hwmon: (aht10) Fix initialization commands for AHT20
  hwmon: (aht10) Add Device Tree support

 .../bindings/hwmon/aosong,aht10.yaml          | 41 +++++++++++++++++++
 drivers/hwmon/aht10.c                         | 16 +++++++-
 2 files changed, 55 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/hwmon/aosong,aht10.yaml

-- 
2.34.1


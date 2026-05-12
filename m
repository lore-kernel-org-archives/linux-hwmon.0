Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2A8A37DAD4
	for <linux-hwmon@vger.kernel.org>; Tue, 12 May 2026 16:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778603356; cv=none; b=D2WVrtevjyj27txGPfDSpdzFEAVURq4dcsuOg7ls/wHkk+qpMoF8H0G0S7I80ex1OXm3m0tl/A9rH09SZFT4RxWYYN6/UZdkT83GNV2PLSJuL5nsJ4E8varVevXHasO86tfKsFXmRwMH0jmRv3RUpss1sML5oUVPHXLGGdwT1P4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778603356; c=relaxed/simple;
	bh=LoubNdRUShMcu7qEV8ZZ5BwpAeFkLKOmXVPshFsRkhA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=NO2z83pozwWlbc+HEiuBpsVk5pPnB12DkEMO5v/5mR7j0EBa/lYlxqeeAlZXR1TKn6I2YvKNtJY3kiofpDTgDjdDO5xoPCyv57aOlhWbJ+/WCLgD4MRWi/AiKWHIMSbrv1H7ERxB0sraSu/VU7ImF861ESN5nWo0CiEx3oJDWno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=SnfLeX0l; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="SnfLeX0l"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-48e56c1bf5dso35560925e9.3
        for <linux-hwmon@vger.kernel.org>; Tue, 12 May 2026 09:29:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1778603351; x=1779208151; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MQR5VZyi+jBTfjIgOfwjcx/+UKNDtrx713FGqq4wKfo=;
        b=SnfLeX0lKvXLiw+UPFjUg8zhTri7pDTh5H7vQ7IWFYyUVoc67FeUbdvwACr0AmSXCQ
         QrH4+M+Cw0yGGM4N+FrAQRnUhde8QSXuL43bVsha/UOd/8YOgvHf2Qgwn8o/SZm4thwm
         PknIo1XH3qYlkYSrNmLAQMOpiCmbS+pyz7za6HHEm2FYiHQ5qRq4HkeBiUvHQVgmuhaU
         vvEiUCYW+v3kQpuQbCx45gnw3y+9sjms3cth9JnHmepoU1YiV4ImZ/290dFqs93GW3Y+
         Hjab/cd345n+8JM+IK8mcwEZlaVa+EqGtg4HwZNf0Bm0a709UbGg2LP51JTmH6ZWHZ9f
         +vzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778603351; x=1779208151;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MQR5VZyi+jBTfjIgOfwjcx/+UKNDtrx713FGqq4wKfo=;
        b=ISq1ayS18a8uKBeIgdQ4HlVNRGKJQS5SeaDMUgppbpoUwGCH8EVsa9ON7UjVEka+3U
         KhXbO46OTxduwU6T9EmQRN0OZZzk4S8bPukKrwHok0/9koHWSoHwihnboyvod0TlPuad
         2rItWzre/7TrnaPwbrJ8RLyk9ZX8ZDjTxVuxhL5+Hn4i7mbDqGkoeuDfIS93yxctY8ke
         MJqJm3KeOGMot/Bit6QPwkHeMgyavoEYiAmaERoGZ2bSOofKuLyNLNmmfvlOF+FUgo58
         vIe5nGa2irAPls5lDshr5BxE3fFGtl0qwHwWIB1mV/EHbJwQD85xLfxHMQ3NkYj7tdKn
         cfTw==
X-Gm-Message-State: AOJu0YxDnkKjiZsgpxchhCchWkAMDm/rVY1JWKlLSXLtfMNnG7n5sgiW
	Rg2oR0jBjYWyqtR4p1DRcn0YFz4QsLpRTzmG5ZnY7tcI6DeBheOJhI7Gy5xM/cGNHxM=
X-Gm-Gg: Acq92OFXP6vch0+g84NLtWY26Shyu5KwMv4r62gsiu7I2Q1vsVhReA9zldisezKf8Vr
	LUF7Vdyqz3F4S9V4Dbo2S6pRYTW2cTMpKioe3OfxnJztcuhpnVFZxZdxa4rnPOprYAFFEV/fPqy
	uZNnsUwwLchzzuZQsXY3LTOU8OoZooZ7PvA4U+o1psHnWCE79yS80+w/7nslNK12/Sb/EW2zrw1
	9+tTDXLTADvRh5LB9vusil8ICKTEoO/g6H21XGSy3l1z+kZyCqqW5KeJ4lHU1VqjS2rSzmMsokb
	N7eLwIvCjsnFkZHlC8fr+iIL5ZKZQ9jeSthMczpDx/DWs0+gJGhf722TasZKi5sLDJ3FXdCGjaj
	DHuFu4Bt8hcJ0gc0XAOSFkmYWtZB1/LXYc0M5j0KKkGQtj0+SbKr5PPQYgJ35n9ikP+VVX1euKS
	lK8+r6Fo5RCmKuxJJvm0SUmpwmK/Ojb6lae0tH4CC3KfLoSzwlH48/pOQ08IvfJcBoqCCo1VlYU
	00oxxcKJ0zc2NU=
X-Received: by 2002:a05:600c:8706:b0:48a:8905:a500 with SMTP id 5b1f17b1804b1-48e70696dfdmr256032915e9.12.1778603351351;
        Tue, 12 May 2026 09:29:11 -0700 (PDT)
Received: from localhost (p200300f65f114e08229f8c404acd2182.dip0.t-ipconnect.de. [2003:f6:5f11:4e08:229f:8c40:4acd:2182])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-48e8e566cf7sm39305455e9.0.2026.05.12.09.29.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 09:29:10 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Wensheng Wang <wenswang@yeah.net>,
	Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/2] hwmon: (pmbus/mp2869) Two cleanups about device ids
Date: Tue, 12 May 2026 18:28:55 +0200
Message-ID: <cover.1778603083.git.ukleinek@kernel.org>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=615; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=LoubNdRUShMcu7qEV8ZZ5BwpAeFkLKOmXVPshFsRkhA=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqA1VHdNCijC4fjRwNzBkRqG8WLHIX29ZZ9ZYPV qe6L0NjZ6CJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCagNVRwAKCRCPgPtYfRL+ TkxPCACoGMS8ANQ9qo5iF6AfiZhdE9EkCqz39DYB12uNoxvjCAU1PdEZG/+Y4NWQpVUCNP8xOkb hHaVTqkR9c24/ezpy3DduB6RrFHRSzU4skbQLc75HkpKTb0tND8gtjQ1YPKVopkD29tdjxFaLt5 VjVJQwr82tCWCrc/fojJW2h2D0lV3B0HFxqs1XVpvB03NVH8EQFWc9tIjvF9sA+YtIO77VI8QJE nCdNrzYz2Nbga2bFSwC/3OUp8n11ZSkAXI+n6S92sLIB11jbx2kelgxDzajR29DLtgwl3i5XYjO gDRFh+3beLM5AduwPFD2HCzdJ+fRSqSJ7CXf+jRVI7Vd/itk
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Hello,

I'm currently working on a change to modify i2c_device_id. While
preparing the hwmon drivers for that (expect a patch series later) I
found the pmbus/mp2869 driver to benefit from some more cleanup so this
was split out of the bigger patches.

Best regards
Uwe

Uwe Kleine-König (The Capable Hub) (2):
  hwmon: (pmbus/mp2869) Remove unused driver data
  hwmon: (pmbus/mp2869) Drop unjustified __maybe_unused

 drivers/hwmon/pmbus/mp2869.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)


base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
-- 
2.47.3


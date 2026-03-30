Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 258903AE701
	for <linux-hwmon@vger.kernel.org>; Mon, 30 Mar 2026 10:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774866250; cv=none; b=KUleFqadrjO2GezqP0/TDLNw42PIc9CF3HD07ATKl0kX7jBIXSg6FgrUu8feNzAisSqiiOrQHYjxSKsIDJvVOAI9DSU8yE2H6BNwTcsHFXoYmi9UXoCm2yaPBwMRb3XkmAyTwjZBioeaP1HDsth2FN/Ni9LhHbgszB8DW7u+aMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774866250; c=relaxed/simple;
	bh=cVWQgXiCXgER1wMbi7fP2up+AnV9eUKTl8mFsyxCVV0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=cPQr50pCoILIWBdxKzzC315AHUDDpOgslm8qNEYajbV927FXm37PPztRxXKDqGFj+tuAGPSjRjBOakVOxbqAZQW//TKCSdtiOsVoLyc80C0PIEkAEBuBdHPed0T/6h8rUchUrDPj+bJuaCejsfULTGN94UZOr5FzFQFtROpJwcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Os8c1onG; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Os8c1onG"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3585ec417f6so2083256a91.1
        for <linux-hwmon@vger.kernel.org>; Mon, 30 Mar 2026 03:24:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774866248; x=1775471048; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4Cy0HRPpwmmn5TvIoVoNc4yfoaNPd77LIEkBXRHxuVI=;
        b=Os8c1onGD+r9+GwdaFishjtrqpdLSbobkpL1NjWhrmrpbaEdGgK3q/vHfoi8VJoQok
         2xnxB0YWB3SfxjAFbEsfMrUm+4yzK/IpNe4gHu5KQShrx3XCIWInNX5wc9bWSJZdCU/9
         CT6h7lumPP8jyf+SanBkE569yH5p9C8yBCtt5gkMwJXUxfVBWqXfAJfCiYEydCPPh9lH
         MSJjmnucXYib1Keb4xBjCXkISsm42H0aj9UZsWW8UGG7nIyOfUp+aDt5o85O679sS6S6
         7dvGc1XOZXSI2Ytgz4hr+U1sGsOryLZ2OCDHaePRDmR5BZJrqYGV4aLLL+m8ueMniR3R
         OtSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774866248; x=1775471048;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Cy0HRPpwmmn5TvIoVoNc4yfoaNPd77LIEkBXRHxuVI=;
        b=sERAYAfbqyg3mnossj/dMl7RKOj7oqPt9K/u20WKuJtvOXDBFUo2YUGYN6sVP4XuWQ
         TrGOfBWDoPG78HRrKxWe4mFQIuMous9NKGjGaJ3yaE7w/p4VDf1kw+xMUuPKkeWlXwU5
         8RCKE5SzsrouFiWzfrwsWqbOvsh6Cs9Li8pxH632ygaR1jJlqtB1JAT1f24g5eCfP4SD
         fth2IYckdKPADy5dD8htanzu7pIHeLWfHlE1ItLjEP1uiUUtQ6+0LEyrJellwAihculy
         etxSZQLuz/J2/I9KXkzvCEMLNTpsDM4Xc0CWxITC2b77HhQjK86pb5R16DriEPTfWvrE
         k/yA==
X-Gm-Message-State: AOJu0YxuxWDGnYlFa01wNFx2Ha/6KnTpAVWe06R1Y3i95UnApoDOHK9+
	AaHZto3yxxOWzPIzvM3KNhtaa2Thc31tOj+UXJIur3q5aX3sJUXMQKai
X-Gm-Gg: ATEYQzz/X6R0baH1eQ26MEfGBZA42OQSHAj3kLxsj0CGQp48Xu3VPZFmEwcPRTnZbKt
	A2GjcKdJpzpH445UBUKXRox36hLCtKOe5AbNt8kbwSHoswBRbaTnhERn7FYKRwEdgMLMMFXoilt
	j1JBW5PGnLmQHoaq5GonSZwzlAZSEJ/wPaO4yhLsydbD2tECWzevE2n0k5qk4gAV+uKSrv5Kubo
	2PNGGTsBldrCJo0ELXBjuZX5Q+p1YzOBzLZvzEleebktU//pUmlw5XgwdSZWv54jCCAQ2KqbgId
	gsA+cee0lgbJl08I6hzhcy/gzltrx8jIE4XNJau4biSYRMZHU2Gg3BjO4qJiTcTof6pi7RjBjqh
	1bpV5o7t7GSHfq9eyvy6loB6eMdSpOONgHJwWhFVRli1fHz1nMTvOg5dQGh1CfaK54ka4uFT2Fc
	JX/nBarVUgxKZbM1W/MDFs6ScTGmxonPH/UEDX7Em+rFrG/Dw6TEzJG/w7
X-Received: by 2002:a17:90b:4b07:b0:359:8957:7285 with SMTP id 98e67ed59e1d1-35c30b82d50mr8989093a91.3.1774866248472;
        Mon, 30 Mar 2026 03:24:08 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:93c7:f319:97ce:1434:43e8:eab7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35da9ef1b70sm2487452a91.16.2026.03.30.03.24.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 03:24:07 -0700 (PDT)
From: ASHISH YADAV <ashishyadav78@gmail.com>
X-Google-Original-From: ASHISH YADAV <Ashish.Yadav@infineon.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ashish Yadav <ashish.yadav@infineon.com>
Subject: [PATCH 0/2] Add support for Infineon Digital eFuse XDP720
Date: Mon, 30 Mar 2026 15:53:43 +0530
Message-Id: <20260330102345.37065-1-Ashish.Yadav@infineon.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ashish Yadav <ashish.yadav@infineon.com>

Hi,

These patches add support for Infineon Digital eFuse XDP720.
XDP720 provides accurate system telemetry (V, I, P, T) and
reports analog current at the IMON pin for post-processing.

The Current and Power measurement depends on the RIMON and GIMON values.
Please look into data sheet sections 5.4.2 and 5.4.4 for more details:
https://www.infineon.com/assets/row/public/documents/24/49/infineon-xdp720-001-datasheet-en.pdf

With Best Regards,
 Ashish Yadav


Ashish Yadav (2):
  dt-bindings: hwmon/pmbus: Add Infineon XDP720
  hwmon:(pmbus/xdp720) Add support for efuse xdp720

 .../bindings/hwmon/pmbus/infineon,xdp720.yaml |  52 ++++++++
 drivers/hwmon/pmbus/Kconfig                   |   9 ++
 drivers/hwmon/pmbus/Makefile                  |   1 +
 drivers/hwmon/pmbus/xdp720.c                  | 122 ++++++++++++++++++
 4 files changed, 184 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/pmbus/infineon,xdp720.yaml
 create mode 100644 drivers/hwmon/pmbus/xdp720.c

-- 
2.39.5


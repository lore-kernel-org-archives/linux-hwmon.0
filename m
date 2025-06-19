Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70B9922D7AD
	for <linux-hwmon@vger.kernel.org>; Thu, 19 Jun 2025 19:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750361883; cv=none; b=JykQX2qTK2MbI0iqOEfS8k7cDzn4Od68f9i51lKbjz1/ilOqkQAXsNXqOtuA3gV0IalmnKQpEcmRpU0T43xRCGof5kPiNTqGlHMMteMzBo8LdTPwGZL1/MVMQ8IEeNpKgbysGZgdUpZb6oE4I8RU59F91KCuPqxwUzUnBb1aXrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750361883; c=relaxed/simple;
	bh=NIFjyyzuaNIdw3YOaVRSCkqGyAMbR5LtcqtqSv0Jb38=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=LLz1LxIz4Pz/81yTwo+vOJ8YiTwIQzhvR2WOQYsD5xmj/4SIPeH7s5X4LDV+OVQJcvc2DGrbfOncO2t+WRWDjT2M54cAmYCAifiW7hanoBozTlwkL4ivAtpo5VGF4bTbWz78MTa00uzfmFAo/iJ0H461kmO7HpfPIo0sdqQZDY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=PxIOddVa; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="PxIOddVa"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-606ddbda275so2230336a12.1
        for <linux-hwmon@vger.kernel.org>; Thu, 19 Jun 2025 12:38:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1750361879; x=1750966679; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DEw+XHTgMkkpVsk+76/bQtWmWF827UIFe6sQvlC4/B0=;
        b=PxIOddVa0QdzZtAJQ8PGI+DgG0o2fWiw1P3iygGZLoGVQeQSyK/aXm9RaCLh//EpJZ
         QKLQAAMUSbdb7mM4gfr0sNcHFo+wtB450aKwb7epIiAlZTl9baDV15KdK/E+hflSFTbU
         ctTvkvgk/6kMLPmqjcLBpNjr3D7cOrG0szd9PcaPFY7jCoeYlCwEdZ0U6Nzaz58r2HaN
         CymUZvEnTkv6odwa9SdTlgC1ua+Q7ajNtyJgtkHArfzCpBuPX0CAo3w8BF/CBeph8Wxt
         cminZHyoMIDFkZkL/41gMQWywia8GsiXpU0Om117ZM/xxObWElNWUHiaQg3jReNpcA/m
         ySdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750361879; x=1750966679;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DEw+XHTgMkkpVsk+76/bQtWmWF827UIFe6sQvlC4/B0=;
        b=Vom9BvX5MSH/sCyJIcAB0RSwdfxajIoM72YUf4YbRttqnkuS22H2DXuROTFWJmLasu
         0Cfn+fhd4u5uk+2oLs3zfrAO6Hq+s7K5w4zBN6LTQs0sKL1lEIUyxddUZQF//JNCDgO3
         +lp/9dsl/amO+yjs8t6rrS7gxDHtmG+qPCCyd53HwMI86iWmhKbNYnqzxdbrc3mCdr9W
         00hGO8q6Z7kwIpVVOemu4i5s3AezZFW0hYgmenZhQto86FbF0PLY4wY8FT616vosB+la
         BHp8jiWHxWW4EdDsjaybenXGlIiQckGbwaD5PCewnie9OIFjaOhNboDkn2QpXOZWvDyG
         S3HA==
X-Forwarded-Encrypted: i=1; AJvYcCXXIU1mGnpD3H1nMDwgwr0dhXeZGqnuSeQUeVEOQJIwVaiDg2hrSofEyIQunqMkpA3WSvTqDlgLo9sMGw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyop7Zx/TxqKkYIXHMAoc0X39N4RGbSR6TVe9PSf+0myBTqfymI
	jVHLg8/SyR/M79tHS6lrHV5PRlJ7LGfZyun3Ma1gz+xApWPpGmU0AhFYzpkQvJ3ijSI=
X-Gm-Gg: ASbGncsjsT99YQujIj5NDVVdy1SCk0fqGhpShrnuHmYQQ/9+RsfR1c0f99LgoQjbiu4
	6uAuEGNDwuns5OrbX8ydVXyJTgNBRE9NoIHmdN2oha6F2euH37ik3phI32CAyUmnkyCL4eLtgOq
	Xe2aWyeB/df3p+fvduW83/QGzeksKTCQb8WJkblue7tVSfpLe0qpZEwhZqYJUqVE862zDaKBF1o
	4WvVEa9fL1XqSjlNgZgjmpfatJG7fz/KeCDTOarSJqOsZokdtlZCXxMqtaH2ky3mtPC9zFRWNci
	GesTIm+AoVhj9QJCc+bFcSt9rO/65YgCFUbAG7q4fo783jJ2+bIFy9/Xp+UxKFSZd90=
X-Google-Smtp-Source: AGHT+IExty0s/qqPMzZoWioOGaL/D5l3jKw1pRA3K84JdSTooeAoNuus4825RUxWdFOd6p3crKYCdQ==
X-Received: by 2002:a17:907:9215:b0:ad8:a50c:f6b7 with SMTP id a640c23a62f3a-ae057b6e710mr9182966b.28.1750361878727;
        Thu, 19 Jun 2025 12:37:58 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:36f3:9aff:fec2:7e46])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ae053ecbf2bsm35610166b.46.2025.06.19.12.37.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 12:37:58 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>
Cc: Chris Packham <Chris.Packham@alliedtelesis.co.nz>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 0/2] hwmon: adt7475: Implement support for #pwm-cells = <3>
Date: Thu, 19 Jun 2025 21:37:44 +0200
Message-ID: <cover.1750361514.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=702; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=NIFjyyzuaNIdw3YOaVRSCkqGyAMbR5LtcqtqSv0Jb38=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBoVGcJKmVssP8jB9YqPPmLToOVDCM1PRQGoejec s3avXa2MpaJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaFRnCQAKCRCPgPtYfRL+ Tm26B/0XY1eUwzzORX/Jlz40BkiXErdvfjjms6ozU/9Ukyk16S49RMwEwRXw+nRDJF8HgpI4Xb8 EAbYwJXLdw6RlcnhUOfpWd0KuY78Z4RljV5TtLRTEKwpbhY96b/uWsOPMAIiKlBNzB3ToyXCuoI 42kq371B52N6H/qy7tOL/hhm3Lz+CG01/nwK/HEZRcq9qj/feYpnyjn9Z2zpun3FDOMqzEdFetE cDjvXYAGZQc3mpJGgLUB8TkTKqqzdtzPmeuPQS9Q5CzPxdH70yyyVKIg8TpKSLLZx4bYoBkn/6B OIEfZbjMdeLZ+L13zorCyIur9JgoMs09yODY+fs3o6EYL+/l
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Hello,

this patch series implements support for #pwm-cells = <3> and updates the
binding accordingly. 3 cells is the usual PWM binding as was discussed in
https://lore.kernel.org/linux-hwmon/jmxmxzzfyobuheqe75lj7qcq5rlt625wddb3rlhiernunjdodu@tgxghvfef4tl .

Best regards
Uwe

Uwe Kleine-König (2):
  hwmon: adt7475: Implement support for #pwm-cells = <3>
  dt-bindings: hwmon: adt7475: Allow and recommend #pwm-cells = <3>

 .../devicetree/bindings/hwmon/adt7475.yaml    | 15 ++++++++------
 drivers/hwmon/adt7475.c                       | 20 ++++++++++++++++---
 2 files changed, 26 insertions(+), 9 deletions(-)

base-commit: 4325743c7e209ae7845293679a4de94b969f2bef
-- 
2.49.0


Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67A6D3DA7F4
	for <linux-hwmon@vger.kernel.org>; Tue, 19 May 2026 07:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779177389; cv=none; b=RH0+TdP8lYcBxaXAnTRkEJMbC1/w+FKoMI0M4DrzAUeyvSnTbEK3qu8Ju9wnAWqFzZvEyvsYxkmhaoQy1F1wRbaMshCJKtCfAbFhBrc+eHeWITgypENxxjfNYJTeUbC9I4lndJnHs5p8ISuR+kE4tIZcibwIT0fTq/DPlPtS7FA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779177389; c=relaxed/simple;
	bh=smqMWADuNscG6tlMAbhonjsCwFpy2DTmVY5dR7Xj9V4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=egZW06loNJGaugvP5Ad5eX1/TO2YM5Xt0v0QbYZh3IPGGXycQGNfegi7AR/UoCqDwbJfjxP1FnP6vYWGBinztP+evfokA6S8zRwYO3CzI5OqAbQ8lPwT7Ev7EwgWFJbFhZfMolpTsisT1u5gOFjCRWyUJ/1PurQSfBQxQVdDXno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P688K//t; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P688K//t"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-365d8e43759so1868589a91.0
        for <linux-hwmon@vger.kernel.org>; Tue, 19 May 2026 00:56:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779177388; x=1779782188; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TIQKyiWUSmY3tJlSHzG04+D9tVQZs2EM4N6KWNjkwTw=;
        b=P688K//tCexG4/fr8T9K3z+pq14jxVL88Zpnb0jnlYKuUsgc5DQk4EbbkDP1BUV4wC
         7ByWITiTkD5w4zEGWIX8LJ9HO1u9GkUFK/nYHQMi7hEZEsCMCoImiYxsMEEE3aLomjDP
         266vbJOROCdAeScm0UjQ/JV3Lmk68rdlQBVyB1hFqMFP3iWfk/CLE9ROWDaxT8XXfbgT
         RoaNSNbbDSuIibtnO5atvzuqOf97r/y/KgnDmmYErdc1abmcf+Pymk/pI2bTA8kpKOPQ
         Xt7BlA4XjNKzYF0/vLvktkgrimrlqWsxiTPXc67DO85MoJehRABcFP0XNBvpzlqXrJKE
         N4BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779177388; x=1779782188;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TIQKyiWUSmY3tJlSHzG04+D9tVQZs2EM4N6KWNjkwTw=;
        b=Jse+X6zrSYVBOhlBuJfxNHPrr/8A/bPjs4gChC+HnW3At1v7xwePpjK8zxRFR4WXM7
         4WumUuC5eVGmpnhNLedmZhydu1SaAp10tqDQzyR2H62P7VbAUCskDmrYZd6mbi9UnMFH
         3LAxOjzPjeeLI1eFLe+MhxkaeRUwUA+FyIZXDR46xahAu4zpxJoofkmGgYIqnBKwRDzp
         nvSyQnBEJwHfgt8sSzMWhJD5NQ4IlV89DUiLmi5fGqgXM4ZJeUztIpwfhLaCVKsYT6/H
         MhXJWk3O9PEjzsJOTIDtQbYDgOKP/YcG8IcLCzNrGNNSFQ3KstqrcYGbA6NKmOvLS8aD
         Gdtw==
X-Gm-Message-State: AOJu0YzFQjyFgqzuQ7+uF2Yx05XELU9AJWhOzsmOYXWw9nicsS9xsRpz
	DuECvP2o81Kx7JFSqaSGncsbfuobwNrV2JhkXAGvBPstDpG4JoVJoBmh
X-Gm-Gg: Acq92OHRiwaORA54JTVhyZIQHCFwgsQVNUvElgvgiB0e80WemdeJ0VTkZYbzQ56qJdI
	fd1HnzhEO5w4Wirgl/xdP1Kg7HJkrI0fv0pQ/OBder7zNTylsuRD/4hZnkKyqo0tfY6NbYvm01Q
	SwmJ58OVQm+QT3riAcJtlhGg7uNt2PdrWhydDdIeCqEWu1QHPZ4Vx9UDOfgFqTKGfPQR2wt+wRB
	97lusEeGEWyJ2djtltvs9KDIABtDCb2Df9IjI+5TFeBBFcRfctrjjmct1laOzoYRWHatDcaUGfG
	ZdaJhirenzztOBnISL2wLdwG0YtWLga7nzwkXHTF+1Rhec9wdFeD5rYW7/7RdZtk+s7LICh/6uj
	5QK/xTQcsbTBxA4gBj4R3Mj3cRosOXzGLStgymOxj03qc4NvwaxKp+i9WVkAIXjNalV6YNc78ed
	KqodwX6h6NWpes354kji4t4qIeIZFeJzKkLYdRxQeuMqM5
X-Received: by 2002:a17:90a:c2ce:b0:35f:b9f1:fded with SMTP id 98e67ed59e1d1-369514e68b3mr14199587a91.12.1779177387697;
        Tue, 19 May 2026 00:56:27 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:630b:f287:3279:f420:ef8:5c69])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3695126f9eesm17116652a91.5.2026.05.19.00.56.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 00:56:27 -0700 (PDT)
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
Subject: [PATCH 0/2] Add support for Infineon Digital eFuse XDP730
Date: Tue, 19 May 2026 13:25:56 +0530
Message-Id: <20260519075558.91466-1-Ashish.Yadav@infineon.com>
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

These patches add support for Infineon Digital eFuse XDP730.
XDP730 provides accurate system telemetry (V, I, P, T) and
reports analog current at the IMON pin for post-processing.

The Current and Power measurement depends on the RIMON and GIMON values.
Please look into data sheet sections 4.4.2 and 4.4.4 for more details:
https://www.infineon.com/assets/row/public/documents/24/49/infineon-xdp730-001-datasheet-en.pdf

With Best Regards,
 Ashish Yadav

Ashish Yadav (2):
  dt-bindings: hwmon/pmbus: Add Infineon XDP730
  hwmon:(pmbus/xdp730) Add support for efuse xdp730

 .../bindings/hwmon/pmbus/infineon,xdp730.yaml |  59 ++++++++
 drivers/hwmon/pmbus/Kconfig                   |   9 ++
 drivers/hwmon/pmbus/Makefile                  |   1 +
 drivers/hwmon/pmbus/xdp730.c                  | 128 ++++++++++++++++++
 4 files changed, 197 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/pmbus/infineon,xdp730.yaml
 create mode 100644 drivers/hwmon/pmbus/xdp730.c

-- 
2.39.5


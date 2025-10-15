Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B036E26561D
	for <linux-hwmon@vger.kernel.org>; Wed, 15 Oct 2025 15:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760542654; cv=none; b=KHnN2LEuQn5c+NAx+evS8U9fqxcnT9v+14p1aMvXYJGWaiSEIpfyIGtS+WzBNK+LVUI21fFzI9WRSh2VdYJtQgMMGf4Tz77oBekS3CbxfVVIbVM+dd98X5ZnB7CEdwv4gt4cyJzoje9o/tjs0gjaqBRzApFYP3sD6J/obiUb1Zc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760542654; c=relaxed/simple;
	bh=aLlRdlh9FDUPd1JAE8xBaQc227ypKkHoxuDPxDr9ql4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=iUDZv7sZVovhX+2RucsBtpqRdK4IGEnR6zEASeLIhQ6O57tJzsEsyQhvb9XdhP0RlHPmR0yM6e/XaLi+cxunqTTDkkiGkmqTtc/CInUugMuT5XmNmG5h+t9QeZzM/7p2neq0vDBIZSzjw4lglkc5HpQ0w7RaPeiTpAO28cCLqVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ih5k1QUB; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ih5k1QUB"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-b5515eaefceso5819840a12.2
        for <linux-hwmon@vger.kernel.org>; Wed, 15 Oct 2025 08:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760542652; x=1761147452; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hn9avPxUFptKtiboarOpoGxvc9w+QcujEJ396q5eQtA=;
        b=ih5k1QUBkcqYqtgLFsRSYm3xAcltkjkYyVMNP4riod5hCzyKwFgHs3ayC2N4KQL2I7
         f9z1tj1nZo9u4pX6oaLc4boLXSyhEmk41nXZoFwhV3kwKJql5mEcCjUEyFttpDsynXiE
         NaEi3XE4DEh1Bn7hDDIyU0CuT2dHG/OPtFLA37YaeLYYz9AdnsS63loP22lczp1zrEnr
         zuTZFQ4WV4xBrb+zVX1Wekl7M58ohkFRLdUmxfQ/JXOVUB7iMzlE/kSsR4F5Ua/pBeLt
         A8Nos01jXzbN1i0whfYYcuGk4ohs3lvQB/+QNhhhD+65On/SU6rrs3UXAWHI/xaDAhjw
         Tn9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760542652; x=1761147452;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hn9avPxUFptKtiboarOpoGxvc9w+QcujEJ396q5eQtA=;
        b=g3WDTGcrubK1grUNsKs8bN7DPVcUBTWc6rYvqI4YAMzQR5YBSwld1R/iKlLglG1seS
         Nt8CtF2R3To3ElqOimhV8ozlqnGvK3EEFSpdMalQAq7xoFBsGHn/wAifC/7HJPRbnMSy
         E0t9fInZMl3BKFHZgmvOyCw94cpTCHA7cBIMS2Zr7vKqx0jWRSoSOK3/4aHyxOrpACM3
         bGsyMeLQU1Vjsn3G/WAREPvx9cqfjEWogU5le8vUcj6PgWhNTY5tkrRPX2YPMSU7KXU8
         vhJ77fnUt8+Yyh+VFu8MvZ30Y0JQPe0qvulFJw4rPdbvblEjtLwAyXf0HWU+C82bN53S
         OGSA==
X-Gm-Message-State: AOJu0Ywp8CWrvV3gddUmOFYWmCW/1TgUJGeYZS4BjBOEf71rgpnfQaxs
	ikk3KtQ/H6idYOvYIwwLxIDMGnIuotehIkkz6q7ovIItYFrPut2Iio4I
X-Gm-Gg: ASbGnctITTc4a4FKZ8kF+FfIungKF1wN7tZ91YgOOwQTZkgb/8To+JPWNfN/qwPsHRe
	5RU8a/+cVlQbIE/xCVhJj9WCrCpCBhOgDT25vb5J67JFh9kcMxv80TMdYk+dXJ0d7KFmedVRrrS
	XQLOhV6ZouG7L36SBvBCGoWFFrSdMB5JYgdWen1+umGUy5Qv2wULH88nT6G6A6tbBilxOUBB0Q5
	t1GaR6MIcWd6YAsl0UsyoIddGnILQ6bVNkhbrQPP0GrwfchQsqvg01tAmxzRdWeq9FB1o6Xrvc2
	K2RimrDan+xN1io7XNRoLr0qxKghspWbatbcEjuExoP5CwNt5m2tSvXF7Tu9ktASMGxmL36mW7/
	JiWA+KZPXerglBneqSFr/MeNwE5YkDm6GOb2N0L9Ey6mvAGfY1hwEmytcgOQ=
X-Google-Smtp-Source: AGHT+IH+yHJj6xUqrD/D2julKj+3TgI0zyx5td0Q6jzoMKQ8APWTNss3bNdH/1RhbmHAbB5CH048bg==
X-Received: by 2002:a17:903:3c66:b0:282:eea8:764d with SMTP id d9443c01a7336-290273ecb72mr398634825ad.35.1760542651777;
        Wed, 15 Oct 2025 08:37:31 -0700 (PDT)
Received: from crl-3.node2.local ([125.63.65.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034f87b23sm201655935ad.113.2025.10.15.08.37.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 08:37:31 -0700 (PDT)
From: Kriish Sharma <kriish.sharma2006@gmail.com>
To: kimseer.paller@analog.com,
	linux@roeck-us.net,
	corbet@lwn.net
Cc: linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kriish Sharma <kriish.sharma2006@gmail.com>
Subject: [PATCH] htmldocs: Documentation/hwmon/max17616.rst:4: WARNING: Title underline too short.
Date: Wed, 15 Oct 2025 15:35:27 +0000
Message-Id: <20251015153527.1646111-1-kriish.sharma2006@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix the following warning encountered when running `make htmldocs`:

  Documentation/hwmon/max17616.rst:4: WARNING: Title underline too short.

The underline below "Kernel driver max17616" was shorter than the title
text, violating reStructuredText formatting rules. Extended the underline
to match the title length.

Fixes: 1fdbb3ff1233 ("Add linux-next specific files for 20251015")
Signed-off-by: Kriish Sharma <kriish.sharma2006@gmail.com>
---
 Documentation/hwmon/max17616.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/hwmon/max17616.rst b/Documentation/hwmon/max17616.rst
index 936447159f87..a3dc429048ae 100644
--- a/Documentation/hwmon/max17616.rst
+++ b/Documentation/hwmon/max17616.rst
@@ -1,7 +1,7 @@
 .. SPDX-License-Identifier: GPL-2.0
 
 Kernel driver max17616
-====================
+======================
 
 Supported chips:
 
-- 
2.34.1


Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CB5F7F6
	for <linux-hwmon@vger.kernel.org>; Fri, 30 Aug 2024 01:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724979961; cv=none; b=ch2GAmjHT0Az1R9WQSKGiXatUwXAOKrmP0fxo8r/oMX7stCEA3JL0l27E+FGwiMtTTqfoc5HSZ7eRpG6YTbP6qQkya8p7xzbSlw4uXs6Er+mFsH90Gxb3sQzY/IakeZufRN8U8TC8aelL+Zw7kVFc2vxfB5hVluAkaMHKZdXnus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724979961; c=relaxed/simple;
	bh=hGffsclAdGsBMC5MCSggH3G6A7t+TbxKus4IPbjjIo0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WW+gnVEFOThZr97LeXB1er8WOXPR99GWth8BW6MRrzjCVOtm8uYmVNjnuCty0YRMIAXAh3xotAncDg2X6Fv23qu+emcFNh10ssOFXESb9YHCUSqah5KDucrK0hLnhxHFdMoqNWSqpZTr1sZWQTPH5EHewfwcv7ff0nmhrzypaKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VFScsNt4; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VFScsNt4"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2021c03c13aso11834805ad.1
        for <linux-hwmon@vger.kernel.org>; Thu, 29 Aug 2024 18:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724979958; x=1725584758; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=2t2ca250leY+df0IcrCFIwKIuZ9pAHmu2iD3qau8aUU=;
        b=VFScsNt4SmQKwvI03YFG+qmet7fu+0TgRsH1B2O3RpZv3z6L+sWPzikU4lPt7FN0Mo
         BI2ZnKUMzQdizxmGVJXfg9SaLTTiVEgnBLq7tWeb1ox47X7O7Ydeo5JjV8IohdLY3nvy
         oYp7RZty7GmpWwnT89MwOJFOQzgpvK1IZaszxGCyOW2DZYZuo06HWZA/4lotV5S5iG50
         WncmshFzqmakgO2kQGA4IjxwGY/5bWDcJopaOHz/MjeSluALZoZeZRZxqMoXRvdWyuqr
         6M49O3jwUB78TvQ2QeerHjf8y9P1OmaHsnoMlQshevCI8AL2ZhiuYjPsnJg+cZSTJBFT
         6jfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724979958; x=1725584758;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2t2ca250leY+df0IcrCFIwKIuZ9pAHmu2iD3qau8aUU=;
        b=SE0u3n1VUAb1g1QakPA5GUQX9lElaqtzlN2Dw3Ic5K1hw9EIK8otoA6SXn+D04b0RX
         lGZojg1TcXsqGwIbXNsqWI8IlGe/qeYY5B0yR09vZU+Bm2gb8Eq0R3FK/7WQI0LW3edb
         odx8XumA2KxCyciWDW7b2YCOlASG0STs7xrUF/WHbtL2ZUk+V3LU5gembhsdKhGgu1Sc
         Q4vZoMNx5Z/VslM+PTKoRguquvyw0kw/kuxNW4h4aPx+J/rwSLCmfNXqRLz0CJT+nPk0
         z3TwE0A8bqzCrQSCFCH6RWmpOxb00XpwTIYuK2+4/806k0qL0QfunkgH48RhN1X9xgs8
         3RsQ==
X-Gm-Message-State: AOJu0Yxdpw9thWtq6KG7mp6hrlafI7aqx/plu24nQtuzLDi/MSZ/w7iL
	is425G88mD1UPat21S+jx2zD9rA09eUXdLyEF6ebzGNFYCj1SDnyEqgZvA==
X-Google-Smtp-Source: AGHT+IE/dg87qDYtFQZtZXX2bL+1l+Vt6zEVihz5ewxnvWYrOA54fOXz79D47zHgPpZfQXYC++lpgA==
X-Received: by 2002:a17:903:2348:b0:1fc:253b:5951 with SMTP id d9443c01a7336-2050e96147fmr74890935ad.4.1724979958079;
        Thu, 29 Aug 2024 18:05:58 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20515553b63sm16978805ad.277.2024.08.29.18.05.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 18:05:57 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH v2 00/14] hwmon: (ina2xx) Cleanup and convert to use with_info API
Date: Thu, 29 Aug 2024 18:05:40 -0700
Message-ID: <20240830010554.1462861-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Clean up driver and convert to use with_info API to simplify driver
maintenance. Add support for reporting current limits.

v2:
- Added Reviewed-by: tags
- Fixed typos in commit description
- Dropped unrelated cosmetic changes
- Set .use_single_write and .use_single_read flags in regmap
  configuration
- Set latch bit only once when initializing the chip
- Added support for current limit attributes
- Use shunt voltage register to calculate current

----------------------------------------------------------------
Guenter Roeck (14):
      hwmon: (ina2xx) Reorder include files to alphabetic order
      hwmon: (ina2xx) Replace platform data with device properties
      hwmon: (ina2xx) Use bit operations
      hwmon: (ina2xx) Mark regmap_config as const
      hwmon: (ina2xx) Use local regmap pointer if used more than once
      hwmon: (ina2xx) Re-initialize chip using regmap functions
      hwmon: (ina2xx) Fix various overflow issues
      hwmon: (ina2xx) Consolidate chip initialization code
      hwmon: (ina2xx) Set alert latch
      hwmon: (ina2xx) Move ina2xx_get_value()
      hwmon: (ina2xx) Convert to use with_info hwmon API
      hwmon: (ina2xx) Pass register to alert limit write functions
      hwmon: (ina2xx) Add support for current limits
      hwmon: (ina2xx) Use shunt voltage to calculate current

 Documentation/hwmon/ina2xx.rst |   4 +
 drivers/hwmon/ina2xx.c         | 895 ++++++++++++++++++++++++-----------------
 2 files changed, 531 insertions(+), 368 deletions(-)

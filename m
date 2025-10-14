Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A01A02FFFA9
	for <linux-hwmon@vger.kernel.org>; Tue, 14 Oct 2025 15:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760455546; cv=none; b=fposXmNuS25M7EQieOIlXcUFD0kX2Sii4caIIVtULr4X43HAy8XoGM3q8dyIbXrpWzdcCNPjoGrhjgp5FY4GkUKlxo2jLWAHhzr8B1Gm6rHL9yOymeMh0kN/+Kk6zCfoIU8wZW6qBtv9UU8JaMe63oAA5wpW+8sfNGdUvwn4i48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760455546; c=relaxed/simple;
	bh=Ncsi261Zvg6ZRzBZFO3/LGFUyxtKef2lk2Uk2IETY0c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y6bITSaysREKAtMpTMzcpBw3nH8t21iXagd3JfjY+Uw7VCGHBOYcoTNtyejZTWXbU5d6le6FSwh6t0a1aZCXLfq2MshQ77gKAxNHxrPWLT0Pl/t6M0YYsU1foBfSd4AdR8UVgDz58NSC+asZwhmCj0MD9ecl8lpjqiE3rhrh6xc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZuvuJD6Y; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZuvuJD6Y"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-781206cce18so5704445b3a.0
        for <linux-hwmon@vger.kernel.org>; Tue, 14 Oct 2025 08:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760455543; x=1761060343; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7wqZC+xmj0uktWyR1744Od74/dESz8Bn++N98hnF80Q=;
        b=ZuvuJD6YSTVRmixlfJy+AmDZUPpxRU7VWC46bVeCIqJUOAS34GRAYHVJSNr4oOUkLP
         YOYXF8ZXQJpn4TrRxYERgybsz7ISdRRXL+X3XTxAvFDJfBxwLW3DgzlvmNoCqH6WvhI+
         4Gw7UP3V/9e+1KODCBH4ARBAnsZT8FrjKRgcxxHvCSmQiFA6wRTvr21QlC4s/qS1+xz2
         G4Tm1UE+6uHz9xRQiPdFF1Z+57Maoa07ViJdEtXAe43l0Rt5O+vNqGGZnjd1zLl6w5na
         ssbNyHik8zT/gs6ywK44FwDHwTqAoWuqIc+7U4QJ5EtsmLOlUim8nX4KyhJ5H4G+tE/5
         UF8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760455543; x=1761060343;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7wqZC+xmj0uktWyR1744Od74/dESz8Bn++N98hnF80Q=;
        b=SGcZ2TOMtye6RrCI1zayQyjP+SrMMgZ3abTEMreFVxZSM0QO5FN1B1ZhhCs62Ff9wh
         QBP0n44Sd7XaXs+v7/bIsSIWf9WPlTp0G5S76BsLlSbkfuIkFt2WAC+G5wHXgFRh3nou
         AkMFwgxgZnvU/mFIHezTV+WrQYnyBAwIzwsodF7nNE/WQ9oo5eAkycMs7u5wOnl0H/cm
         MK0KDqG/CqomyYz57MY0nt7E+uu7u7Hh/+bWDqmKDPSM4d/93lTk5mMqxXter7yQzYne
         +H18HzDGR4ZDJikNtHbP0XifpI4snFIoeJcC5XFriaFDKm7tW4MnHwysfE9s2+vTvImy
         BJZQ==
X-Gm-Message-State: AOJu0YxI1Ql8YexxyCiHC+d1vePevkeC1k1vj/c5QkBZsvCN8tR2z9xp
	iafxaf4LFx1zv5K6F1PnOO0bwU47PIbZ+WhMDqDnP4xRcrkX+s/SWpawa9u+4w==
X-Gm-Gg: ASbGncuUGFPJJWKj7jTIp9dZujX9yKGul6u5SwOd/ycErLW0OY6vW5e7cUgE5Hxbjnm
	vd6gJ5c8TGaatPful42rLit3UHbSHIZhAp6GzYpRKY9hpdUOXLMGMwsYnkkRLPIfxvf0fHKLg/Z
	/uGwbjA76jhCNurOWRjmRxYsXsM/26XNzDeQ0yT/1WbcXPdI6F2BAnbuJHPHsTGb/Zid06v28/e
	bQpLmqJg6ODAGSnEoRZwvMke8uWfQK3lQBXcKVfdS+yK/61SAGNK/ugVkD/2sJCn3XPOJLfjKNa
	9mqb8ZB8M50KWlcGnt9hedWyUYjrFUH3Z+r+cRSqGyYO4b/+ibNvJJNcfXwZGDWvHsaZh7DY/rH
	0j7oLEucECMwBHaLqMycqpyB/DOLqK3wgwJPsOjuqMPfte97kgsStEO37X668mWC8
X-Google-Smtp-Source: AGHT+IHxghgz9wayCXGZXaQA7WB+73LbxDovqpRiNEeYjTL5I+HZkVJCLe2K1B3BZ/VS7yuAGkhpMw==
X-Received: by 2002:a05:6a20:a128:b0:32d:95f2:1fe with SMTP id adf61e73a8af0-32da8df32d3mr32081129637.2.1760455543524;
        Tue, 14 Oct 2025 08:25:43 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992b060962sm15664628b3a.1.2025.10.14.08.25.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 08:25:43 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 18/20] hwmon: (nct7363) Drop unnecessary include files
Date: Tue, 14 Oct 2025 08:25:13 -0700
Message-ID: <20251014152515.785203-19-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20251014152515.785203-1-linux@roeck-us.net>
References: <20251014152515.785203-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The driver does not perform any locking and does not create sysfs
attributes. Drop the unnecessary include files.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/nct7363.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/hwmon/nct7363.c b/drivers/hwmon/nct7363.c
index e13ab918b1ab..71cef794835d 100644
--- a/drivers/hwmon/nct7363.c
+++ b/drivers/hwmon/nct7363.c
@@ -7,10 +7,8 @@
 #include <linux/bits.h>
 #include <linux/err.h>
 #include <linux/hwmon.h>
-#include <linux/hwmon-sysfs.h>
 #include <linux/i2c.h>
 #include <linux/module.h>
-#include <linux/mutex.h>
 #include <linux/regmap.h>
 #include <linux/slab.h>
 
-- 
2.45.2


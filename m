Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F8C9264602
	for <linux-hwmon@vger.kernel.org>; Wed, 26 Nov 2025 11:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764157264; cv=none; b=mPtvX1HC8raeLP2GxFjY/QhIvHzyHbDeFWa9gWy4b52sy1kr1lo84VZb4VJot1Ou1qJydOgzpn/UhMrjRjGZckrQVqzxT1EKFjSpcAVJEc1tQ6zv/mRQc8O323diNpaqWnR1CyAYsG1ujcRNFDHwasNSxcUKLVoIRe68p/Rzznw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764157264; c=relaxed/simple;
	bh=TgrzW04OurC6JFpNdugLPojVTkqtrttQ9ARoSbtk3u4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ShQuRynPaeStIeuifCPUKyq7zQq8PtV9XmMXBuqJSGbGCJCbJjxhIquQlZ/eX8ta0AdSvImiaYJsjaPXMI20GUtrwbwzc6MQri79oh1WXnzwke7O0dJwgBkq/v4Ey7x14XwadhU/hbUhWz7ukMtdpSyYJJRNaDgYNwbBOD7W2+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NreqoY91; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NreqoY91"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-29558061c68so88073315ad.0
        for <linux-hwmon@vger.kernel.org>; Wed, 26 Nov 2025 03:41:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764157262; x=1764762062; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hHDo2OBspjM/pUXdeybYNxNYiOYioqpiTsRPZh3n3mU=;
        b=NreqoY91S18kOX359o3JQcoy1YqZsFu4LLXV+AwMLHVOmDoxGgYNV515rWQavk1JFa
         g1RlYZugabZjMrrbL1c5F1048GNJiqp0W1mbKHv4C0THOn89xGL+qW03po0PYPiUI7fe
         6MxWosUrtlWzwS5f7O4DVhx+NllImjusDKHgkyfOn4AYrfaZsHkqF6jgGDjXrP59HlpV
         iEoMMvvJI5zTmC4VmdbrpOFhmJKo88RgwYpWlfKALO1mXehL650yaJ23E8IfNlDGMEvF
         LE75J8aGgu5ZnUiOFd1X9cki1RXlOH1G9mWXfZJfNaOYLlE/d4Q/c9s/tgdMJeYUdnXl
         a0Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764157262; x=1764762062;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hHDo2OBspjM/pUXdeybYNxNYiOYioqpiTsRPZh3n3mU=;
        b=h53TZpGvc2lvK0ht6dWlA2aE4rLmS0uD7MApSnM7S6SS6zxyy6cdxjsGyBW9sZbdwI
         SWkaap2Lh5Hb++ymUhwFDWiHb+dqMocJ/5G7oXRaJ1KJAXpJEv//Jg+Ty58BnBiWOD4c
         q3ekGGM9YB6GwZvzKSo8aBGMhzvK/qub/ONoqfmap2W5EdilAiaz7ET7R26U4ol/nCRT
         slQqUVumGSKFytl3pZv9rzh08vP44HH0b4U/GS0bfHuKC7D6JQYurYRaJz8Djjv5pMAG
         WzzBSqZMazkJ175fnMrZdtpBY4I19c9MvPD4Krgjr8pW6RNel7sAMEgowIPR1aqgiQmU
         gnUg==
X-Gm-Message-State: AOJu0Yzaxx79/9qRg5DIPTgqNYSHND2XTqHPmEvJd8p5FYpGoQjXn+mk
	laI5aXRP5okqzR15coRy8cp2B1wfqwMbo2fB4UFTrfzOb7+GUgo1yzseUUBiQ2h8e4o=
X-Gm-Gg: ASbGncsJ5jNgE/67slfHqzi1NomxoVTNMVjjTdegNoHgSsG0bX5VvxU5E/mMsn4w8nO
	j/O4Khv3vkQNk1oRGsGKQsDYOAiPeVloRSktWnem7lVBFLIX6ifM9LNpic6LEN2LbqTCGvDCR11
	+1WGcbYos4aoktdTpIpeZjPSxWOAkHkakjGUW6EzpGCjxco069F42TL8i56GEjyI9Lxhxih7fq8
	IhGOsIKBPPe9/qBIV9+FqhAEp5euY9WaaRcXFarqNDZSagcg3X+eIwaYKCxyz56pK96m8jp+FIc
	YmuDPDisiHMTav9c6hcGi/xGesgkuY3oywCqvfezJE6uspRS9uVuSq85x6BEgNQtWc8JrguJsyL
	f4rvFrXvg+pvTNBmdk8ttoGOQY6kDx5BpNzo3DGE+HblVqR5teyZhBk2h4e10ivFag8abh9KCoj
	r1TmWM6s1i+uq2DUM5PgkMMDewm6gL6N58nXXFuJXgd2Xn6JgYjMRuuM9QlOT9oZ8Nqvc6JwUIS
	p2gQVCYgB4c3Mk=
X-Google-Smtp-Source: AGHT+IHHpPqLQo2V90IQyAzr/hlLRXqNt9ClWiZZ5j/0UklvOI90hooliPxiAW8tTJtFCLH3s1RZrA==
X-Received: by 2002:a17:902:ccce:b0:297:dd30:8f07 with SMTP id d9443c01a7336-29b6bf806bcmr231164605ad.50.1764157261589;
        Wed, 26 Nov 2025 03:41:01 -0800 (PST)
Received: from 2045D.localdomain (128.sub-75-221-107.myvzw.com. [75.221.107.128])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b13de62sm197304325ad.36.2025.11.26.03.40.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 03:41:01 -0800 (PST)
From: Gui-Dong Han <hanguidong02@gmail.com>
To: clabbe.montjoie@gmail.com,
	linux@roeck-us.net
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Gui-Dong Han <hanguidong02@gmail.com>
Subject: [PATCH] hwmon: (adm1029) Add locking to avoid TOCTOU
Date: Wed, 26 Nov 2025 19:40:46 +0800
Message-ID: <20251126114047.10039-1-hanguidong02@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function fan_show checks shared data for zero or invalid values
before using it as a divisor. These accesses are currently lockless. If
the data changes to zero between the check and the division, it causes a
divide-by-zero error.

Explicitly acquire the update lock around these checks and calculations
to ensure the data remains stable, preventing Time-of-Check to
Time-of-Use (TOCTOU) race conditions.

Link: https://lore.kernel.org/all/CALbr=LYJ_ehtp53HXEVkSpYoub+XYSTU8Rg=o1xxMJ8=5z8B-g@mail.gmail.com/
Signed-off-by: Gui-Dong Han <hanguidong02@gmail.com>
---
Based on the discussion in the link, I will submit a series of patches to
address TOCTOU issues in the hwmon subsystem by converting macros to
functions or adjusting locking where appropriate.
---
 drivers/hwmon/adm1029.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/hwmon/adm1029.c b/drivers/hwmon/adm1029.c
index 761c13092488..71eea8ae51b9 100644
--- a/drivers/hwmon/adm1029.c
+++ b/drivers/hwmon/adm1029.c
@@ -171,14 +171,17 @@ fan_show(struct device *dev, struct device_attribute *devattr, char *buf)
 	struct adm1029_data *data = adm1029_update_device(dev);
 	u16 val;
 
+	mutex_lock(&data->update_lock);
 	if (data->fan[attr->index] == 0 ||
 	    (data->fan_div[attr->index] & 0xC0) == 0 ||
 	    data->fan[attr->index] == 255) {
+		mutex_unlock(&data->update_lock);
 		return sprintf(buf, "0\n");
 	}
 
 	val = 1880 * 120 / DIV_FROM_REG(data->fan_div[attr->index])
 	    / data->fan[attr->index];
+	mutex_unlock(&data->update_lock);
 	return sprintf(buf, "%d\n", val);
 }
 
-- 
2.43.0


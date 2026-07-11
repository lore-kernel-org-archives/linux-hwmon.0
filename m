Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B400239085
	for <linux-hwmon@vger.kernel.org>; Sat, 11 Jul 2026 07:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783755257; cv=none; b=suuKx1fMfu7qaij6niYkRvV0p0POM5RoDsJhjijzANPCkwf0/A7LkTXCo7h1GxCm1eAz1oRNwWcVPkH+Zfi8GdBSnFvEwFbgSR9g1hyMwUHjuO7FWqlBBI4uVNf8dt7buYfoxPGYCFRolTv1BOSw9itbFeDZu0u8AsVSHT1WS5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783755257; c=relaxed/simple;
	bh=ZP2JO3fElePND2pQ0KOwxEFSV9MB1DRtXS6NkApK+2E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uy1doQMsj6ObdaNhSOHMZE0JoguXNltMccb/sPy1alqGJZfh9UMPsY5yagp9OdHVLZJskIZzKPdOxKYl3hPnviKNvRaCeSaBPmwG7xr1oa/oam0WYflM73DKv3m6USc6C4xYHN/LBWct3A3jmfgoHarAuouhfAfWY8FBRRQ6BtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QTJkfO8s; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QTJkfO8s"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-493f4638f4aso14875945e9.3
        for <linux-hwmon@vger.kernel.org>; Sat, 11 Jul 2026 00:34:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783755255; x=1784360055; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fD/CwBLnEVLUY6MgvUkwlUV/G9yM3Q7N8JsNXnAMXo4=;
        b=QTJkfO8sWV90TtnWx4Yx8bCcbSg7pXSxHr4zxPTrYz2vl8P2o6Djs7MzPNNNaFrzyb
         F+kfgK6Og4jTslLh2Ri5cQDDnWns2NY/iX8J9KoM8ZkV8Vvwy8zaPtK6Nh/0WiHaizbL
         Pfgun4TKLi1H76W9QcyNPvzasiMLvYRKrEjeRz709Qp5047/W4PKerh1AwpODHo4q2C5
         qUfuMmbMXbWrRuJsSCgaTMrST3RHQEQtuRkyFunNozvhQkp9jiCF46NL74cSgN9U1wdx
         75AXh4TV4tGWr52inOwUuKuU3BsCJh4ayk+SwCgc5d3rIGkIBE4G5GNpNG1F0dXg8wZp
         kHEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783755255; x=1784360055;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fD/CwBLnEVLUY6MgvUkwlUV/G9yM3Q7N8JsNXnAMXo4=;
        b=Z4DiJ1n4CKZQVM0cw+HQGqNwvoeK8ih/nnW2njpcGt52OLFFROG1VOPuGTDK7VbZwo
         mY3XpGAZq3aN5DfpvJlt8n36oS8bHMKbilagADnYgdiEu9sDqzlv2FuIrQz6UftUFyGI
         SNi7BawH+KPqJwaGicOad8i2jxFcVYvYnDQEfn0C/aoNPsPwJ1LETWP5H64vv81VoDPX
         6jIeIRH+nSQBXA3dkY+IOB1hAbLlV/tV3UbcCcmqjUI4tK3/QY1450d9ydnP1GDY7vS8
         eW3FaOsSlgFQlXDj1JoYpISHFZlUuFTtJQT5ajc8L1gjfDwsAKr/q1YpMxMffBw6F5/k
         U7wg==
X-Forwarded-Encrypted: i=1; AHgh+RooOQ60mTKZljSAk5tei3ZvdUEB+okUwmzV/PtkHT1PgdA25U+A6uYJsTuLuA7VNhv+l6qKSYXhD6C7AQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwtrRUsL/nyTgNKFauLUHpkqNF8VYArE89mekDTXKNrfCY03g5E
	OY1Nuntmn50LA4kFM91zSbXJFlqSfl0SZ3eAdg0xjB5Cho1TR0w1RYIV
X-Gm-Gg: AfdE7ckuUlIX2RB+qPmOaA4xdW/W3jQHJBwMXRteDKJCoQh2/TJE2sfRPBYyZAyYvq1
	ms2IPq+vlCoRduPwFqtBVJxcq9ECv2tUyVNExfmJYJBnHIJCNuGCV1XNw6IAn/beA/onsH9skM0
	0toHZMIQG/kJVoST6ysSXzrmcTr1A51a6sseSKL14mmPt3C2pFt1RcMYBYNghTTr8PMv6TteJz0
	B3zNWuD83QCCb/n+vc8hjBQ/oz6TbN8nkf/zyXBfXCvbgiNBU4nIrbjTGRe5cNytPl3/+PkHd0Q
	eocD+ZfC99+8Mp32C+XsFSdCuLzjXOIHY14le3oS+cwJACSvAmbyrdGCpcDhxO9QMYVC7snN9AI
	laY1Uh9XE6t6uWiF4XEmh4SmwfYBqZx+DNG/jzvkKTV3VC0Zi0DnDDgusmAxCTMECyg3MZaQMXE
	l6T8fy/jQggtEs9RkRfzilNzyveaIIYY0=
X-Received: by 2002:a05:600c:1d15:b0:493:ee2b:c8c7 with SMTP id 5b1f17b1804b1-493f87d5819mr15567725e9.4.1783755254670;
        Sat, 11 Jul 2026 00:34:14 -0700 (PDT)
Received: from puma.museclub.art ([2a00:6020:b326:d300:d19:a765:d8d7:bedc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493eb6df417sm204733245e9.8.2026.07.11.00.34.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 00:34:14 -0700 (PDT)
From: Eugene Shalygin <eugene.shalygin@gmail.com>
To: eugene.shalygin@gmail.com
Cc: Guenter Roeck <linux@roeck-us.net>,
	linux-hwmon@vger.kernel.org (open list:ASUS EC HARDWARE MONITOR DRIVER),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 0/1] add T_Sensor for ROG STRIX X870E-E GAMING WIFI
Date: Sat, 11 Jul 2026 09:31:51 +0200
Message-ID: <20260711073319.553163-1-eugene.shalygin@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

v2 changes: elaborated commit messages

Vishaal Saraiya (1):
  hwmon: (asus-ec-sensors) add T_Sensor for ROG STRIX X870E-E GAMING
    WIFI

 drivers/hwmon/asus-ec-sensors.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.55.0


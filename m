Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14F454A1DF0
	for <linux-hwmon@vger.kernel.org>; Mon,  7 Sep 2026 11:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788780638; cv=none; b=uGk+mzbfeROwhSOSqSWU7HwX2V4d4DeBLPtUiv/hzwF5t6qu88x8JN0v9T/YHHpJ6oki4yPKHd8nOJ7SqPpOuA7K0Ozyti6rVwRA8PFMCsW7/azLF2UrwIHmeTvS5TKCLBRni8zOf77y860zKButH/3w2jXJJMQEcvlmMyT5UJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788780638; c=relaxed/simple;
	bh=/iI+mVhYoHECHLm26/9Lw+yRsz2hiZVTsKnS/mTkwSc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uzYdz3WCAubLux2PeaktVed/BeQqYbZOdw88fJJv2D2EfZTlOxG7u8AsPeg3CDgSz42j6oHr7pLO7206Tuxv3qpgDtNO/2CO5M3oi0xjxf8n4pE5Wl8NI6znLp0lT/qUGKqUTZGGAHJkvd0QSmHACLjytsX98y6wkWHMi4i3PZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rUidBtKy; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rUidBtKy"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-482e4998d28so2704871f8f.2
        for <linux-hwmon@vger.kernel.org>; Mon, 07 Sep 2026 04:30:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788780635; x=1789385435; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=I8GJQHaCPI4Y6feIxiZlfcO4FEuwsVfypUZYbsmpk7k=;
        b=rUidBtKy/CaF/WrsZyGghT5tGLXVaNIMmlNwCJpJK4+DiI6vuvqVs3a5cmcm0zQ6NQ
         +L6aYy10SfODNojlgXzi6Mc5jBU5WQNKcaSEvSSuGuF7ko8jMuo6fNTC9PFFcKp0mZPb
         W4MyBRHpwMhl09EeFakuOAzJezazN0T3YFWNVKUfZisyDg/sSDr+HWDNhMswbK3cyIOG
         llFhQ8GYXJZuO5gP4TmWlZApc4N6DXTbzPo+ltGEQuq0hGiFwzQXYMzfDaWqohsCLoJ4
         nMN1iy2NHGlo9pveuHcVETUP2Q2Sn37q9KCt2LrFhpyL00v9gB0fYveKv5vQvkUu3sMz
         E1dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788780635; x=1789385435;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I8GJQHaCPI4Y6feIxiZlfcO4FEuwsVfypUZYbsmpk7k=;
        b=rMWhLpN7SeGU9Gw+Cl1VON5LHlHn7JgsCbXDyql4Si6IbTRBSkoI3zQKnas/410d9R
         gUPOCB7Q5TVSXXLwQtHD5RseSqxmDFxhI1IRGvcpJB1KyjRLL1XAS29MvGgLuIDhK7n6
         GIbOZioFqhFzRHEH5fKuCV6Ko0OWft6X3UhYWqAiyGxmpGGhTByfEdZu3zE0z3kv0poh
         U5DI26XvGlLuojzWMqqNByiuNBgskAZhxDa53COHgutvAyOI/bRxx9+AoJ6q/lquzmJA
         NgBzwMUmSVhnzo/jk7vQ+WZtHmXLQ0WFKsrTV46nvGbnWINRbEURPjb2TJPYii3qjzDE
         kjsg==
X-Gm-Message-State: AFuF++kcwqrW9zqgrBCmrxmc+VUMpDQaCwwQUlbc/YYYxrhDknYbSPa2
	ojjZGd453cubhfWXzyjckLOGqk0QPUTGu9p2qO8Ctok3kgsig1pjFj/N
X-Gm-Gg: AYBFou37duJk+XTAmyYHiXaxm0HftnsbZlK2WHG351nQ0SIXh2juQdBTD8aDePLcvNc
	iQ83WiRDRkRTYiSOTb79LknLb6ePwrPGk/IhnWShBNoNNpJAcKaBkTjPzcx8m2dNrJfdxLLEBs1
	6erTM3ze7yFx4Cjt57PkLirrJCSNVxfECK85mBmpQx5yFW8QOwxwYkccOCA5BJrraJv3Sq12Dv5
	Hhdhkl/HJXPqRxLczPtC35EJvZ/ZzQdrZT53o+MJl0oSf1f9W1DB3vM06RfexzX+N3drOkoESzg
	fKtZqXqNBj+pMeWEM2njdhLXDDqO1A7+hLRz2JXfLzBiDlIOHdcmMiNYw7t5KN74p8Z/52vEvoT
	bUM0TSRQdy48sdwiUAnjHFoT337YafVm6qRM10JqOoAjCMKSfo4aUeDO9h/f8+boJN6uannr4yk
	xziH5FCAlO250LpJzABoOePtwtTT1dgkoAu3N7sLeWcMOeHppUOsEfyw7eHfAsXDwMEpUZs/wcm
	UPDLa0++QgNeEZdeSJ2zXZBHdEwj5sa5PMn2EV8wCG1K5uL0PwVgF9E41M=
X-Received: by 2002:a05:600c:3b0e:b0:49c:fc6e:a3d5 with SMTP id 5b1f17b1804b1-49cfc6ea726mr183476145e9.20.1788780634912;
        Mon, 07 Sep 2026 04:30:34 -0700 (PDT)
Received: from sergio-82n7.fritz.box (host27-7-217-213.cgnat.broadband.ehiweb.it. [213.217.7.27])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce58da3acsm821879915e9.0.2026.09.07.04.30.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 04:30:34 -0700 (PDT)
From: Sergio Melas <sergiomelas@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sergio Melas <sergiomelas@gmail.com>
Subject: [PATCH] hwmon: (yogafan) Update reference database and contributors for new models
Date: Mon,  7 Sep 2026 13:30:29 +0200
Message-ID: <20260907113029.1532654-1-sergiomelas@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add documentation entries for the newly supported laptop models
(Yoga 14cACN 2021, Yoga 740-15IML, and IdeaPad 3 15ALC6 Ub) in the
master reference database table, and include the new contributor.

Signed-off-by: Sergio Melas <sergiomelas@gmail.com>
---
 Documentation/hwmon/yogafan.rst | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/hwmon/yogafan.rst b/Documentation/hwmon/yogafan.rst
index 9ff5db5dc..5c21c50b7 100644
--- a/Documentation/hwmon/yogafan.rst
+++ b/Documentation/hwmon/yogafan.rst
@@ -87,6 +87,9 @@ immediately to ensure the user knows the fan has stopped.
 
  MODEL (DMI PN) | FAMILY / SERIES  | EC OFFSET | FULL ACPI OBJECT PATH          | WIDTH  | MULTiplier
  ----------------------------------------------------------------------------------------------------
+ 82N7           | Yoga 14cACN 2021   | 0x06      | \_SB.PCI0.LPC0.EC0.FANS        |  8-bit | 100
+ 81TD           | Yoga 740-15IML     | 0x06      | \_SB.PCI0.LPCB.EC0.FANS        |  8-bit | 100
+ 82KU           | IdeaPad 3 15ALC6 Ub| 0x06      | \_SB.PCI0.LPC0.EC0.FANS/FA2S   |  8-bit | 100
  82N7           | Yoga 14cACN      | 0x06      | \_SB.PCI0.LPC0.EC0.FANS        |  8-bit | 100
  80V2 / 81C3    | Yoga 710/720     | 0x06      | \_SB.PCI0.LPC0.EC0.FAN0        |  8-bit | 100
  83E2           | Yoga Pro 7       | 0xFE      | \_SB.PCI0.LPC0.EC0.FANS        |  8-bit | 100
@@ -159,6 +162,7 @@ Contributors & DSDT Providers:
 - **Sarbajit Sarkar** (Lenovo LOQ 15IAX9)
 - **HinataKato** (XiaoXin Pro 13ARE 2020 - 83KF)
 - **PenPenIsGod** (IdeaPad 3 15ALC6 - 82KU & Legion Pro 7 16AFR10H - 83RU)
+- **wizard-28** (IdeaPad 3 15ALC6 Ub - 82KU)
 - **unlockxiaom** (Legion Pro 7 16AFR10H - 83RU, Yoga Pro 7 14IAH10 - 83KF, ThinkCentre M80q)
 - **Phani Pavan K** (Yoga Pro 7 14IAH10 - 83KF)
 - **Splarkszter** (Yoga 7 16ARP8 - 83BS)
-- 
2.55.0


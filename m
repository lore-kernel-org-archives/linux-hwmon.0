Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 660BD3EB80B
	for <linux-hwmon@vger.kernel.org>; Tue, 24 Mar 2026 12:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774354894; cv=none; b=KeFfbmbodaWaMt7r53l9GqDHVi1PnzduEE2NT6K583b/TXBs+U9QsHZ1SxAIHrw18uXTW88jaTaYoVaP4z/YbC70OTPTgDyeHk/ZYcBmnJl/ZhkjnRFRiyh5pYVW5d2I+LU/VtThm4deZd85iQSz1KZwMAXfugy+zfH7bop5Jr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774354894; c=relaxed/simple;
	bh=fcwVyaJcljt29RM66M0X4GSgb10r1rPBYxhdHcCXaQU=;
	h=From:To:Cc:Subject:Date:Message-Id; b=iCYJl+0fluuBNvclIdTIG6ClSKET732pKYYlDFZLa/jUsNP+hp0wvrhh8DjbJPKIabhidme59nhsrTYUdzzAII9IODbfvPf6yl13csfya69ikxBJiavgICxqprvQeYI1XnEPWgCczzHYriUsr0vNJcuvHD2Ec5iQkR8SL24YlRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zv57AThP; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zv57AThP"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-827270d50d4so1200749b3a.3
        for <linux-hwmon@vger.kernel.org>; Tue, 24 Mar 2026 05:21:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774354893; x=1774959693; darn=vger.kernel.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aCsDvvGLw5y2TgRq6IipJhMCbPT9IZc/NWhKizXVysU=;
        b=Zv57AThPlj9zV8+Sno4VCSdzWSln2NP8mfCk/sLoUikCRfyzSkRoBuMBAc6c9kBdKv
         xDUgocJCt9RgDbmB3r32NDnPIfW1dFZ43Ym1MuSxXXxoVekRXWcgSFguPUxg6EOy2vpy
         47fm+yWBLX6CpluxTMXVUL08ir5ya3YXP7O5+IIqJgkNCZL234Sj8PdYJW/Z8zznlxje
         Xk3X1c8ZVJptM9Bz2UzuhtOKWPgCi7urbbHfAHi7B17qCBCj9bG3vvohytBFgAHNpn/7
         53x1sxdt37iNH49uPVYrgcFaPscZYkcetV3Gzd2SDJJmASRSMeR1ssAMKG+fLlE6E8TF
         JgKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774354893; x=1774959693;
        h=message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aCsDvvGLw5y2TgRq6IipJhMCbPT9IZc/NWhKizXVysU=;
        b=tQUG4E8+l7xwapU4FSJ4CqxvcM3c+CUS6nNH0hO1HaC1edA4G7BfPwMwHw5qtqHA8A
         JQHx67ylK9y6ikS3xhRe65g1r1zbDITfwD6YkEh1uzd2fCzW0Th77fOgSuEVMq/eq9/J
         STZeWRIK+8PCBPgamAj1kEKELoNWwtgFLQ4fPCgofYqR13JnYcTOpEJFK9A5Vp2GBZjh
         A7TqHA4gi/fAoZfBQx8ZfICexBjntwbv8j97DEB7Qt0BgNu56te/kNGZKumQxvK4lreB
         QI1vaW3vRIPJQxCshacPhzwAVEwCwqLyTnKiS8dD8kr3yRNMd8sOOrPBlcWfwhb6Fp9N
         v9YA==
X-Forwarded-Encrypted: i=1; AJvYcCUoE62C2Fj1BvkUlIlJTYJiBJf79TZFb2CrcL9sKr8MaEzhc7G9O1SmTTC/uEirkMvVT3tzMsehwpkCow==@vger.kernel.org
X-Gm-Message-State: AOJu0YzizOmzbmyQp9UCfV4wpdAeXPP/lCoRJBCAZQPAA9szx6j8/ZDl
	JbR//x9hRgGrOlmjqiIu75h48YBMQJ9K0p4VrJfLcDAw1Cex0WdfbQ1/
X-Gm-Gg: ATEYQzz3IIbXWPwthV+4Wpnkjea0vyk3XcFujFF4Z+iS7IjZtTthdWlmQCSm/otU3mL
	kwuNuilvJy7kXt9uoEYNKgxE3WjSnnbL/M1Yg4PV+CbhuAJcunCNsaimPBG6TTMI2aQPb3oNG81
	XYBZjC4oGVqWVh7O+uwOcB9jDgIWJaBp95zJFUvKUHqxvVw4AFK8vNRjv5QjbMYkme9R/61xic2
	DyYfm7GYanf06ZMiSrWsQtmPKor9g7F1MlgChqOljLnMlSrPHeptgPlXxI92OAKDXXeLh+pE+t9
	6ws+vfyS1+FYPh7dG+3fOinJzCckHVerL+PbEiGLyllJw4YLx5U+Q1pgh+DzCQ/ZLCn9miW3e6F
	3gWWJLwo8NwrSQ6odSRUeq6MdndHAOojA6Kkyb+GhtfU3sHBrKYubGHyceWFMfc/M2DuttLgX6n
	iblzSCItjqhjjwXY7RMwpA2YekTqo6ggNbhle1v4I1Se8A00U0xOe8
X-Received: by 2002:a05:6a20:12c9:b0:39c:250:2db8 with SMTP id adf61e73a8af0-39c025037d4mr8807540637.17.1774354892601;
        Tue, 24 Mar 2026 05:21:32 -0700 (PDT)
Received: from ubuntu.localdomain ([27.217.83.168])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c74443ccbe4sm9904920a12.22.2026.03.24.05.21.28
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 24 Mar 2026 05:21:31 -0700 (PDT)
From: Zaixiang Xu <zaixiang.xu.dev@gmail.com>
To: linux@roeck-us.net
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	zaixiang.xu.dev@gmail.com
Subject: [PATCH v3 0/4] hwmon: (sht3x) Add support for GXCAS GXHT30
Date: Tue, 24 Mar 2026 20:21:05 +0800
Message-Id: <1774354869-119736-1-git-send-email-zaixiang.xu.dev@gmail.com>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

This series adds support for the GXCAS GXHT30 humidity and temperature 
sensor. The GXHT30 is software compatible with the Sensirion SHT30 series.

This series also introduces the missing YAML binding schema for the
Sensirion SHT30 family, replacing wildcards with specific model names.

Changes in v3:
- Split driver changes into two patches: one for DT framework and one 
  for adding GXHT30 (suggested by Guenter Roeck).
- Fixed commit message line lengths (suggested by Guenter Roeck).
- Removed wildcards 'x' from compatibles, used specific model names,
  and renamed the binding file to sensirion,sht30.yaml 
  (suggested by Conor Dooley).
- Added manufacturer website to vendor-prefix patch and included 
  Acked-by from Conor Dooley.
- Fixed missing newline at end of YAML file (reported by kernel test robot).

Changes in v2:
- Fix placeholder "Your Name" in MODULE_AUTHOR.

Zaixiang Xu (4):
  dt-bindings: vendor-prefixes: Add GXCAS Technology
  dt-bindings: hwmon: Add Sensirion SHT30 series
  hwmon: (sht3x) Add devicetree support
  hwmon: (sht3x) Add support for GXCAS GXHT30

 Documentation/devicetree/bindings/hwmon/sensirion,sht30.yaml | 44 ++++++++++++++++++++
 Documentation/devicetree/bindings/vendor-prefixes.yaml       |  2 +
 drivers/hwmon/sht3x.c                                        | 16 +++++++-
 3 files changed, 61 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/hwmon/sensirion,sht30.yaml


-- 
2.34.1


Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 893C317B506
	for <linux-hwmon@vger.kernel.org>; Mon,  2 Jun 2025 05:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748841099; cv=none; b=LgE9TD0mkxMeWFhQknTyPbcYyKphoKdMxMe8Gqy3ukuoff24ISYmTmAdV6IyPfR0PGntTWSTw8nogrr51EZNO3EkW7uCsNWOkHgtoZTR8G9cLm77SP87eo08SP9PBRqx1C+WOcE3GmBWZ/74iSkQbOwNbDPEZQZXrZLb7zl3PW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748841099; c=relaxed/simple;
	bh=fBMmraWfxLq7HUrXgoImc3vLGw7rNTiJCLSX9/+vBE0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PpPPTAF9e3U3lmWXRsV+VoUAL6mc3OViZUsqwhx147i20pqURnrODlb2Iq2H1mEGgBCwnND0hwzXx5x1tEp5Mrh43CIDt/fJyn3vqES3u9DwdqTS+9lZwNm/uEw1/iY5xt7afq0vRCF6ExwWsqn8oB2twG00r3i37tPMrCaUXoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inventec.com; spf=pass smtp.mailfrom=inventec.com; dkim=pass (2048-bit key) header.d=inventec.com header.i=@inventec.com header.b=bkdfrsbm; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inventec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inventec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=inventec.com header.i=@inventec.com header.b="bkdfrsbm"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-234b9dfb842so35478555ad.1
        for <linux-hwmon@vger.kernel.org>; Sun, 01 Jun 2025 22:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=inventec.com; s=google; t=1748841097; x=1749445897; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wpy7pqswBlGBPIRq9ziJBUuXDhOQvEIp935goKXFdPE=;
        b=bkdfrsbmWUt2Gth6JJ5K9q4/qeCbN8uHrXCG1cN0Va3DkpMxijXcavudF2AMDneJak
         30JhWyCH+JtfNMTP9pntDswp5kon3801o7dUFlPqPSCeChRmB6kAL01koTtay4FFwamO
         Iakr8NTorhaQ+mApaMwZD05tLfpKLvq8B90V5H+6Tkb4m3+XlML4VfEqg46xnl9377g0
         tNCzTuszRLiFETLwwZBMR6Ta0SnwvfyxdmzvRSSCfa3/9eHUfxRyDk4VZ3d9TbIlSrWF
         rPfTgS1HAk6y8KCsYYjJsR2fnHHEeWErpAHbryig8N6P0uez9uZEcluZ1aVjt+jLAsTt
         1q9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748841097; x=1749445897;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wpy7pqswBlGBPIRq9ziJBUuXDhOQvEIp935goKXFdPE=;
        b=O53BhnvEclF+BSwz55ciPWZwB9U+Pyc9AcA4R6fhxWTYxxqqa1ByH6zYOwG8Vx5SQl
         fOBv61J0NKwAdktW9c3YDDc4jyfm90onbzwXJ0IBEuVF4qyuTMHmpDDbXOQMZqFY80mt
         boo2SlRbcI7PVkEG4oEhI2dnNDykvEB7Xyr+S6pg9CJTyRLquW9on8byTdY4kax72W6O
         ve/QCB/sa+bm/kXXQ4US3ShSz/FPou42l0Ob8RvfwqsUsDkkt6WSobP4Ir1w0qNIu/qj
         RXEd5fnKR1cWw/srWuT8J/B/5NrP/kdcDw3ZNU6diS7jIrq3pD1soA7t+KCN6VjqJzM9
         kZyQ==
X-Gm-Message-State: AOJu0YxFhkQ7SbOwA5fM7E3YRAmh51IMWo6SAQQr5C5DL7vJ78ENycdw
	EaJLGuBoTsX7VJSlswf3h4wDleNgOBIH3XPUPzAgFhDSvX8KalYgezDrZ2RW8Zeh+OU=
X-Gm-Gg: ASbGncs9Hw/1s3zyfaJ5gHj/vY+z8xOUx97/nppJMCRzvqtUlZsDcZzzxa3FmyMLQfD
	CFLQVc49GzYIIzo/LaPdEB5yOGpfXkv3+nlwfDogB15dMsLc2GO6lwYFP2qvRYhr9ZEDM55qniF
	Tcxp/00dI3kN5WUSIaFC/rMCl9fZheYhEJg64qeNt0s+61mroCTkfqfZWGSqqNfus8MNwqoSywF
	FuqAF8x6FI+38xoi3Lo1EEPY0fosrm56C4uPVr1SMcn3vQBeoBEHq741ABJh0erZboSNeDwIcEb
	I17DX1y9gw4CMuvjJXlIJBz1CDBgaSvfxhszrHdLJS4whFR4uJn8iqFtS5hCz9XTk3vDvU1j
X-Google-Smtp-Source: AGHT+IGALTc0/1tFLGhHIF2r9ZhN1RPRNEY+38maOOjRsNV4DmYxUBBG1NaebFKyRx8ArzYcQkcQSQ==
X-Received: by 2002:a17:903:244a:b0:232:59b:58fe with SMTP id d9443c01a7336-2355f6cb6b7mr94525395ad.1.1748841096781;
        Sun, 01 Jun 2025 22:11:36 -0700 (PDT)
Received: from localhost.localdomain ([123.51.235.216])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506bc85fcsm62709085ad.38.2025.06.01.22.11.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Jun 2025 22:11:36 -0700 (PDT)
From: Chiang Brian <chiang.brian@inventec.com>
To: jdelvare@suse.com,
	linux@roeck-us.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	grant.peltier.jg@renesas.com
Cc: linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Chiang Brian <chiang.brian@inventec.com>
Subject: [PATCH v4 1/2] dt-bindings: hwmon: (pmbus/isl68137) Add RAA229621 support
Date: Mon,  2 Jun 2025 13:04:14 +0800
Message-Id: <20250602050415.848112-2-chiang.brian@inventec.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250602050415.848112-1-chiang.brian@inventec.com>
References: <20250602050415.848112-1-chiang.brian@inventec.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add device type support for raa229621

Signed-off-by: Chiang Brian <chiang.brian@inventec.com>
---
v1 -> v4:
- Correct the subject and commit message
- Patch kept in sync with series version
- Link to v1: https://lore.kernel.org/all/20250314032055.3125534-1-chiang.brian@inventec.com/

 Documentation/devicetree/bindings/hwmon/pmbus/isil,isl68137.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/isil,isl68137.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/isil,isl68137.yaml
index bac5f8e352aa..3dc7f15484d2 100644
--- a/Documentation/devicetree/bindings/hwmon/pmbus/isil,isl68137.yaml
+++ b/Documentation/devicetree/bindings/hwmon/pmbus/isil,isl68137.yaml
@@ -56,6 +56,7 @@ properties:
       - renesas,raa228228
       - renesas,raa229001
       - renesas,raa229004
+      - renesas,raa229621
 
   reg:
     maxItems: 1
-- 
2.43.0

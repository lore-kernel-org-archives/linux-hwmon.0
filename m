Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD79C3570A5
	for <linux-hwmon@vger.kernel.org>; Fri, 19 Dec 2025 15:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766159335; cv=none; b=O2RCuBz7Rkf6k+GOpULfFoBXOJNJYXvISv+JgaB6g5sGiLV9Esz9ENomZVtGlG9N3Nh+mQAowSS5diNT2/rdiG3R9tpzM5Vo9NM2dfWJna7KEB8Ae5nRPvjrlA+Ek9pkdNPZsPgcJnyiFV1pufXBjt+DfrJfoXiVmGISJ8FnlIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766159335; c=relaxed/simple;
	bh=Mvm8QoSjolw65qipKtDiT3F30Pm5K4KTuzgK8sadwvA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=GK62t+y6qYB0ZyT4ntrlr0hMjp5744NJwDGFZToCr1ZGY3VHhyIpEqmZevlbRQNS/7pJbgA4t1wDIB8hvq9xMqSzydVycDIjR5GEyZiog9CwseRabbl0ydjZXRZdNtZdmtJV2bIRT8n7np5SKPlaDxtY4X7r2VadmV293arazCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FJwNXDiE; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FJwNXDiE"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-59a10df8027so2385532e87.0
        for <linux-hwmon@vger.kernel.org>; Fri, 19 Dec 2025 07:48:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766159332; x=1766764132; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5PXyu1ShwrwP9eLi4zR+BX6SFvZCu4oLpHaCC4ecLrE=;
        b=FJwNXDiEy9Jt30NLhAT414uEIG8wAQdsQk9+gIDwdHeyp/MqVyDYjyyiCK3bEP5vVp
         x9LybLlb9IhPpQBrLKNvHel8YMranOMwMon16Y8Ccvlmh33rMJLv+f7cGSLOAA73Chdi
         5WNrQh0B1wJuwtys7sFZpHrRsvDcMMzW+wADon98I7QZ+RKMw31Ydk24kp2hZf1X8F4Q
         GAZWa5mWnreywXSNUp55gCDkSEz3ijo4ltqCD+Z/hkFpi1vVkYj1Wwi03f5d3Cn+wTn6
         CVtXpZTtvkiMA889hB7SnIbeEgYxH2tm+RicAdF/9ufYqnKDakW+0lMYLzmHBSRoR+A4
         K76g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766159332; x=1766764132;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5PXyu1ShwrwP9eLi4zR+BX6SFvZCu4oLpHaCC4ecLrE=;
        b=XHKgxALzu77ggLG/O4bX9le1AMtUFOn3zapFHFuzySCWx9VkTO00+JeG6o5NXObxvU
         cD9cybehNN0wLSsvxDvLXNxadPFczb95V5a+ShGS5ypRrGrUXfBp0lHPMl53VTGzFD01
         BvjS5qXbFxkwzjm3klM8A1pP+AY49hW4dJ+DHwyZb+gvsGNBi8zZ25WeGmtBsjPDM/Zd
         z3pc18lCLII1SwrMcblZ5a448RKqiPjNFVr7zmWTd5cFK6Fmh1U9egTYSmSiyLWZwHo3
         QAjmDO2bHg9o/EIV+nVVMYAPUVQ1VhG3f7cGosj50nz7VVgsIi7erUISrmpiBfsoS6Gn
         DFVA==
X-Gm-Message-State: AOJu0YwU5cN4nZnKjBDICJIMaxkip7Gpn2+iQ+eUAaK284D2+p28K9IP
	pP/mVpXwuq9aaiP5dr9akRZD9PfEZzM7LcfC/K0z3PnDXEzGrsRZgjtI
X-Gm-Gg: AY/fxX6OR6iwTz/4VR2ulxrHbgq/g7KvU0m4dq+ygtTgXKg+0NZ/RfbnegFIyWTETaC
	USxuvnOXJSmrdLIAXnrOO7hu25fgfLa7LXUi4Ei9S2Ttthn3qYAc0ZHJ5x/rtEmJLeS8iLHM4uX
	wng71wgOcr7GHp2pmYzuavaOM11bGC629vwAc+a+NAyQNeMDL8KIDr6VpyVztkevLjJto84YOov
	R520P3n/rLUQ0GBOGXriW57SGvfWe0kC0PRDAM0vfC/kFkUAyv6m9+Ujq40RyvdS0uBNjraAd2m
	p6rYuBmMsWFJ35LfJrzc9D7i1hC2/JaXv4CtlCrqjfO6z8/2PUw4RuWo+cpm0YTkud0EKzvjXkh
	qzJPXiGgHQ+jFjQm9V9fXWnFs2+hHyR9jIbQ2dnr6cVnTOylgUJQXI/dxFd5JpdWVPHzlK+SUTW
	+P39P5LSW78SZLipsGVTSyiXySX+4UgCvWD5y/Dkmb2K0cI7z36p+gJtQARaSm27d9KN8QzaN/E
	CR5Zg==
X-Google-Smtp-Source: AGHT+IF8C55yRNkr5agY5wdwgfnZyX9aDWKgTdrBWJKsDTuW/ZxATAJPbAglEy5tvq/gMa1rIDTBEw==
X-Received: by 2002:a05:6512:3191:b0:598:8f92:c340 with SMTP id 2adb3069b0e04-59a17d7768amr1172280e87.52.1766159331802;
        Fri, 19 Dec 2025 07:48:51 -0800 (PST)
Received: from LT-5CG5341NQ4.nordic.imtech.com (84-253-208-48.bb.dnainternet.fi. [84.253.208.48])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-381224de76csm6356391fa.10.2025.12.19.07.48.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 07:48:51 -0800 (PST)
From: Kari Argillander <kari.argillander@gmail.com>
Subject: [PATCH 0/2] hwmon: Minor errno and sysfs fixes
Date: Fri, 19 Dec 2025 17:48:13 +0200
Message-Id: <20251219-hwmon-fixes-v1-0-21b29097ea3b@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAL1zRWkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDI0NL3Yzy3Pw83bTMitRi3SSLVCMDUwtjkxQjAyWgjoKiVLAEUEN0bG0
 tABk6ZvBdAAAA
X-Change-ID: 20251219-hwmon-fixes-b8e205834d20
To: Kari Argillander <kari.argillander@gmail.com>, 
 Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766159330; l=1069;
 i=kari.argillander@gmail.com; s=20251219; h=from:subject:message-id;
 bh=Mvm8QoSjolw65qipKtDiT3F30Pm5K4KTuzgK8sadwvA=;
 b=n8wjFoxE8g/Pmu0rtTy9zsv3WaegxVqf63D314kB6DaphW8runBGtSLkMRnT+YuPRv9so5gH/
 N2voa6v8TNSBr8/ncYpsrv68d4Rn83pNgfVQ/v2DFWtkhpopYmMDvKk
X-Developer-Key: i=kari.argillander@gmail.com; a=ed25519;
 pk=RwSxyhTpE3z4sywdDbIkC3q33ZQLNyhYWxT44iTY6r4=

This series contains two small hwmon cleanups.

The first patch fixes an incorrect errno returned by sanitize_name()
when called with a NULL pointer. Returning ENOMEM in that case is
misleading. EINVAL better reflects the actual error.

The second patch switches sysfs show callbacks to sysfs_emit(), as
recommended by Documentation/filesystems/sysfs.rst. While the risk of
overflow with sprintf() is low in practice, using sysfs_emit() avoids
the issue entirely and aligns the code with current kernel guidance.
This also simplifies Rust bindings, where overflows cannot be ignored.

Signed-off-by: Kari Argillander <kari.argillander@gmail.com>
---
Kari Argillander (2):
      hwmon: Fix wrong return errno in *sanitize_name()
      hwmon: Use sysfs_emit in show function callsbacks

 drivers/hwmon/hwmon.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)
---
base-commit: cc3aa43b44bdb43dfbac0fcb51c56594a11338a8
change-id: 20251219-hwmon-fixes-b8e205834d20

Best regards,
-- 
Kari Argillander <kari.argillander@gmail.com>


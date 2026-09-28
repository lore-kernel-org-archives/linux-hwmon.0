Received: from mail-pj2-f41.google.com (mail-pj2-f41.google.com [74.125.227.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFBAB43FD06
	for <linux-hwmon@vger.kernel.org>; Mon, 28 Sep 2026 10:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790593190; cv=none; b=jVwGByT465WA+G1ad8hxnWNR3Lhl8usZpZlLP92fsN1ycFpfR2OsWopN0WRE4iunNGnlxpMUdKPluljAio4cNs54MS/kMmK1lGmkaO+tkS4Z4XskEPBxSiGdK+hspV8i+4lwPj/3UvPPIqQQ7XbPCbKZmJeiqd45CF4bsamaa+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790593190; c=relaxed/simple;
	bh=hIbE1WkiEyYr2rgywtMnsnYfOGO9WVejcPv35XwQqV0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Mnuv6C24D5EcAo6uAp6B7shk7ZEp4LMyvuewbflGsuW+KJLGayq0gfHza5ILC6rgE8FP4QE8K+DPSZg5w0zQM3SBEpYHxs4xUKyo5sh1yfrXbUArnSflY94PSjM6oYhVt8Wv6+M/2vlCY90bEOkX9ZIyQx4mJ46puYBy7U9VFwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lHzjMdxm; arc=none smtp.client-ip=74.125.227.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lHzjMdxm"
Received: by mail-pj2-f41.google.com with SMTP id 98e67ed59e1d1-3a0bd71827eso1564336a91.0
        for <linux-hwmon@vger.kernel.org>; Mon, 28 Sep 2026 03:59:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790593188; x=1791197988; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Jt8WLvuVpcaKdOY0WmZ2Johj0kI46QjfNZqar/F/0wA=;
        b=lHzjMdxmYUQpUbyl6b/p6kZ/o2CHeWhd70KWfRgC+dLVoWVe74Z0jw+KfzGhiDy23X
         2qYbc6pYrgn9janX79WtK3uFvpiF3jqDe3W/LRTYiOS5jQC7zShLnwAOnqYKo7kNXXhU
         bpCR8J+ZavyoyrcKsM1YEd1t2n/Cm5KmlRQ78NewkL6+lMNoDvrVuqvl3rhopRg6IS2j
         2lDoKagXlWAmjEIWREbFnYwVTBbDrppbVw/4PvSgHupp+oE4k3PBUQMwTMYIpQOwECg1
         84cInnImhJvYzZJ9Prw4cm5HG83VJRPzkjdlsgW5iUXmeRNV57CnF/fMfXoNJnUzTSay
         uHZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790593188; x=1791197988;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jt8WLvuVpcaKdOY0WmZ2Johj0kI46QjfNZqar/F/0wA=;
        b=ZDIWO+RvDr4OkcKujNCBfGzAT0wV6kZTdmMsgJW8khNKr0TI0FtUniSHeObiyxZ+zB
         pODf087Mnh7GZ8PaVZIyi7lRClXxz2JE0P9aStshnUCDcBba4RJvBZ6ZeUlV+K4lY13b
         Ai9P6Lrfv6/M18p3qBWNwcfgMWkLpx7d7sxWjpf9g6izFDy0WpAQ+DCUvkGe4GCipOqa
         5nBex115iZEna/P8BVjoSEGeVzjF+QkxeDA94t/KeclrMz0ycKs3Bn6for/JdYCZxhcL
         zQIK47u9rDhfj8X8rzwSMn3yHyBJoS//i02SsSM41HyF5AX5x502iukRH7npRPKKqSV+
         T01A==
X-Gm-Message-State: AFq9FYK0MO9DnJYu5FahwuVRxozlG5Y4NjEM6rSqFunTmTOpBrg1zsO3
	fd0qWUv8I2xbJ0x2g2ocRNSEeaWrVEq7+QAPHAlRySKKWPvn6Qa3pi3Q
X-Gm-Gg: AYBFou2467j/2kPwGV2GRs7jlvkp4fMmRyPGCTLFMIXIZWfmVKNgKd1fROnc/1p+RJz
	qd33JweX0ReXfdnqgNtM1/MN3jNPq0DjOgCdwhDwLpJTPz/dXPs23GcvkQmfAeuCoH83ErsGgO7
	juI8OX98g5CVoCuaOV+BjREQYZYN82yVUoKfxXFOkKIZcG0xbQ0CghQfIw24XLQA3xPhAg/lGc2
	/PSU5osSpUXY2ClSMX4BY7ddnAppIfFuthZf85aXMZztDhBUjVMq2K74uZaGaZqBe9BoHSsvg9O
	qMWCoL2yetWkjmWjj3wpzeq9VP0HwENrBAUlKMCmwtUtd1PC/rb0tb3lBVi5wxZCLw7OaacPU+S
	cWYasAhhxHEOPXE+c+WHfhqUolGAsBlJf1zSUYgXKxpPyPoxC2wSIDratTnMc4s1l7gAv5bGS4P
	XUYSO6dHbPT2wYm8VJCN1uhJecWZHh7z+YF70ITBDHtm2TYEsOxcoUXu4rM2U2cfAmXuqCK1SZ7
	OiEAD8Te2rDpA0fH2BgnFT9dtv4UIHiV+7pWJTKnU2Gj5+S/ls9cKEqTJyBpcG9RASJpjTeHxUD
	V2hRZ+dgVM0qp65O3GX2dDxeLCR/EunHY6UZLPUBmtT8MirP7DqMpcTWWkG2
X-Received: by 2002:a17:90b:4b0a:b0:39e:21a7:5df5 with SMTP id 98e67ed59e1d1-3a0985eb6c7mr10896774a91.24.1790593187942;
        Mon, 28 Sep 2026 03:59:47 -0700 (PDT)
Received: from spider.bream-herring.ts.net ([103.6.151.236])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0cd1c4ec9sm15924338a91.16.2026.09.28.03.59.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 03:59:47 -0700 (PDT)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: linux-hwmon@vger.kernel.org,
	linux-watchdog@vger.kernel.org
Subject: [PATCH] MAINTAINERS: name the hwmon-next and watchdog-next branches
Date: Mon, 28 Sep 2026 18:59:44 +0800
Message-ID: <20260928105944.2186541-1-matthias.goergens@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The T: entries for HARDWARE MONITORING and WATCHDOG DEVICE DRIVERS name
groeck/linux-staging without a branch.  The repository's HEAD points to
branch master, which mainline already contains.  linux-next merges two
branches of this repository (Next/Trees): hwmon-next for HARDWARE
MONITORING and watchdog-next for WATCHDOG DEVICE DRIVERS.  Name each in
its entry.

Signed-off-by: Matthias Goergens <matthias.goergens@gmail.com>
---
This is part of a cleanup of all T: entries whose repository HEAD is
not where development happens: one patch per repository, sent in small
batches.  The plan is at [1], and why it goes out in batches at [2].

[1] https://lore.kernel.org/all/20260924033200.3615554-1-matthias.goergens@gmail.com/
[2] https://lore.kernel.org/all/20260924101844.2403008-1-matthias.goergens@gmail.com/

 MAINTAINERS | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 140eafcbbd78..6dd05753c41b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11483,7 +11483,7 @@ M:	Guenter Roeck <linux@roeck-us.net>
 L:	linux-hwmon@vger.kernel.org
 S:	Maintained
 W:	http://hwmon.wiki.kernel.org/
-T:	git git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
 F:	Documentation/ABI/testing/sysfs-class-hwmon
 F:	Documentation/devicetree/bindings/hwmon/
 F:	Documentation/hwmon/
@@ -29359,7 +29359,7 @@ M:	Guenter Roeck <linux@roeck-us.net>
 L:	linux-watchdog@vger.kernel.org
 S:	Maintained
 W:	http://www.linux-watchdog.org/
-T:	git git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git watchdog-next
 F:	Documentation/devicetree/bindings/watchdog/
 F:	Documentation/watchdog/
 F:	drivers/watchdog/

base-commit: 62f4c998b297cf233997a2b4cd6fc2d2df0319c9
-- 
2.55.0


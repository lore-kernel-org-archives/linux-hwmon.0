Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19DA8136E21
	for <linux-hwmon@vger.kernel.org>; Thu, 24 Oct 2024 03:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729741083; cv=none; b=dvW6ilhSyEUmI0sLpNfkGcRcmwARRh5vMqANdaWmn5cMrXjvlJrFld2p6RqDQA1Cfj0riMKnZU1vch4R0NnonGzJNT1K9WThEbewTQJsiJmEyxieT5YnTtfSwF3QeocQvTCaVRJdUDnD5JXE2h+COkQpsuc4z/Maomv95quJINs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729741083; c=relaxed/simple;
	bh=pHoeaOwWJmx0u8QijgNn7bMrWBP0M50nYvQCZF61TZ0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BKH+D43bOA1sMv7sEm9OroU6D/UbgB6fL2vNLHulj4se4DCYP9MDn0cDK/z2iDwftD++Q2gDCMD4t1+7b//8+QF0eGonVfVge3Y+5mv0D5xt4Gs/LcO8ygSqJ7sJc2YJCvyMKLhZALzeyqoJTOsstpQLVZVNahmEoZfyZXuJMjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gSoQmt01; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gSoQmt01"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2e34a089cd3so406110a91.3
        for <linux-hwmon@vger.kernel.org>; Wed, 23 Oct 2024 20:38:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729741079; x=1730345879; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=mv1RaFjR+1mpTr8P4V73cauYTc/iIF4X4IbNfBetV+I=;
        b=gSoQmt01FpPnpGMvH/u/dSs62uRA/8TLBW2QNYZtmG3wFXoeNrHy/1O+ylC9Vk2VaG
         9rrk9J5RtjG6EnfavhGDrsspUspkKbs8E/2COjYuyfBjtY+9/2KGAsZy/zqoY8+hGLhi
         fLGGmjMGnw2auhZ/5Un8/PkLdZfouiSrxlyiExKzHteV3Tpy6nR7TE+vCHCfMIKRGJOK
         trDTzpysVZ+EOlFUV7/ZwFzonbr67ba1L7pma0CtfGE6wSSXZ3noVuMRix+tBlJkKltc
         IhKANlB3snhsqUaZmcPMT/SwLBY6tGQZ3cA7o6qLa6hsY6FHBcTrAOaJFGFmcdhfjM0V
         sF5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729741079; x=1730345879;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mv1RaFjR+1mpTr8P4V73cauYTc/iIF4X4IbNfBetV+I=;
        b=wXCfJqcf82hwUbrp/voe5oMkD+QHrnKnFy/J/mkSppr2rGfPyYptBx2u+giynVLdUB
         YxyCsE3DNO+8N3WJ5qWGi/P0LsbOtv5yoTL++FFv72VWcpwSrly4lSCcT8ZiEjG5CUgA
         GXokvPEcAbwzR2cyJidLSYAOf5HXHhl0bLfISrxibMvZtKcijhq6iTy8w+R4K9ypuDkF
         I9FiikD7/KgpFVCc56f2mKP0TGtgqNtkgoTAarhf7BlNRBVfCp7GbM/8WqAdLsjch0es
         NJXbRYevzVZz+AfVfxcaKFZoVC7Gcabchue6YH2oG2fYjA4NGv+i2dvwao/h9+OK2QPH
         Zu3A==
X-Gm-Message-State: AOJu0YzEiICm+rMjCvtrhYHel8S/ZdHVYafdRF+2gGmrh8qH+VylPVno
	6vXC+y2BlRd4w6WD4Tc3EJA+SA+pnkbOoS9oz7PPPgJf7xNin2RG/0R0BA==
X-Google-Smtp-Source: AGHT+IF4c2YoPRScqrLSuNRuGJ1PLFd/wC7yuEz+BhMYp8c/k541Qx7f3iaw8O3n64OwdEuIDKV62Q==
X-Received: by 2002:a17:90a:4ce3:b0:2cf:fe5d:ea12 with SMTP id 98e67ed59e1d1-2e77f47f026mr780207a91.24.1729741079510;
        Wed, 23 Oct 2024 20:37:59 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e77e56f468sm299738a91.41.2024.10.23.20.37.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 20:37:58 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Aleksandr Mezin <mezin.alexander@gmail.com>
Subject: [PATCH] MAINTAINERS: Remove Aleksandr Mezin as NZXT-SMART2 driver maintainer
Date: Wed, 23 Oct 2024 20:37:55 -0700
Message-ID: <20241024033756.685930-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Per his request, remove Aleksandr Mezin as maintainer of the
NZXT-SMART2 hardware monitoring driver.

Cc: Aleksandr Mezin <mezin.alexander@gmail.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 MAINTAINERS | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 867cdda2f834..ca7e827da33e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16792,13 +16792,6 @@ S:	Maintained
 F:	Documentation/hwmon/nzxt-kraken3.rst
 F:	drivers/hwmon/nzxt-kraken3.c
 
-NZXT-SMART2 HARDWARE MONITORING DRIVER
-M:	Aleksandr Mezin <mezin.alexander@gmail.com>
-L:	linux-hwmon@vger.kernel.org
-S:	Maintained
-F:	Documentation/hwmon/nzxt-smart2.rst
-F:	drivers/hwmon/nzxt-smart2.c
-
 OBJAGG
 M:	Jiri Pirko <jiri@resnulli.us>
 L:	netdev@vger.kernel.org
-- 
2.45.2


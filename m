Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 251FF20ADFF;
	Fri, 10 Jan 2025 11:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736509686; cv=none; b=dQgM84AnEhgnSWsj22dv6pLeE55+Y8J4cTGLUCI0tU5v/WewJNDjuomSimafkoU6hpYIlIbLxqfgU6JigQFdPSWtydJ+MmAOt8846Q/ChR3TGl+2NnKS5j/PIlLT37GuL8XrfJOcI4zQjWcOjAcCC5XqJit4nbXLSAmSBilfI2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736509686; c=relaxed/simple;
	bh=ccxm1N+dLVpzpg8p9w9I2klW2Uft+HlRqiwPjWXd1aE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=s/gizWNNs8cqRyMcPPNWoN5FdHGL9Maye1jzGDpDJSlxc77aLfO+qNl4/pDJdSrHDxZq8EwuOni8flnWMMZ3gr3+9jx2VGnGkJGYv4Xf2P/0525r+cja4nV+gDNvyuitejxHkLid96HJNa+hV146PGmOP7xyI+C7HtjSRfPFCPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y7zUYib4; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y7zUYib4"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-216426b0865so31902425ad.0;
        Fri, 10 Jan 2025 03:48:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736509683; x=1737114483; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=tFRw/+58ITVuLNvlLKTfpJf5G1Rh4TJJMDSpDyZ7jpE=;
        b=Y7zUYib4jrRCeUrAQo5refuGjNRZqyfGbEwzfGP7J57D6J5R/C61qYDodGr+vJoCW8
         hXvFPFKxEse+xr9hTjk+inANSoluMdVnIT8d+0MwjsE+xituT4jOOcN5qPH8LiLAHC82
         aWMeT48PLGMueoijwFg0Xl/Zwk58rUw1qNO6o4tK5Ah5oMU+Y18hR9Cs+wMbgDAKXPPP
         /jo8z2qeNxpk1pE9Icq3N2rPQnTcKUxCiLI/6QbRb87QBcxXDkvOhCzbhszFNJh0Miyc
         9yshAUJObG5V0w/cvSlD3l0ugZi9qeDXra3PydkKIcdsQuJniy1H5XfaryIsfG40WKv4
         aHcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736509683; x=1737114483;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tFRw/+58ITVuLNvlLKTfpJf5G1Rh4TJJMDSpDyZ7jpE=;
        b=CEndHRZJgoXqc16zzZwbR/fnsAqC5ZaJorRvwATpUOyBFEvZXL88u6s69/iSvO4+Gn
         MVVv+Jtjl6ieE30k5GPmMhVt3xebTw6AJ/o2jCzFGWygzbUNGruR6vuHpDwu6PQmWs64
         3wTUXSuqeSA9nzPJ2GQI4WzQZ67RWI6ks/wnfggOeoXZYzVeIkQVETijqv270HE0sX2K
         /CKz4K2FsyZlHoJ4tTLvW6Vak1sByyBSix31ExwNHsD493Arxc7sSxC7al1Ig9HSwudM
         VG3i0jx8azTFYA1U9L60CWjLuzwnpZp/6fGks8IX/n9/SFEcxZsyNTYuhxhSBk2sszhc
         H/bA==
X-Forwarded-Encrypted: i=1; AJvYcCUcQ5yXcEQDDrnae0+Tk4SJbGLNqqAj/MU3yOi/0PiYAR9LJUpRtDZJ9MeHBGaUxTotwshK7UtDpnhPJzvt@vger.kernel.org, AJvYcCX5mcjCw4oGNJ7pYkYxrT9GK/2CnfsT9iZ5hyTc0ACNHfKYBiYLXvHi/O/ztFnChGmYFWekSMFfmW6U+A==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywsqd7QarY9trvyvIzejkmPe+GgUPnAKmwP3dHGWWM7Yf/ZbsKd
	aOKl26cZ4VKH6xtAQf6LAhg+wh6n3dSnjNK5UFBoc4niYMgZUyNaGGc9jw==
X-Gm-Gg: ASbGncsIf5h7UwhlnnFDjKD0q6ya1LLQNwb5v/MpaHsGm0rKMfcz0kQZiBI8cFPXnA8
	iGrdqlQ2f0OrrUFYsSXqb2hEMkiU3nQMc33XqOyCbb6JDrMwIgsQeJxHA5UkYzTifFAmj8UeJbr
	zTNGz1OAhSCOSsoQvck3scGWsH2O2xgx2epGXTj9zY5aIk8G/HdjJpOgicAvKDnyojTgwAr1hfa
	YCwGKP1FRpMi2VJjmRfKX2n5Hlh6sDf38yBLZUA8++d/T8UxyJq
X-Google-Smtp-Source: AGHT+IEoGoXXspj4Ewi9299VG6sDT8BkazCSMsMCMlPvlD0nOLBSE1QJDy/r2MIF9gM2MkgFwMybmA==
X-Received: by 2002:a17:902:da87:b0:215:a96d:ec17 with SMTP id d9443c01a7336-21a83f4d80dmr162248825ad.14.1736509683327;
        Fri, 10 Jan 2025 03:48:03 -0800 (PST)
Received: from prometheus.lan ([45.124.203.18])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f219324sm12560905ad.127.2025.01.10.03.47.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2025 03:48:02 -0800 (PST)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
From: Joel Stanley <joel@jms.id.au>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>
Cc: Billy Tsai <billy_tsai@aspeedtech.com>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-aspeed@lists.ozlabs.org
Subject: [PATCH] hwmon: Fix help text for aspeed-g6-pwm-tach
Date: Fri, 10 Jan 2025 22:17:36 +1030
Message-ID: <20250110114737.64035-1-joel@jms.id.au>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The help text has the wrong module name mentioned, and the capitalisation
of the title is inconsistent.

Fixes: 7e1449cd15d1 ("hwmon: (aspeed-g6-pwm-tacho): Support for ASPEED g6 PWM/Fan tach")
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
The naming for this driver unusual; other aspeed devices are named for
the soc name (ast2400, ast2500, etc) that introduced them, not the
generation.

Additionally this driver uses the abbreviation "tach", while the other
uses "tacho".

 drivers/hwmon/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index dd376602f3f1..9afa70f877cc 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -413,7 +413,7 @@ config SENSORS_ASPEED
 	  will be called aspeed_pwm_tacho.
 
 config SENSORS_ASPEED_G6
-	tristate "ASPEED g6 PWM and Fan tach driver"
+	tristate "ASPEED G6 PWM and Fan tach driver"
 	depends on ARCH_ASPEED || COMPILE_TEST
 	depends on PWM
 	help
@@ -421,7 +421,7 @@ config SENSORS_ASPEED_G6
 	  controllers.
 
 	  This driver can also be built as a module. If so, the module
-	  will be called aspeed_pwm_tacho.
+	  will be called aspeed_g6_pwm_tach.
 
 config SENSORS_ATXP1
 	tristate "Attansic ATXP1 VID controller"
-- 
2.45.2


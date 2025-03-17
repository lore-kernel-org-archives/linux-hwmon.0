Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1D521B808
	for <linux-hwmon@vger.kernel.org>; Mon, 17 Mar 2025 09:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742202914; cv=none; b=teqaJ6HCzPtBkYccDxBpTrjRLG9EUNj2dI8a90ccjnKkPbS7dzY382BhFK6pHeSzwSed+rTYpWddlrUTw7u0yeqlu3zCaJpgUPV/kmD3mcJ21+A3qUs/qfAM93i/G3d6n1mtbNsduPaIszAAvF/5wClWvHfRV10MpRk5bxBVouQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742202914; c=relaxed/simple;
	bh=T7dimAhBfE4wY7JZAMkixTQrHaUwjdB62tQDyD1BYVQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iqan3p4Ir0VZTUyHMRGzP9Qo/jIjw7hVOHhQUfacf84pBCeUby6UmtTcuWLf7gLR08pvXfds2WBWd9nX3lF9QSKyqzCmn1UzhDZSzwu3LOTnuVqNzvRFtMW2wfkhohBYHd7AljFpZHSUBQEhOJRd1QqoRxeT+6DaAzZKUTNf/rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=WVIYa2JF; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="WVIYa2JF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=cG/S5H056jkpWk
	EtOKUTFWfqUueLN6gaWdE13xyy61Q=; b=WVIYa2JFDYPUPW60VSd5ddHaWhx5yI
	wdz879DupkJTN11AUlHy33zDdEv4fExWi/4JfJSC1t/hUd/+xN3Lz/2t1HvXJHf3
	1vyRVH2sDwrvkJgEHwreYDnfBQjvcgJ+WyJv5YExodkmIIbc1ooM/i5UqdnkmOWK
	NBI5jCPY81y5VDYvCUxq7H58z96GJisH0RvmwLuEOieqX40UydBapKUMs883Pz52
	luclXhHB+FOoA3ep7dKneT5lkDTUqiEICWVs0vJ2M6ynJbsEzC8pS3mU3Q8ER4eA
	9YAyRdqumONBqqRn0uzFInp5xAn3bElagGdg0dfZ15TxthwAC0hPgAMQ==
Received: (qmail 3053338 invoked from network); 17 Mar 2025 10:15:04 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 17 Mar 2025 10:15:04 +0100
X-UD-Smtp-Session: l3s3148p1@QaZBOYYwZJggAwDPXyTHAJp038nK7dx+
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-hwmon@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH] MAINTAINERS: correct list and scope of LTC4286 HARDWARE MONITOR
Date: Mon, 17 Mar 2025 10:14:49 +0100
Message-ID: <20250317091459.41462-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This entry has a wrong list, i2c instead of hwmon. Also, it states to
maintain Kconfig and Makefile which is not suitable for a single driver.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Found because I was wondering why each and every pmbus patch was sent to
the i2c-list... I'd love to have this in 6.14, if possible

 MAINTAINERS | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 896a307fa065..68e312bcd006 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13750,12 +13750,10 @@ F:	drivers/hwmon/ltc4282.c
 
 LTC4286 HARDWARE MONITOR DRIVER
 M:	Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
-L:	linux-i2c@vger.kernel.org
+L:	linux-hwmon@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/hwmon/lltc,ltc4286.yaml
 F:	Documentation/hwmon/ltc4286.rst
-F:	drivers/hwmon/pmbus/Kconfig
-F:	drivers/hwmon/pmbus/Makefile
 F:	drivers/hwmon/pmbus/ltc4286.c
 
 LTC4306 I2C MULTIPLEXER DRIVER
-- 
2.47.2


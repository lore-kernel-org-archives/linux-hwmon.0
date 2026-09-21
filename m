Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7365639020C
	for <linux-hwmon@vger.kernel.org>; Mon, 21 Sep 2026 06:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789973866; cv=none; b=qPQS4qEW7aFzAVEkVF5pAc9pr5pOIxeTiBF+o6aBoXmEaWJcJuP3kHwSseB4RhMpyJgxDajX/YpLRV8vfVNsh/DLJY13z5F4BYYX02ditd4RfXc6TFJb7tC9QOi/Ahbf2IGbaPozZ7gGQg7vi22infAiCe1d2oIjJwRn4dzTpGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789973866; c=relaxed/simple;
	bh=R6KQCtmBZ/LzQF/AMHskVs6rZH+bFAh197Pym1iNSc8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=q5cbf8YlfnnAl6PJQQs9EyZKd2e/9JPF0MzLPRp68MoCMJ2dL3W27BuqC33iQuscHRlf29ob3QInTVwBLvf+bcphzdyhpLsToY2JQBgR7JoUBF7TXccasdYWmxKBJBbZmOXeZjrPDfUWPRdT2Lp5hxNLHL9EspRv4oL3tOf4tbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OoOV4dfc; arc=none smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OoOV4dfc"
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-85469e25187so1421233b3a.2
        for <linux-hwmon@vger.kernel.org>; Sun, 20 Sep 2026 23:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789973864; x=1790578664; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qtif5ZGV6EGkcHsHgZP2vHZuwYDFX6knAp85t7NtDS8=;
        b=OoOV4dfcsOanBjnNMFNGb2N+03IuSNmrLc+j2MuBehL3Zz6r/F271d7oKgUMCDjb+X
         Hh8JUXVS6pxp4wFr5Ek3g9yYZ+OcxooU8Z6h2F/OyyDeen4MN96Tgj6g2N06nK0WKato
         LEIb6AASk6YTw/aUx/WAFTIg8igDFTA4hNeAMYsUNrQAcyXuUaSrcTwR1Eq01ZqFbCWy
         JJlQN5XbM6Q6ZmHxtGMq7sBfSehqg0muXmslX7V/L48Yi4mpIAPkQ0hNQZtg8HGJ8QVz
         2BTWK+wo9LODOF8R4LVAQgzVyIyym9QLx5NjTAAcndiD0kRH0C01lYPoFFfA1tIpxPel
         Sqow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789973864; x=1790578664;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qtif5ZGV6EGkcHsHgZP2vHZuwYDFX6knAp85t7NtDS8=;
        b=EeD6p1hTtm8hZG45gApcD4tN3AgJIYsa9wuhiivj1LBID3ygbs/Ua8Hfm8TDMYCsIG
         HBYLaDBPsKUDFjPatMJXXqtgScqk2hwwnhwBi/lkEt7Fg4kffWJHOwqWpI/cHhD2NXJC
         7hkYgSuVv9kOHDM5EuQQFzGJMMXqgVrnY4WPrSJ0yVfN5b29b7FaTJS+Uv3b9Qw/h6J0
         ZC8a3FfmIXqUd8h2vi2UCgNA4A6DZEZ1sogzidEBTyhLYvfl0ZWOWRR9Ygn73oBCZnu5
         l9DZkBLHniYtz6lWtCBBumusF7l0+0xN8Aw+dehF4QpTGDNgg7MjiuixFuzLiK/+kZyO
         1vAg==
X-Gm-Message-State: AFuF++l2Jc5Xx9bNGRfAB8mIRUa3yzo7w5/a6lho9yKlTqgqE6hqgIs7
	Rbcnsh13LVZRj8EDt7bjwkmYkelxuX4WAD9MhKPjqlpvWmAiPx8emTBp
X-Gm-Gg: AYBFou11OCuPla1jf8Q8GdRGUwnsPQKYDPzwNeY32zfp+0GCgksy9zCd80crtVeJ8RB
	3y7l0xQIRF6e3IR2lilR1+o2hiSl6pRVnFs7BNlHeAvRjRVvTEvd51kD0220fGLauJSNjYCYXDH
	1ABdAz0Db4K3iLJP56w1l1z4ZPNh5QJMUnaNgzFNRlRIuC4R+1jznTyLFBhfqLJm89B1C21Qpdi
	9XQETsViAB4YWzXW1gRIVXZeCLX0AZdbMvQRPbS+huQHUoeHE73QJ8v8tfeWmRqKkaDiqOkJoKQ
	s/2gxLRtT+kUrz7NFok4pkvQ0ApnW0rpao3tKj9cDYEjFJMrzbLQAGQllNSMS9WfVnJxm4Nm3Uw
	Kqz3+aIfcnk/d5NYg/xCsxQbtTTGbN1nNFbYdXTDweuojSsKYJAaZ7bh5H1vZwF3VcFJhEhhzCv
	gT07TUi8CeW9ocbRcktY/6QCv7YnqHf1N5FJoP7FfBEmrUBXO58CM6oTh8ZFzBpbaX4IRqBvMA1
	x1LUCMHX0eyZzFYgDqrlHi6rDwpkOeu
X-Received: by 2002:a05:6a21:e584:b0:3d7:b3c1:cc34 with SMTP id adf61e73a8af0-3dd8c41a56dmr12576965637.26.1789973863555;
        Sun, 20 Sep 2026 23:57:43 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:9391:ec5e:64c1:1347:62e6:6b8f])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144d55f299fsm31398048c88.15.2026.09.20.23.57.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 23:57:42 -0700 (PDT)
From: ASHISH YADAV <ashishyadav78@gmail.com>
X-Google-Original-From: ASHISH YADAV <Ashish.Yadav@infineon.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ashish Yadav <ashish.yadav@infineon.com>
Subject: [PATCH 2/2] hwmon:(pmbus/xdpe1a2g7b) Add support for xdpe1a2g7c controller
Date: Mon, 21 Sep 2026 12:27:02 +0530
Message-Id: <20260921065702.93196-3-Ashish.Yadav@infineon.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260921065702.93196-1-Ashish.Yadav@infineon.com>
References: <20260921065702.93196-1-Ashish.Yadav@infineon.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ashish Yadav <ashish.yadav@infineon.com>

Extend xdpe1a2g7b driver to support xdpe1a2g7c model.

Signed-off-by: Ashish Yadav <ashish.yadav@infineon.com>
---
 drivers/hwmon/pmbus/Kconfig      |  4 ++--
 drivers/hwmon/pmbus/xdpe1a2g7b.c | 10 ++++++----
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
index eb71a0ac044b..f65a295d09a4 100644
--- a/drivers/hwmon/pmbus/Kconfig
+++ b/drivers/hwmon/pmbus/Kconfig
@@ -867,7 +867,7 @@ config SENSORS_XDPE1A2G7B
 	tristate "Infineon XDPE1A2G7B"
 	help
 	  If you say yes here you get hardware monitoring support for Infineon
-	  XDPE1A2G5B and XDPE1A2G7B.
+	  XDPE1A2G5B,XDPE1A2G7B and XDPE1A2G7C.
 
 	  This driver can also be built as a module. If so, the module will
 	  be called xdpe1a2g7b.
@@ -877,7 +877,7 @@ config SENSORS_XDPE1A2G7B_REGULATOR
 	depends on SENSORS_XDPE1A2G7B && REGULATOR
 	help
 	  If you say yes here you get regulator support for Infineon
-	  XDPE1A2G5B and XDPE1A2G7B multi-phase digital controllers.
+	  XDPE1A2G5B,XDPE1A2G7B and XDPE1A2G7C multi-phase digital controllers.
 
 	  This enables the controllers to be used as regulator devices,
 	  providing voltage control through the regulator framework.
diff --git a/drivers/hwmon/pmbus/xdpe1a2g7b.c b/drivers/hwmon/pmbus/xdpe1a2g7b.c
index 9455ef443b2b..48f6f8081c4b 100644
--- a/drivers/hwmon/pmbus/xdpe1a2g7b.c
+++ b/drivers/hwmon/pmbus/xdpe1a2g7b.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0+
 /*
- * Hardware monitoring driver for Infineon Multi-phase Digital XDPE1A2G5B
- * and XDPE1A2G7B Controllers
+ * Hardware monitoring driver for Infineon Multi-phase Digital XDPE1A2G5B,
+ * XDPE1A2G7B and XDPE1A2G7C Controllers
  *
  * Copyright (c) 2026 Infineon Technologies. All rights reserved.
  */
@@ -23,7 +23,7 @@ static int xdpe1a2g7b_identify(struct i2c_client *client,
 	int vout_mode;
 
 	/*
-	 * XDPE1A2G5B and XDPE1A2G7B support both Linear and NVIDIA PWM VID data
+	 * XDPE1A2G5B and XDPE1A2G7B/7C support both Linear and NVIDIA PWM VID data
 	 * formats via VOUT_MODE. Note that the device pages/loops are not fully
 	 * independent: configuration is shared, so programming each page/loop
 	 * separately is not supported.
@@ -100,6 +100,7 @@ static int xdpe1a2g7b_probe(struct i2c_client *client)
 static const struct i2c_device_id xdpe1a2g7b_id[] = {
 	{ .name = "xdpe1a2g5b" },
 	{ .name = "xdpe1a2g7b" },
+	{ .name = "xdpe1a2g7c" },
 	{ }
 };
 
@@ -108,6 +109,7 @@ MODULE_DEVICE_TABLE(i2c, xdpe1a2g7b_id);
 static const struct of_device_id __maybe_unused xdpe1a2g7b_of_match[] = {
 	{ .compatible = "infineon,xdpe1a2g5b" },
 	{ .compatible = "infineon,xdpe1a2g7b" },
+	{ .compatible = "infineon,xdpe1a2g7c" },
 	{}
 };
 
@@ -125,6 +127,6 @@ static struct i2c_driver xdpe1a2g7b_driver = {
 module_i2c_driver(xdpe1a2g7b_driver);
 
 MODULE_AUTHOR("Ashish Yadav <ashish.yadav@infineon.com>");
-MODULE_DESCRIPTION("PMBus driver for Infineon XDPE1A2G5B/7B");
+MODULE_DESCRIPTION("PMBus driver for Infineon XDPE1A2G5B/7B/7C");
 MODULE_LICENSE("GPL");
 MODULE_IMPORT_NS("PMBUS");
-- 
2.39.5


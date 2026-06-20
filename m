Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4013D33260D
	for <linux-hwmon@vger.kernel.org>; Sat, 20 Jun 2026 06:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781937906; cv=none; b=gN1No8utNjtjvmmciYNTG62Us/hnY+MUQeCt/oYWQ9DlKDx/KsQmw+cxuT9XvkdG/LqCZjtq4as8ESHOGZLsULdLWcfuw6HCcWMOpKj2AFwHceFNFQlfR4geWk20JRef0hZZkEINZ3UoT/qVNJNWShkerrmEuP2k2M6epbplLss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781937906; c=relaxed/simple;
	bh=v8di4b3o+xItRI/4yzkAdXXDg6QqGItgPqqyndVPB4g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=F05fFI6Bi+GcUm59CsdwaiulJXPvvV+Dg9aE7/VQJHWxEShrx5PuWA9c6IPDydLKp2btSjJU8Ymk39yr6sFb8CQrkyRyBOSjWS5DWfc6StjpWIBXpN2syIz41WC83IB/LhQqezfkexD0t4+oTcr0ETbXb273qdKeWAjDOmwUSoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=Krf8Egr3; arc=none smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="Krf8Egr3"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-30c03b09e02so3831533eec.1
        for <linux-hwmon@vger.kernel.org>; Fri, 19 Jun 2026 23:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1781937904; x=1782542704; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=avwQGP9nJuxN8bh9IyChwkK+Cm3JHw878xbt3vgsgio=;
        b=Krf8Egr35Y97fpCcZg3GLsMDixgW7hUiN3Q8unbltR1qr1dpXERTkzjSA5shWMgVLo
         f4TdEfG6w/n4SbzqYQwaqeWPveqAbufOybaydJEXTTQi4iYAQNRbKCPPI1BY89956MuS
         xUk5s2EWaTKWeml5GIkJ8J8vQz4toXkP268xprBDZHRFvPjbCNhBROEO+HZnSFeBb6bN
         Y5D2bDGY5q/yg7yIHqr2zET/v0xRd9fWHu5reZxoLtHUhbOcLbckNOKtXcI67khVfEdP
         l4wbh7+mmdLyaNgtGkLkvDL5idlWAJ17v2nlfOkMLK/JFUc1Kzf2qa8QkSuBMyYa+VBx
         hJeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781937904; x=1782542704;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=avwQGP9nJuxN8bh9IyChwkK+Cm3JHw878xbt3vgsgio=;
        b=dDuoHVFbzcGz1NwQrcPep5YqeLnRLnBorKgty4pemf2AGo36745aZfZJNukBrKLbn4
         dmdGz6fhn4//iFzSTeGTS6z0yb5Kf5YKEMlr3Oo2s/ENuoWQJBhRsKVQ7IaO2TuE9Ha+
         ueKNLm7Hmf33RdgzWOg1w7T0HkSGP8kM07bpfgarn2ZVpvEzSAng0JLpxVsXHEmFvJL2
         dz0DWq8dFx2i/4n2Z+MtkqJBFKrw7SslwyH1BAzN2eG/FzGeDqq7khUbP/ns7MmKLeVn
         NQ7PZi+/UXofitagWc/6exeyQT12cgjKpuF1tGAlVyMOwgro1Iv80EYRK/ci0agMIqzU
         TFkw==
X-Forwarded-Encrypted: i=1; AFNElJ/nx97GrsB1URQkP+KIgzAbh0si6brkTD6D9b5HMr/pkaxMAvC2hUEZZNg3wH4JkGwkAuNpomNPjgTgkA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwSl/VbYzaqaYiXzXMkslmpWWHf33fknQpFxCbd8gBbkY3iJ52E
	pYO9rMM+3uJCFaUAH+PY4+XKMX70kt/OEJFqOe/OaLuvLrEJqrgTVxMToDRhaEV+ZyI=
X-Gm-Gg: AfdE7ckUvTVkS8Fn1yo/8n7O1skIAb2u0pkOfYbAB5TMCZVOy2RdJnNQ/KzVhMZdRSM
	HOl4ewipmsc/+l0aOUiDNBDOpLnLCUelhG8B660WTRbm/Cwnv2KoyGqQmaUfee6XUpZbCiF9Th1
	w9M8QMOuaXnwIESxJPVPS4qjMJRgxC7fl6k60B52pVRjiXYUPziCAYzgaT71RzPBGgxpgfSeM2a
	eDTkHFrrjC8w8ESERA9Q41IbR8E/fPTUY99W+YFoaXVWPxp+JCxwFopyz5s14xshj/FWOUAVRw+
	eDKc7JarQPFcYQ/GZ/dXTJrSqevOdbBODXwq3SEm1aTFGP1GfPAQGMuIflv+95NK6HRlBW+Us1s
	0gYv1j7vVVmDkxl25Jl7byYaRdTU0D3x9gOe90h1Xt/k93f9nE03luao9uZAgCuZmevMHj2AKjP
	RStHm0edJDZOXf8Uk=
X-Received: by 2002:a05:7301:7bc3:b0:2fc:9ae6:e5a8 with SMTP id 5a478bee46e88-30c0d06583cmr3094950eec.20.1781937904148;
        Fri, 19 Jun 2026 23:45:04 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c1ba91120sm2653854eec.13.2026.06.19.23.45.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2026 23:45:03 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Fri, 19 Jun 2026 23:44:57 -0700
Subject: [PATCH] hwmon: (pmbus/xdpe1a2g7b) Add regulator support
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260619-xdpe1a2g7b-v1-1-428c3847be0d@nexthop.ai>
X-B4-Tracking: v=1; b=H4sIAOg2NmoC/yXMTQ5AMBBA4as0s9akP1HhKmLRMhgLmhZpIu6uW
 H6L9y6IGAgjNOyCgCdF2tYMWTDoZ7tOyGnIBiWUEUbWPA0epVVT5bjV2pSVEaNTAnLgA46Uvln
 b/Y6HW7Df3wPc9wMFmcgHbgAAAA==
X-Change-ID: 20260619-xdpe1a2g7b-a3365760fb20
To: Guenter Roeck <linux@roeck-us.net>
Cc: Ashish Yadav <ashish.yadav@infineon.com>, linux-hwmon@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781937903; l=2833;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=v8di4b3o+xItRI/4yzkAdXXDg6QqGItgPqqyndVPB4g=;
 b=lwQW9TpdYaadCUnNONucuU2axn5D4/7eo+aQKBtZhKdrk81yUV/zach1G96QFpJBqaF7zieBb
 XVR8d8VTtJRBfOn4vOQa6a/0AN2U39lhZ03KXnX1+BDn9SJtvziu1A1
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=

Register both dual-loop output channels with the regulator framework by
populating regulator_desc[] and num_regulators in pmbus_driver_info.
This exposes the standard PMBus OPERATION-based on/off control and
status reporting to consumer drivers.

Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
The new SENSORS_XDPE1A2G7B_REGULATOR Kconfig and the ifdef-guarded
regulator_desc array mirror the opt-in pattern already used by the
XDPE122 driver (SENSORS_XDPE122_REGULATOR), so the REGULATOR dependency
stays optional for users that only need hwmon monitoring.
---
 drivers/hwmon/pmbus/Kconfig      | 10 ++++++++++
 drivers/hwmon/pmbus/xdpe1a2g7b.c | 11 +++++++++++
 2 files changed, 21 insertions(+)

diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
index c8cda160b5f8..78146f27585a 100644
--- a/drivers/hwmon/pmbus/Kconfig
+++ b/drivers/hwmon/pmbus/Kconfig
@@ -803,6 +803,16 @@ config SENSORS_XDPE1A2G7B
 	  This driver can also be built as a module. If so, the module will
 	  be called xdpe1a2g7b.
 
+config SENSORS_XDPE1A2G7B_REGULATOR
+	bool "Regulator support for XDPE1A2G7B and compatibles"
+	depends on SENSORS_XDPE1A2G7B && REGULATOR
+	help
+	  If you say yes here you get regulator support for Infineon
+	  XDPE1A2G5B and XDPE1A2G7B multi-phase digital controllers.
+
+	  This enables the controllers to be used as regulator devices,
+	  providing voltage control through the regulator framework.
+
 config SENSORS_XDPE122
 	tristate "Infineon XDPE122 family"
 	help
diff --git a/drivers/hwmon/pmbus/xdpe1a2g7b.c b/drivers/hwmon/pmbus/xdpe1a2g7b.c
index 971e7b73752e..9455ef443b2b 100644
--- a/drivers/hwmon/pmbus/xdpe1a2g7b.c
+++ b/drivers/hwmon/pmbus/xdpe1a2g7b.c
@@ -57,6 +57,13 @@ static int xdpe1a2g7b_identify(struct i2c_client *client,
 	return 0;
 }
 
+#if IS_ENABLED(CONFIG_SENSORS_XDPE1A2G7B_REGULATOR)
+static const struct regulator_desc xdpe1a2g7b_reg_desc[] = {
+	PMBUS_REGULATOR("vout", 0),
+	PMBUS_REGULATOR("vout", 1),
+};
+#endif
+
 static struct pmbus_driver_info xdpe1a2g7b_info = {
 	.pages = XDPE1A2G7B_PAGE_NUM,
 	.identify = xdpe1a2g7b_identify,
@@ -72,6 +79,10 @@ static struct pmbus_driver_info xdpe1a2g7b_info = {
 	.func[1] = PMBUS_HAVE_VIN | PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT |
 		   PMBUS_HAVE_IIN | PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT |
 		   PMBUS_HAVE_PIN | PMBUS_HAVE_POUT | PMBUS_HAVE_STATUS_INPUT,
+#if IS_ENABLED(CONFIG_SENSORS_XDPE1A2G7B_REGULATOR)
+	.num_regulators = XDPE1A2G7B_PAGE_NUM,
+	.reg_desc = xdpe1a2g7b_reg_desc,
+#endif
 };
 
 static int xdpe1a2g7b_probe(struct i2c_client *client)

---
base-commit: 9ecfb2f7287a967b418ba69f10d45ead0d360593
change-id: 20260619-xdpe1a2g7b-a3365760fb20

Best regards,
--  
Abdurrahman Hussain <abdurrahman@nexthop.ai>


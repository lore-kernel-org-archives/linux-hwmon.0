Received: from bits.crawford.emu.id.au (bits.crawford.emu.id.au [116.255.43.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DD4B3C38
	for <linux-hwmon@vger.kernel.org>; Sun, 28 Apr 2024 06:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.255.43.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714284451; cv=none; b=GbNCTHl2IEA1YKhAMkEAX7UT8Z3lhyXFrsXuH1SP4H76vTVPYuKE8gfiYDucZQZhw3TU12WBmYdZpnNbH/Y7aEQR0sxtyMeNqF0m2yCxuvBk2ZPPhTvPbJvnCVTlCWdDdMYgOcKgUJde5qYKNhuhFCzU83J3O4QOL0lPv8zkPPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714284451; c=relaxed/simple;
	bh=Y3O2stinyv38PpEPh2E167efiJAzUN41naiZN7Spf9Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aCXQNmWsOaqFeBep4ymIt34G8W8RBS8dAwVmKZlirBAVymIbhYbmyosE+WLiqLaoFRslVA7gAU73ivqLVFcaqOmDCZfvOwLtklsHHgTUbgFkSYbdN/sZWbRgCeqJwKCc9po3Xlzrx2aqnu4D8UgVSuFLPZunaeR9nmUyMqlisJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=crawford.emu.id.au; spf=pass smtp.mailfrom=crawford.emu.id.au; dkim=pass (2048-bit key) header.d=crawford.emu.id.au header.i=@crawford.emu.id.au header.b=YUWhiXRD; arc=none smtp.client-ip=116.255.43.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=crawford.emu.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crawford.emu.id.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=crawford.emu.id.au header.i=@crawford.emu.id.au header.b="YUWhiXRD"
Received: from agc.crawford.emu.id.au (agc.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc07])
	(authenticated bits=0)
	by bits.crawford.emu.id.au (8.17.2/8.17.2) with ESMTPSA id 43S66tnt3524336
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Sun, 28 Apr 2024 16:07:08 +1000
Authentication-Results: bits.crawford.emu.id.au; arc=none smtp.remote-ip=fdd2:7aad:d478:1::cb10:cc07
DKIM-Filter: OpenDKIM Filter v2.11.0 bits.crawford.emu.id.au 43S66tnt3524336
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crawford.emu.id.au;
	s=s1; t=1714284428; bh=dJFaJrUUQhk8I+kf+Oo1DfnsuweTVW4xMI7fepjQ/jA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YUWhiXRDkAg9aAQvQk6+RYTKZtUXXZPy/jbMA6mH8iae1NAYBOiMTdBvsDTVaBUlw
	 g1I3jnFnMe2qYyuTnQsxLkkEJiZPzCkXSWo0eth7Ru4NdkmZVdp0CiOS6M00nYrpib
	 h1LOBl7fAZCwfbUnLXj8uSgrpIP4Qa8XFM2KqvopTDo8ZNoKpow4iog+8w+4OSSyyc
	 zX8/DOmFkl5mdV8fKD8/k1iIfyzY8tpDamnqGDIZb6QBvCYEJQTqyCUEUknQOPAD4q
	 yFLCKvuh5SWX0O+ZY/mU4jBO8QfNlJ8UcJyeFvJE3gCEEoswETF6IphkN1B9xVAaKT
	 5HFK6pI8+EqEQ==
From: Frank Crawford <frank@crawford.emu.id.au>
To: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, Frank Crawford <frank@crawford.emu.id.au>
Subject: [PATCH v3 1/4] hwmon (it87): Rename FEAT_CONF_NOEXIT to FEAT_NOCONF as more descriptive of requirement
Date: Sun, 28 Apr 2024 16:06:33 +1000
Message-ID: <20240428060653.2425296-2-frank@crawford.emu.id.au>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240428060653.2425296-1-frank@crawford.emu.id.au>
References: <20240428060653.2425296-1-frank@crawford.emu.id.au>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.4 (bits.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc01]); Sun, 28 Apr 2024 16:07:08 +1000 (AEST)
X-Virus-Scanned: clamav-milter 1.0.5 at bits.crawford.emu.id.au
X-Virus-Status: Clean

Rename previous definitions to match the new information that they are
preinitialised as enabled and should not receive codes to enter or exit
configuration mode.

Signed-off-by: Frank Crawford <frank@crawford.emu.id.au>
---

v2:
 * renamed the feature to FEAT_NOCONF and macro to has_noconf following
   review.

v3:
 * No change.

---
 drivers/hwmon/it87.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
index fbe86cec6055..6eeba3a01e3c 100644
--- a/drivers/hwmon/it87.c
+++ b/drivers/hwmon/it87.c
@@ -320,7 +320,7 @@ struct it87_devices {
  * second SIO address. Never exit configuration mode on these
  * chips to avoid the problem.
  */
-#define FEAT_CONF_NOEXIT	BIT(19)	/* Chip should not exit conf mode */
+#define FEAT_NOCONF		BIT(19)	/* Chip conf mode enabled on startup */
 #define FEAT_FOUR_FANS		BIT(20)	/* Supports four fans */
 #define FEAT_FOUR_PWM		BIT(21)	/* Supports four fan controls */
 #define FEAT_FOUR_TEMP		BIT(22)
@@ -452,7 +452,7 @@ static const struct it87_devices it87_devices[] = {
 		.model = "IT8790E",
 		.features = FEAT_NEWER_AUTOPWM | FEAT_12MV_ADC | FEAT_16BIT_FANS
 		  | FEAT_TEMP_OFFSET | FEAT_TEMP_PECI | FEAT_IN7_INTERNAL
-		  | FEAT_PWM_FREQ2 | FEAT_FANCTL_ONOFF | FEAT_CONF_NOEXIT,
+		  | FEAT_PWM_FREQ2 | FEAT_FANCTL_ONOFF | FEAT_NOCONF,
 		.peci_mask = 0x07,
 	},
 	[it8792] = {
@@ -461,7 +461,7 @@ static const struct it87_devices it87_devices[] = {
 		.features = FEAT_NEWER_AUTOPWM | FEAT_16BIT_FANS
 		  | FEAT_TEMP_OFFSET | FEAT_TEMP_OLD_PECI | FEAT_TEMP_PECI
 		  | FEAT_10_9MV_ADC | FEAT_IN7_INTERNAL | FEAT_FANCTL_ONOFF
-		  | FEAT_CONF_NOEXIT,
+		  | FEAT_NOCONF,
 		.peci_mask = 0x07,
 		.old_peci_mask = 0x02,	/* Actually reports PCH */
 	},
@@ -507,7 +507,7 @@ static const struct it87_devices it87_devices[] = {
 		.features = FEAT_NEWER_AUTOPWM | FEAT_16BIT_FANS
 		  | FEAT_TEMP_OFFSET | FEAT_TEMP_OLD_PECI | FEAT_TEMP_PECI
 		  | FEAT_10_9MV_ADC | FEAT_IN7_INTERNAL | FEAT_FANCTL_ONOFF
-		  | FEAT_CONF_NOEXIT,
+		  | FEAT_NOCONF,
 		.peci_mask = 0x07,
 		.old_peci_mask = 0x02,	/* Actually reports PCH */
 	},
@@ -544,7 +544,7 @@ static const struct it87_devices it87_devices[] = {
 #define has_four_temp(data)	((data)->features & FEAT_FOUR_TEMP)
 #define has_six_temp(data)	((data)->features & FEAT_SIX_TEMP)
 #define has_vin3_5v(data)	((data)->features & FEAT_VIN3_5V)
-#define has_conf_noexit(data)	((data)->features & FEAT_CONF_NOEXIT)
+#define has_noconf(data)	((data)->features & FEAT_NOCONF)
 #define has_scaling(data)	((data)->features & (FEAT_12MV_ADC | \
 						     FEAT_10_9MV_ADC))
 #define has_fanctl_onoff(data)	((data)->features & FEAT_FANCTL_ONOFF)
@@ -748,7 +748,7 @@ static int smbus_disable(struct it87_data *data)
 		superio_select(data->sioaddr, PME);
 		superio_outb(data->sioaddr, IT87_SPECIAL_CFG_REG,
 			     data->ec_special_config & ~data->smbus_bitmap);
-		superio_exit(data->sioaddr, has_conf_noexit(data));
+		superio_exit(data->sioaddr, has_noconf(data));
 	}
 	return 0;
 }
@@ -765,7 +765,7 @@ static int smbus_enable(struct it87_data *data)
 		superio_select(data->sioaddr, PME);
 		superio_outb(data->sioaddr, IT87_SPECIAL_CFG_REG,
 			     data->ec_special_config);
-		superio_exit(data->sioaddr, has_conf_noexit(data));
+		superio_exit(data->sioaddr, has_noconf(data));
 	}
 	return 0;
 }
@@ -3143,7 +3143,7 @@ static int __init it87_find(int sioaddr, unsigned short *address,
 	}
 
 exit:
-	superio_exit(sioaddr, config ? has_conf_noexit(config) : false);
+	superio_exit(sioaddr, config ? has_noconf(config) : false);
 	return err;
 }
 
@@ -3540,7 +3540,7 @@ static void it87_resume_sio(struct platform_device *pdev)
 			     reg2c);
 	}
 
-	superio_exit(data->sioaddr, has_conf_noexit(data));
+	superio_exit(data->sioaddr, has_noconf(data));
 }
 
 static int it87_resume(struct device *dev)
-- 
2.44.0


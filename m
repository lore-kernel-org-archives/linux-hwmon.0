Received: from bits.crawford.emu.id.au (bits.crawford.emu.id.au [116.255.43.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6734243AB2
	for <linux-hwmon@vger.kernel.org>; Sat, 27 Apr 2024 08:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.255.43.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714207746; cv=none; b=JL+MdMNMeBGKGILA3HfLbv618CwnkFQGjsu0bMv911iGCr210m9hQS2QCzM3itZiOK5Mb3p5ageRvH6kUBE0zad5lu8YTnXpdJo0erigdIEgO/7/k+cqZBB124K84w5VHs6s8aUTc6HUjkJblccOlPFhGl3Flvrrtc9Z0SlnT3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714207746; c=relaxed/simple;
	bh=mcmUpmJAqwirQehxAyPIJ1ZOf1dWm6i/P/mj7KaRDh8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z7JalAVwu+Khdjjzi+EpfBMyx2djV++zFrcqFEiYAeiJRVFt1hdjEptFlxzzoPBWW04PWpxFjYrFxS8KzuX4Ey1ufEtZN+zuTC6qIyVcDPRwXUS1tqa5RVZkGcIWOuIKHrmB8cAFyKwPWusK6UKUCkonvVGWfoxZtWm9iT0mJr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=crawford.emu.id.au; spf=pass smtp.mailfrom=crawford.emu.id.au; dkim=pass (2048-bit key) header.d=crawford.emu.id.au header.i=@crawford.emu.id.au header.b=KEc9QkTY; arc=none smtp.client-ip=116.255.43.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=crawford.emu.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crawford.emu.id.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=crawford.emu.id.au header.i=@crawford.emu.id.au header.b="KEc9QkTY"
Received: from agc.crawford.emu.id.au (agc.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc07])
	(authenticated bits=0)
	by bits.crawford.emu.id.au (8.17.2/8.17.2) with ESMTPSA id 43R8XNSD3013858
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Sat, 27 Apr 2024 18:33:36 +1000
Authentication-Results: bits.crawford.emu.id.au; arc=none smtp.remote-ip=fdd2:7aad:d478:1::cb10:cc07
DKIM-Filter: OpenDKIM Filter v2.11.0 bits.crawford.emu.id.au 43R8XNSD3013858
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crawford.emu.id.au;
	s=s1; t=1714206817; bh=pS7Hd9SgTiTOW2fBM4EYlAsKIQAB6YpV63yuQtE5Woo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KEc9QkTYAUmkHZCvf6s8PiEeBTVGzLzRJUGyIKZ8kvCSPsjPkPyGhi9kbns0y+9/y
	 0od4eqezO74MvoHi78sCp/CS7v7MFWAVirwcVMqYpFNTkOySdn5rGwqEJH9E1LBbqJ
	 K8ENHw44Z6y1wjY8dAbq7gCDU3WBYkZdW0fBmJDJY4FI+YyKzEUQbWAw7o/U+OeqRO
	 VbaXNagL+hGpj8ZQgmDjR46/kUx8CWvn08ewSedflDjQS/K68IT/U+wdkC4V9fcFWw
	 +O4YOK3vwKJGHwgxpAHEGEGaURaL4hCPqgD5SdPB0GhXqDBOqCeZtWd0hWK+oQ55rJ
	 wUXtoiJSXNEng==
From: Frank Crawford <frank@crawford.emu.id.au>
To: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, Frank Crawford <frank@crawford.emu.id.au>
Subject: [PATCH v2 1/4] hwmon (it87): Rename FEAT_CONF_NOEXIT to FEAT_NOCONF as more descriptive of requirement
Date: Sat, 27 Apr 2024 18:33:02 +1000
Message-ID: <20240427083317.2077175-2-frank@crawford.emu.id.au>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240427083317.2077175-1-frank@crawford.emu.id.au>
References: <20240427083317.2077175-1-frank@crawford.emu.id.au>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.4 (bits.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc01]); Sat, 27 Apr 2024 18:33:37 +1000 (AEST)
X-Virus-Scanned: clamav-milter 1.0.5 at bits.crawford.emu.id.au
X-Virus-Status: Clean

Rename previous definitions to match the new information that they are
preinitialised as enabled and should not receive codes to enter or exit
configuration mode.

Signed-off-by: Frank Crawford <frank@crawford.emu.id.au>
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


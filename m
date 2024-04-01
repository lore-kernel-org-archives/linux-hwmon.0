Received: from bits.crawford.emu.id.au (bits.crawford.emu.id.au [203.132.92.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E19833F6
	for <linux-hwmon@vger.kernel.org>; Mon,  1 Apr 2024 03:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.132.92.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711940495; cv=none; b=BeozOnSd51CQKvuvpjPtGAnjGyCLnbN4T4dWHPXm0VKZmviERPmFmmiXs8nqvOTcH3lb4DsRtOGrO4QkqSwb+DADUvCj+GfQJJ0mdO1yBIHC0RE9PfiksXqZgSg94v2sTpBL5NGWCWfpjyA7a78AiHIh32flsgd1WJPCbB+nKPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711940495; c=relaxed/simple;
	bh=x073pIytXcY6puSD7Qj//QsYJ28CrFTDN5jpp5D6vj8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YhHr+/n9MmsIVg/BuArhevp6laIX/zF+HaJNUDS+JUm62F157wMbz0NC356ac2Xm4l4WEs5f3FzYzwxgL8djnA6Lyp4EH3JOw9Kh9ZBSU3K9NMM5dhHS6p4FSvKmhVo/v2GVbaNMyrU5KgCy5YlrxvyYQLOcOzFRwT4oAQAuwbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=crawford.emu.id.au; spf=pass smtp.mailfrom=crawford.emu.id.au; dkim=pass (2048-bit key) header.d=crawford.emu.id.au header.i=@crawford.emu.id.au header.b=nazqFoht; arc=none smtp.client-ip=203.132.92.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=crawford.emu.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crawford.emu.id.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=crawford.emu.id.au header.i=@crawford.emu.id.au header.b="nazqFoht"
Received: from agc.crawford.emu.id.au (agc.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc07])
	(authenticated bits=0)
	by bits.crawford.emu.id.au (8.17.2/8.17.2) with ESMTPSA id 4312uQwk871729
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Mon, 1 Apr 2024 13:56:38 +1100
Authentication-Results: bits.crawford.emu.id.au; arc=none smtp.remote-ip=fdd2:7aad:d478:1::cb10:cc07
DKIM-Filter: OpenDKIM Filter v2.11.0 bits.crawford.emu.id.au 4312uQwk871729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crawford.emu.id.au;
	s=s1; t=1711940198; bh=a0YV52EsZDUdvg1iL/OPQ/7Xu0bpdkRonT2rAvFRLcg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nazqFohtHYDskluY6/00Qc3DizZhA7cPm6ODJ68+8o3V6gPUzP2eKvePvQBLxJpCr
	 uVmSnlYPGXOc4TvCrY3aYGuoJjr8qDHUUkVOqufDsnjRXKRR7jAG4sUomY24hi5z3p
	 aXGQYcoA3aZurzzxOY94fPKi2+yUxusZTlIcokAa9CQ8Lzlh7ObEeYcRdB6in1qcKl
	 utLf5rl4EP8mrrhUxLZXKXpaAPqBnHyr6jh3geHC1ASrUn1PUQw0tj7WsdKQTtlg1z
	 e034vnUD6pUGFYlACfv7D2HncKbmm/Kt8EMVyIJExX8paQw+psFyQy8bDwbx7Yr5eX
	 a08mrJnow7HPQ==
From: Frank Crawford <frank@crawford.emu.id.au>
To: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, Frank Crawford <frank@crawford.emu.id.au>
Subject: [PATCH v1 1/4] hwmon (it87): Rename NOEXIT to BIOSOPEN as more descriptive of requirement
Date: Mon,  1 Apr 2024 13:56:03 +1100
Message-ID: <20240401025620.205068-2-frank@crawford.emu.id.au>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240401025620.205068-1-frank@crawford.emu.id.au>
References: <20240401025620.205068-1-frank@crawford.emu.id.au>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.4 (bits.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc01]); Mon, 01 Apr 2024 13:56:38 +1100 (AEDT)
X-Virus-Scanned: clamav-milter 1.0.5 at bits.crawford.emu.id.au
X-Virus-Status: Clean
X-Spam-Level: *

Rename previous definitions to match the new information that they are
preinitialised by the BIOS and should not receive codes to enter or exit
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
+#define FEAT_CONF_BIOSOPEN	BIT(19)	/* Chip conf mode enabled by BIOS */
 #define FEAT_FOUR_FANS		BIT(20)	/* Supports four fans */
 #define FEAT_FOUR_PWM		BIT(21)	/* Supports four fan controls */
 #define FEAT_FOUR_TEMP		BIT(22)
@@ -452,7 +452,7 @@ static const struct it87_devices it87_devices[] = {
 		.model = "IT8790E",
 		.features = FEAT_NEWER_AUTOPWM | FEAT_12MV_ADC | FEAT_16BIT_FANS
 		  | FEAT_TEMP_OFFSET | FEAT_TEMP_PECI | FEAT_IN7_INTERNAL
-		  | FEAT_PWM_FREQ2 | FEAT_FANCTL_ONOFF | FEAT_CONF_NOEXIT,
+		  | FEAT_PWM_FREQ2 | FEAT_FANCTL_ONOFF | FEAT_CONF_BIOSOPEN,
 		.peci_mask = 0x07,
 	},
 	[it8792] = {
@@ -461,7 +461,7 @@ static const struct it87_devices it87_devices[] = {
 		.features = FEAT_NEWER_AUTOPWM | FEAT_16BIT_FANS
 		  | FEAT_TEMP_OFFSET | FEAT_TEMP_OLD_PECI | FEAT_TEMP_PECI
 		  | FEAT_10_9MV_ADC | FEAT_IN7_INTERNAL | FEAT_FANCTL_ONOFF
-		  | FEAT_CONF_NOEXIT,
+		  | FEAT_CONF_BIOSOPEN,
 		.peci_mask = 0x07,
 		.old_peci_mask = 0x02,	/* Actually reports PCH */
 	},
@@ -507,7 +507,7 @@ static const struct it87_devices it87_devices[] = {
 		.features = FEAT_NEWER_AUTOPWM | FEAT_16BIT_FANS
 		  | FEAT_TEMP_OFFSET | FEAT_TEMP_OLD_PECI | FEAT_TEMP_PECI
 		  | FEAT_10_9MV_ADC | FEAT_IN7_INTERNAL | FEAT_FANCTL_ONOFF
-		  | FEAT_CONF_NOEXIT,
+		  | FEAT_CONF_BIOSOPEN,
 		.peci_mask = 0x07,
 		.old_peci_mask = 0x02,	/* Actually reports PCH */
 	},
@@ -544,7 +544,7 @@ static const struct it87_devices it87_devices[] = {
 #define has_four_temp(data)	((data)->features & FEAT_FOUR_TEMP)
 #define has_six_temp(data)	((data)->features & FEAT_SIX_TEMP)
 #define has_vin3_5v(data)	((data)->features & FEAT_VIN3_5V)
-#define has_conf_noexit(data)	((data)->features & FEAT_CONF_NOEXIT)
+#define has_conf_biosopen(data)	((data)->features & FEAT_CONF_BIOSOPEN)
 #define has_scaling(data)	((data)->features & (FEAT_12MV_ADC | \
 						     FEAT_10_9MV_ADC))
 #define has_fanctl_onoff(data)	((data)->features & FEAT_FANCTL_ONOFF)
@@ -748,7 +748,7 @@ static int smbus_disable(struct it87_data *data)
 		superio_select(data->sioaddr, PME);
 		superio_outb(data->sioaddr, IT87_SPECIAL_CFG_REG,
 			     data->ec_special_config & ~data->smbus_bitmap);
-		superio_exit(data->sioaddr, has_conf_noexit(data));
+		superio_exit(data->sioaddr, has_conf_biosopen(data));
 	}
 	return 0;
 }
@@ -765,7 +765,7 @@ static int smbus_enable(struct it87_data *data)
 		superio_select(data->sioaddr, PME);
 		superio_outb(data->sioaddr, IT87_SPECIAL_CFG_REG,
 			     data->ec_special_config);
-		superio_exit(data->sioaddr, has_conf_noexit(data));
+		superio_exit(data->sioaddr, has_conf_biosopen(data));
 	}
 	return 0;
 }
@@ -3143,7 +3143,7 @@ static int __init it87_find(int sioaddr, unsigned short *address,
 	}
 
 exit:
-	superio_exit(sioaddr, config ? has_conf_noexit(config) : false);
+	superio_exit(sioaddr, config ? has_conf_biosopen(config) : false);
 	return err;
 }
 
@@ -3540,7 +3540,7 @@ static void it87_resume_sio(struct platform_device *pdev)
 			     reg2c);
 	}
 
-	superio_exit(data->sioaddr, has_conf_noexit(data));
+	superio_exit(data->sioaddr, has_conf_biosopen(data));
 }
 
 static int it87_resume(struct device *dev)
-- 
2.44.0


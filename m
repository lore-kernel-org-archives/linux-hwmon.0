Received: from bits.crawford.emu.id.au (bits.crawford.emu.id.au [203.132.92.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F34933F6
	for <linux-hwmon@vger.kernel.org>; Mon,  1 Apr 2024 03:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.132.92.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711940492; cv=none; b=cqpylGNK0e+58sEIrmIIev2cUuTzKiIZP0StYZSn89hxmjxrPQomaiiQlQvcvfeAj3EBnv1695gMFrh+Lmo3zF+wFv25CSdbJBOOLCOUkD5X/Qfap7c/opizSwPpTNrYHTvt/BzxbprhwHG7zFp0oDGv9FI6QAJX1ZxUxJWRaxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711940492; c=relaxed/simple;
	bh=kIepjF3sYF+cwbHxxF+HCy6RCP4yenABlSXDAjOCLqY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iTFk3R5MKDsmsmTJQeIDCRqkKqtuhuD+LcRhXS+qvk4sXHE7odgd/CP0GsguuAToLUDpIG/Sw/hZRn44/ikNWdY45CoPxt6/m5++Ytzpz0ZV2/ljnjm1tkGaCOt8DSTdNeuax/2D4boDMrh3dXkyzxeISEelRw1zaCwgptkyvfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=crawford.emu.id.au; spf=pass smtp.mailfrom=crawford.emu.id.au; dkim=pass (2048-bit key) header.d=crawford.emu.id.au header.i=@crawford.emu.id.au header.b=R5glnQq0; arc=none smtp.client-ip=203.132.92.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=crawford.emu.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crawford.emu.id.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=crawford.emu.id.au header.i=@crawford.emu.id.au header.b="R5glnQq0"
Received: from agc.crawford.emu.id.au (agc.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc07])
	(authenticated bits=0)
	by bits.crawford.emu.id.au (8.17.2/8.17.2) with ESMTPSA id 4312uQwm871729
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Mon, 1 Apr 2024 13:56:45 +1100
Authentication-Results: bits.crawford.emu.id.au; arc=none smtp.remote-ip=fdd2:7aad:d478:1::cb10:cc07
DKIM-Filter: OpenDKIM Filter v2.11.0 bits.crawford.emu.id.au 4312uQwm871729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crawford.emu.id.au;
	s=s1; t=1711940205; bh=vArK97dm3ThszED6Ix3d9QZZQB4vljtBWj+s/Pme1as=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=R5glnQq0JMY4iqxGrxS5Jd+MiyQJ4uytqv7i7fsroWLf/XQpOL04grDFLnWzQEwyZ
	 yp+5DpM9BybdD6SB4LL+FbFuhP65uEq3ZE9ly92wEEasqCiU5APBAXelbi3JIAGeXO
	 3MQxiQqzLmqOLOycoX3/aFE2/gTABpfQFQUmExN0vzuJ07RgP8VZVvYowkGxsw6eea
	 GCNnSRynK5mB4xS+CewIz7va7BBSBrXhlrFxIM+qkBpSzIoK/cTOC6WW8r0ZKewfGx
	 +O5kRej7gFyODFoIKk5qQf1ixf6+11hPikFqJQcrhmn3E4UDZgTIcS2tHCaYDlBs8Y
	 v25YeMfk6zMwg==
From: Frank Crawford <frank@crawford.emu.id.au>
To: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, Frank Crawford <frank@crawford.emu.id.au>
Subject: [PATCH v1 3/4] hwmon (it87): Test for chipset before entering configuration mode
Date: Mon,  1 Apr 2024 13:56:05 +1100
Message-ID: <20240401025620.205068-4-frank@crawford.emu.id.au>
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
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.4 (bits.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc01]); Mon, 01 Apr 2024 13:56:45 +1100 (AEDT)
X-Virus-Scanned: clamav-milter 1.0.5 at bits.crawford.emu.id.au
X-Virus-Status: Clean
X-Spam-Level: *

Major part of the change for the new method to avoid chipset issues.

Perform an intial test if the chip ID can be read without entering
configuration mode, if so, do not enter configuration mode and continue
as is.

If chip ID cannot be read, enter configuration mode, and continue with
previous code.

Also update exit code to take account of if we entered configuration
mode or not.

Signed-off-by: Frank Crawford <frank@crawford.emu.id.au>
---
 drivers/hwmon/it87.c | 52 +++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 47 insertions(+), 5 deletions(-)

diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
index 396c2d3afbf7..6a77f2f6e1e1 100644
--- a/drivers/hwmon/it87.c
+++ b/drivers/hwmon/it87.c
@@ -2667,6 +2667,27 @@ static const struct attribute_group it87_group_auto_pwm = {
 	.is_visible = it87_auto_pwm_is_visible,
 };
 
+/*
+ * Original explanation:
+ * On various Gigabyte AM4 boards (AB350, AX370), the second Super-IO chip
+ * (IT8792E) needs to be in configuration mode before accessing the first
+ * due to a bug in IT8792E which otherwise results in LPC bus access errors.
+ * This needs to be done before accessing the first Super-IO chip since
+ * the second chip may have been accessed prior to loading this driver.
+ *
+ * The problem is also reported to affect IT8795E, which is used on X299 boards
+ * and has the same chip ID as IT8792E (0x8733). It also appears to affect
+ * systems with IT8790E, which is used on some Z97X-Gaming boards as well as
+ * Z87X-OC.
+ *
+ * From other information supplied:
+ * ChipIDs 0x8733, 0x8695 (early ID for IT87952E) and 0x8790 are intialised
+ * by the BIOS and left in configuration mode, and entering and/or exiting
+ * configuration mode is what causes the crash.
+ *
+ * The recommendation is to look up the chipID before doing any mode swap
+ * and then act accordingly.
+ */
 /* SuperIO detection - will change isa_address if a chip is found */
 static int __init it87_find(int sioaddr, unsigned short *address,
 			    struct it87_sio_data *sio_data, int chip_cnt)
@@ -2674,16 +2695,25 @@ static int __init it87_find(int sioaddr, unsigned short *address,
 	int err;
 	u16 chip_type;
 	const struct it87_devices *config = NULL;
+	bool opened = false;
 
-	err = superio_enter(sioaddr, false);
+	/* First step, lock memory but don't enter configuration mode */
+	err = superio_enter(sioaddr, true);
 	if (err)
 		return err;
 
 	err = -ENODEV;
 	chip_type = superio_inw(sioaddr, DEVID);
-	/* check first for a valid chip before forcing chip id */
-	if (chip_type == 0xffff)
-		goto exit;
+	/* Check for a valid chip before forcing chip id */
+	if (chip_type == 0xffff) {
+		/* Enter configuration mode */
+		__superio_enter(sioaddr);
+		opened = true;
+		/* and then try again */
+		chip_type = superio_inw(sioaddr, DEVID);
+		if (chip_type == 0xffff)
+			goto exit;
+	}
 
 	if (force_id_cnt == 1) {
 		/* If only one value given use for all chips */
@@ -2767,6 +2797,18 @@ static int __init it87_find(int sioaddr, unsigned short *address,
 
 	config = &it87_devices[sio_data->type];
 
+	/*
+	 * If previously we didn't enter configuration mode and it isn't a
+	 * chip we know is initialised by the BIOS, then enter configuration
+	 * mode.
+	 *
+	 * I don't know if any such chips can exist but be defensive.
+	 */
+	if (!opened && !has_conf_biosopen(config)) {
+		__superio_enter(sioaddr);
+		opened = true;
+	}
+
 	superio_select(sioaddr, PME);
 	if (!(superio_inb(sioaddr, IT87_ACT_REG) & 0x01)) {
 		pr_info("Device (chip %s ioreg 0x%x) not activated, skipping\n",
@@ -3144,7 +3186,7 @@ static int __init it87_find(int sioaddr, unsigned short *address,
 	}
 
 exit:
-	superio_exit(sioaddr, config ? has_conf_biosopen(config) : false);
+	superio_exit(sioaddr, opened && config && has_conf_biosopen(config));
 	return err;
 }
 
-- 
2.44.0


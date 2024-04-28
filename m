Received: from bits.crawford.emu.id.au (bits.crawford.emu.id.au [116.255.43.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35EDB79CF
	for <linux-hwmon@vger.kernel.org>; Sun, 28 Apr 2024 06:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.255.43.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714284269; cv=none; b=ul9NLpRtuE3YfZJSb56Nat49brTyLDYFaekCkOY0INlNGtpoIli/mmKvuac7DCxN5vRmY9+zzP8eBil2a3iqlNEIOn1p5rby8oE45SApuTm4Ezyyo5SmG+rwmOkko+PmHAhEY+nqK6JrwiWTgDHi1xacxAW706yDCPr6myTs7cI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714284269; c=relaxed/simple;
	bh=rkZ57KKgqY32j1XCo+3uwKYfr37h+dohTtq+wQTqE/A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cpMY4Q3qXV459wAPksDTffTnWhqyswxkG2VzfAiI681LsfWnJcgf8kYkAMPN+yWKdVubLRWMIANKQt2REszX3zkGlM0dKhReGINY1ny6i3vztpshr1/H+YMOKVYLklYMkzoy2eNJic8EXn9EOXsTjdud2aYIVvowQX7n9rRZVvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=crawford.emu.id.au; spf=pass smtp.mailfrom=crawford.emu.id.au; dkim=pass (2048-bit key) header.d=crawford.emu.id.au header.i=@crawford.emu.id.au header.b=BzlNVWrW; arc=none smtp.client-ip=116.255.43.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=crawford.emu.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crawford.emu.id.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=crawford.emu.id.au header.i=@crawford.emu.id.au header.b="BzlNVWrW"
Received: from agc.crawford.emu.id.au (agc.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc07])
	(authenticated bits=0)
	by bits.crawford.emu.id.au (8.17.2/8.17.2) with ESMTPSA id 43S63jt23523223
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Sun, 28 Apr 2024 16:04:06 +1000
Authentication-Results: bits.crawford.emu.id.au; arc=none smtp.remote-ip=fdd2:7aad:d478:1::cb10:cc07
DKIM-Filter: OpenDKIM Filter v2.11.0 bits.crawford.emu.id.au 43S63jt23523223
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crawford.emu.id.au;
	s=s1; t=1714284246; bh=2Z0MtEU7YbNI2zjdvPxG5ztWsQX6kO0+PjhsVIETdqw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BzlNVWrW4C+0A78tiX3Y+Q6qkVIpQgmF1xEPQNulWqlfhhklLev6b02YKJ6rR7eT2
	 JxKr0hNJmlSnFNu0bauEGSJerjr7KbAFD6a1cA3GujiKN0aZWN9nYRo1+gVdwcY9wW
	 vWjQ5CP/A8OwSPoE8NAk8k7FXFlmZXcaa71msbrtFGlIUh5ULArWzk140IbxtZEsvB
	 H2a76YxG6H4MnIvaNy0i4hpNqzrONV2mzb7Igq28FcuwmoS7HXPz3O882z4eecMNO7
	 M5OQx+wEA7K0LPcmZd8Ub5T2QOuIVRDsFh78dGcO6fQMEmKbMsk9eG23MZQY1U3Ntd
	 CVBL8jatVvDGA==
From: Frank Crawford <frank@crawford.emu.id.au>
To: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, Frank Crawford <frank@crawford.emu.id.au>
Subject: [PATCH v3 3/4] hwmon (it87): Test for chipset before entering configuration mode
Date: Sun, 28 Apr 2024 16:03:28 +1000
Message-ID: <20240428060343.2424176-4-frank@crawford.emu.id.au>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240428060343.2424176-1-frank@crawford.emu.id.au>
References: <20240428060343.2424176-1-frank@crawford.emu.id.au>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.4 (bits.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc01]); Sun, 28 Apr 2024 16:04:06 +1000 (AEST)
X-Virus-Scanned: clamav-milter 1.0.5 at bits.crawford.emu.id.au
X-Virus-Status: Clean

Major part of the change for the new method to avoid chipset issues.

The actual update does the following:

1) Lock the memory, but does not perform a SIO entry (previously it
would have performed an SIO entry).

2) Attempt to read the chipID.  This should be safe no matter which
chip we have.

3) If step (2) fails, then perform SIO entry and retry chipID read.  For
older chips and on failure it acts similarly to prior to this patch.

4) Set the sio_data->type, similar to previously.

5) If we have not performed an SIO entry, and this is not a chip type
with the NOCONF feature, then it will perform an SIO entry at this
point.

6) Proceed with setup as prior to this patch.

7) Any following access to the SIO registers will invoke the SIO entry
and SIO exit steps unless it is a chip with the NOCONF feature set.
This was set up in the previous patches in this patchset.

8) Update to the exit based on if it had performed a SIO entry or not.

Signed-off-by: Frank Crawford <frank@crawford.emu.id.au>
---

v2:
 * rename macro from has_conf_biosopen to has_noconf.
 * improve patch documentation on new test of chipID.

v3:
 * rename variable from opened to enabled.
 * corrected final call to superio_exit().
 * minor update to patch documentation.

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
+ * and left in configuration mode, and entering and/or exiting configuration
+ * mode is what causes the crash.
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
+	bool enabled = false;
 
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
+		enabled = true;
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
+	 * chip we know is initialised in configuration mode, then enter
+	 * configuration mode.
+	 *
+	 * I don't know if any such chips can exist but be defensive.
+	 */
+	if (!enabled && !has_noconf(config)) {
+		__superio_enter(sioaddr);
+		enabled = true;
+	}
+
 	superio_select(sioaddr, PME);
 	if (!(superio_inb(sioaddr, IT87_ACT_REG) & 0x01)) {
 		pr_info("Device (chip %s ioreg 0x%x) not activated, skipping\n",
@@ -3144,7 +3186,7 @@ static int __init it87_find(int sioaddr, unsigned short *address,
 	}
 
 exit:
-	superio_exit(sioaddr, config ? has_noconf(config) : false);
+	superio_exit(sioaddr, !enabled);
 	return err;
 }
 
-- 
2.44.0


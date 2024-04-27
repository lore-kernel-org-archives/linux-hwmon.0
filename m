Received: from bits.crawford.emu.id.au (bits.crawford.emu.id.au [116.255.43.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12BCD43AB2
	for <linux-hwmon@vger.kernel.org>; Sat, 27 Apr 2024 08:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.255.43.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714207748; cv=none; b=AgUgbElHRtG9dqWDWUxNRnGqoSv9wFYxjO4QXLcn2duhVZNZSYw+S3JWQEVZLbcthCgTLwnG8D7ht7hBmyhXbfLogLnCCUX8ckDE/zl/ernrl26pKuDlMqPRaw1tm7GaGCR2meBIVCZDUSCTP6D6CLJO+0GxjERpcf9rQZzAxVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714207748; c=relaxed/simple;
	bh=V1hJ145P9A31MiXlRCV54Z7KFuwszuBFhjTD5OO5foM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qVmBgCHtjNhKh3W/N0CA0L6Eu7/Ys9TRKyJRZ/i5Q6aLBXsCaGs8R8fqFQe+cXt2LAeHrVXweOkSmrtuKiNqqiRwihSjj2UpHuAuZ/eh5283plqMCUGprsTZsZ4Uo7UuN+P4JO+JeC/YnOhQUc+SDBIq/IAsSGR8ooeGsqKh0+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=crawford.emu.id.au; spf=pass smtp.mailfrom=crawford.emu.id.au; dkim=pass (2048-bit key) header.d=crawford.emu.id.au header.i=@crawford.emu.id.au header.b=h7WJ8bPZ; arc=none smtp.client-ip=116.255.43.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=crawford.emu.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crawford.emu.id.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=crawford.emu.id.au header.i=@crawford.emu.id.au header.b="h7WJ8bPZ"
Received: from agc.crawford.emu.id.au (agc.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc07])
	(authenticated bits=0)
	by bits.crawford.emu.id.au (8.17.2/8.17.2) with ESMTPSA id 43R8XNSF3013858
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Sat, 27 Apr 2024 18:33:43 +1000
Authentication-Results: bits.crawford.emu.id.au; arc=none smtp.remote-ip=fdd2:7aad:d478:1::cb10:cc07
DKIM-Filter: OpenDKIM Filter v2.11.0 bits.crawford.emu.id.au 43R8XNSF3013858
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crawford.emu.id.au;
	s=s1; t=1714206823; bh=R/SBQk6lnazOQ4c4X+vU30o8eLlYWj96DN4T74sF0oM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=h7WJ8bPZKe6kb6tv3LLmI2Z9oAJoyPHAHYs5lyz9GRX6wRAIROj4xGNuM6m8v5qyW
	 43KrvZHI080x4uiYanBI6/lm/5RhpThftwLoX1bsfRucnA0BalnEMGWjs9op9D//GK
	 DreGSnmAbu67i61ToSlFWfvxanuEvaZr7VWBNo1MXz+Lr2mzq2YU2uOgC93Jc1E2OI
	 PnYwD3uhwekSHYuml3+5FEp/Z7eNiPlWqK2k45O2YF3za1iCN+6KOcYdteBImhQYAK
	 IhCgJgvRjsEd/1IJZLfWuPLQo8J4n+g0cYN8wGpBhcK23DtDjbHjQoUVYTngUUPX6Y
	 rnoS+a/1Er3zg==
From: Frank Crawford <frank@crawford.emu.id.au>
To: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, Frank Crawford <frank@crawford.emu.id.au>
Subject: [PATCH v2 3/4] hwmon (it87): Test for chipset before entering configuration mode
Date: Sat, 27 Apr 2024 18:33:04 +1000
Message-ID: <20240427083317.2077175-4-frank@crawford.emu.id.au>
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
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.4 (bits.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc01]); Sat, 27 Apr 2024 18:33:43 +1000 (AEST)
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

8) There is also some minor update to the failure exit based on if it
had performed a SIO entry or not, in addition to the previous tests.

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
+	 * chip we know is initialised in configuration mode, then enter
+	 * configuration mode.
+	 *
+	 * I don't know if any such chips can exist but be defensive.
+	 */
+	if (!opened && !has_noconf(config)) {
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
-	superio_exit(sioaddr, config ? has_noconf(config) : false);
+	superio_exit(sioaddr, opened && config && has_noconf(config));
 	return err;
 }
 
-- 
2.44.0


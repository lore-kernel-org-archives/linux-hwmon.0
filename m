Received: from bits.crawford.emu.id.au (bits.crawford.emu.id.au [203.132.92.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAB4A7F
	for <linux-hwmon@vger.kernel.org>; Mon,  1 Apr 2024 02:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.132.92.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711940235; cv=none; b=GDi0MQ0ld5dNIxbgRZE0sSBMGeFjcQes00/uFc7Q8RfgwX1mNJkaZwU1WB1YylPMkGpk3t3XXuXwvhL6mHYNO03oU8R29AwTTR8XI+5M5/7yfpAdQ1Y6W5d3bQHJ+H8T9a9wxYYC6d93K2CmBkJ3QOmNHCWZtKTOTEBbV46fVoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711940235; c=relaxed/simple;
	bh=OSSb/O5csrUyqjFr6utKFsOCrRYwe1jZIwjRdt3sWrM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Yd59PI+Mif1ixLvZVjq0XHsDaZqQmn6oro/L3lLEK0jpaV7BfsVf7B+NRPvAebE7asPLalzDDw7zfFNVHGdTbtznZEFjtqWsN9zLPgeN8HntcPeprcqPl6U1Pc2bMcqY6VXHezUGY3aZ9KZTEkCQNwbWlITPUc9E8TQPYitmp6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=crawford.emu.id.au; spf=pass smtp.mailfrom=crawford.emu.id.au; dkim=pass (2048-bit key) header.d=crawford.emu.id.au header.i=@crawford.emu.id.au header.b=sHyuFZV5; arc=none smtp.client-ip=203.132.92.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=crawford.emu.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crawford.emu.id.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=crawford.emu.id.au header.i=@crawford.emu.id.au header.b="sHyuFZV5"
Received: from agc.crawford.emu.id.au (agc.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc07])
	(authenticated bits=0)
	by bits.crawford.emu.id.au (8.17.2/8.17.2) with ESMTPSA id 4312uQwn871729
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Mon, 1 Apr 2024 13:56:48 +1100
Authentication-Results: bits.crawford.emu.id.au; arc=none smtp.remote-ip=fdd2:7aad:d478:1::cb10:cc07
DKIM-Filter: OpenDKIM Filter v2.11.0 bits.crawford.emu.id.au 4312uQwn871729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crawford.emu.id.au;
	s=s1; t=1711940208; bh=tyiK63EQJyv2V2245oIrzzcXln0HwFK88tDu8y2Umoo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sHyuFZV5DsQ3FBMNCCz5h2b13sjnARczn579CedVEi5pIEah0F/E9NB8b1ZhQxj6B
	 WrJ7xXy5Aw9aQCQwrN/dKcveKS0RoHGhSGYJ7WjqcCWyl5gMEt+swsuXCkj5800aK5
	 t8LL5gnAUsbULZ/UpoJbUzYAMw8LK2ohLSc7xAt6QSceQbCoWkN35IHiSD4P4Hqgw8
	 vlLPXeKZnu58FWJVmtRK2PEWoESZNkwe7lI+ofQT07APgyxsM2Wz4NTSBkufhU3x/E
	 Bxd/s+h3RC7qdZgtbpi8MYshMrRbotEzT2OqfkAcXUXLNfSrYuVhjzrUdlagr7pANk
	 /IgdN83sAMBjQ==
From: Frank Crawford <frank@crawford.emu.id.au>
To: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, Frank Crawford <frank@crawford.emu.id.au>
Subject: [PATCH v1 4/4] hwmon (it87): Remove tests no longer required
Date: Mon,  1 Apr 2024 13:56:06 +1100
Message-ID: <20240401025620.205068-5-frank@crawford.emu.id.au>
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
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.4 (bits.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc01]); Mon, 01 Apr 2024 13:56:48 +1100 (AEDT)
X-Virus-Scanned: clamav-milter 1.0.5 at bits.crawford.emu.id.au
X-Virus-Status: Clean
X-Spam-Level: *

Remove DMI tests for boards that are known to have issues with entering
configuration mode, as now we are testing the chips directly and no
longer need to rely on matching the board.

Leave the DMI table in place, for the nVIDIA board, and any future
expansions.

Signed-off-by: Frank Crawford <frank@crawford.emu.id.au>
---
 drivers/hwmon/it87.c | 48 --------------------------------------------
 1 file changed, 48 deletions(-)

diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
index 6a77f2f6e1e1..b850eb3e5907 100644
--- a/drivers/hwmon/it87.c
+++ b/drivers/hwmon/it87.c
@@ -3683,27 +3683,6 @@ static int it87_dmi_cb(const struct dmi_system_id *dmi_entry)
 	return 1;
 }
 
-/*
- * On various Gigabyte AM4 boards (AB350, AX370), the second Super-IO chip
- * (IT8792E) needs to be in configuration mode before accessing the first
- * due to a bug in IT8792E which otherwise results in LPC bus access errors.
- * This needs to be done before accessing the first Super-IO chip since
- * the second chip may have been accessed prior to loading this driver.
- *
- * The problem is also reported to affect IT8795E, which is used on X299 boards
- * and has the same chip ID as IT8792E (0x8733). It also appears to affect
- * systems with IT8790E, which is used on some Z97X-Gaming boards as well as
- * Z87X-OC.
- * DMI entries for those systems will be added as they become available and
- * as the problem is confirmed to affect those boards.
- */
-static int it87_sio_force(const struct dmi_system_id *dmi_entry)
-{
-	__superio_enter(REG_4E);
-
-	return it87_dmi_cb(dmi_entry);
-};
-
 /*
  * On the Shuttle SN68PT, FAN_CTL2 is apparently not
  * connected to a fan, but to something else. One user
@@ -3726,34 +3705,7 @@ static struct it87_dmi_data nvidia_fn68pt = {
 		.driver_data = data, \
 	}
 
-#define IT87_DMI_MATCH_GBT(name, cb, data) \
-	IT87_DMI_MATCH_VND("Gigabyte Technology Co., Ltd.", name, cb, data)
-
 static const struct dmi_system_id it87_dmi_table[] __initconst = {
-	IT87_DMI_MATCH_GBT("AB350", it87_sio_force, NULL),
-		/* ? + IT8792E/IT8795E */
-	IT87_DMI_MATCH_GBT("AX370", it87_sio_force, NULL),
-		/* ? + IT8792E/IT8795E */
-	IT87_DMI_MATCH_GBT("Z97X-Gaming G1", it87_sio_force, NULL),
-		/* ? + IT8790E */
-	IT87_DMI_MATCH_GBT("TRX40 AORUS XTREME", it87_sio_force, NULL),
-		/* IT8688E + IT8792E/IT8795E */
-	IT87_DMI_MATCH_GBT("Z390 AORUS ULTRA-CF", it87_sio_force, NULL),
-		/* IT8688E + IT8792E/IT8795E */
-	IT87_DMI_MATCH_GBT("B550 AORUS PRO AC", it87_sio_force, NULL),
-		/* IT8688E + IT8792E/IT8795E */
-	IT87_DMI_MATCH_GBT("X570 AORUS MASTER", it87_sio_force, NULL),
-		/* IT8688E + IT8792E/IT8795E */
-	IT87_DMI_MATCH_GBT("X570 AORUS PRO", it87_sio_force, NULL),
-		/* IT8688E + IT8792E/IT8795E */
-	IT87_DMI_MATCH_GBT("X570 AORUS PRO WIFI", it87_sio_force, NULL),
-		/* IT8688E + IT8792E/IT8795E */
-	IT87_DMI_MATCH_GBT("X570S AERO G", it87_sio_force, NULL),
-		/* IT8689E + IT87952E */
-	IT87_DMI_MATCH_GBT("Z690 AORUS PRO DDR4", it87_sio_force, NULL),
-		/* IT8689E + IT87952E */
-	IT87_DMI_MATCH_GBT("Z690 AORUS PRO", it87_sio_force, NULL),
-		/* IT8689E + IT87952E */
 	IT87_DMI_MATCH_VND("nVIDIA", "FN68PT", it87_dmi_cb, &nvidia_fn68pt),
 	{ }
 
-- 
2.44.0

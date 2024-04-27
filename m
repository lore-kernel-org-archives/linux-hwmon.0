Received: from bits.crawford.emu.id.au (bits.crawford.emu.id.au [116.255.43.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D75D43AA2
	for <linux-hwmon@vger.kernel.org>; Sat, 27 Apr 2024 08:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.255.43.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714207742; cv=none; b=HvB+dSE/umSowWL0GyxPSU8f8x7OK1dQQvtzY5vfftnYlU6DT6t/TkhT0G8a8egpfV1Wf9d9Jm/lVBsaianUUBpF+q5EpHLg88sQGAqSNCVht+U111rFXiRSDnrm50FF9PNIeRQswrfUozeSUEJ+iv+c4noggxeX8B5K1n2eOGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714207742; c=relaxed/simple;
	bh=24Re6KjVeqrdoztZvZKvHd9XONoUcmsW1sXMxxsjVmQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HG88C1CMM2cwUAM8UyOtTf/qYJ0wjrxbFfAGZNyVaHRV2QvFYwzyiXDFB6GaqeRM78UjokxPub3Po99s5voY9+wmrmLTF5ZaD3tyk3nCwqaRszHkCmZS241YreM8iONmM7MKZYX4q+3K/luktRbyxMGYOv9t6L0irSny+q8Pj5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=crawford.emu.id.au; spf=pass smtp.mailfrom=crawford.emu.id.au; dkim=pass (2048-bit key) header.d=crawford.emu.id.au header.i=@crawford.emu.id.au header.b=g3KbmRea; arc=none smtp.client-ip=116.255.43.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=crawford.emu.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crawford.emu.id.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=crawford.emu.id.au header.i=@crawford.emu.id.au header.b="g3KbmRea"
Received: from agc.crawford.emu.id.au (agc.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc07])
	(authenticated bits=0)
	by bits.crawford.emu.id.au (8.17.2/8.17.2) with ESMTPSA id 43R8XNSE3013858
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Sat, 27 Apr 2024 18:33:40 +1000
Authentication-Results: bits.crawford.emu.id.au; arc=none smtp.remote-ip=fdd2:7aad:d478:1::cb10:cc07
DKIM-Filter: OpenDKIM Filter v2.11.0 bits.crawford.emu.id.au 43R8XNSE3013858
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crawford.emu.id.au;
	s=s1; t=1714206820; bh=5KXn9S0TnHteCe182jaH/j/bgkbBuj/Eo5AFjuT/xE4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=g3KbmRea3YkNVYRtTnRquDDuDyBzv2w6CxaOZuk/FVtB2S2JbsoMwUsq83/woutRZ
	 zsBe7FkC6r2GhdDWIIl1DayO7dC8WPncajY9iHfye6AMwMP2/NssEi2S3KbM+JR77Z
	 4DP6Cf0Jqo+jtG6Y1wI/kgZUYVfIEkiUF6y/DT61i75hMKtBWUhg3E6TUtInB2WC7P
	 WnTQfPo+FMlNt3eiHYdzl+nS9tHlbC3Yi6qM+4ojgi6a3KZWS38fcQ9btakc0KmsgF
	 h0xaKRy7Dl47dJJRqlH9TWTIpAgpiFOjZ/6VmvJ84DVbiVHJJxiLl2/5iopxZwsWbI
	 AiC47cBY4b10Q==
From: Frank Crawford <frank@crawford.emu.id.au>
To: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, Frank Crawford <frank@crawford.emu.id.au>
Subject: [PATCH v2 2/4] hwmon (it87): Do not enter configuration mode for some chiptypes
Date: Sat, 27 Apr 2024 18:33:03 +1000
Message-ID: <20240427083317.2077175-3-frank@crawford.emu.id.au>
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
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.4 (bits.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc01]); Sat, 27 Apr 2024 18:33:40 +1000 (AEST)
X-Virus-Scanned: clamav-milter 1.0.5 at bits.crawford.emu.id.au
X-Virus-Status: Clean

Update the configuration mode entry code to allow conditional entry, and
apply to all calls.

Signed-off-by: Frank Crawford <frank@crawford.emu.id.au>
---
 drivers/hwmon/it87.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
index 6eeba3a01e3c..396c2d3afbf7 100644
--- a/drivers/hwmon/it87.c
+++ b/drivers/hwmon/it87.c
@@ -117,7 +117,7 @@ static inline void superio_select(int ioreg, int ldn)
 	outb(ldn, ioreg + 1);
 }
 
-static inline int superio_enter(int ioreg)
+static inline int superio_enter(int ioreg, bool noentry)
 {
 	/*
 	 * Try to reserve ioreg and ioreg + 1 for exclusive access.
@@ -125,7 +125,8 @@ static inline int superio_enter(int ioreg)
 	if (!request_muxed_region(ioreg, 2, DRVNAME))
 		return -EBUSY;
 
-	__superio_enter(ioreg);
+	if (!noentry)
+		__superio_enter(ioreg);
 	return 0;
 }
 
@@ -742,7 +743,7 @@ static int smbus_disable(struct it87_data *data)
 	int err;
 
 	if (data->smbus_bitmap) {
-		err = superio_enter(data->sioaddr);
+		err = superio_enter(data->sioaddr, has_noconf(data));
 		if (err)
 			return err;
 		superio_select(data->sioaddr, PME);
@@ -758,7 +759,7 @@ static int smbus_enable(struct it87_data *data)
 	int err;
 
 	if (data->smbus_bitmap) {
-		err = superio_enter(data->sioaddr);
+		err = superio_enter(data->sioaddr, has_noconf(data));
 		if (err)
 			return err;
 
@@ -2674,7 +2675,7 @@ static int __init it87_find(int sioaddr, unsigned short *address,
 	u16 chip_type;
 	const struct it87_devices *config = NULL;
 
-	err = superio_enter(sioaddr);
+	err = superio_enter(sioaddr, false);
 	if (err)
 		return err;
 
@@ -3520,7 +3521,7 @@ static void it87_resume_sio(struct platform_device *pdev)
 	if (!data->need_in7_reroute)
 		return;
 
-	err = superio_enter(data->sioaddr);
+	err = superio_enter(data->sioaddr, has_noconf(data));
 	if (err) {
 		dev_warn(&pdev->dev,
 			 "Unable to enter Super I/O to reroute in7 (%d)",
-- 
2.44.0


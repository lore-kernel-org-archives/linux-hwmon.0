Received: from bits.crawford.emu.id.au (bits.crawford.emu.id.au [116.255.43.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C96873C38
	for <linux-hwmon@vger.kernel.org>; Sun, 28 Apr 2024 06:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.255.43.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714284455; cv=none; b=ogzd3DDdH4ZN1GILSxjZqA265jtFaoY4AWP6WNn12786yz6HF9znwjWhapEv2zZUJuGuv1r8qCpdMUTTiQXEjT9d83HdhNsEOpvXPmydgjB5Y6I6Dc3aNGuEuWsb9Aohfy+RnaPOT7p9G62LH1xXy8dsaFjwvBS7GbjOlXluQTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714284455; c=relaxed/simple;
	bh=0nM+LTwTwhUdvzpFTak3fF6Isl56rE/eM++mK66npRk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bNTO4WDSVrSm2vLmw9LAWlCVTNJFY5AZIo5rgdUzkcRF4WuBAdwx4L6TXk8d23CQB8+fyrvKmrlhzHE5alfxjRQ9uh7XRIf0WwMs+Lfl+FXvRyV8ZYMUH6sXpuumt7XzdDaLiUPqOunCKI12QCF7u20Ym8MllIY0W6UKU8fs6RI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=crawford.emu.id.au; spf=pass smtp.mailfrom=crawford.emu.id.au; dkim=pass (2048-bit key) header.d=crawford.emu.id.au header.i=@crawford.emu.id.au header.b=G+N1nwNB; arc=none smtp.client-ip=116.255.43.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=crawford.emu.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crawford.emu.id.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=crawford.emu.id.au header.i=@crawford.emu.id.au header.b="G+N1nwNB"
Received: from agc.crawford.emu.id.au (agc.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc07])
	(authenticated bits=0)
	by bits.crawford.emu.id.au (8.17.2/8.17.2) with ESMTPSA id 43S66tnu3524336
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Sun, 28 Apr 2024 16:07:11 +1000
Authentication-Results: bits.crawford.emu.id.au; arc=none smtp.remote-ip=fdd2:7aad:d478:1::cb10:cc07
DKIM-Filter: OpenDKIM Filter v2.11.0 bits.crawford.emu.id.au 43S66tnu3524336
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crawford.emu.id.au;
	s=s1; t=1714284431; bh=0MlWyBXdsciIcO1hCKA1rRHNDMbVodx+zu9R6K0XjDo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=G+N1nwNB7d864vDFkiDKiLFo7Fb0CfOQVjR7Y3W6xj/Tt5cmeNdQ1NkPfsJmrrUKx
	 ArV5I/yanK6g9DS1dfzLHV9NGFO/Jjdp0uZCRKY+bOqfKZ9J3hYzjgNhFGFVOBa538
	 a0lYrwfmvuJliY8QVBu9iW3jkEgOttVUKgh2F3OAQsgM3NoEWG1jba48ztoCCSqYyw
	 sw6CMR99jDEyGkrDa1Xnqw+nAt8mzwO9VzfNv5/FUqNV1WrDyqesEMVKlzok1CmK0K
	 tTidR4h1Wjs/3QHdTAYz/OX3b/YEeq0YdpnUR2qmk4gOfm9wRAJZ7j12Wx7ddeaoI0
	 aiaAJnR2aNGxQ==
From: Frank Crawford <frank@crawford.emu.id.au>
To: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, Frank Crawford <frank@crawford.emu.id.au>
Subject: [PATCH v3 2/4] hwmon (it87): Do not enter configuration mode for some chiptypes
Date: Sun, 28 Apr 2024 16:06:34 +1000
Message-ID: <20240428060653.2425296-3-frank@crawford.emu.id.au>
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
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.4 (bits.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc01]); Sun, 28 Apr 2024 16:07:11 +1000 (AEST)
X-Virus-Scanned: clamav-milter 1.0.5 at bits.crawford.emu.id.au
X-Virus-Status: Clean

Update the configuration mode entry code to allow conditional entry, and
apply to all calls.

Signed-off-by: Frank Crawford <frank@crawford.emu.id.au>
---

v2:
 * change macro name from has_conf_biosopen to has_noconf.

v3:
 * no change.

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


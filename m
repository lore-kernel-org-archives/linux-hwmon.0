Received: from bits.crawford.emu.id.au (bits.crawford.emu.id.au [203.132.92.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 454D4C8DE
	for <linux-hwmon@vger.kernel.org>; Mon,  1 Apr 2024 03:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.132.92.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711940489; cv=none; b=f5yKONuX+hrp/j1xAfjGm6IrW5jGjwohG17UyMXcSJCbK4XFmEoh5YWp2mTkXuH9VgAz31fFoAb4L7MIm5VaO37Q0xeRrXzpgpC8t2uD/xHoe3MVa8oM2QKpSH0ftDw5A/c8sxAPnjmz5hd3e3cET3vAw6PTcvNmdOA6JR91Vvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711940489; c=relaxed/simple;
	bh=EQriTeQpu48knMMXljLPrgKBn5rc/jRs5Wyk6h3ggfI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FUsc6CA3a+/fw2RhKl/9oCdRV8am4UYkR9BP16ZOMSZARTfwo2BFc68Us8dlNHKSmBjNnnsjftW6fv6xZ+MfWlbEWfkxXRflDCpOP4pm88Pbzel+oLAepf40sFngSzDu+m+PVRQUXgv0Zm4WIMYH3RO8Wu0MpkMDnU/YNxgxNzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=crawford.emu.id.au; spf=pass smtp.mailfrom=crawford.emu.id.au; dkim=pass (2048-bit key) header.d=crawford.emu.id.au header.i=@crawford.emu.id.au header.b=DQy6obEH; arc=none smtp.client-ip=203.132.92.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=crawford.emu.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crawford.emu.id.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=crawford.emu.id.au header.i=@crawford.emu.id.au header.b="DQy6obEH"
Received: from agc.crawford.emu.id.au (agc.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc07])
	(authenticated bits=0)
	by bits.crawford.emu.id.au (8.17.2/8.17.2) with ESMTPSA id 4312uQwl871729
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Mon, 1 Apr 2024 13:56:41 +1100
Authentication-Results: bits.crawford.emu.id.au; arc=none smtp.remote-ip=fdd2:7aad:d478:1::cb10:cc07
DKIM-Filter: OpenDKIM Filter v2.11.0 bits.crawford.emu.id.au 4312uQwl871729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crawford.emu.id.au;
	s=s1; t=1711940201; bh=Y+ZGKMRg8WEdq4mqw0G+QgyMZYlqgl1pSnPwq3qnklk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DQy6obEHsTGWZHWKsuj443ulwVdLzc90w1tXibnm75yxQzVCy7B6FlYW3gK5gmYCw
	 u+3NEgX2BZw8dWBBmkMHI5PC95Kbg3dRjJJetJBR+l4y+fqchsCUFcZtOX9s+9U7sp
	 Xyj+Eu1dwnyHUzlR64QEgKu2ckg0Vzn8S+KKvwHP34R4iWeaPfmIqcLo12g9PO7EOS
	 IrJK2LzmCP/3vhVEpxqmJ4VYAj+iv6G6gcMyng9PmyK+WWpyFsFqIICDTBYBQ4Yb5l
	 wHvqHwS/5a8HDoLTwEVx/NK0AOy/hHXDCfjZQvvQtSNAxQ+hkaJgG9TyLS08J+bK1u
	 9WFHdY5C78M2g==
From: Frank Crawford <frank@crawford.emu.id.au>
To: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, Frank Crawford <frank@crawford.emu.id.au>
Subject: [PATCH v1 2/4] hwmon (it87): Do not enter configuration mode for some chip types
Date: Mon,  1 Apr 2024 13:56:04 +1100
Message-ID: <20240401025620.205068-3-frank@crawford.emu.id.au>
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
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.4 (bits.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc01]); Mon, 01 Apr 2024 13:56:41 +1100 (AEDT)
X-Virus-Scanned: clamav-milter 1.0.5 at bits.crawford.emu.id.au
X-Virus-Status: Clean
X-Spam-Level: *

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
+		err = superio_enter(data->sioaddr, has_conf_biosopen(data));
 		if (err)
 			return err;
 		superio_select(data->sioaddr, PME);
@@ -758,7 +759,7 @@ static int smbus_enable(struct it87_data *data)
 	int err;
 
 	if (data->smbus_bitmap) {
-		err = superio_enter(data->sioaddr);
+		err = superio_enter(data->sioaddr, has_conf_biosopen(data));
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
+	err = superio_enter(data->sioaddr, has_conf_biosopen(data));
 	if (err) {
 		dev_warn(&pdev->dev,
 			 "Unable to enter Super I/O to reroute in7 (%d)",
-- 
2.44.0


Received: from bits.crawford.emu.id.au (bits.crawford.emu.id.au [116.255.43.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75E8579CF
	for <linux-hwmon@vger.kernel.org>; Sun, 28 Apr 2024 06:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.255.43.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714284266; cv=none; b=ge7KNJ3ePonlK3Gtcs3KzINpADhR3MC3S+hDmqwvke/MBRFRNlCaMkGhOslThsNRUJDSeTYlgdkNxuE2Rtybr2+jXwUrMUpdoSSmedRifGLGCZWh5Mjv2kl6LvbEoPaALRIZ3fUe6jCeFhgM3TLJJ7v9yGm2Jz0DXH1GRIsSR/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714284266; c=relaxed/simple;
	bh=0nM+LTwTwhUdvzpFTak3fF6Isl56rE/eM++mK66npRk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cu91gW2ymTaVVhc86WmNmSS0fcJkYHrg/Cf6nWtlj/5p4ovOr9znIfVgLEiqc1EutF/ZJGuejqWmd6BZst+RTIZ3XqS2NCQEvGHmXhyqWBkcjMnnv4FC49YLy5XrBwrbLU7MpM7VZApIYFvQxA40zKLO3Hugyw2Tmp5jqsVOR3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=crawford.emu.id.au; spf=pass smtp.mailfrom=crawford.emu.id.au; dkim=pass (2048-bit key) header.d=crawford.emu.id.au header.i=@crawford.emu.id.au header.b=BEzQqzsr; arc=none smtp.client-ip=116.255.43.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=crawford.emu.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crawford.emu.id.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=crawford.emu.id.au header.i=@crawford.emu.id.au header.b="BEzQqzsr"
Received: from agc.crawford.emu.id.au (agc.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc07])
	(authenticated bits=0)
	by bits.crawford.emu.id.au (8.17.2/8.17.2) with ESMTPSA id 43S63jt13523223
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Sun, 28 Apr 2024 16:04:02 +1000
Authentication-Results: bits.crawford.emu.id.au; arc=none smtp.remote-ip=fdd2:7aad:d478:1::cb10:cc07
DKIM-Filter: OpenDKIM Filter v2.11.0 bits.crawford.emu.id.au 43S63jt13523223
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crawford.emu.id.au;
	s=s1; t=1714284242; bh=0MlWyBXdsciIcO1hCKA1rRHNDMbVodx+zu9R6K0XjDo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BEzQqzsrFXIgQMnCXV5IEpXwrwIMpQVX46G9ifQBVUnyyuJhtGrChTZepB6raZVav
	 s+KgsQA+LtaGD5/G7Gx7+5PtNeCUvGWSkaT+a2QkqclspS4s5u0HPrGprkoTZroXIj
	 nw0PX+Q6eB5roPMH9NhwPP4vVPxZXdLJHzQw/5s5zeTObtbi6LTFmWJ/Lfplx4Myc/
	 YBUYRkLoe3YBvVZJ0LI7tARG9Sv9s1UoseWDzjLHeK5yqIcVRTxXwbXsgnejECpwXo
	 xa5yMjERzZDPkHCLxko7ulEwEU4ylVF26dJ3KK17MNZ+Aar6qyuEKUEH2l5kG5QuHs
	 0tyBl/Hgta4HQ==
From: Frank Crawford <frank@crawford.emu.id.au>
To: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, Frank Crawford <frank@crawford.emu.id.au>
Subject: [PATCH v2 2/4] hwmon (it87): Do not enter configuration mode for some chiptypes
Date: Sun, 28 Apr 2024 16:03:27 +1000
Message-ID: <20240428060343.2424176-3-frank@crawford.emu.id.au>
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
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.4 (bits.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc01]); Sun, 28 Apr 2024 16:04:02 +1000 (AEST)
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


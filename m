Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.241.56.161
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794063992;
	b=la3pOFF7p8yB2jV5WSonOIXDvusxf3PPG9FRRst4pz4fRQc1tb+QoqGEyZx+vjHxSJdr
	 cQw9s54OOlFNVSXkrRnUa6RtLC5yOyPN2t0nrI3Xb9O7klY+94WDU11Sv4eZlLIPGc8B6
	 kH17ctA3Fkp2OKl6ZbD88UaZL8qr1xRepD8hbpvC28bIAzOBz9oZAHQHUyYcYkDMfAwYM
	 RGDfTmBHVb/p21/sfcCKq4TM2sP6WsbNmPL5sqBmi/RlJrUyG4n3fxwUaraiN26OzW2js
	 t3xSsa/8vB1pJmFhdlXjMGRyWKfFRRoz/b7n/byrelvPAGIEBqf/kIeXKYWE/J2MaaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794063992;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-Rspamd-Queue-Id;
	bh=aNl6N5aZvIYcmu8uPSEH2CIEocI5mNcKcn5UzSShfFE=;
	b=UognnyoTDqievvR24oZ8zyXXduICdtpyKilS7kQjz8XYRx9rpyIxiG2ycPRLoiE7FQ2x
	 5aAPKiOTH2g+qsZM0eIPW7xVIvk57jNqq2xhAZu4rf2D8e7dJEgc302w6AM2WYLRIiG9c
	 dw8czP67OwszKXOmXYtZi5Lu4JBvKZLrnVeS5oixBldBuqDalDLagRr1uAmhTX9OXujfS
	 KJViXX0NDFQCf7huiXPApCLei2EPIL2x3gDb3Cs/H84+Rk5xV5kbIeRF0i+OFnyxHTdZC
	 uHyx4b3TVFr0DdOxkv75PhrwWA9H4a8WKTHJPq83KX3YUffywOzALTENvtmlC/GXoyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bojanowski.me;
	spf=pass smtp.mailfrom=bojanowski.me;
	dkim=pass header.d=bojanowski.me header.i=@bojanowski.me header.a=rsa-sha256 header.s=MBO0001 header.b=mO6Hho2W;
	arc=none smtp.remote-ip=80.241.56.161
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23D4D606D83C;
	Sat,  7 Nov 2026 15:06:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23D4D606D83C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bojanowski.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bojanowski.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bojanowski.me header.i=@bojanowski.me header.a=rsa-sha256 header.s=MBO0001 header.b=mO6Hho2W
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4jMKBP0pbDzKnRH;
	Sat, 07 Nov 2026 16:06:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bojanowski.me;
	s=MBO0001; t=1794063981;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=aNl6N5aZvIYcmu8uPSEH2CIEocI5mNcKcn5UzSShfFE=;
	b=mO6Hho2Wn/x/gP8L9WrgszrwSwMdcZ99DfLP79uoCA9gyCtmpFWoSr2sohn7pSVMRg9GUD
	TOT1Eth2C7M4ixYNcxnVAt9+uSjmFogmU5AGdC0RBC/PqrhxBRAExluU3Nivcw/+ivwscM
	5/UM/AqvPquxKnyWw4jRDZHNl/iq5zdLHJ+hcFpCHtgqHm3m0pmOo6lDBtP2J3LQB3DcLI
	zAgui+JVBvGkKvGqVZVsh90EAmzUpzdz0xLyPbAVu5htJGVxRNTOAZqh0udzWPK0uFQrLT
	Cth9dXHRXzExQEaShtOBqzNsQSrEi5S+irgXjQvS6DRPzo0qbzZHd3+8nPLCDg==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of tomasz@bojanowski.me designates 2001:67c:2050:b231:465::1 as permitted sender) smtp.mailfrom=tomasz@bojanowski.me
From: Tomasz Bojanowski <tomasz@bojanowski.me>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hamza Mahfooz <someguy@effective-light.com>
Subject: [PATCH] hwmon: (nct6683) Remove the 32 mV voltage scale
Date: Sat,  7 Nov 2026 16:06:19 +0100
Message-ID: <20261107150619.297999-1-tomasz@bojanowski.me>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4jMKBP0pbDzKnRH

in_from_reg() is meant to scale the VCC, VSB, AVSB and VBAT sources
by 32 mV, but show_in_reg() passes it the monitor channel of the first
three voltage sensors instead of the source of the sensor shown. The
32 mV case therefore never matches, and all voltages have been scaled
by 16 mV since commit 41082d66bfd6 ("hwmon: Driver for NCT6683D").

According to the datasheet, there is no 32 mV LSB. On an MSI MAG
B850M MORTAR WIFI (NCT6687D, customer ID 0x20d), VCC reads 3.31 V,
VSB and AVSB 3.34 V and VBAT 3.10 V with 16 mV. With 32 mV they would
read 6.6 V, 6.7 V and 6.2 V.

Drop the source argument and the 32 mV case. No functional change.

Link: https://lore.kernel.org/linux-hwmon/20261106144247.30507-1-tomasz@bojanowski.me/
Signed-off-by: Tomasz Bojanowski <tomasz@bojanowski.me>
---
On this board, CPU Vcore is connected to VIN4 (confirmed from the EC
monitor configuration registers) and reads 1.33-1.36 V with 16 mV
with the cores at 5.5 GHz, so a separate 8 mV scale for Vcore does
not apply here. I have no data from boards of other vendors.

 drivers/hwmon/nct6683.c | 18 ++++--------------
 1 file changed, 4 insertions(+), 14 deletions(-)

diff --git a/drivers/hwmon/nct6683.c b/drivers/hwmon/nct6683.c
index d0ae3daaf049..b5c5931d3dfe 100644
--- a/drivers/hwmon/nct6683.c
+++ b/drivers/hwmon/nct6683.c
@@ -503,20 +503,10 @@ nct6683_create_attr_group(struct device *dev,
 	return group;
 }
 
-/* LSB is 16 mV, except for the following sources, where it is 32 mV */
-#define MON_SRC_VCC	0x60
-#define MON_SRC_VSB	0x61
-#define MON_SRC_AVSB	0x62
-#define MON_SRC_VBAT	0x64
-
-static inline long in_from_reg(u16 reg, u8 src)
+/* LSB is 16 mV */
+static inline long in_from_reg(u8 reg)
 {
-	int scale = 16;
-
-	if (src == MON_SRC_VCC || src == MON_SRC_VSB || src == MON_SRC_AVSB ||
-	    src == MON_SRC_VBAT)
-		scale <<= 1;
-	return reg * scale;
+	return reg * 16;
 }
 
 static u16 nct6683_read(struct nct6683_data *data, u16 reg)
@@ -701,7 +691,7 @@ show_in_reg(struct device *dev, struct device_attribute *attr, char *buf)
 	int nr = sattr->nr;
 
 	return sprintf(buf, "%ld\n",
-		       in_from_reg(data->in[index][nr], data->in_index[index]));
+		       in_from_reg(data->in[index][nr]));
 }
 
 static umode_t nct6683_in_is_visible(struct kobject *kobj,
-- 
2.56.0


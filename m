Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7913E1A6817
	for <linux-hwmon@vger.kernel.org>; Fri,  4 Sep 2026 01:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788483709; cv=none; b=fbckwz7f4x/GvHBjXZnkngNThRJY1m/u8VAT91OGpEzNcVOVwieMDVvehSO/0+4UdxkfIfKK5lwUD/Q6Ss1Hh/EECXT4HRfuRuza4lywWx9OzYV82zvzGB7RSRLtGwoQi5FsegErSy9FDJ5h91WQq2Cc49ApVyYgcSFqGr1jlzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788483709; c=relaxed/simple;
	bh=qR5cExiPS9KyaHYAZsu33BfCpqnivwwfHuela8nEbJA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qXvf1K10w1zssNmQhEvq28zjdL7XANKVxzflaIkYwLCkBlCpPfNSAApdBEm3fstAP1k2IT7A2/TMu6xevwy87AgF+5mMGYPVh7/IRkVBjB3CvJWd1FpIBmTOt1TFCN+hoxCx1zX+wGpwjk2sWMGEZA8rwZFPa/sZUALiYw+jMNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=smRPWcJN; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="smRPWcJN"
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id E21DC2C06D3;
	Fri,  4 Sep 2026 12:53:56 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1788483236;
	bh=tS5IVUhZl3MhnvZyQVV7cXvwri1cCTVKG6/g9gtV6Jo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=smRPWcJNYCDwKuMBWaaESXD1+0kOKM6MHsIT796Lz5F5PeTtGtZTcyPTPcOtykkoE
	 qYTW07EIEjK8pIGPxsY1Oa25PxRHI/h4wIydRLa0h5ABpLr8+WR1C7QRqoHwhjnZkB
	 ZC6sF442rH2ipmzNQYG8wX8kB+T0hPtVQ8eF4MYOCW38u9LDPiUmEpR7LctpSrs76b
	 srtM4lBEEDiTmzqWDtd6n//rqLsUMlweT7BSV2AumCBIr+6VWwk06oV74IQlHZoQBL
	 uQlbNbQwlDO7WNW2154weBdL1d8C8j4hE9WG9lyl9v5uB5Y7rMobz3FXO8Gy1BCbDq
	 4Pgtu6RwdR6Lw==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B6a9a16a40000>; Fri, 04 Sep 2026 12:53:56 +1200
Received: from aryans-dl.ws.atlnz.lc (aryans-dl.ws.atlnz.lc [10.33.12.26])
	by pat.atlnz.lc (Postfix) with ESMTP id B986B13EE4D;
	Fri,  4 Sep 2026 12:53:56 +1200 (NZST)
Received: by aryans-dl.ws.atlnz.lc (Postfix, from userid 1844)
	id B873E605E4; Fri,  4 Sep 2026 12:53:56 +1200 (NZST)
From: Aryan Srivastava <aryan.srivastava@alliedtelesis.co.nz>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aryan Srivastava <aryan.srivastava@alliedtelesis.co.nz>
Subject: [PATCH v0 1/2] hwmon: pmbus: Fix vout_mode parsing
Date: Fri,  4 Sep 2026 12:53:49 +1200
Message-ID: <20260904005351.2136374-2-aryan.srivastava@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260904005351.2136374-1-aryan.srivastava@alliedtelesis.co.nz>
References: <20260904005351.2136374-1-aryan.srivastava@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.4 cv=CKmJXgrD c=1 sm=1 tr=0 ts=6a9a16a4 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=VdqzKS8jKosA:10 a=SraTm1qjkgrBK5f-9HQA:9 a=3ZKOabzyN94A:10
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat

Currently this parsing assumes the top-most bit of the register is
unset, allowing it to match against all 2bit numbers. In the case where
the top bit is set, the parsing fails as the extracted value is always a
3 bit number.

AND the read value after the bit shift to ensure only 2 bits are being
parsed out.

Signed-off-by: Aryan Srivastava <aryan.srivastava@alliedtelesis.co.nz>
---
 drivers/hwmon/pmbus/pmbus.c      | 2 +-
 drivers/hwmon/pmbus/pmbus_core.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/pmbus/pmbus.c b/drivers/hwmon/pmbus/pmbus.c
index 7a7eac90d62e..b629acbffbfb 100644
--- a/drivers/hwmon/pmbus/pmbus.c
+++ b/drivers/hwmon/pmbus/pmbus.c
@@ -121,7 +121,7 @@ static int pmbus_identify(struct i2c_client *client,
=20
 		vout_mode =3D pmbus_read_byte_data(client, 0, PMBUS_VOUT_MODE);
 		if (vout_mode >=3D 0 && vout_mode !=3D 0xff) {
-			switch (vout_mode >> 5) {
+			switch ((vout_mode >> 5) & 0x3) {
 			case 0:
 				break;
 			case 1:
diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus=
_core.c
index 5f69c1420b4e..55391db5b414 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -2753,7 +2753,7 @@ static int pmbus_identify_common(struct i2c_client =
*client,
 		 * Not all chips support the VOUT_MODE command,
 		 * so a failure to read it is not an error.
 		 */
-		switch (vout_mode >> 5) {
+		switch ((vout_mode >> 5) & 0x3) {
 		case 0:	/* linear mode      */
 			if (data->info->format[PSC_VOLTAGE_OUT] !=3D linear)
 				return -ENODEV;
--=20
2.55.0


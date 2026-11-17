Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=130.239.18.156
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794922303;
	b=K2LUgPL1aDiP82bA/JzRN0FADapjPVPo6mIgeI6sR4heL9MwV34VQXMPMI+48pNt3k63
	 HdBztIm5g6y/wUwIK7XJY6l+ENwdfIflAxcmAPbtmhalnyNFGO3KwSJ2TVaq6oOfRgSXy
	 871OVC7UnixqhONhqHaCVhKL3lrezw/sYgS4WGJ+OeYOOWv2U4ZbWAelugOy/cVoY9guS
	 ft+d1M75m3jQH3QpFHzN857WFlBSJz0zCVWCXsjKMLslPQZOTalDgllZG2pgwDX7tddlh
	 eDQO3PRWGWmkgIpU07sLRpWMC0a9ZfT8/b4UQmXtiIwDav6XcO9/k+eGP6FJRrHCJ6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794922303;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=W+NquuX1JEi6z1cfXRakGcDZ9icaiFUqpJrNR09O4C8=;
	b=X4YUfalq+G091dfLOaW2NQD2qnG8pHr9U2VQbU3TUAAfsQuUsCyIuwGTgFX/IoSY/QM5
	 ffJGF8ke02Q3yPgoqHUxTFXYSCfn0rnRGhjbXd1dYQd458ceSNzUxlpghhnpw4ECpina8
	 FhLZp6hhhQGW2vJC4nlgadw/Zk804OtDluYhyRegAMH+X9Xd96jC3KZrCMbx2Fs1ezhZq
	 QBd3OVv3+piSbe2ew1CPiev1rR0r5KYw1UbINiVkJynEt1qK6IjytaNJ0C5WskDouJ8HP
	 EGPIQSSbsaziz/ol5zbQN9GfvZNstkzZTLm1N8denZ3AtyYEq9Namr94YkaOAYuBFBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ac2.se;
	spf=pass smtp.mailfrom=accum.se;
	dkim=pass header.d=ac2.se header.i=@ac2.se header.a=rsa-sha256 header.s=default header.b=sZ46RlQ5;
	arc=none smtp.remote-ip=130.239.18.156
Received: from mail.acc.umu.se (mail.acc.umu.se [130.239.18.156])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75E7D606A329
	for <linux-hwmon@vger.kernel.org>; Tue, 17 Nov 2026 13:31:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75E7D606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ac2.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=accum.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=ac2.se header.i=@ac2.se header.a=rsa-sha256 header.s=default header.b=sZ46RlQ5
Received: from localhost (localhost.localdomain [127.0.0.1])
	by amavisd-new (Postfix) with ESMTP id 82CBC44B91;
	Tue, 17 Nov 2026 14:31:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ac2.se; s=default;
	t=1794922292; bh=RyFrR8/SnYcO0HcuNOC9gS7xggleyP9K/7xKxWxAVtc=;
	h=From:To:Cc:Subject:Date:From;
	b=sZ46RlQ5Li6EVzd6ud96NrAGK5+LAPyH6f6baZB3JaE+23dqDLyAwXKF2lQR2fZmq
	 1WEglIMlgsh5wuiPXsxwuWUcm9jJvTN+bgw12KIJNhi8MXVS7zNaBfeij31O1z0V6Y
	 /5OD4ve4EA9o1Yyqwb4acibfNORR33fApDNTU2Ok=
Received: from suiko.ac2.se (suiko.ac2.se [IPv6:2001:6b0:e:2018::162])
	by mail.acc.umu.se (Postfix) with ESMTP id EC9D944B90;
	Tue, 17 Nov 2026 14:31:31 +0100 (CET)
Received: by suiko.ac2.se (Postfix, from userid 24471)
	id D367B42B4B; Tue, 17 Nov 2026 14:31:31 +0100 (CET)
From: Anton Lundin <glance@ac2.se>
To: linux-hwmon@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>,
	Zev Weiss <zev@bewilderbeest.net>,
	Anton Lundin <glance@ac2.se>
Subject: [PATCH] hwmon: (nct6775) Add support for NCT5525-S
Date: Tue, 17 Nov 2026 14:30:39 +0100
Message-ID: <20261117133038.40996-2-glance@ac2.se>
X-Mailer: git-send-email 2.47.3
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

It's a newer revision of NCT5525 with new id.

Signed-off-by: Anton Lundin <glance@ac2.se>
---
This was tested on a ASRock 4X4 BOX-AI350 board.

 drivers/hwmon/nct6775-core.c     | 1 +
 drivers/hwmon/nct6775-platform.c | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/drivers/hwmon/nct6775-core.c b/drivers/hwmon/nct6775-core.c
index 6f7279fb8814..5d512cc21c54 100644
--- a/drivers/hwmon/nct6775-core.c
+++ b/drivers/hwmon/nct6775-core.c
@@ -20,6 +20,7 @@
  *
  * Chip        #vin    #fan    #pwm    #temp  chip IDs       man ID
  * nct5525d     8      3       3       3+3    0xd2b3 0xc1    0x5ca3
+ * nct5525d-s   8      3       3       3+3    0xd294 0xc1    0x5ca3
  * nct6106d     9      3       3       6+3    0xc450 0xc1    0x5ca3
  * nct6116d     9      5       5       3+3    0xd280 0xc1    0x5ca3
  * nct6126d    10      5       5       3+3    0xd283 0xc1    0x5ca3
diff --git a/drivers/hwmon/nct6775-platform.c b/drivers/hwmon/nct6775-platform.c
index f443ae1dac67..7a6f9e8c0993 100644
--- a/drivers/hwmon/nct6775-platform.c
+++ b/drivers/hwmon/nct6775-platform.c
@@ -77,6 +77,7 @@ MODULE_PARM_DESC(fan_debounce, "Enable debouncing for fan RPM signal");
 #define SIO_REG_ADDR		0x60	/* Logical device address (2 bytes) */
 
 #define SIO_NCT5525_ID		0xd2b0
+#define SIO_NCT5525_S_ID	0xd290
 #define SIO_NCT6106_ID		0xc450
 #define SIO_NCT6116_ID		0xd280
 #define SIO_NCT6122_ID		0xd2a0
@@ -1042,6 +1043,7 @@ static int __init nct6775_find(int sioaddr, struct nct6775_sio_data *sio_data)
 
 	switch (val & SIO_ID_MASK) {
 	case SIO_NCT5525_ID:
+	case SIO_NCT5525_S_ID:
 		sio_data->kind = nct5525;
 		break;
 	case SIO_NCT6106_ID:
-- 
2.47.3


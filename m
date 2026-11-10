Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.202.169.37
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794283201;
	b=yBcbrGBgfKlLCiXj6jNTxnGLt27m/wU05tVqV8FuBNZUzq0loQ/C6Qt/BvG5Q9j5VL/a
	 r4JZohLdnvK3sAllj1LvAcO/xJygrK9g4BdPC7UneuTMho8DPw20mUWrg7x58CrIkt1kY
	 7zcjRNNh/PQ5+9OHxkd62fO+5aMyX4t0+PIPaIDMr31tgm2KTwRcOPBeQOVMdDnh0aTJ6
	 uKgFyaOmQqwgl4DPwla/JjCNMAX5/cyW5d6PSRMkEkkEFv1iXELp7nlk7eHUwptUx5Tkt
	 BN5HHWamCVXayHWvX+F9XfsB/Vb58gew7PY1yPea3TYhAUM2xj2bfA9zv+zeufuMILA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794283201;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:
	 X-Source-IP:X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=2XAJDzmAtqHaoo6EyTtzq6RJobZy6+UO6cN1+Yktqow=;
	b=3phjdcqBP+kNqICPivWqhkSU1h5l0aE9L8taBpv0xTxwRxd1051AmJp2prz7STaap8BF
	 nOJFRa0eKJ63l2Nz/OXXL/FesQEfhwudqKPZbvHpkIx8SQR2wAWKyi1RaE7mlf6KIHSdd
	 xTqlofhaoIAs0Or5cxxrVV4Q4/fcJd/AF7UZMxOu1UHd3sAJk+CTmpz83D4kczvFsyA8X
	 9EtFhMgFu7pc5jbuHO5Uh/W0zx/S/wkuPT7aT9RCPADOe2XVNeY6I7gMZeZENsq/7TVxa
	 lPfGcZOZR+NYvtPHMbhkmry5ihmXRfWjgCb+eEX3lDI8VRq3uBCuj+Zks8Bbgf7Hm+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=j1dBZ5Oz;
	arc=none smtp.remote-ip=44.202.169.37
Received: from omta038.useast.a.cloudfilter.net (omta038.useast.a.cloudfilter.net [44.202.169.37])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CA36606A31C
	for <linux-hwmon@vger.kernel.org>; Tue, 10 Nov 2026 04:00:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7CA36606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=j1dBZ5Oz
Received: from eig-obgw-6004b.ext.cloudfilter.net ([10.0.30.210])
	by cmsmtp with ESMTPS
	id QWTDxY9MIJFmFQd1bx9NPC; Tue, 10 Nov 2026 03:59:59 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id Qd1axQelblaNKQd1ax9cK3; Tue, 10 Nov 2026 03:59:58 +0000
X-Authority-Analysis: v=2.4 cv=UbpRSLSN c=1 sm=1 tr=0 ts=6af296be
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=c92rfblmAAAA:8 a=VwQbUJbxAAAA:8
 a=_jlGtV7tAAAA:8 a=o012Mnvs-MQSH_9JAAAA:9 a=GvGzcOZaWPEFPQC_NcjD:22
 a=nlm17XC03S6CtCLSeiRr:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=2XAJDzmAtqHaoo6EyTtzq6RJobZy6+UO6cN1+Yktqow=; b=j1dBZ5Oz4sx3
	86Gp2LO4JEB3cH9x9IX9FchDSt1X9DUq8DD7STDfbhYtR0krRtxPBwmqp7QdTPvwOjgcqL0XEma3Z
	Nu/rLDDeJxDZPARNU54qJgou9kiNGmGb/al3gvkVI7UiqO7mI2aV1TCVxCxijtFBlLaBj3Qrn/LQt
	Lx7LCJ7uEsxI9r4H3boIlgVGm3LCKWNyxm9IBIP5hhh7O+RysHmwuw6Okr07sgjqAVDCsN7jsgptA
	8aZV6thKv2UB+OmXG9rjWiMXOHG808Aeypa7wAd6bPfVu4mp2imIwyNxepbTCamovu8QGeBULUd3M
	GDSI/T9ILXBo7bbh37+5fg==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:48880 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xQd1a-00000003Ra7-13kC;
	Tue, 10 Nov 2026 09:29:58 +0530
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Anton Lundin <glance@ac2.se>,
	Guenter Roeck <linux@roeck-us.net>,
	Sashiko <sashiko-bot@kernel.org>
Subject: [RFT PATCH 1/3] hwmon: (nct6775) Fix target temp and tolerance for NCT6106/6116/6126
Date: Mon,  9 Nov 2026 19:59:53 -0800
Message-ID: <20261110035955.3968731-2-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20261110035955.3968731-1-linux@roeck-us.net>
References: <20261110035955.3968731-1-linux@roeck-us.net>
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
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xQd1a-00000003Ra7-13kC
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:48880
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 6
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfB1hiUxeorTwGelMj5vt8zqYY3XRwOLDT+rGkaWgPHUt5k/bBfUlUtMKlEpY10ZSHXZiYOOz2UWB91zPLk4IEJ/9Up/HVFFr37fMSkN2641S/ciFE47W
 cXzYdb204gsNw/ZoOgWxDEc3PqV2FqA4skmCMMdR7GucsHymkpdBCABr8ESYPadl51f5/FQUdx4s+TyImdtCas7vc4Z+53g+urfeUHcrXSCruDvTqniOt1yf

In nct6775_probe(), the nct6106, nct6116, and nct6126 chip cases leave
target_temp_mask, tolerance_mask, and speed_tolerance_limit
zero-initialized.

As a result, reading pwm*_target_temp from sysfs always returns 0,
writing to pwm*_target_temp, pwm*_temp_tolerance,
pwm*_crit_temp_tolerance, or fan*_tolerance clamps user-supplied values
to 0, and pwm_update_registers() fails to clear existing tolerance bits
in REG_FAN_MODE when updating fan control modes.

Initialize target_temp_mask to 0xff, tolerance_mask to 0x07, and
speed_tolerance_limit to 63 for NCT6106, NCT6116, and NCT6126, matching
the hardware register layout shared with NCT5525 and NCT6776+.

Fixes: 6c009501ff20 ("hwmon: (nct6775) Add support for NCT6102D/6106D")
Fixes: 29c7cb485b32 ("hwmon: (nct6775) Integrate new model nct6116")
Fixes: 437b3c2a4bdc ("hwmon: (nct6775) Add support for NCT6126D")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Link: https://sashiko.dev/#/bug/linux-76f191d0-4c79-4982-887e-e5c9a2ed7136
Cc: Anton Lundin <glance@ac2.se>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/nct6775-core.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/hwmon/nct6775-core.c b/drivers/hwmon/nct6775-core.c
index 83083a0e9302..192b52750db5 100644
--- a/drivers/hwmon/nct6775-core.c
+++ b/drivers/hwmon/nct6775-core.c
@@ -3712,6 +3712,9 @@ int nct6775_probe(struct device *dev, struct nct6775_data *data,
 
 		data->fan_from_reg = fan_from_reg13;
 		data->fan_from_reg_min = fan_from_reg13;
+		data->target_temp_mask = 0xff;
+		data->tolerance_mask = 0x07;
+		data->speed_tolerance_limit = 63;
 
 		data->temp_label = nct6776_temp_label;
 		data->temp_mask = NCT6776_TEMP_MASK;
@@ -3788,6 +3791,9 @@ int nct6775_probe(struct device *dev, struct nct6775_data *data,
 
 		data->fan_from_reg = fan_from_reg13;
 		data->fan_from_reg_min = fan_from_reg13;
+		data->target_temp_mask = 0xff;
+		data->tolerance_mask = 0x07;
+		data->speed_tolerance_limit = 63;
 
 		data->temp_label = nct6776_temp_label;
 		data->temp_mask = NCT6776_TEMP_MASK;
@@ -3865,6 +3871,9 @@ int nct6775_probe(struct device *dev, struct nct6775_data *data,
 
 		data->fan_from_reg = fan_from_reg13;
 		data->fan_from_reg_min = fan_from_reg13;
+		data->target_temp_mask = 0xff;
+		data->tolerance_mask = 0x07;
+		data->speed_tolerance_limit = 63;
 
 		data->temp_label = nct6776_temp_label;
 		data->temp_mask = NCT6776_TEMP_MASK;
-- 
2.45.2


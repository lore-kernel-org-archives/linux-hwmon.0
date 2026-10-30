Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.202.169.39
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793386417;
	b=ExjZH4iHlmghjdqz7v/Ez/2bpRi6SCFG+AXu4nIvQmglBXgr1tczdpBddXmFi8YNcYei
	 4jqV6aEF21ZW4XbwBs2BoNMPZaRcox/FVlK8R7HevW6COu4dFnJR0Hs2PlESNPzhNTAAz
	 N9WatVcJcTZDx1EEKOQyKqkLAaAjwk+TBgyuGf2nwySevVmf6E7yynarC3Rm/4O6nkwH4
	 6TefVwldSMopjF7CJC1X+ckA/4/cU//SlOGwuBypzhIw+RGGsW+KAhP0RcIqK71YFPFHD
	 tkVYw18ImEvLSk6O0prYAPVS/keLR7hyG4WSYoPZGJT/R9bJhVRjdIVhs9ADbvDcB1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793386417;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:
	 X-Source-IP:X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=9qqc2d49SiYyBPgouRaGtwzQUKrEsx03y1Cx9U3El3k=;
	b=4H8LzKCdKexdAX0E5OzSWQacPQV7vZEkimFHo/gZr0Hf106wgMVOcg5+KuD0xEB8nICT
	 EBA2FXhvRfPszRzfCNKQneGT9xEePaKesak2dIwYIpr7EZTosRKQi0y6X71hxG6WYxw2m
	 /R6oYsO7RTuGWhd/C49lPzN+hL7blpAVuqudogOjEmZd4Spnsu0AKP7BpdBs878+5Tnja
	 bTS+HtfE/x6C5pxMHnRPTzXg4tEUXqP+Hy1kta5VQznDWLmKl4c55o8cozndRMvZIVyWs
	 nRuf1vjkgsgwZzODDk7PSCkIJKMR1XBYKa6chfk4LhLNYgYddbZBFNfXrHka0EVHo9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=J2hNdxd3;
	arc=none smtp.remote-ip=44.202.169.39
Received: from omta040.useast.a.cloudfilter.net (omta040.useast.a.cloudfilter.net [44.202.169.39])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A50BE606A32F
	for <linux-hwmon@vger.kernel.org>; Fri, 30 Oct 2026 18:53:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A50BE606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=J2hNdxd3
Received: from eig-obgw-5006b.ext.cloudfilter.net ([10.0.29.217])
	by cmsmtp with ESMTPS
	id Mp1XxG1fJMylkMrjMxhnfN; Fri, 30 Oct 2026 18:53:36 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id MrjLxukfcNSXiMrjMxSjZO; Fri, 30 Oct 2026 18:53:36 +0000
X-Authority-Analysis: v=2.4 cv=JvXxrN4C c=1 sm=1 tr=0 ts=6ae4e7b0
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=660iZSQnnn4A:10 a=M0FbrtG7MMAA:10 a=_jlGtV7tAAAA:8 a=aHpM7dG-TJ2rLdUfAB0A:9
 a=nlm17XC03S6CtCLSeiRr:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=9qqc2d49SiYyBPgouRaGtwzQUKrEsx03y1Cx9U3El3k=; b=J2hNdxd3/7nf
	7AHUnyV8aG3KJJItOP9qXnYNUz54oebHvKk+Pllwye1JlEQy1FRsQqTNvzkvv/OFdCUeuuxPgJG6E
	F6o/pQbq8HlreRZbELKLIqW3gqjUfuXXOMgL1Bm8PeMxFpUoKlDTfLA7rwxN9rI20eAkhO01HxjAk
	qN3rDbxMhm39DL5LLURp4utV0UBpSj471acUCC48/6s/aKfLaAn6X5/xwhFNFQWhp6V2FIaSl58it
	zG8P+fOZ4fxCFrHALBkrXv1mACUJTjQci8/n4o7Mfcbsl3rLtKea0BBz69+8QZLoiLQ/xMRO0siiH
	TrSrWQIDa1vcLCWDD3h8XA==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:48450 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xMrjL-00000003RZi-3H2R;
	Sat, 31 Oct 2026 00:23:35 +0530
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 11/11] hwmon: (pmbus) Fix return value check from thermal zone registration
Date: Fri, 30 Oct 2026 11:52:56 -0700
Message-ID: <20261030185256.976255-12-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20261030185256.976255-1-linux@roeck-us.net>
References: <20261030185256.976255-1-linux@roeck-us.net>
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
X-Exim-ID: 1xMrjL-00000003RZi-3H2R
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:48450
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 28
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfDT2kVbvMFx3O5M7yvCvgUZ/dfF7r7x9T81JGDUJBXP10Iz0ZpC/78ijpXx8oct24r+LfYszvJj/NQSeExcuX6cKO3TwCsh1MdrnuAX16NJM/hmdIbWG
 3wkKPQit8f3Rv8Ke4nZdvfVCNmSyXuzoavbREcw/ljxmc59LelvYqYbyeQynPRt2WOxwUGod+MU6TCeK5ZzTGQ8mRc55JQPL8HS8U6xgqFxwK33QiLDtmC9u

The PMBus core used to call devm_thermal_zone_of_sensor_register()
to register thermal zones. Commit 613ed3f676092 ("hwmon: pm_bus: core:
Switch to new of thermal API") changed this to call
devm_thermal_of_zone_register() instead. The code subsequently checks if
the call failed because the thermal subsystem is not configured.
devm_thermal_zone_of_sensor_register() used to return -ENODEV in this
case. devm_thermal_of_zone_register() returns -ENOTSUPP. The code currently
still checks for -ENOVEV. This results in driver instantiation failures if
the thermal subsystem is disabled.

Check for -ENOTSUPP to fix the problem. Keep checking for -ENODEV because
this indicates that no thermal zone is configured for the sensor, which is
acceptable for the driver and must not cause a registration failure.

Fixes: 613ed3f676092 ("hwmon: pm_bus: core: Switch to new of thermal API")
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/pmbus/pmbus_core.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index 574d9879bdcf..8fa379d04cd1 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -1532,10 +1532,11 @@ static int pmbus_thermal_add_sensor(struct pmbus_data *pmbus_data,
 	tzd = devm_thermal_of_zone_register(dev, index - 1, tdata,
 					    &pmbus_thermal_ops);
 	/*
-	 * If CONFIG_THERMAL_OF is disabled, this returns -ENODEV,
-	 * so ignore that error but forward any other error.
+	 * If CONFIG_THERMAL_OF is disabled, devm_thermal_of_zone_register()
+	 * returns -ENOTSUPP. If no thermal zone is configured for the sensor,
+	 * it returns -ENODEV. Ignore those errors but forward any other error.
 	 */
-	if (IS_ERR(tzd) && (PTR_ERR(tzd) != -ENODEV)) {
+	if (IS_ERR(tzd) && PTR_ERR(tzd) !=  -ENODEV && PTR_ERR(tzd) != -ENOTSUPP) {
 		devm_kfree(dev, tdata);
 		return PTR_ERR(tzd);
 	}
-- 
2.45.2


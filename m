Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.202.169.37
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793386391;
	b=ZogPey2rixwDaBxbWpTzjOspsGN3UFyEB2Fkx9WBYv0Um36N+QljJ4z3ekfcr9HUdgzC
	 D9RQnUoNdLZpVCJ+T+O5wx0x5+2d62y8lOvj6H73pY+0vDAshtHlH+dwP41Pe+z47lumd
	 zHMc0RVyI93HL3GIowkr5guTUUjfB9gfwhw3vkmf5xFACyV+C2y3cSE66PyBy6J5MwYs2
	 tioCIH00VTagNqM9XIY2871mlglk9CFNxTEoit2Gv2xBKq2rC8YbAP9rch613+aiqO/hz
	 VZX8Fg7zkTlUrAwhgUIvw5KIs3qB8cnbJoosONRInvjIXw/CSLL5tSnVrGFj2HlPivw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793386391;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:
	 X-Source-IP:X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=IIGEn6ce/1Qk/PiHeHNxwWYOfwoP3eC6rpmgxJjypy4=;
	b=RJxY3+G+Nno991pzHK5i7F3ImSn2DXgXKjyVwWZQa1n6d089WZYvnVMEytLmL/CNfUlB
	 gRfyCrk8a9CpIfqP95sv3yQ6n8KZgWVx4tsrngpKuYVJFiY17noE4aac5Iesul2yd80fP
	 9B5ZqgwUEiT0pxXHFHPtr29L+lVKjdl3gnYv11NEsknySh1OYcvWWu0KEMQRFE8h9GW82
	 OOgGO6bVY6uyMrclm836v7GJAsaOH/mPNeldIcd/ZX8xuN69jwFRdshyiyoVKnbp5W8Ei
	 M09ktDQdroreaxemF9TeJr3slYxx3pKBzqLK9Wi8Z5PSchnsCx2KuS9lPAt+JPwYGuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=S7aiXmvr;
	arc=none smtp.remote-ip=44.202.169.37
Received: from omta038.useast.a.cloudfilter.net (omta038.useast.a.cloudfilter.net [44.202.169.37])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8F71606A31A
	for <linux-hwmon@vger.kernel.org>; Fri, 30 Oct 2026 18:53:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8F71606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=S7aiXmvr
Received: from eig-obgw-5003b.ext.cloudfilter.net ([10.0.29.155])
	by cmsmtp with ESMTPS
	id MqZBxqQGEJFmFMriwxqRLn; Fri, 30 Oct 2026 18:53:10 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id MrivxabwTbxHHMrivx1A6Q; Fri, 30 Oct 2026 18:53:09 +0000
X-Authority-Analysis: v=2.4 cv=QK5oRhLL c=1 sm=1 tr=0 ts=6ae4e795
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=660iZSQnnn4A:10 a=M0FbrtG7MMAA:10 a=Oe-TAeJsAAAA:8 a=VeVZoRYdAAAA:8
 a=pGLkceISAAAA:8 a=_jlGtV7tAAAA:8 a=Tmc03Fi2OsZDLu_N_swA:9
 a=PwQcmOdWtFEqXSMKX3oR:22 a=TKXEY2ph7vCcqc0JNG1P:22 a=nlm17XC03S6CtCLSeiRr:22
 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=IIGEn6ce/1Qk/PiHeHNxwWYOfwoP3eC6rpmgxJjypy4=; b=S7aiXmvrkx3k
	0c7JVlb6fYbqxUP328CGH7BLCH/0vKz2xEqMc+34n/uTKNLkMLVGxinXagb8mseZiw/Yh1fOB9+Ss
	OJd34Qz8Mf0OWewDapO4Ry1UQYSrr48b4PfU+OmsWjAzUpfayDu3f8emqUlQzbgnKqboATDl3i8zA
	9qsZhkviPKCAq3kVpq7RoXBTQtTYp0OanArKPZyRZylhvqfosonoxsF1G9Bb2cf1OgS+wIdfLs+o4
	p5xCHPDgwHMeoF2xRdDKEEvEPlZqmal0oLO9IxgLdPOKq5oSuxOaTJY9bMJCHDdxiVyXtyWtpuj5P
	0MhJ8SGXFe/Yt6Plm7bnbQ==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:54944 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xMriv-00000003RJA-0ItL;
	Sat, 31 Oct 2026 00:23:09 +0530
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>,
	Ed Brindley <kernel@maidavale.org>,
	Denis Pauk <pauk.denis@gmail.com>
Subject: [PATCH 02/11] hwmon: (asus_wmi_sensors) Avoid global struct mutation
Date: Fri, 30 Oct 2026 11:52:47 -0700
Message-ID: <20261030185256.976255-3-linux@roeck-us.net>
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
X-Exim-ID: 1xMriv-00000003RJA-0ItL
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:54944
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 16
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfEEaQew6slas4HB0tVmbiSiLZTtmamcJjrq2ILjAdsZHfAKwInMElND8dUVZ225xzf+hoFR1TBC+tRRbJO7Z0H1Es9EO7YDJNVJ1Ukyg56LFDP+0DHa9
 h28Je5UFKfAdt1oT4XUn/mauacIkD+j9G42AYmqXf9V9k385zpKOKZfTIGe77AXzhgKxN2wpzAQlwcgt7XWhvO8m5EbGNd2qyHGVUEWTfppXGg9gq9JNamGJ

In the asus_wmi_sensors driver, device-managed memory allocated in
asus_wmi_configure_sensor_setup() is assigned to a global static structure,
leading to a potential use-after-free when the device is unbound.
The driver defines a single global asus_wmi_chip_info structure to register
with the hwmon core. During probe, it dynamically allocates the .info
channel array using devm_kcalloc() and assigns it directly to this global
structure. When a device is unbound, its device-managed memory is
automatically freed, leaving asus_wmi_chip_info.info as a dangling pointer.
Furthermore, if multiple WMI devices are probed sequentially, each probe
overwrites the same global pointer, forcing all registered hwmon instances
to reference the channel information of the most recently probed device.

While it is unlikely if not impossible that multiple WMI devices of the same
kind exist, modifying a global static data structure is undesirable. Remove
the static data structure and allocate it as part of struct asus_wmi_sensors
to avoid the potential problem.

Fixes: 548820e21ce1 ("hwmon: (asus_wmi_sensors) Support X370 Asus WMI.")
Cc: Ed Brindley <kernel@maidavale.org>
Cc: Denis Pauk <pauk.denis@gmail.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/asus_wmi_sensors.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/hwmon/asus_wmi_sensors.c b/drivers/hwmon/asus_wmi_sensors.c
index 621e3506972d..0feab3f62496 100644
--- a/drivers/hwmon/asus_wmi_sensors.c
+++ b/drivers/hwmon/asus_wmi_sensors.c
@@ -164,6 +164,7 @@ struct asus_wmi_wmi_info {
 
 struct asus_wmi_sensors {
 	struct asus_wmi_wmi_info wmi;
+	struct hwmon_chip_info chip_info;
 	/* lock access to internal cache */
 	struct mutex lock;
 };
@@ -496,11 +497,6 @@ static const struct hwmon_ops asus_wmi_hwmon_ops = {
 	.read_string = asus_wmi_hwmon_read_string,
 };
 
-static struct hwmon_chip_info asus_wmi_chip_info = {
-	.ops = &asus_wmi_hwmon_ops,
-	.info = NULL,
-};
-
 static int asus_wmi_configure_sensor_setup(struct device *dev,
 					   struct asus_wmi_sensors *sensor_data)
 {
@@ -508,7 +504,7 @@ static int asus_wmi_configure_sensor_setup(struct device *dev,
 	struct hwmon_channel_info *asus_wmi_hwmon_chan;
 	int nr_count[hwmon_max] = {}, nr_types = 0;
 	struct asus_wmi_sensor_info *temp_sensor;
-	const struct hwmon_chip_info *chip_info;
+	struct hwmon_chip_info *chip_info;
 	enum hwmon_sensor_types type;
 	struct device *hwdev;
 	int i, idx;
@@ -549,8 +545,9 @@ static int asus_wmi_configure_sensor_setup(struct device *dev,
 	if (!ptr_asus_wmi_ci)
 		return -ENOMEM;
 
-	asus_wmi_chip_info.info = ptr_asus_wmi_ci;
-	chip_info = &asus_wmi_chip_info;
+	chip_info = &sensor_data->chip_info;
+	chip_info->ops = &asus_wmi_hwmon_ops;
+	chip_info->info = ptr_asus_wmi_ci;
 
 	sensor_data->wmi.info_by_id = devm_kcalloc(dev, sensor_data->wmi.sensor_count,
 						   sizeof(*sensor_data->wmi.info_by_id),
-- 
2.45.2


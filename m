Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.37
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793386391;
	b=zo62RjBx6q8p6fIhgi9Lt8aC8wTFvyJD4vHPYQY15nvnk5aOlHkWYAD0nBO4rRDgVWbM
	 jSgE6YhxK1zy/ONzOjD6IWLzuFFDqYhFe+iMBwWHZvy69UjyDDBN9H+OmIq890dMBKTjO
	 4oPmsHud1AzcvU3RBuetwHzlOM6/KWgZFbdB46wD/dlYM4w+1uByfsKF/Runsl+6d/TXb
	 l5VPfk6xtY8gz4Wr2hFvCwThgtMGW2nSThG704C7j5zuBfzbZacguNpz9dfQWW7Vo/cdl
	 J58ZCq0DEu4aqgNrQroFuDYHvTTrDQHVdVb4Wzw0jEBx190JkLkh0RMtVECFRpO71sQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793386391;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:
	 X-Source-IP:X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=XDzyHaXUXGj3ZGPN/gTZ3/U1t0wdyF9y9MZ3g3LGzk8=;
	b=vPWTIIYV7cKk9eySJ+++YhedVu/3fMpzwqw3OAh3F2myQroknbGJoaPgT3T3FU/Z+29m
	 kIcc4jSlxIosckWIih81JzrdmjPkKnGROBRa3t/upi0KMbcm2SNCNRBTNRsx5FZBR3aqH
	 XJezJCXXVwKZqdW0xCT0hjT1134zYkmqiKIJNkhjSRN6YAZc0IVEXQAduZCIKl+r72GRw
	 eSr4nUmtJKjMApJDaKWzLAvyYljQRFDsqf6qV1jBZ43yzasnyCgco2xQ/qb4r2DKCE4dF
	 bLqFnm49GeHZauQ9Ia0ZfIR9xfJU09YXLPQJKYhwKATDVXevBqFARnpCdGo4z+gcjSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=E84Z+rxp;
	arc=none smtp.remote-ip=35.89.44.37
Received: from omta38.uswest2.a.cloudfilter.net (omta38.uswest2.a.cloudfilter.net [35.89.44.37])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4810C606A31C
	for <linux-hwmon@vger.kernel.org>; Fri, 30 Oct 2026 18:53:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4810C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=E84Z+rxp
Received: from eig-obgw-6001b.ext.cloudfilter.net ([10.0.30.143])
	by cmsmtp with ESMTPS
	id MqtWxDN1Xv0ndMriwxrNXF; Fri, 30 Oct 2026 18:53:10 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id MriwxdRHz1xnwMriwxGsnR; Fri, 30 Oct 2026 18:53:10 +0000
X-Authority-Analysis: v=2.4 cv=OsxPyz/t c=1 sm=1 tr=0 ts=6ae4e796
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=660iZSQnnn4A:10 a=M0FbrtG7MMAA:10 a=HMux6HqqAAAA:8 a=_jlGtV7tAAAA:8
 a=vex_B8S-AAAA:8 a=UtEvoEV7KDPgfXqxhRUA:9 a=ZRRwZiaQ84Kxq24M-lRa:22
 a=nlm17XC03S6CtCLSeiRr:22 a=piZ7GnUMHaBkGeu-p2yy:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=XDzyHaXUXGj3ZGPN/gTZ3/U1t0wdyF9y9MZ3g3LGzk8=; b=E84Z+rxpm5Jo
	SyDOSW3NfMwgSXXPyF+8uVu28R3x6rGb1ZfA5j9cz84HNHvLWApv34mgMT8ty3Ommh5AHnZL9eoNK
	ZwhUAi3p5Sgp/JEetl6UxmfdAsSb+HqtaUff1ehin250oxrnN2shsh2VILEAfjmbpFIJAhgQTmuKF
	wxRlqaDNbNjWmJN2qI1KIe+sVIah0ZFXlK6AZMq8iRQjsb+mNbclWTxO7sXXm+E8fDzrjL14mkoBp
	dJDU/N9mT+vYr+NGlL8aE0J2unUVMMtAE1jhJth57r7g4oDZyfajBugt/e9royREQy4h0+2rRmt7s
	EMeTy2kDq/niFQRW91B6TQ==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:54946 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xMriv-00000003RKY-3Aaw;
	Sat, 31 Oct 2026 00:23:09 +0530
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>,
	James Seo <james@equiv.tech>
Subject: [PATCH 03/11] hwmon: (hp-wmi-sensors) Avoid global struct mutation
Date: Fri, 30 Oct 2026 11:52:48 -0700
Message-ID: <20261030185256.976255-4-linux@roeck-us.net>
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
X-Exim-ID: 1xMriv-00000003RKY-3Aaw
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:54946
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 18
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfERDmF/6LZbFOeShx9fgxea1GVg4/2bVCSYlBt3FNqIe9ws9wsMChTYwq8B7mLgqmlif7Q8TyYzUlgVacSfafpYYYYfXCZuCis/R5fBiXtYh0alr5yEs
 7Z2/g/1OX8W68/aRN6/Q7v13GVwkjSBDIY3tFXrRI2mpdehCsSl6ARTxLyLVTqeGTdq/FNeewNssyWRqTVmDWSatBZ5xB0tnajbL4INUs0IcHsVj6Vl6o4k3

In the HP WMI sensors driver, make_chip_info() assigns a device-managed
memory allocation to a static global structure, resulting in a
use-after-free when the device unbinds.
During hp_wmi_sensors_probe(), make_chip_info() dynamically allocates a
hwmon_channel_info array using devm_kcalloc() and assigns it to the
static global hp_wmi_chip_info.info pointer.

If multiple instances probe sequentially or concurrently, the shared
global pointer is overwritten by each new device. When any device unbinds,
its devm-managed memory is automatically freed, leaving the global
hp_wmi_chip_info struct and any other active device instances with a
dangling pointer. Subsequent accesses by the hwmon core (such as thermal
zone reads) will dereference this freed memory, causing a use-after-free.

While this is not supposed to happen in the real world (there should only
be one instance of the driver in any system), modifying global structures
is undesirable and should be avoided whenever possible. Allocate struct
hwmon_chip_info as part of struct hp_wmi_sensors instead and initialize it
in make_chip_info() to avoid mutating the global structure.

Fixes: 23902f98f8d4 ("hwmon: add HP WMI Sensors driver")
Cc: James Seo <james@equiv.tech>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/hp-wmi-sensors.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/hwmon/hp-wmi-sensors.c b/drivers/hwmon/hp-wmi-sensors.c
index d8bcfeb8d5b2..a859752c8387 100644
--- a/drivers/hwmon/hp-wmi-sensors.c
+++ b/drivers/hwmon/hp-wmi-sensors.c
@@ -390,6 +390,7 @@ struct hp_wmi_info {
  */
 struct hp_wmi_sensors {
 	struct wmi_device *wdev;
+	struct hwmon_chip_info chip_info;
 	struct hp_wmi_info **info_map[hwmon_max];
 	u8 channel_count[hwmon_max];
 	bool has_intrusion;
@@ -1531,11 +1532,6 @@ static const struct hwmon_ops hp_wmi_hwmon_ops = {
 	.write	     = hp_wmi_hwmon_write,
 };
 
-static struct hwmon_chip_info hp_wmi_chip_info = {
-	.ops         = &hp_wmi_hwmon_ops,
-	.info        = NULL,
-};
-
 static struct hp_wmi_info *match_fan_event(struct hp_wmi_sensors *state,
 					   const char *event_description)
 {
@@ -1962,7 +1958,8 @@ static int make_chip_info(struct hp_wmi_sensors *state, bool has_events)
 	if (!ptr_channel_info)
 		return -ENOMEM;
 
-	hp_wmi_chip_info.info = ptr_channel_info;
+	state->chip_info.ops = &hp_wmi_hwmon_ops;
+	state->chip_info.info = ptr_channel_info;
 
 	for (type = hwmon_chip; type < hwmon_max; type++) {
 		count = channel_count[type];
@@ -2053,7 +2050,7 @@ static int hp_wmi_sensors_init(struct hp_wmi_sensors *state)
 		return err;
 
 	hwdev = devm_hwmon_device_register_with_info(dev, "hp_wmi_sensors",
-						     state, &hp_wmi_chip_info,
+						     state, &state->chip_info,
 						     NULL);
 	return PTR_ERR_OR_ZERO(hwdev);
 }
-- 
2.45.2


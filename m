Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.202.169.37
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793733531;
	b=ylX2tDQn8LwhUlnJq0xzK//ylK9pQKuljjGWgAOLhx4xkzgKLiy7HeMqLFDRy9Hv8tm2
	 PTMlTnkPNNlh9/ArOWVZqjVJJU157piJB9beKId4e7d6sY3mA0cvRhFhffb3b7yiXvHIk
	 MtEkq/Ef88mbWRoLc7QXWGG0oWh5eDZHepZWnmDeJugeyI/zqsTDMtBzwzSWw180EgK6J
	 J/ph8gfp0tVeo4Wl+x1ta1rRAcR7OBQldXzL7DA41zBuulNQS/WSWjg24Gvi6DSGzobBv
	 h7/aQPiVWcNtbseSahBXHZ3PLviW679mKXaPazrFn2O9wdqklW0zc0KqgBkldUhFoYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793733531;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:X-Source-L:X-Exim-ID:
	 X-Source:X-Source-Args:X-Source-Dir:X-Source-Sender:X-Source-Auth:
	 X-Email-Count:X-Org:X-Source-Cap:X-Local-Domain:X-CMAE-Envelope;
	bh=Gnbv6pkjJZQghkE5qmvNuaJAdp9E6jddej1HeacI0+8=;
	b=dTQotB1KsMcFzOrLKgT1P7j5pIlxzBcCbGVqHAdT7ESD4p6DL4op9R+jlgb0rANMkbNK
	 sLHCKIR1jJ32dFiGBahF++zGW/M26G36N0Gp1fzxJy2f+Uu19l2B+O6niRydBfdx8aEiC
	 ZAS2UHOSv0Cx57YpJYy1E3NBJJNMvbr8MuZGFAJVT6b10v+OCikMnO7jDJkyKzk6vhSCl
	 UZQtTBOt+/BUfobDp2Si67miWONtnZCuk3VT3aPrH7CvME0GWBAYqKA/px6RrwkxKTjjq
	 ZCCs7b9h6ehLb8slbN2lCeO/gr+OeG0gGWJOgBis0WD8g8OBFi7FhLlXIdxkPCsvWsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=ZD5MhnsS;
	arc=none smtp.remote-ip=44.202.169.37
Received: from omta038.useast.a.cloudfilter.net (omta038.useast.a.cloudfilter.net [44.202.169.37])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6896606A31B
	for <linux-hwmon@vger.kernel.org>; Tue,  3 Nov 2026 19:18:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6896606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=ZD5MhnsS
Received: from eig-obgw-5002b.ext.cloudfilter.net ([10.0.29.226])
	by cmsmtp with ESMTPS
	id OD4Fx5s7IJFmFOK1yxJi5E; Tue, 03 Nov 2026 19:18:50 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id OK1xxS3L3gk6fOK1xx3W7Z; Tue, 03 Nov 2026 19:18:49 +0000
X-Authority-Analysis: v=2.4 cv=KM9aDEFo c=1 sm=1 tr=0 ts=6aea3399
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=_jlGtV7tAAAA:8 a=ustbhp3tvGufTsXyMYcA:9
 a=nlm17XC03S6CtCLSeiRr:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Gnbv6pkjJZQghkE5qmvNuaJAdp9E6jddej1HeacI0+8=; b=ZD5MhnsSNGFzo89P6xR01XAmWX
	GCCff8PIS0rj264wv01vWXO/BO9WoroL5nVM0q+ly+y46OimaDRcUAfB+7ZsMEJAp9xl2uQC97Lu0
	W2LNsaxD3Q0gM5lhvoHpoafE7L7BPdfDZ2zHY3IedjcEyiZzsPB+zX4VKgSNa7mDDz87GnE12AhT5
	bfTt0eNUFDfyY3H3Sy2r1MYmcxh/LJBwfpb3VhpeTCmWIszfbCYrWGdesX/+pG4uWeX24+C4vUA4z
	t5MhKF5e4GEDdwOF+TN1nkdCkZAUnvp1qq9/hHOrN+3IGijiYlhUoswAJYMmCaAqxK3YhdTPTGC50
	UuY+M/rA==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:46774 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xOK1x-000000011XD-0MWP;
	Wed, 04 Nov 2026 00:48:49 +0530
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>,
	James Seo <james@equiv.tech>
Subject: [PATCH] hwmon: (hp-wmi-sensors) Serialize alarm flag read-and-clear with state->lock
Date: Tue,  3 Nov 2026 11:18:46 -0800
Message-ID: <20261103191846.3132938-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
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
X-Exim-ID: 1xOK1x-000000011XD-0MWP
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:46774
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 5
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfJjbqBEdx0cNNjaz5pQWfchw10/iTjnyqkrpATRylkR9VSsK5ou4LBIpaekUbhv893rwOvyX4kiJi1sTV0m47/BsCU2Q/j3fBuhkHL7YSpjmF+YN009i
 T4BXSpztdgMM2KDN+5jcgu5u0HxlzSIOcoQR8u39owEo2yzTvTf3RAl72MbdjJ56WmA09unTV510aQkkF+aq9LdqSfwE4WhZrAQVnkqbyErOsF9reS9saB/3

In hp_wmi_hwmon_read(), temperature and fan alarm flags (info->alarm)
are evaluated and cleared without acquiring state->lock, while only the
hwmon subsystem lock is held by the hwmon core. Meanwhile, the
asynchronous WMI event handler hp_wmi_notify() sets info->alarm under
state->lock. If hp_wmi_notify() sets info->alarm between the read and
the subsequent clear in hp_wmi_hwmon_read(), the newly reported fan
stall or critical temperature alarm is overwritten with false and
permanently lost.

The driver-local state->lock cannot be replaced with the hwmon
subsystem lock (hwmon_lock()):
- When no connected hwmon-supported sensors are present (!count), the
  driver operates in debugfs-only mode without registering a hwmon
  device, while debugfs attributes (fungible_show()) still require
  state->lock to serialize WMI queries and sensor state updates.
- Even when sensors are connected, add_event_handler() must subscribe
  to WMI events before make_chip_info() and
  devm_hwmon_device_register_with_info() because visibility of alarm
  and intrusion attributes depends on whether event registration
  succeeded. As a result, hp_wmi_notify() can run before the hwmon
  device exists during probe and after devm unregisters and frees the
  hwmon device during removal.

Acquire state->lock in hp_wmi_hwmon_read() around reading and clearing
info->alarm to prevent losing WMI alarm events.

Fixes: 23902f98f8d4 ("hwmon: add HP WMI Sensors driver")
Cc: James Seo <james@equiv.tech>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/hp-wmi-sensors.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/hwmon/hp-wmi-sensors.c b/drivers/hwmon/hp-wmi-sensors.c
index 1953d672edaf..1a4955dbddd0 100644
--- a/drivers/hwmon/hp-wmi-sensors.c
+++ b/drivers/hwmon/hp-wmi-sensors.c
@@ -1480,8 +1480,10 @@ static int hp_wmi_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
 
 	if ((type == hwmon_temp && attr == hwmon_temp_alarm) ||
 	    (type == hwmon_fan  && attr == hwmon_fan_alarm)) {
+		mutex_lock(&state->lock);
 		*out_val = info->alarm ? 1 : 0;
 		info->alarm = false;
+		mutex_unlock(&state->lock);
 
 		return 0;
 	}
-- 
2.45.2


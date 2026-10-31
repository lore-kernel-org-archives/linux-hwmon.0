Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.202.169.39
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793460940;
	b=IVZMyKHvZmKqI0axvNMbUdKw0QJOojVbx1ifz+s+DqYDIb/efw4cYY797QU2jNSTcxTI
	 XuNghjfK9+nIKyRa7EXROl2prP7ZlJPk9XK2ddWnKJtj7772IZKFg5jaIIvmpJTDV08VR
	 /kjnVbHZl6HIuiT4fx4wSfFm5TjF0oHnWlf8tLB5YbxdHPEygMrjkdSadUG4+TiV+mdAX
	 xqZvE8o24E/TdpCAg8e99P0v6/WQEc0ffqcnkmP5Wz9NBaTuerRuienWL+e49npqrofUW
	 Ls41PS8nGiXcv9gxJHcK0AMmkXFjA3uWPjwrBNqpt6jgTrGeERDeciusB/H7Kuz4rvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793460940;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:
	 X-Source-IP:X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=e21Pe2T0RZdIOikdBXZt/9xeRY1xd6PVpevxR7XTcr8=;
	b=wJb0FdAbDUPQUxlnHJSjkQQQCHbthiOmZ2egQtZZPKBGuvugM2UM5LZ6um+ShNQDaO+t
	 zSnjaljfcEOQHKbNwNWTOpTTKnVJDsfhCBh7hFcux39eU7it1jFuX40W6LkOctdznYulG
	 hu/XvNy1Aq+h4pNM6aqDwxhef0LFbjbPh/OMbaiVLU/1P7JBh6fyEu84xLtv7Vsxrvix0
	 DjJLa0R1pKztopKfXRDy8YP5eCeqUiOmXztNT1EjfyDX3THMrlMQWcdO0FDIQmV1RtgpG
	 ScZZma03I0Zjl9lgSNkgZ5DsfSRUyJkSXykqJyn4JW8+aUZJTq57vS/OS7YVLhgW/Xg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=ao0dA0Jh;
	arc=none smtp.remote-ip=44.202.169.39
Received: from omta040.useast.a.cloudfilter.net (omta040.useast.a.cloudfilter.net [44.202.169.39])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3504606A31A
	for <linux-hwmon@vger.kernel.org>; Sat, 31 Oct 2026 15:35:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3504606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=ao0dA0Jh
Received: from eig-obgw-5001b.ext.cloudfilter.net ([10.0.29.181])
	by cmsmtp with ESMTPS
	id N7SyxJMyKMylkNB7Fxn4zi; Sat, 31 Oct 2026 15:35:33 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id NB7Ex1hG50ULmNB7Ex3AH0; Sat, 31 Oct 2026 15:35:33 +0000
X-Authority-Analysis: v=2.4 cv=JJw7s9Kb c=1 sm=1 tr=0 ts=6ae60ac5
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=660iZSQnnn4A:10 a=M0FbrtG7MMAA:10 a=VwQbUJbxAAAA:8 a=_jlGtV7tAAAA:8
 a=0GV0Y0fVeijW4RWnL7EA:9 a=nlm17XC03S6CtCLSeiRr:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=e21Pe2T0RZdIOikdBXZt/9xeRY1xd6PVpevxR7XTcr8=; b=ao0dA0Jhhv39
	CA+8dVsrcxeRv6NJhW975aFDyj151O/yRUJWY8L3Dy9DpOJN3qcWdQHhkqfFHXZW2orxmW9MBWyrx
	T7vydur7FMwPXN8068jUFtV0M0kgJBQI6r6WUmgpbwOMxYYPjK/JXtyQOn14FkGy0hpr2HkrJMCgE
	znxVHzM/6lei2XVinzmvVKTBg4r086t8eG44UEgU3uLiHuFieKXBbsI9dcN+6sh4VB6T+ovQva1FC
	l+CafhLZhdyveSnqSLdfQYlqwo7ubJtRVZG6yCtZrk6Lzvz0VyYvc+nbuM/IZo8iW13r2/IJlg/OF
	6TD8j1/0qJssufIYxnmGKQ==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:60484 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xNB7E-00000001q2T-1K2W;
	Sat, 31 Oct 2026 21:05:32 +0530
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH 1/3] hwmon: (coretemp) Check for NULL platform device in hotplug callbacks
Date: Sat, 31 Oct 2026 08:35:26 -0700
Message-ID: <20261031153528.3195123-2-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20261031153528.3195123-1-linux@roeck-us.net>
References: <20261031153528.3195123-1-linux@roeck-us.net>
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
X-Exim-ID: 1xNB7E-00000001q2T-1K2W
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:60484
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 8
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfIME7RZgS1TVPbSUaGnzOosxRO5068tJhtsqJg9mAR3inXS40MiPGZ82WRazDZGVHZwjsReSV2qu2DydwNbPotRU9XGuDRutjydancUT87N2IZaJm5Qx
 G2rS8TSzQgF+uD6BMDzyer4NZw8bQv/4Hw4E6y+1+z5bjFzUmdhlqt5PseaklyexaEt2wD/Rb1fWXKzZ8ELtxOrRY/X/6GD3eVXjMZSvZuyHq0zFjDqZYyfi

coretemp_get_pdev() returns NULL when topology_logical_die_id(cpu) is
negative (such as -ENODEV or -ERANGE from topology_get_logical_id() on a
firmware/hardware APIC ID mismatch) or exceeds max_zones (for example,
under asymmetric or anomalous ACPI die topologies where
topology_max_packages() * topology_max_dies_per_package() is smaller
than the logical die count).

Commit 6d03bbff456b ("hwmon: (coretemp) Simplify platform device
handling") pre-allocated zone_devices[0 .. max_zones - 1] during module
init and dropped the NULL checks on pdev in coretemp_cpu_online() and
coretemp_cpu_offline(), passing pdev unconditionally to
platform_get_drvdata(). When coretemp_get_pdev() returns NULL,
platform_get_drvdata(pdev) dereferences &pdev->dev and triggers a kernel
NULL pointer dereference.

Check for a NULL pdev and return 0 in both coretemp_cpu_online() and
coretemp_cpu_offline() before calling platform_get_drvdata(). Returning
0 in coretemp_cpu_online() ignores the unmapped CPU without blocking CPU
bringup or tearing down valid thermal zones on other dies.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Fixes: 6d03bbff456b ("hwmon: (coretemp) Simplify platform device handling")
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/coretemp.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/hwmon/coretemp.c b/drivers/hwmon/coretemp.c
index 3836beade59f..eb74ecd12310 100644
--- a/drivers/hwmon/coretemp.c
+++ b/drivers/hwmon/coretemp.c
@@ -695,6 +695,9 @@ static int coretemp_cpu_online(unsigned int cpu)
 	if (!housekeeping_cpu(cpu, HK_TYPE_MISC))
 		return 0;
 
+	if (!pdev)
+		return 0;
+
 	pdata = platform_get_drvdata(pdev);
 	if (!pdata->hwmon_dev) {
 		struct device *hwmon;
@@ -746,6 +749,9 @@ static int coretemp_cpu_offline(unsigned int cpu)
 		return 0;
 
 	/* If the physical CPU device does not exist, just return */
+	if (!pdev)
+		return 0;
+
 	pd = platform_get_drvdata(pdev);
 	if (!pd->hwmon_dev)
 		return 0;
-- 
2.45.2


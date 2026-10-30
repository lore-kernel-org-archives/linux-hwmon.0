Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.39
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793386404;
	b=Rr64H6+ipclRuwpiEiHCAwIBXyH6OUxdQavgJ5lrcGBoiWw6+mWo5VfIw+LwPIkVVT5e
	 cfRa5ZtxfizzoSkRv2Tk/gG4mTlwiwoQ1QEbaCgI4V6zkoDtbVxeJOzasI1+Hrq89NkkI
	 VxOocz/eO7NWrv4q4V9nOD+azMJpEpV5l87l4N1sKB1lis2IAb2S/Pc74eQMLREfp9B1K
	 4viLOmA8pj1V/92BLPgeWCR7DCJ6/Y7DZFh8aLMMmegCg6g9YarBTNDwkAqUJ46i5pA60
	 zTwwi5AKePOinIph7tZOcEj+SVf5tzU0BWHqWdO87tg3qcW2Hd2qItfYpT58BYFLY6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793386404;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:
	 X-Source-IP:X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=8qjdIY71MSliA6OlpYp4PNDL/qWvT3t/wcvTU7fMnxo=;
	b=1MywZnskPiu+wDrPwyFR3dTcK5GAMopOzQ6zPNpPeUjCdYFONjkRHRUkBXR66XHWqjRz
	 QRSxcmoeAEkbumnJzCsYGft6FfXzW6QZTJpVfjFZCrgNaZGB4GPoWt/vz1pIPH/Q08CTB
	 zDUAH0WWT8dg04Kl13p5MradCXvD+vJLjnR9zs/Lir9XECHM03UPSwdE1CvrwyvN/8l7V
	 2gS/2i9sKN4pCHrUBna0O2VAFsSR8W+iUZBeLnrRATMHLIXqDZyJvc2x21BCpru9l1UdO
	 d+Fdst1xR2kuDWHigQRp3JhS5rvyXE4VqLPHOQAbzskpDtPmSdyTbrwyfRSlpG9gHrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b="C8f/xBOi";
	arc=none smtp.remote-ip=35.89.44.39
Received: from omta40.uswest2.a.cloudfilter.net (omta40.uswest2.a.cloudfilter.net [35.89.44.39])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01215606A31E
	for <linux-hwmon@vger.kernel.org>; Fri, 30 Oct 2026 18:53:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01215606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=C8f/xBOi
Received: from eig-obgw-6004b.ext.cloudfilter.net ([10.0.30.210])
	by cmsmtp with ESMTPS
	id MrhkxW7gDc3XsMrj9xDh0f; Fri, 30 Oct 2026 18:53:23 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id Mrj9xf1qEe0duMrj9xI8GA; Fri, 30 Oct 2026 18:53:23 +0000
X-Authority-Analysis: v=2.4 cv=KINaDEFo c=1 sm=1 tr=0 ts=6ae4e7a3
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=660iZSQnnn4A:10 a=M0FbrtG7MMAA:10 a=_jlGtV7tAAAA:8 a=qzyADSyKsyQIE0a3rL8A:9
 a=nlm17XC03S6CtCLSeiRr:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=8qjdIY71MSliA6OlpYp4PNDL/qWvT3t/wcvTU7fMnxo=; b=C8f/xBOio/yA
	m987tmYRj9W4SmiSQFiZLPmksuXdijj4DnhfTRj7iq4quOAqGxIezcVjk8O0MczPIACWf6S/0JbMl
	ch2I4gFZGtzh/kHTBPdQm+LuUFYiV1FPaRcO9eVZlukw2dXk6jo5etra0z1swrxNi+anNAKNc0Dxq
	b3cQqgHNDqk5/jJS+6bC9atmpfpwdy+RcKheLfakUASO7DulHbRphknCYOooutPvfITEKSKcrDPS8
	+YlFk1yti1Mea6oVAiRAP8DEAO6gCinUmLYQdVsnMdjej17UM/MeUcn2XJAyxcnLC+77jWihqcUei
	DUFPnoC2xhQ2XT+J8N5Tjg==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:37484 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xMrj9-00000003RTX-0UUO;
	Sat, 31 Oct 2026 00:23:23 +0530
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 08/11] hwmon: (pmbus/q54sj108a2) Add missing NULL pointer check
Date: Fri, 30 Oct 2026 11:52:53 -0700
Message-ID: <20261030185256.976255-9-linux@roeck-us.net>
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
X-Exim-ID: 1xMrj9-00000003RTX-0UUO
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:37484
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 25
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfJW4x+MgWovZuUFAWGxwD8/yz3w8t64Fn0vCGtF/ViyAx317ZUnQ5Me/eDk5nKHOHdGsSIvMwRjhG9vnrcPHAwHYJPzpcqHZqCXDj23CmfqPJ8Kz8WKO
 glEdZ67InxqHEWBYD2oK6fqiwJEAK2HMH8Qi1frnxWFbVO76DoK/HGbcdOTW2mJQOZXq2ZtTGcy98jWD0AHdhorfr4laPP2ZUBuuvn3vIgk07g5aiXYRs4Si

When CONFIG_DEBUG_FS is enabled and per-client PMBus debugfs directory
creation fails during pmbus_do_probe(), q54sj108a2_probe() passes the NULL
pointer returned by pmbus_get_debugfs_dir() to debugfs_create_dir()
without validation, creating its debugfs directory at the debugfs root
instead of under the client directory.

If pmbus_init_debugfs() fails to create the client directory, data->debugfs
is left as NULL or an ERR_PTR, which pmbus_get_debugfs_dir() converts to
NULL. Passing a NULL parent to debugfs_create_dir() places q54sj108a2_dir
in the root of the debugfs filesystem and populates it with attribute files
whose private data pointers reference psu->debugfs_entries. Because this
root-level directory is outside the client debugfs hierarchy, PMBus core
cleanup does not remove it on device unbind, leaking the debugfs entries
and causing a use-after-free of the devm-allocated struct q54sj108a2_data
if the orphaned files are accessed via q54sj108a2_debugfs_read() or
q54sj108a2_debugfs_write() after device removal.

Fix the problem by adding the missing NULL pointer check.

Fixes: d014538aa385 ("hwmon: (pmbus) Driver for Delta power supplies Q54SJ108A2")
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/pmbus/q54sj108a2.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/hwmon/pmbus/q54sj108a2.c b/drivers/hwmon/pmbus/q54sj108a2.c
index ecac405d7536..b018a611d9b6 100644
--- a/drivers/hwmon/pmbus/q54sj108a2.c
+++ b/drivers/hwmon/pmbus/q54sj108a2.c
@@ -351,6 +351,8 @@ static int q54sj108a2_probe(struct i2c_client *client)
 	psu->client = client;
 
 	debugfs = pmbus_get_debugfs_dir(client);
+	if (!debugfs)
+		return 0;
 
 	q54sj108a2_dir = debugfs_create_dir(client->name, debugfs);
 
-- 
2.45.2


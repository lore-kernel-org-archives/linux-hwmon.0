Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794789732;
	b=Xvm8LoqZQzWfdk6H+5D1eXAd/hKZ3f+LBIwnpDtD2nVXNjRUhLlAS5css7K8wVT4VKNk
	 t+Mu6L0M2xgr5FDH/mg7iaVKdvULAgn80pNqtjU66CcU5MM/qKscH5xsDwMqlbhf4T1cO
	 a7FO9s10w0bOUjupe6EfdQL2GoSX2JGnPWQpmkIUwSGWab2eIAMw3ukq1+JrO5gvo/nZD
	 FE5SAuFvbmufJ9AaK7PkoZrPU5TiHIESpCSEiwlpoUd3kqX/+Y4QSc42PfKPTWhBvX8AZ
	 lLfgNh07ItK7krZIbk9VenELxLwWHfuHmgCHSFqHyYX0XH0Rj6/yhzXzRLVZDSCU4RA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794789732;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:
	 X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=b6+/Olz0BDlAxDLlENDex5nGSnNQT3v8w8D9omOUT4E=;
	b=3GObU16t1ZLv61ZJ8StbNVsCtDUH7l+KVZYij/YeXoijKIQwGvUvSbG6cvCVC0lbRra2
	 nrALz+/RPK+tWpa+l4o+2oO37w7tNJs0zug7ao5daFltDU4ejbiaU3BTVqXcMJ1oluw9I
	 6rjUL67ceAtvf/Blzh62Ftqqc6BFZbMFUKLH9UJcJ9C+cQ/EJkvkCZSWnNhUPngV/cJkH
	 tVFRnfSk0Kk37kXRbIvOapjLwiA4tWEwvmOd5E1xlHO5LoKmv9h3FbhXJEgDxFX9PUI8A
	 Xgyz/0x2hbj6ob6XESkqkPkQ8XNYJjuEjlDhELAG0bNuc/RToKKvuA+1djkwiXav/Ug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=yaT2jS4D;
	arc=none smtp.remote-ip=35.89.44.33
Received: from omta34.uswest2.a.cloudfilter.net (omta34.uswest2.a.cloudfilter.net [35.89.44.33])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FBEE606A329
	for <linux-hwmon@vger.kernel.org>; Mon, 16 Nov 2026 00:42:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2FBEE606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=yaT2jS4D
Received: from eig-obgw-6002b.ext.cloudfilter.net ([10.0.30.203])
	by cmsmtp with ESMTPS
	id SkUVxuxzLAR1iSknUxUgKp; Mon, 16 Nov 2026 00:42:12 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id SknTxD5ba8cn4SknTxhGxN; Mon, 16 Nov 2026 00:42:11 +0000
X-Authority-Analysis: v=2.4 cv=Qrde3Uyd c=1 sm=1 tr=0 ts=6afa5163
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=_jlGtV7tAAAA:8
 a=3uNsp3hANkmk-a_pTVMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=nlm17XC03S6CtCLSeiRr:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=b6+/Olz0BDlAxDLlENDex5nGSnNQT3v8w8D9omOUT4E=; b=yaT2jS4DDK0L34iG9A2rgVga4e
	idgHZJyEd5YLf7q4AaF1Z9LJJOQLhUgk9JzBiZTJm2ScbQdGm4CfnLhJfGTw2ev8SeiadGVPbZBna
	2cgLWvbgdjmoO5oN/a6DX4WSZ9NM7AHx6rHMx5w0Ga9hQSePiurAYwZS9kI7JGIy9BrDZXj6B4W9i
	7m1Oq46BMputzaBYHlyYVS8Dl0MC4AtxPD42xQ3LFko9FcSgGXRCaR/19yq5xCLC44PN8upsz1HhF
	p+j6Y05smD6Yc/4vbo4a78bus3HFZsoP1ZT1gz8nfrXZguYYLFrRdT/5+8PIGurkZogDlKdHA7fFF
	01Krxx3A==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:43378 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xSknT-00000001iJg-13FF;
	Mon, 16 Nov 2026 06:12:11 +0530
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>,
	=?UTF-8?q?Dav=C3=AD=C3=B0=20Steinn=20Geirsson?= <david@dsg.is>
Subject: [PATCH] hwmon: Use per-device lockdep keys
Date: Sun, 15 Nov 2026 16:42:09 -0800
Message-ID: <20261116004209.2570779-1-linux@roeck-us.net>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xSknT-00000001iJg-13FF
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:43378
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 16
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfIi5eEP4uvP3aaxEtjwS689QGD6OVMbbjxr9Z0eNwuE3tBHtu3NP4OVUpM/HcGFaWx4CqjRmVSis7E179xWKAJQIVk2GmuUI+mBzWcJ06sZkte6sdZBJ
 ryqMPEWqJFiMH8BYJxscvYac6fsJwpuSjwo2+o6Wg25c6Rc8V5YiRLWd3d6RyJ4GXXfErK7jS93C8QhD8OLcfik+SKfBe2viqXYI56j39zaoUAR28B9J0r8e

Currently, mutex_init(&hwdev->lock) in __hwmon_device_register() assigns
a single static lockdep key to all hardware monitoring device locks. If
one hardware monitoring device accesses another hardware monitoring
device (for example, pwm-fan controlling a PWM output provided by
adt7470), lockdep sees two instances of the same lock class acquired in
sequence and reports a false-positive recursive locking warning.

Give each struct hwmon_device its own dynamic struct lock_class_key,
registered via lockdep_register_key() and initialized with
mutex_init_with_key() before any error path that calls
hwmon_dev_release(), and cleaned up with mutex_destroy() and
lockdep_unregister_key() in hwmon_dev_release(). This allows nested
locking across distinct hwmon devices while preserving full lockdep
deadlock and self-recursion detection.

Cc: Davíð Steinn Geirsson <david@dsg.is>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/hwmon.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/hwmon.c b/drivers/hwmon/hwmon.c
index 73a818806d3d..6cfcdb9f60b7 100644
--- a/drivers/hwmon/hwmon.c
+++ b/drivers/hwmon/hwmon.c
@@ -18,6 +18,7 @@
 #include <linux/idr.h>
 #include <linux/kstrtox.h>
 #include <linux/list.h>
+#include <linux/lockdep.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/pci.h>
@@ -37,6 +38,7 @@ struct hwmon_device {
 	const char *label;
 	struct device dev;
 	const struct hwmon_chip_info *chip;
+	struct lock_class_key lock_key;
 	struct mutex lock;
 	struct list_head tzdata;
 	struct attribute_group group;
@@ -136,6 +138,8 @@ static void hwmon_dev_release(struct device *dev)
 		hwmon_free_attrs(hwdev->group.attrs_const);
 	kfree(hwdev->groups);
 	kfree(hwdev->label);
+	mutex_destroy(&hwdev->lock);
+	lockdep_unregister_key(&hwdev->lock_key);
 	kfree(hwdev);
 }
 
@@ -939,6 +943,8 @@ __hwmon_device_register(struct device *dev, const char *name, void *drvdata,
 	}
 
 	hdev = &hwdev->dev;
+	lockdep_register_key(&hwdev->lock_key);
+	mutex_init_with_key(&hwdev->lock, &hwdev->lock_key);
 
 	if (chip) {
 		const struct attribute **attrs;
@@ -993,7 +999,6 @@ __hwmon_device_register(struct device *dev, const char *name, void *drvdata,
 		tdev = tdev->parent;
 	hdev->of_node = tdev ? tdev->of_node : NULL;
 	hwdev->chip = chip;
-	mutex_init(&hwdev->lock);
 	dev_set_drvdata(hdev, drvdata);
 	dev_set_name(hdev, HWMON_ID_FORMAT, id);
 	err = device_register(hdev);
-- 
2.45.2


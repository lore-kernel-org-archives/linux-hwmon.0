Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.39
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793386403;
	b=PDbNt8jRjPyt4BCFE8HXt9cC8sCzFcwqoEtbQNWY0kvgqOv82MvHKZI5fL/blv1mpsY1
	 OvDUV2E2Fwu7+a2UM9HXSDz6r5BIsYhjW9i7pRVXdwmBHBrVT30BZooVkIemQo06+LMiK
	 FGtvgeWHBWEfUa3gkJmfBrDGeDJj2Ro1Oy/7FsUoSj/GptAlqZUDXx/iofBsUyBhbk0Oc
	 wv8qRiu1fAsvgo5I1vnNa8DrLeVxK4Qa49haqg7e/PE9yD0u3Wl/158oud+FcyXkfLJ63
	 JH14ZnKo6lltCd2Yellj1AlGJ+LcuMwrwt5qIBjXaLYOE52dpQ8EWsR25uiZP3VKcMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793386403;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:
	 X-Source-IP:X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=q6aexpVA2ySm9bFEwfy2+9diS9xnCGOOHFC9v8vpIOI=;
	b=oH61WHViISe5txQeqT0s0xmhyGRaY+YFHXj2uj2vQNdWdjlXRqBl2kCy51XsxS9cfdvN
	 /d/T3Q/HE7PE6Ve7oK8mb4Bg/GkCv4MvbwR+JgKzy4+uiMPvfwZTnj0lj6EZqbOUaZzHL
	 rGrQtBAq7NFBvPEYD+akRVOeR+tOX+oB28iiawITTWX255Cqf+Sm8GaIRCIJ7A++0khdv
	 H5s3KOO50c4CCLp0igGWkZgeOZLiEDxk1g/FONU45z86lbB9CYacCv1EVaFLSFVA3drOg
	 6KnAWNcSWxEpGrKCTGcvu5/0WlbuekaW9TzEZ8wbQ42JWKfXahmeAeSjKyrbULjI0qQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b="gMz/QJ+k";
	arc=none smtp.remote-ip=35.89.44.39
Received: from omta40.uswest2.a.cloudfilter.net (omta40.uswest2.a.cloudfilter.net [35.89.44.39])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77CB2606A31A
	for <linux-hwmon@vger.kernel.org>; Fri, 30 Oct 2026 18:53:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77CB2606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=gMz/QJ+k
Received: from eig-obgw-6005b.ext.cloudfilter.net ([10.0.30.162])
	by cmsmtp with ESMTPS
	id MlkjxUdwBc3XsMrj9xDh0P; Fri, 30 Oct 2026 18:53:23 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id Mrj8xwoye8LLeMrj8xwo0V; Fri, 30 Oct 2026 18:53:23 +0000
X-Authority-Analysis: v=2.4 cv=BenY0qt2 c=1 sm=1 tr=0 ts=6ae4e7a3
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=660iZSQnnn4A:10 a=M0FbrtG7MMAA:10 a=QyXUC8HyAAAA:8 a=_jlGtV7tAAAA:8
 a=eHMhdYcSVKZY0jOA81cA:9 a=nlm17XC03S6CtCLSeiRr:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=q6aexpVA2ySm9bFEwfy2+9diS9xnCGOOHFC9v8vpIOI=; b=gMz/QJ+ksyzl
	tz6cI2nP46Fq6kEW+XRanPf+tQzNMcW9lvfOT5RB0Slod8uYUOO3yOMZA/rRMcsO6MlHiRBydxRuk
	Fk0yuql80aHIN7znhkDm++NK+PqWEadyhxSf6hKz5KT+DcX0JoiL3U7iI9OrroA9oBnC9xJQANesH
	ra5vDa/cGke8DW8KjrN/woy5BXwGNLPneaEwcjCvCXvV7DFsrgX+UdIHljHVLI9ssUhQcKu4Y9FA1
	FwiOPcphraAWLjUkPf8oqrdBABidTLb0rFiQmWfRiTdoBsdE8H8dM/IEdlYWq9ZdAAvkx3YemxBv8
	bWrUMF/4BmqoFdUKae+gNg==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:43092 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xMrj8-00000003RSH-1xjZ;
	Sat, 31 Oct 2026 00:23:22 +0530
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>,
	Iwona Winiarska <iwona.winiarska@intel.com>
Subject: [PATCH 07/11] hwmon: (peci/dimmtemp) Fix devres leak and UAF on concurrent unbind
Date: Fri, 30 Oct 2026 11:52:52 -0700
Message-ID: <20261030185256.976255-8-linux@roeck-us.net>
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
X-Exim-ID: 1xMrj8-00000003RSH-1xjZ
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:43092
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 24
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfCe/ufXZGJA36tcUO9rbGhM0FV5xAgW4eqHMrdhSfJMtc8R7hrHz10Z6XSkSsK05ipZ9aPjGbZagZSM8ln7KGpSjWj2LM/m6ITCdwdrCJ1ctwvBgHJeP
 km2K6FjRnWP+zkCl582G1K1/CkNeFvuLqsbEBdvwuxapTLBLmoTXedqiAo9lrqclgo1zFtA2KvTC1Ag25Nx8dCHttYD6UyfdSMoD+UuueUmZmS/4tGNgqL0h

When a peci_dimmtemp device is unbound concurrently with its delayed
initialization work (detect_work), newly allocated devm resources and
the hwmon device are leaked, leading to a use-after-free when reading
the lingering hwmon sysfs attributes.

In peci_dimmtemp_probe(), detect_work is registered for cancellation via
devm_delayed_work_autocancel(). During driver detach, devres_release_all()
first moves all existing entries from dev->devres_head onto a local todo
list before invoking their release callbacks in reverse order. If
create_dimm_temp_info_delayed() is already running when
devm_delayed_work_drop() calls cancel_delayed_work_sync(),
create_dimm_temp_info() can allocate dimmtemp_label strings via
devm_kzalloc()/devm_kasprintf() and register the hwmon device via
devm_hwmon_device_register_with_info(), appending new devres entries to
the now-empty dev->devres_head. Once the work finishes,
devres_release_all() frees priv and priv->name from the local todo list
without re-evaluating dev->devres_head, leaving the late devres
allocations and registered hwmon device behind with a dangling priv
pointer.

Cancel detect_work synchronously in a driver .remove() callback instead
of relying on devm_delayed_work_autocancel() so that the work is fully
drained before devres_release_all() detaches dev->devres_head, allowing
any devm resources registered by the delayed work to be released in
proper reverse order. Also only schedule detect_work when
check_populated_dimms() returns -EAGAIN so that probe failure paths do
not leave delayed work pending.

Fixes: 73bc1b885dae ("hwmon: peci: Add dimmtemp driver")
Cc: Iwona Winiarska <iwona.winiarska@intel.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/peci/dimmtemp.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/drivers/hwmon/peci/dimmtemp.c b/drivers/hwmon/peci/dimmtemp.c
index bd3e8715dfec..617a4cc0f65c 100644
--- a/drivers/hwmon/peci/dimmtemp.c
+++ b/drivers/hwmon/peci/dimmtemp.c
@@ -4,7 +4,6 @@
 #include <linux/auxiliary_bus.h>
 #include <linux/bitfield.h>
 #include <linux/bitops.h>
-#include <linux/devm-helpers.h>
 #include <linux/hwmon.h>
 #include <linux/jiffies.h>
 #include <linux/module.h>
@@ -326,11 +325,13 @@ static int create_dimm_temp_info(struct peci_dimmtemp *priv)
 	if (ret == -ENODEV) {
 		dev_dbg(priv->dev, "No DIMMs found\n");
 		return 0;
-	} else if (ret) {
+	}
+	if (ret == -EAGAIN) {
 		schedule_delayed_work(&priv->detect_work, DIMM_MASK_CHECK_DELAY_JIFFIES);
 		dev_dbg(priv->dev, "Deferred populating DIMM temp info\n");
-		return ret;
 	}
+	if (ret)
+		return ret;
 
 	channels = priv->gen_info->chan_rank_max * priv->gen_info->dimm_idx_max;
 
@@ -398,10 +399,8 @@ static int peci_dimmtemp_probe(struct auxiliary_device *adev, const struct auxil
 			 "Unexpected PECI revision %#x, some features may be unavailable\n",
 			 peci_dev->info.peci_revision);
 
-	ret = devm_delayed_work_autocancel(priv->dev, &priv->detect_work,
-					   create_dimm_temp_info_delayed);
-	if (ret)
-		return ret;
+	auxiliary_set_drvdata(adev, priv);
+	INIT_DELAYED_WORK(&priv->detect_work, create_dimm_temp_info_delayed);
 
 	ret = create_dimm_temp_info(priv);
 	if (ret && ret != -EAGAIN) {
@@ -412,6 +411,13 @@ static int peci_dimmtemp_probe(struct auxiliary_device *adev, const struct auxil
 	return 0;
 }
 
+static void peci_dimmtemp_remove(struct auxiliary_device *adev)
+{
+	struct peci_dimmtemp *priv = auxiliary_get_drvdata(adev);
+
+	cancel_delayed_work_sync(&priv->detect_work);
+}
+
 static int
 read_thresholds_hsx(struct peci_dimmtemp *priv, int dimm_order, int chan_rank, u32 *data)
 {
@@ -665,6 +671,7 @@ MODULE_DEVICE_TABLE(auxiliary, peci_dimmtemp_ids);
 
 static struct auxiliary_driver peci_dimmtemp_driver = {
 	.probe		= peci_dimmtemp_probe,
+	.remove		= peci_dimmtemp_remove,
 	.id_table	= peci_dimmtemp_ids,
 };
 
-- 
2.45.2


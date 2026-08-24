Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E3AC3806D2
	for <linux-hwmon@vger.kernel.org>; Mon, 24 Aug 2026 17:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787593871; cv=none; b=W0RZS2WIsgm3n9nk09N8aZO/9QAAejLb1sWTCgWw/eSw18gZTtpcIl3CJn1ju/2vqr8mNVXSQOOakiGtuf+aBMtUz7kOHe8Rfe7QUUdIv6TeXmKN/77t8HcDUKuXLBBowtbpu3GYrlMz70IzHWgiAOewzgeObL5NH005+7D3IAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787593871; c=relaxed/simple;
	bh=F4Vn7w9he8XvFaQgePxC49jos8Ircb4h09eWzonsEE8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Yb6cdfOdu4w614Otb4iMqHC+4pV0PEe17xStYqhV1NHHP5NZlJVjMWm3jYZqLalv8v/0b+xmSSL1z7/Ao3OcejrqT3i2MOUFV8x2cZqC7Tt8EC5EHcrCD0V239fQdPNktjYIAKvTCQatO9X5FD2NOU9is+ZpjERW4mT/A3xA3dI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fDVpcOgt; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fDVpcOgt"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-38dc4553f62so5118387a91.0
        for <linux-hwmon@vger.kernel.org>; Mon, 24 Aug 2026 10:51:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787593869; x=1788198669; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q4WjCM0YGYpG6uGbEGVqjVtxdg84mLbv5nOzooF+Ac4=;
        b=fDVpcOgt5XZbnEKR0ZvR2QLm2c2Dr/bbUcaEsBnGtjqmfP/9+AyEbp5VpuHqumPv/v
         6o46WDwiKPj2HZVMlmi0PTSLnecbQubO+nhonvO6SHd4u0MjfqvB7oWJtoQ6o14WK97o
         6AU1FAAb0joNT+npr/oiiRaeqTbOzHC4RLM75RwwlfKooRzre0TlQcSsTA3+T5/EbEtX
         OYrxV+UyA0sGhYv/Agqtz1hb+RPqilwSrZfCdCymu2Nk56mKdmI0dzV5af9xcVe3u8gH
         hL5FvMZqRKuEqF5U/SL3uhiWAoR8kUpDaxGzuPbFVyB6M/+hi9Kzr/O4yspTi3pR9fLL
         QKyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787593869; x=1788198669;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Q4WjCM0YGYpG6uGbEGVqjVtxdg84mLbv5nOzooF+Ac4=;
        b=C6YIjz+Tms1Cmr+DQ+d7CUh1Jpak8jz8wVErX7ELXqBl0UclFZ1dPoQARvpq32YsPN
         Qlja5DwNF1gIZSVDXGrQmR7oxJs+sTvabGiJvTxQxJX7S6M+JoDitKioX6m1EGnrtDIS
         GsGPbSClEBCRRBHDtarGBdXonAQ3Y7iOd4M7Q8uN5yD+Rg4YtTkpfMsqNxYu5pTxlmj0
         neX1k+vOWCgRQZUduwT3fYAqy3/icTHkupmqL8wyLjheyavh4KVmcHqhJylrXHJAPDJM
         TB7XF8/rYzX8OwFHmNPq4JWRDBaMcpXsQTkprcSbKTn0AVoN90RbN2pp8MCFWdNK452M
         d0LQ==
X-Forwarded-Encrypted: i=1; AHgh+RpZQSBwuawsNUnpDKqje2FdXx1naWQf7hR/1XuQocNeWdcapOV483Jp5JqbIiSG7rVG79jeTj6M7tx62w==@vger.kernel.org
X-Gm-Message-State: AFuF++nE0OWmq/3MDdlAk+0xHynd8rQ9ez6c6OUoz/J3+FjcyWzYGDIr
	sCGZ7iZQK9ZrAKUUgN4kEXjJ9ivPc82sZaOJFqPp59M/a7cxHBBhlq2r
X-Gm-Gg: AR+sD13qTvnPiuQ/bqG1mz1zGQKwDjpChhEjPRkSZ+2S631fiMN4csyWQ27wBNt+s5a
	hFoYKAScjs8a20DfthIaD/ifee7EdRzq2EZxXfuoV4a0Z7GQX2pUGsIwf72q/b5Z2g3Ocnfuirv
	tUA6bw5lwN37I88B9eFTey5pPnMWVhR16MLbix72Lq8OG13u0X1cUkblwyd4Cs1T/DuUPh03Dg2
	lBlsUCPwv9JmbBCe0SMFt1DjxmC72eC0yIGcknoTktkQafwDlRaQKpIIBN7tzw/2+pu3EDrTWh4
	YM9vpx2GpCYKf8LWPPLeTQuTGqwc1JTryJnnTJuXbH1kGkphRBnu4nVjIKa6mB0lD1cMVSENJUF
	wGgzux/YuQb+xkwwwjiJl7FDY6T5q8uhlBLM0rpGSw2U9fvWzM4Hmp4uF/+qSZcx+qI6LDGKnNM
	75213krLcSKYOu0Y6zzyplw2J/fA/NolYfhc5KK/Y76xiWX5loNLWJqOVpRXpc9rsB9xc=
X-Received: by 2002:a17:90a:d64e:b0:38e:1497:af5b with SMTP id 98e67ed59e1d1-395c33dd84dmr53348731a91.1.1787593868662;
        Mon, 24 Aug 2026 10:51:08 -0700 (PDT)
Received: from localhost ([2620:10d:c090:500::4:ddd2])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141861732f8sm26815372c88.10.2026.08.24.10.51.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 10:51:08 -0700 (PDT)
From: Zinc Lim <limzhineng2@gmail.com>
To: Alexander Duyck <alexanderduyck@fb.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Simon Horman <horms@kernel.org>,
	Mohsin Bashir <mohsin.bashr@gmail.com>
Cc: kernel-team@meta.com,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	zinclim@meta.com,
	Zinc Lim <limzhineng2@gmail.com>
Subject: [PATCH net-next v2 3/6] eth: fbnic: cache hwmon sensor readings
Date: Mon, 24 Aug 2026 10:50:56 -0700
Message-ID: <20260824175059.2485048-4-limzhineng2@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260824175059.2485048-1-limzhineng2@gmail.com>
References: <20260824175059.2485048-1-limzhineng2@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Each hwmon attribute access triggers its own TSENE firmware mailbox
round-trip, so reading the full set of attributes or polling them at a
high rate floods the firmware mailbox with quick, successive IPC messages
for data that barely changes between ticks.

Cache the last temperature and voltage reading and serve reads from it
for the remainder of the current jiffy. A single TSENE response carries
both readings, so one transaction on a miss refreshes both and satisfies
a whole batch of reads. The cache is seeded with the FBNIC_SENSOR_NO_DATA
sentinel at registration so the first read always refreshes, and
concurrent reads are serialized by the hwmon core so no additional
locking is required.

Signed-off-by: Zinc Lim <limzhineng2@gmail.com>
---
 drivers/net/ethernet/meta/fbnic/fbnic.h       |  7 ++++
 drivers/net/ethernet/meta/fbnic/fbnic_fw.h    |  7 ++++
 drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c | 36 +++++++++++++------
 3 files changed, 40 insertions(+), 10 deletions(-)

diff --git a/drivers/net/ethernet/meta/fbnic/fbnic.h b/drivers/net/ethernet/meta/fbnic/fbnic.h
index d0715695c43e..f647ef07704b 100644
--- a/drivers/net/ethernet/meta/fbnic/fbnic.h
+++ b/drivers/net/ethernet/meta/fbnic/fbnic.h
@@ -22,11 +22,18 @@ struct fbnic_napi_vector;
 #define FBNIC_MAX_NAPI_VECTORS		128u
 #define FBNIC_MBX_CMPL_SLOTS		4
 
+struct fbnic_hwmon_cache {
+	unsigned long last_read;
+	s32 temp_mdeg;
+	s32 volt_mv;
+};
+
 struct fbnic_dev {
 	struct device *dev;
 	struct net_device *netdev;
 	struct dentry *dbg_fbd;
 	struct device *hwmon;
+	struct fbnic_hwmon_cache hwmon_cache;
 	struct devlink_health_reporter *fw_reporter;
 	struct devlink_health_reporter *otp_reporter;
 
diff --git a/drivers/net/ethernet/meta/fbnic/fbnic_fw.h b/drivers/net/ethernet/meta/fbnic/fbnic_fw.h
index d84723e4cfa3..42a5f83ddb45 100644
--- a/drivers/net/ethernet/meta/fbnic/fbnic_fw.h
+++ b/drivers/net/ethernet/meta/fbnic/fbnic_fw.h
@@ -6,6 +6,7 @@
 
 #include <linux/completion.h>
 #include <linux/if_ether.h>
+#include <linux/limits.h>
 #include <linux/types.h>
 
 struct fbnic_dev;
@@ -44,6 +45,12 @@ struct fbnic_fw_ver {
 	char commit[FBNIC_FW_CAP_RESP_COMMIT_MAX_SIZE];
 };
 
+/* Sentinel for a sensor value the driver does not have: a threshold the
+ * firmware never populated (older firmware) or a cache entry not yet
+ * refreshed.
+ */
+#define FBNIC_SENSOR_NO_DATA			S32_MIN
+
 struct fbnic_fw_cap {
 	struct {
 		struct fbnic_fw_ver mgmt, bootloader;
diff --git a/drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c b/drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c
index 38bb26cb8e6c..f35cb0065093 100644
--- a/drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c
+++ b/drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c
@@ -2,6 +2,7 @@
 /* Copyright (c) Meta Platforms, Inc. and affiliates. */
 
 #include <linux/hwmon.h>
+#include <linux/jiffies.h>
 
 #include "fbnic.h"
 #include "fbnic_mac.h"
@@ -25,26 +26,32 @@ static umode_t fbnic_hwmon_is_visible(const void *drvdata,
 
 static int fbnic_hwmon_sensor_read(struct fbnic_dev *fbd, int id, long *val)
 {
+	struct fbnic_hwmon_cache *cache = &fbd->hwmon_cache;
 	struct fbnic_fw_completion *fw_cmpl;
 	int err = 0;
-	s32 *sensor;
-
-	fw_cmpl = fbnic_fw_alloc_cmpl(FBNIC_TLV_MSG_ID_TSENE_READ_RESP);
-	if (!fw_cmpl)
-		return -ENOMEM;
+	s32 *cached;
 
 	switch (id) {
 	case FBNIC_SENSOR_TEMP:
-		sensor = &fw_cmpl->u.tsene.millidegrees;
+		cached = &cache->temp_mdeg;
 		break;
 	case FBNIC_SENSOR_VOLTAGE:
-		sensor = &fw_cmpl->u.tsene.millivolts;
+		cached = &cache->volt_mv;
 		break;
 	default:
-		err = -EINVAL;
-		goto exit_free;
+		return -EINVAL;
+	}
+
+	if (*cached != FBNIC_SENSOR_NO_DATA &&
+	    time_is_after_eq_jiffies(cache->last_read)) {
+		*val = *cached;
+		return 0;
 	}
 
+	fw_cmpl = fbnic_fw_alloc_cmpl(FBNIC_TLV_MSG_ID_TSENE_READ_RESP);
+	if (!fw_cmpl)
+		return -ENOMEM;
+
 	err = fbnic_fw_xmit_tsene_read_msg(fbd, fw_cmpl);
 	if (err) {
 		dev_err(fbd->dev,
@@ -67,7 +74,12 @@ static int fbnic_hwmon_sensor_read(struct fbnic_dev *fbd, int id, long *val)
 		goto exit_cleanup;
 	}
 
-	*val = *sensor;
+	/* FW returns both readings in one response, cache both. */
+	cache->temp_mdeg = fw_cmpl->u.tsene.millidegrees;
+	cache->volt_mv = fw_cmpl->u.tsene.millivolts;
+	cache->last_read = jiffies;
+
+	*val = *cached;
 exit_cleanup:
 	fbnic_mbx_clear_cmpl(fbd, fw_cmpl);
 exit_free:
@@ -107,6 +119,10 @@ void fbnic_hwmon_register(struct fbnic_dev *fbd)
 	if (!IS_REACHABLE(CONFIG_HWMON))
 		return;
 
+	/* Seed cache with sentinel so the first read always refreshes. */
+	fbd->hwmon_cache.temp_mdeg = FBNIC_SENSOR_NO_DATA;
+	fbd->hwmon_cache.volt_mv = FBNIC_SENSOR_NO_DATA;
+
 	fbd->hwmon = hwmon_device_register_with_info(fbd->dev, "fbnic",
 						     fbd, &fbnic_chip_info,
 						     NULL);
-- 
2.53.0-Meta


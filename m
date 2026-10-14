Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D5AF4AC161
	for <linux-hwmon@vger.kernel.org>; Wed, 14 Oct 2026 22:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792016554; cv=none; b=PX9eiTnbJKrDZPscqmrkmPQDmr/BSpShAL0wa3HpxmDkxQ2DWwr1okd4aWq3dtdRRS2XdKjytx5pX82BPFs7RLYWVYjyhQr2dGejDvuxWDQygf3/xSYPUCG6Xx/XxSXaMv+4ZGlCoa5u0VFXnSCHDvkEH8Rr1qNysXWkCq1XD7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792016554; c=relaxed/simple;
	bh=1LQQnH3Df+SOEKqlRwe0Shj3+oVhATZyZAPjcDT/2BY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V7DNK8WMpzOdioYBSrOI5mpP6239dLR19MNwUlSTzIUbPm8tP98dVgwBaLJtIgpvYiO4G1t2044GaVhJwB7zeyH78L48WsKcxUePyldISWlacJnN0Ty57VJKRtwGq6E5j0ApH66a1IUGTnRXNjfJRQgiggXgoVasJu1iOlWMq1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lZYc8oAs; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lZYc8oAs"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-35b2c599f43so6144361eec.0
        for <linux-hwmon@vger.kernel.org>; Wed, 14 Oct 2026 15:22:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792016552; x=1792621352; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k7E54Gamm23I7pb6W2akdaDghKzKpOihGThuE98U3QY=;
        b=lZYc8oAsqSIr19FS936xk9dnom0krY5ok2UcOKs4KnPE5I4/DJqjT4g8HITQ38wn+9
         XzNrCi7h7pjMESHkYtm2D5j9GRKFA66rzXxLRW1R2HT/tvZxHrjuc1SpcJACFqoW2H9f
         dqQaoDC975xiF+qs3Ok/Sap5suL34XYgnWWJSNkN88Wu6G+Yz2poCndS2MqE7b+bV6ko
         GFoeJJpc5pVUx3cSEEKQ2r7uM/zaDfiMskomzEk9Ah1kvO6//hmaKVRksDdEbDhKROve
         Or7OfSNIjvZTT32fV7DrKx/GDqhp/X920o6IOtE/vvbtQ+kfKqJTGqzPNml0Lkq6gpOF
         QnTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792016552; x=1792621352;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=k7E54Gamm23I7pb6W2akdaDghKzKpOihGThuE98U3QY=;
        b=CaoLvTO1Ae76REv7sRfvwjZhsRTHTHpmopHUrAv+WxL81ZCvQtmjM5jgGWoenO0WV3
         IIY6dIofDbCoelkVpujnfImVNBFETDOKfEIJ0Tjhcw4ONxWHd2eZVtVXWPnsQkpM4TRl
         pJVThGZxrzvJ9O3/g9OH/VaQaOIkDpmZJgLa1N7+NrLYFX+Mev3jQVsFbgVCZP5J147R
         rkFb84boGIxA4PhjWjKBzf56IyGW+q3DTSiYj6I2jiVLi7r/wPf94m7Y7H3n+1JMM+Eo
         v7xCGvkUV2al91dsBvPxPEwg4CsTAdvdSK307ZDDNYu5edAJ7CXGFwUlgr7tNR0286Ov
         n2nQ==
X-Forwarded-Encrypted: i=1; AKwUvBx3B2ta2/o0//8yGwxnECQsrUiwSnaNwjEZkRdJ5gleddMEgezLAr+WaGqgNtR/AGicNcpUx9TkwZtKyg==@vger.kernel.org
X-Gm-Message-State: AFq9FYLX1q/qBpp0qdpypRHPF1MmPfnYaNbKZjIR2aJgr5cMsHBFQqLj
	yHkyliXRVPyF32k15qv9cQv9fuBPhwXD695JN0fU7yrIEQtny7N4b5c5
X-Gm-Gg: AYBFou0Dy+oJhLgbI4cfvyDsDh3bbYGdBQ4h44lUKa300smueHOgL1Qz989xhqrNc/k
	YDPKA3V7kxTZxxpxs0q9BYLwbijKn/cv32xowuke7YLc07PKkt+kuTFhUVbI4hc4toEO+xLDjh1
	lpHpo9y9o0NBdL7HviyDhUL7mIr3SHd3hOtqBheCEwTsaNKc/otDC6+ycrFTj4Pv26+/F5oFMmd
	t9VUje+qN0WTozf52Tzh5EK7vvlmBvNE3JAVDADLlDHfCTz6KSCh8c9gfZEcL2rzD4yH7a0IoVW
	cWcIsDyVskGp4AzCskMsnjFvJKX0XUd0lw4sd7AbE/+R2u7JX1PMDFG4IJnGdnqXd3Vc/P/xP/p
	1KHfTAfRF9A4bf1o6IXZldj1xmabSrha9xaazv8GVbrdHucaRFB1rcaF3V0ewxJjYMkwf5mTsPL
	oajbhfnHiADYuHJJjH0lATQ1X5teY7H+bqp9txjAlXrYAgk5dQfKeQjdoaEeD71q2jM+xBfXkbZ
	t1hKQ==
X-Received: by 2002:a05:7300:8b14:b0:35f:f0:8edf with SMTP id 5a478bee46e88-35f00f09f07mr1334564eec.13.1792016552128;
        Wed, 14 Oct 2026 15:22:32 -0700 (PDT)
Received: from localhost ([2620:10d:c090:500::5:7561])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35f0c3bcf80sm1295905eec.7.2026.10.14.15.22.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 15:22:31 -0700 (PDT)
From: Zinc Lim <limzhineng2@gmail.com>
To: alexanderduyck@fb.com,
	kuba@kernel.org,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	pabeni@redhat.com,
	linux@roeck-us.net,
	horms@kernel.org,
	hmohsin@meta.com,
	mike.marciniszyn@gmail.com
Cc: kernel-team@meta.com,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	zinclim@meta.com,
	limzhineng2@gmail.com
Subject: [PATCH net-next v4 2/6] eth: fbnic: cache hwmon sensor readings
Date: Wed, 14 Oct 2026 15:22:20 -0700
Message-ID: <20261014222225.2803660-3-limzhineng2@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261014222225.2803660-1-limzhineng2@gmail.com>
References: <20261014222225.2803660-1-limzhineng2@gmail.com>
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
sentinel in fbnic_mbx_init() so the first read always refreshes.

Signed-off-by: Zinc Lim <limzhineng2@gmail.com>
---
 drivers/net/ethernet/meta/fbnic/fbnic.h       |  7 +++++
 drivers/net/ethernet/meta/fbnic/fbnic_fw.c    |  7 +++++
 drivers/net/ethernet/meta/fbnic/fbnic_fw.h    |  7 +++++
 drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c | 31 +++++++++++++------
 4 files changed, 42 insertions(+), 10 deletions(-)

diff --git a/drivers/net/ethernet/meta/fbnic/fbnic.h b/drivers/net/ethernet/meta/fbnic/fbnic.h
index 1f9fbd71447f..857a64b518f3 100644
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
 
diff --git a/drivers/net/ethernet/meta/fbnic/fbnic_fw.c b/drivers/net/ethernet/meta/fbnic/fbnic_fw.c
index 49b8813a3564..82307f212f58 100644
--- a/drivers/net/ethernet/meta/fbnic/fbnic_fw.c
+++ b/drivers/net/ethernet/meta/fbnic/fbnic_fw.c
@@ -105,6 +105,13 @@ void fbnic_mbx_init(struct fbnic_dev *fbd)
 	/* Reset FW Capabilities */
 	memset(&fbd->fw_cap, 0, sizeof(fbd->fw_cap));
 
+	/* Seed cache with sentinel so the first read always refreshes. The
+	 * cache mirrors what firmware reported, so drop it when the mailbox
+	 * restarts.
+	 */
+	fbd->hwmon_cache.temp_mdeg = FBNIC_SENSOR_NO_DATA;
+	fbd->hwmon_cache.volt_mv = FBNIC_SENSOR_NO_DATA;
+
 	/* Reinitialize mailbox memory */
 	for (i = 0; i < FBNIC_IPC_MBX_INDICES; i++)
 		memset(&fbd->mbx[i], 0, sizeof(struct fbnic_fw_mbx));
diff --git a/drivers/net/ethernet/meta/fbnic/fbnic_fw.h b/drivers/net/ethernet/meta/fbnic/fbnic_fw.h
index f47669129c9d..ddedb7c0e0a7 100644
--- a/drivers/net/ethernet/meta/fbnic/fbnic_fw.h
+++ b/drivers/net/ethernet/meta/fbnic/fbnic_fw.h
@@ -6,6 +6,7 @@
 
 #include <linux/completion.h>
 #include <linux/if_ether.h>
+#include <linux/limits.h>
 #include <linux/types.h>
 
 struct fbnic_dev;
@@ -59,6 +60,12 @@ enum {
 	(BIT(FBNIC_FW_CAP_F_BMC_TCAM_REINIT) |	\
 	 BIT(FBNIC_FW_CAP_F_BMC_MACDA_SYNC))
 
+/* Sentinel for a sensor value the driver does not have: a threshold the
+ * firmware never populated (older firmware) or a cache entry not yet
+ * refreshed.
+ */
+#define FBNIC_SENSOR_NO_DATA			S32_MIN
+
 struct fbnic_fw_cap {
 	unsigned long state;
 	struct {
diff --git a/drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c b/drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c
index 6c8c66ab86c1..0c3fe2a37227 100644
--- a/drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c
+++ b/drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c
@@ -2,6 +2,7 @@
 /* Copyright (c) Meta Platforms, Inc. and affiliates. */
 
 #include <linux/hwmon.h>
+#include <linux/jiffies.h>
 
 #include "fbnic.h"
 #include "fbnic_mac.h"
@@ -30,26 +31,31 @@ static umode_t fbnic_hwmon_is_visible(const void *drvdata,
 
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
+	if (*cached != FBNIC_SENSOR_NO_DATA && cache->last_read == jiffies) {
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
@@ -72,7 +78,12 @@ static int fbnic_hwmon_sensor_read(struct fbnic_dev *fbd, int id, long *val)
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
-- 
2.53.0-Meta


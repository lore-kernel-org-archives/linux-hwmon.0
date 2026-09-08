Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B23C55908BE
	for <linux-hwmon@vger.kernel.org>; Tue,  8 Sep 2026 22:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788908270; cv=none; b=HHVCqWt+vqBojtzXLQSysMVVv5N97EVDdacAbQLDrgcRmNvwPsCHeZV6Ln+URF+fv46Ghb4dipGGrDbswT8Mry1IiaXYrL+QFNTY3XJVItgaRPzlRC/ku4XDNX3FHn/FrjZ2WpbplQj7kKTuVDsexJg6Z44flWnN6Nnesitlkmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788908270; c=relaxed/simple;
	bh=DQmWpiiP+cD4WOs/XMACwGLUuwq7F0q+Wq6Ld9uy2Lg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TxpwF+QLWf6ltp0SuIKOJ9hyRYeEgfjwTuMMYMX9tNG6+hSReFNYiInTxW9zPdKowWoIL4xKzgIvKsoINgTOxMmt5WrBNM2Mh0m0LqplVZHwoTCSyqf6pa2aEoqew2O0eu2imwudGjLbsu3oYH087Ia6HBxkw0qUBFRpUJ7noA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mmpF6IUC; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mmpF6IUC"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-381b831d535so8162246a91.0
        for <linux-hwmon@vger.kernel.org>; Tue, 08 Sep 2026 15:57:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788908265; x=1789513065; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wumeOXgAu9H0Kp97qaCmHzt/GpEB2ltmfWp7a6Ii+u8=;
        b=mmpF6IUCM7VAx/+T0HKOxspCt5wTL6l3DBH1qE0kFMamRLzsk1/q1FZ7WazcbNfllG
         9ujr5jSZAeclJVXXgd9btNs/9DDa0sDGcnp52koT+04HQAIeYZrFSJDbCV2kZ+NZeh+z
         9mMEiXmviEO3YQ/qPCl4/g4ZeFiXvY3f52+NFAnyn4zu+Kojd/Pk/SXoaJp+rYKuLhAO
         4WBVveJglt203np0sidV/zQCS9VGqskgNlx5v6/ecoxlGPDoNC+b2HYcZlUoLZyBzFvK
         8XyUR9U9biWQrbdQlfyGr9SZnoBBjyDBuDg0UUTjzY6a1IJFrg2GZmyVDgrepMv+JNYM
         P16A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788908265; x=1789513065;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wumeOXgAu9H0Kp97qaCmHzt/GpEB2ltmfWp7a6Ii+u8=;
        b=k1VMPwF391tBzwGrEICMxVJsE5Ad+tSj5BlceY2ZdIc4EXAwHNeioEIDgsqrzyhskJ
         VDBXEywu3QZbZAikF+FLVNU2NpnoQvtzNpgErMLQ4Bdc58hu5JAEBFsh5SCnvLVyBVQC
         M7NiUmk79SI4+UhPBljynr4AQ451Hud1Zc2bSmtEkLBPU8Gq0UifpTyTOa/h/Ylhv6Ck
         zdKcpfJ8GLsukyhEP3iSaq0wGzM6jaUVIRYCocz0YQ7sRMpXsxk8J0XKB5ZTCzfaMKe5
         OdAG8XeungGg9V1jd7Z/l2RUpSVtWKL+iO5QpJfORT4Mzf5qZylYnMiV867uY4C3i6s6
         XR3Q==
X-Forwarded-Encrypted: i=1; AKwUvBwDLAAwD/4cEzZfwZ6iBgt301GkNl1OrCCXO1ycSVDmmRijaQ14kp2XXlsK0uoLP837fdTPWdrSUgd43A==@vger.kernel.org
X-Gm-Message-State: AFuF++lIYOaYyT7/O3c4ml1dQUrx51B/NA8Yz6JELOOYAczzVBFFJDok
	sxd4WhqUKAZwRXv62ptVhQaXvFMnqm+cjqovFYzmbas3UU9DJ5FFJruL
X-Gm-Gg: AYBFou24C0o+eCcQ+vrYk/j46SXs6WyIcXwCm6zLPJuPEOdh4L9nxYTludynMeT8ihQ
	P2XMXCGSNu5bcCJrZpqfIre/jz6tWzI/0JNIqGhR7uGs02WgAo2MoP73ypQ24yYURdqUiL9Fe4W
	NqGTEeT7Ti3LWuSJVdmf5s7NqyhW9P93gtgXdYPkKuNtkjHD3tgdzIzYkLYcIS3Str+RbniXUG2
	SiZFmgtpniCj3lM3dX//e+OPJ+0dHP1Tn8MZ/NBvZ47CVwZUBocqSsw0VCVBJNaS//B6suQPfuv
	VeVpFfIQDg/M0Z3jD1HHc81O+TvOW3LIKQrurYTWPKfQiOTt88T4zOpwgJTxJCRhqsg7dJmD9vB
	YUaxG1wH+e4L6PaevrqXGVXZ8++957VL64tUerxem7lFpYuoKx8AYnmAGfagpghPWBir9145yka
	ougRtNHp2pxgjsBUTL9cWW/HXRrlXuqy61hP+wWnNdd1/+1nXheE2W5/khR0SuF5kjZr4Gs41Yc
	kOwAw==
X-Received: by 2002:a17:90b:274e:b0:398:b1eb:136c with SMTP id 98e67ed59e1d1-39b2610fe62mr47435731a91.9.1788908264615;
        Tue, 08 Sep 2026 15:57:44 -0700 (PDT)
Received: from localhost ([2620:10d:c090:500::6:91c1])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339a534df1sm45266746eec.7.2026.09.08.15.57.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 15:57:44 -0700 (PDT)
From: Zinc Lim <limzhineng2@gmail.com>
To: alexanderduyck@fb.com,
	kuba@kernel.org,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	pabeni@redhat.com,
	linux@roeck-us.net,
	horms@kernel.org,
	mohsin.bashr@gmail.com
Cc: kernel-team@meta.com,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	zinclim@meta.com,
	limzhineng2@gmail.com
Subject: [PATCH net-next v3 3/6] eth: fbnic: cache hwmon sensor readings
Date: Tue,  8 Sep 2026 15:57:34 -0700
Message-ID: <20260908225737.3034403-4-limzhineng2@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260908225737.3034403-1-limzhineng2@gmail.com>
References: <20260908225737.3034403-1-limzhineng2@gmail.com>
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
 drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c | 35 +++++++++++++------
 3 files changed, 39 insertions(+), 10 deletions(-)

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
index 38bb26cb8e6c..c8e7ff1d36fc 100644
--- a/drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c
+++ b/drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c
@@ -2,6 +2,7 @@
 /* Copyright (c) Meta Platforms, Inc. and affiliates. */

 #include <linux/hwmon.h>
+#include <linux/jiffies.h>

 #include "fbnic.h"
 #include "fbnic_mac.h"
@@ -25,26 +26,31 @@ static umode_t fbnic_hwmon_is_visible(const void *drvdata,

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
@@ -67,7 +73,12 @@ static int fbnic_hwmon_sensor_read(struct fbnic_dev *fbd, int id, long *val)
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
@@ -107,6 +118,10 @@ void fbnic_hwmon_register(struct fbnic_dev *fbd)
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

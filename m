Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4599F3A4F3B
	for <linux-hwmon@vger.kernel.org>; Mon, 31 Aug 2026 21:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788211368; cv=none; b=qmpXAzUoU52bQtwjuhqTVuUUVbasflbuZ12MXl2K/rXRtzqWSF5V8ES3jY+rbAmVz8XQgyXWkFZ81hKHnT8UPejuOQEGHQiXWSt//5j9lXPLUnoH0HkOLWj5RiLJHS48FBMK0yrjWL3AeS3bkl4nZPeTnXTKloQuCJopmDF7Xa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788211368; c=relaxed/simple;
	bh=F4Vn7w9he8XvFaQgePxC49jos8Ircb4h09eWzonsEE8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S2HzfnXgMiHBmLB6Gk041MsKPcah301eQ4rY1nWGA4YaZUNF90cLEgdBtmm+9oOmN3mCtOlxTfPJZg3Ewp5utaoonKouTYOdtdt56D6VSt5YBAvvW0crgelrOxvmOdeID0JUPVDvq2NUu+DOEe/Ad5gohgCDYAg7Ka7U96op/Gc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PCsKBYDa; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PCsKBYDa"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-c9aea40d799so171052a12.0
        for <linux-hwmon@vger.kernel.org>; Mon, 31 Aug 2026 14:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788211365; x=1788816165; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q4WjCM0YGYpG6uGbEGVqjVtxdg84mLbv5nOzooF+Ac4=;
        b=PCsKBYDaoMFq2uumxlEqSpdmVyzS5arP5/5Co6EJUnXoQE9/mfW46nH286ghl4Gi2/
         uFl8ccJ4yM+EjfwrODLVVRIU43x2CC4JyyZU4ge5n76/KCAqZolQXuKWGnM6TH7tfK3s
         RfxTWx3lzu5lPSKBVz2ieAFCJ2ggEujraTU8gx4nTZ0gGI4Gn/j7rWwdDBdxkib0sptT
         9/AUwKLC6dzIWEAP+5BOFbmKt4zgA0eBiAnsIpSFa69t0MwtbOVrZdECV4xPAEVR/qym
         QU1UsunaFblktiDNvvcb5CHdPQz+AbEpEzCytYVJ4aEshGtlKL8WgOTOTLm1vap5KDlh
         3tiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788211365; x=1788816165;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Q4WjCM0YGYpG6uGbEGVqjVtxdg84mLbv5nOzooF+Ac4=;
        b=Zk9i6d8yK3WleIUTjg2ts2uLc/mNrPnAPea1axe/8i9eZNdNOiOIhVFoAQyfUMrdRc
         PA8iJLWsSKmUBIKEoXO6oac9FQUhLblOW4UHd0OmHiXbYUuD80oz8AGcc9ZU/vZb8YQ6
         g9BkdB18URAJAA21XfTvZuFUvYFw6q/nxUukePl4jpDMmIKdby4Ho9YBrBfWPSUO2qRk
         AzMXJLFIfvKj7kLE/zQsrTQ68lBP8W1FrgFii1gDQ89cNyhx27DI52L0can6sawkeDkj
         35MZKJ9A5SS5g6IHab00c3x0Etx1G3u8b1Wuxe6yXdNzdQDqRFgNeoMJxZBAKB+7VBMn
         8Omw==
X-Forwarded-Encrypted: i=1; AHgh+RrH0pWbNKxZuCauzkWMfj4Tryx/CR8Z2KwzrM/FeGih+qv0Nf+pfYInIkUoncRvlh4IcS4bhOxFRWRWDA==@vger.kernel.org
X-Gm-Message-State: AFuF++nGrLmosWYnlsXH2lmcQsEIaATf6vM8FLaXeDo0X7k/RQu7GWKm
	e7QG0zkmFFmuks2dJ/pcIZCDV0EAdsD1Bi4prSgxsZLd+TiBDl69LIpi
X-Gm-Gg: AR+sD12M8cwKZf2x8o1WgVXEFFeSz85ra4Ox/vYU4zkJP1sJkqm8C5j86vFizpgb1CE
	Gx0h6QI7WL6iZ7Zd/xDgaRSH1cfo05olvWUaBYYPcnlGU64FpyxP24uayZqua7mDYJOWNcD0WMN
	QFQ9d3GEGKbhZOBh8zlERf6YyS2eeJ/pl/bhS/AbKgkwiFUeM8hRyBNRfa+IMjzKO0PKRN6h5wK
	And2tDCS5H6ot5iGWr+DKzrtAWvPvyzaP3QsiQF3gatJ9kMRt5/PkV28a2obogvZKyNBGFvfBwO
	djOu+jdtKLU3klh/98FJX+vOU0J/3AOuC1Ge8axGYKXvDSMFWKQ57bub61GJGgQmHq6kVJPW6Nf
	4faiOR65hmbAAudELbIMnVtuHkw9NZ+rr3Jm9DBTNd5dxfxMTEx+ud1B2Pc9KUfyzO6Vx36/h6W
	TLe7XHFkcOghR8DV3lqSGQalOI61AuORe8P4dWThGLIHoW/A2G18LZ7sQQWJddCNXi2vc=
X-Received: by 2002:a05:6a21:6444:b0:3d4:52bd:b89d with SMTP id adf61e73a8af0-3d452ccfb07mr24454870637.23.1788211365243;
        Mon, 31 Aug 2026 14:22:45 -0700 (PDT)
Received: from localhost ([2620:10d:c090:500::6:bac7])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32b26fd7edbsm21385431eec.5.2026.08.31.14.22.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 14:22:44 -0700 (PDT)
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
Subject: [PATCH net-next v2 3/6] eth: fbnic: cache hwmon sensor readings
Date: Mon, 31 Aug 2026 14:22:31 -0700
Message-ID: <20260831212234.1212971-4-limzhineng2@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260831212234.1212971-1-limzhineng2@gmail.com>
References: <20260831212234.1212971-1-limzhineng2@gmail.com>
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


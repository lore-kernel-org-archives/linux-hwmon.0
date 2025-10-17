Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B472133031A
	for <linux-hwmon@vger.kernel.org>; Fri, 17 Oct 2025 13:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760706186; cv=none; b=sAuFB6ZcqcGQi1VG2mql7TJNm7kbSBEN0IXEmHvnIzM8q+OtQxTbz1ZC+efUm66ngaqHqVgT9+knRYiFFcEyIVj5OT1PM6Cn1z0b1OL6BERf59VzxbZCuhfenEJT2QtHGhyC8RriPY7jN0oaTlACIIWn7tVZVuIbQkDeaYVh/nE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760706186; c=relaxed/simple;
	bh=wgFyiU7rzqpTz9X0a23r3chYAeQWx/fPsNa40sJFOpg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=frmmmdm+1figcbiGEQdProZ276rU0F1RolflrYN0OW4XTa2TIx/cxZ54d5SXtaAU7l9Hkb0DafgbDTlh7HsqUOmZoUGB/1qtf3HB/qhnmz0oAKZZfp3kRTxmd3zNOaQXTrfIMCCRydp3OWLN85SwAl524tESZj56nLzE5HunxcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F5lxRIea; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F5lxRIea"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-28e7cd6dbc0so22791185ad.0
        for <linux-hwmon@vger.kernel.org>; Fri, 17 Oct 2025 06:03:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760706184; x=1761310984; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eD2aErEbTkyvQDeMxIem1pAzYnWlcVOxaumJFxzK2Sk=;
        b=F5lxRIea73b8u9LSd+RUJu0B6fajiwFw0aKIIkcu8RAsJ0JyfadXL+VS6HrJU+VH/Y
         XUEHqyN1h0Bldne0A0M7oF9/p4pZiE+2L2A6Hnu4ty7hbT6Q5r6SwMqRom6pxRj/40no
         wP0ojOZ6a0Qahdmu3tEWXSmqHPww88Y6k1SvfR5mfN1EATYj2TScmdvM1PR/lrV8B9aT
         OwmUxXveOg4rGREImioG/HRjlB99NvBQtMDPt+x3b9XxX1dpepb7s2tIJ3a4C2n0IHaV
         Xh06oC3DdtjEDnR/WiwiZPHheruaWRdyejfft0CuIzs45AjZJUtiM7gexLtAKzL7gYum
         OQqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760706184; x=1761310984;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eD2aErEbTkyvQDeMxIem1pAzYnWlcVOxaumJFxzK2Sk=;
        b=TUHRG3GwTzWwdUjQ3KEZx0Cs1g6TehOiTO4Ji4e3TJX9DhIXPfZGPMgbzcfnnaxNuH
         biD0UJn77PXCB1LHE0xYFjwgVu6PWksjD5iuhxSPSHVxhNq4RvumKrSmQ3XQbm46Z3Xg
         6FFSq21p6/X7SrYYi5vIyqrLJXxjU9MjzcXTOvMElvvq07+J+UpYvf5OZKGrGlQv1l0X
         Arh3NMRIg/Ny57XS4gpd4iLPfyWn2XfxQyS5aZio+ZcTFdwhhL1QIynRwgFiuLZlyj44
         Pmtzp2AWMexkcLSt3Ccmb0NUxnuh69eziz1MaXg3z9DopTS1EUdk0sxWSSodnHCaKFnv
         xnpA==
X-Gm-Message-State: AOJu0YwS60Ju6Ffj1fZ7ZtCN5SCBuybjWfyw5SRToK2J2F1TptEbqPDn
	ESPmVYYYPHb8VSDEEbISgmn1Iqll6wA7LDhXlesU/LcNuCzX19DCGegTLIfFJQ==
X-Gm-Gg: ASbGncvfFg3wEncq0Fe+BZ/FVxHLx7rMg8bl8qSHsS3AyNeGDwDr54OMUMkQYthLVY8
	p6xt3IwJIJ2QzW3YVjeZIfzgWMaan5B/VAagBlG/1ObwFmF7saESR4CQZRCtocmYpc6+uJSZPIi
	eBNeM7epRBjNZgz5mEuO3BC7XErL42LGI6T0erSuFvjVFaMs9Xdte8RCg4lQY4E9ENzXAk20Xfk
	tK7BHS8UUBLCkOy1jY9reFgvqVdZ5LUMI86+Uzk1jQTl/Fh41Dvw9w3CKnlH4EDkvIhCm05J1YO
	1wKB7/GaJMNVAJdmsxlI7/Kq9Hcaag3cG7kbdSFXHaOS6ASaudvKiVOSN+fUaHs8+hR2WomJpUJ
	PtCNqFYYLbg/CGbjVd0H0CBGFLgEsNlDkd+BkKkZ5SplLnDUFMCMnzxA+6zRCpJAXf+XgdYCYfO
	M59ICqTtAY0bPU
X-Google-Smtp-Source: AGHT+IF5RchYGrwU1VbVvm1+64TdYQXoJMbedtEIY54RtIlb+09Dd5QDU/RtdcZHGcO/VJXhkTwltg==
X-Received: by 2002:a17:902:e88e:b0:24c:9309:5883 with SMTP id d9443c01a7336-290cb94799fmr42203195ad.28.1760706183540;
        Fri, 17 Oct 2025 06:03:03 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2909930a95fsm63934695ad.2.2025.10.17.06.03.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 06:03:02 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 18/29] hwmon: (peci) Rely on subsystem locking
Date: Fri, 17 Oct 2025 06:02:10 -0700
Message-ID: <20251017130221.1823453-19-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20251017130221.1823453-1-linux@roeck-us.net>
References: <20251017130221.1823453-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Attribute access is now serialized in the hardware monitoring core,
so locking in the driver code is no longer necessary. Drop it.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/peci/common.h   |  3 --
 drivers/hwmon/peci/cputemp.c  | 72 +++++++++--------------------------
 drivers/hwmon/peci/dimmtemp.c | 17 ++-------
 3 files changed, 23 insertions(+), 69 deletions(-)

diff --git a/drivers/hwmon/peci/common.h b/drivers/hwmon/peci/common.h
index 734506b0eca2..92a7ee1925bc 100644
--- a/drivers/hwmon/peci/common.h
+++ b/drivers/hwmon/peci/common.h
@@ -1,7 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 /* Copyright (c) 2021 Intel Corporation */
 
-#include <linux/mutex.h>
 #include <linux/types.h>
 
 #ifndef __PECI_HWMON_COMMON_H
@@ -13,12 +12,10 @@
  * struct peci_sensor_state - PECI state information
  * @valid: flag to indicate the sensor value is valid
  * @last_updated: time of the last update in jiffies
- * @lock: mutex to protect sensor access
  */
 struct peci_sensor_state {
 	bool valid;
 	unsigned long last_updated;
-	struct mutex lock; /* protect sensor access */
 };
 
 /**
diff --git a/drivers/hwmon/peci/cputemp.c b/drivers/hwmon/peci/cputemp.c
index b350c9a76894..b2fc936851e1 100644
--- a/drivers/hwmon/peci/cputemp.c
+++ b/drivers/hwmon/peci/cputemp.c
@@ -116,11 +116,9 @@ static int get_temp_target(struct peci_cputemp *priv, enum peci_temp_target_type
 {
 	int ret;
 
-	mutex_lock(&priv->temp.target.state.lock);
-
 	ret = update_temp_target(priv);
 	if (ret)
-		goto unlock;
+		return ret;
 
 	switch (type) {
 	case tcontrol_type:
@@ -139,9 +137,6 @@ static int get_temp_target(struct peci_cputemp *priv, enum peci_temp_target_type
 		ret = -EOPNOTSUPP;
 		break;
 	}
-unlock:
-	mutex_unlock(&priv->temp.target.state.lock);
-
 	return ret;
 }
 
@@ -177,26 +172,23 @@ static s32 dts_eight_dot_eight_to_millidegree(u16 val)
 
 static int get_die_temp(struct peci_cputemp *priv, long *val)
 {
-	int ret = 0;
 	long tjmax;
 	u16 temp;
+	int ret;
 
-	mutex_lock(&priv->temp.die.state.lock);
 	if (!peci_sensor_need_update(&priv->temp.die.state))
 		goto skip_update;
 
 	ret = peci_temp_read(priv->peci_dev, &temp);
 	if (ret)
-		goto err_unlock;
+		return ret;
 
-	if (!dts_valid(temp)) {
-		ret = -EIO;
-		goto err_unlock;
-	}
+	if (!dts_valid(temp))
+		return -EIO;
 
 	ret = get_temp_target(priv, tjmax_type, &tjmax);
 	if (ret)
-		goto err_unlock;
+		return ret;
 
 	priv->temp.die.value = (s32)tjmax + dts_ten_dot_six_to_millidegree(temp);
 
@@ -204,35 +196,30 @@ static int get_die_temp(struct peci_cputemp *priv, long *val)
 
 skip_update:
 	*val = priv->temp.die.value;
-err_unlock:
-	mutex_unlock(&priv->temp.die.state.lock);
-	return ret;
+	return 0;
 }
 
 static int get_dts(struct peci_cputemp *priv, long *val)
 {
-	int ret = 0;
 	u16 thermal_margin;
 	long tcontrol;
 	u32 pcs;
+	int ret;
 
-	mutex_lock(&priv->temp.dts.state.lock);
 	if (!peci_sensor_need_update(&priv->temp.dts.state))
 		goto skip_update;
 
 	ret = peci_pcs_read(priv->peci_dev, PECI_PCS_THERMAL_MARGIN, 0, &pcs);
 	if (ret)
-		goto err_unlock;
+		return ret;
 
 	thermal_margin = FIELD_GET(DTS_MARGIN_MASK, pcs);
-	if (!dts_valid(thermal_margin)) {
-		ret = -EIO;
-		goto err_unlock;
-	}
+	if (!dts_valid(thermal_margin))
+		return -EIO;
 
 	ret = get_temp_target(priv, tcontrol_type, &tcontrol);
 	if (ret)
-		goto err_unlock;
+		return ret;
 
 	/* Note that the tcontrol should be available before calling it */
 	priv->temp.dts.value =
@@ -242,35 +229,30 @@ static int get_dts(struct peci_cputemp *priv, long *val)
 
 skip_update:
 	*val = priv->temp.dts.value;
-err_unlock:
-	mutex_unlock(&priv->temp.dts.state.lock);
-	return ret;
+	return 0;
 }
 
 static int get_core_temp(struct peci_cputemp *priv, int core_index, long *val)
 {
-	int ret = 0;
 	u16 core_dts_margin;
 	long tjmax;
 	u32 pcs;
+	int ret;
 
-	mutex_lock(&priv->temp.core[core_index].state.lock);
 	if (!peci_sensor_need_update(&priv->temp.core[core_index].state))
 		goto skip_update;
 
 	ret = peci_pcs_read(priv->peci_dev, PECI_PCS_MODULE_TEMP, core_index, &pcs);
 	if (ret)
-		goto err_unlock;
+		return ret;
 
 	core_dts_margin = FIELD_GET(PCS_MODULE_TEMP_MASK, pcs);
-	if (!dts_valid(core_dts_margin)) {
-		ret = -EIO;
-		goto err_unlock;
-	}
+	if (!dts_valid(core_dts_margin))
+		return -EIO;
 
 	ret = get_temp_target(priv, tjmax_type, &tjmax);
 	if (ret)
-		goto err_unlock;
+		return ret;
 
 	/* Note that the tjmax should be available before calling it */
 	priv->temp.core[core_index].value =
@@ -280,9 +262,7 @@ static int get_core_temp(struct peci_cputemp *priv, int core_index, long *val)
 
 skip_update:
 	*val = priv->temp.core[core_index].value;
-err_unlock:
-	mutex_unlock(&priv->temp.core[core_index].state.lock);
-	return ret;
+	return 0;
 }
 
 static int cputemp_read_string(struct device *dev, enum hwmon_sensor_types type,
@@ -431,18 +411,6 @@ static void check_resolved_cores(struct peci_cputemp *priv)
 		bitmap_zero(priv->core_mask, CORE_NUMS_MAX);
 }
 
-static void sensor_init(struct peci_cputemp *priv)
-{
-	int i;
-
-	mutex_init(&priv->temp.target.state.lock);
-	mutex_init(&priv->temp.die.state.lock);
-	mutex_init(&priv->temp.dts.state.lock);
-
-	for_each_set_bit(i, priv->core_mask, CORE_NUMS_MAX)
-		mutex_init(&priv->temp.core[i].state.lock);
-}
-
 static const struct hwmon_ops peci_cputemp_ops = {
 	.is_visible = cputemp_is_visible,
 	.read_string = cputemp_read_string,
@@ -507,8 +475,6 @@ static int peci_cputemp_probe(struct auxiliary_device *adev,
 
 	check_resolved_cores(priv);
 
-	sensor_init(priv);
-
 	hwmon_dev = devm_hwmon_device_register_with_info(priv->dev, priv->name,
 							 priv, &peci_cputemp_chip_info, NULL);
 
diff --git a/drivers/hwmon/peci/dimmtemp.c b/drivers/hwmon/peci/dimmtemp.c
index a281476c7a31..bd3e8715dfec 100644
--- a/drivers/hwmon/peci/dimmtemp.c
+++ b/drivers/hwmon/peci/dimmtemp.c
@@ -96,16 +96,15 @@ static int get_dimm_temp(struct peci_dimmtemp *priv, int dimm_no, long *val)
 {
 	int dimm_order = dimm_no % priv->gen_info->dimm_idx_max;
 	int chan_rank = dimm_no / priv->gen_info->dimm_idx_max;
-	int ret = 0;
 	u32 data;
+	int ret;
 
-	mutex_lock(&priv->dimm[dimm_no].temp.state.lock);
 	if (!peci_sensor_need_update(&priv->dimm[dimm_no].temp.state))
 		goto skip_update;
 
 	ret = peci_pcs_read(priv->peci_dev, PECI_PCS_DDR_DIMM_TEMP, chan_rank, &data);
 	if (ret)
-		goto unlock;
+		return ret;
 
 	priv->dimm[dimm_no].temp.value = __dimm_temp(data, dimm_order) * MILLIDEGREE_PER_DEGREE;
 
@@ -113,9 +112,7 @@ static int get_dimm_temp(struct peci_dimmtemp *priv, int dimm_no, long *val)
 
 skip_update:
 	*val = priv->dimm[dimm_no].temp.value;
-unlock:
-	mutex_unlock(&priv->dimm[dimm_no].temp.state.lock);
-	return ret;
+	return 0;
 }
 
 static int update_thresholds(struct peci_dimmtemp *priv, int dimm_no)
@@ -145,10 +142,9 @@ static int get_dimm_thresholds(struct peci_dimmtemp *priv, enum peci_dimm_thresh
 {
 	int ret;
 
-	mutex_lock(&priv->dimm[dimm_no].thresholds.state.lock);
 	ret = update_thresholds(priv, dimm_no);
 	if (ret)
-		goto unlock;
+		return ret;
 
 	switch (type) {
 	case temp_max_type:
@@ -161,9 +157,6 @@ static int get_dimm_thresholds(struct peci_dimmtemp *priv, enum peci_dimm_thresh
 		ret = -EOPNOTSUPP;
 		break;
 	}
-unlock:
-	mutex_unlock(&priv->dimm[dimm_no].thresholds.state.lock);
-
 	return ret;
 }
 
@@ -349,8 +342,6 @@ static int create_dimm_temp_info(struct peci_dimmtemp *priv)
 		ret = create_dimm_temp_label(priv, i);
 		if (ret)
 			return ret;
-		mutex_init(&priv->dimm[i].thresholds.state.lock);
-		mutex_init(&priv->dimm[i].temp.state.lock);
 	}
 
 	dev = devm_hwmon_device_register_with_info(priv->dev, priv->name, priv,
-- 
2.45.2


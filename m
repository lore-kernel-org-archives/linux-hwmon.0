Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45AAC4AA56B
	for <linux-hwmon@vger.kernel.org>; Wed, 14 Oct 2026 22:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792016557; cv=none; b=A+dG7I4FMZ7CIlaWMuaYGR348kAvRZepCApumgGpUEm3Fs4Iht/Gk/zi6h4vMU8nLV4dGCmNMO+U81zrrA0UIwL3TS0sJL2zsEdFepLwfFXgz2YTiTmtv7/nf4JGXw22JIQeU53SAHw7R+dDw7YLJJqfl3f1/5Zz8dso0xZrLRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792016557; c=relaxed/simple;
	bh=bH4OoZXwTOifp1/jy4eIY8Dpsmyg3iduTIKQgebbwJE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o2JbL4ymlB1osmkfKSx63Wc7zOXgB9jy0gJ78H7cV0H7zqdPfbXiwH0mBcudp3vT39qp8VO21NBoW+twjxEF8Ly6ivY5IfkJgt32ijpVkmmqydWwusc0Of1cQ28m5NqHMdxXT51nRPQbU9WjL6KRd7FeZqF+NlUOC0MivjEa6Iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fy78yYRi; arc=none smtp.client-ip=74.125.82.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fy78yYRi"
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-141395927feso8950552c88.0
        for <linux-hwmon@vger.kernel.org>; Wed, 14 Oct 2026 15:22:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792016554; x=1792621354; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WKBdoRa2HVu3mnJTPxSfWHSZoQO2OEtSPKYKioKdq58=;
        b=fy78yYRidqzTSxy/2KAPXQ+kE1qzJQvDIa3uSE45b2mXjRPwjLlERiXHE1yGBzBLGz
         dOo8wGE5aQbdqWucw6Z3vvwuI3ut//0m+ufBUPV+G/x6vCrGNZjY+dvTDqxlBj98OwnD
         HqDnzIvKcDHNZaRW9yMNEpGAp3AjaZbcvVsC0JPbr/+gFyLrFOZceHIzj42FqQxc2uxn
         GAffvCTWx2fTG02+jynDckJm1o3PhjXhWOwfPmAQSenHnCElRzQDYjSm9E56l3fcH1l6
         wHvyjP6GjTf/4g9IN2WaXBwXCTppSZNLn5baUj/6xZLNq6LJqX2H4UVX5sAzh26cZBke
         FOGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792016554; x=1792621354;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WKBdoRa2HVu3mnJTPxSfWHSZoQO2OEtSPKYKioKdq58=;
        b=iATsg2hwynzoOQRelYePqI5qzXxl7P0WyiAqitRd45sLf4wHuRNsJVGHToEnFYQ6mZ
         Ony8XymPmbDvIEhe6z147E+Hxhpl6BnzL1xZiHi/5iEAQGqA3CJ1XaI8jNe5O7dw6tDd
         gFqUhiBfyLOJa6Up/FA2CPsL6dXsaOc6kqqEtNyh95h91nKhYk8VrtK58p9LmR5EYdF5
         i6vMlHR2j/6AHbD4zaku6O9cYWj3rUJNDS81Q7L6YJMwbGAQHGXCiaYs0GFDqvorlL/l
         OdhDMtmgsFE4HCfi5hs4u9CY4/YaclPePipq1IAumbIziBO1bl6GWIKtCQFUPlSPZARk
         usMA==
X-Forwarded-Encrypted: i=1; AKwUvBxwpUC3X0QvjSAsRidHVkx7zja6tP11OKhSYpqqBhPF7BSAebIyKwEkNH9pYhkdbb7d+taBhwc+sq4JTg==@vger.kernel.org
X-Gm-Message-State: AFq9FYIaTGTIaUd/zb1hEPAD/VE2V/zzUMACobdeVF9BKsXq9KayhXDX
	dGFxZhCFfijzQNedVWP8Fvz3fZlq7s0QjrJcNa11K1b1SUsuDUk9X1ia
X-Gm-Gg: AYBFou18iRuQ5ky0FmFbmTRH0Af47F1Vw880cox5d6IoqbkFeYfygltcuHvOIU0PBtW
	bu3oYXnutcmZ4rzKoyWMWWIvPRZvMBVleouedP0PifRD1fxs7THmr5DP7hnTN5llc4Rc6rUUjI8
	LaP6PE2aR+ozrwHZHIs8ScPfA9jzV0QuJxlOH5EJIjGwcuGb42nyoKfsGRupgxtZ311Bl1q4k3F
	dMDcoL3MhmkaCQG46MfjFQizC3diQiq/+RlsKkNbdXC1Of+HIN4BWQ5MZp/F0hsEjl+LDPFooRD
	5lGa8ILBPK9Nh62nc0Wclp/5pqccr2z8XrjBBXsK3+fDsOozM1GAqoNqpbSV12xrye3oiJ8bI4X
	DhpNHMdYzHOmNbuqEINc0/wxCJZXuDwsrIpMtbgaO2NT/5VmW8oysnR7885j9PpO67ZSPJBh44o
	RxDbzD1Ms2kPKy2E3Bjv7+EtMNGJPMa7u4qCixGRuY2+jd244p41EmjokZsNdFc81VpievJ2t+W
	Fv+XQ==
X-Received: by 2002:a05:7022:7e08:b0:162:e05:e43f with SMTP id a92af1059eb24-16a5f208bf7mr33592949c88.23.1792016554019;
        Wed, 14 Oct 2026 15:22:34 -0700 (PDT)
Received: from localhost ([2620:10d:c090:500::5:7561])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1746482c978sm29749037c88.13.2026.10.14.15.22.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 15:22:33 -0700 (PDT)
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
Subject: [PATCH net-next v4 3/6] eth: fbnic: report temperature and voltage thresholds via hwmon
Date: Wed, 14 Oct 2026 15:22:21 -0700
Message-ID: <20261014222225.2803660-4-limzhineng2@gmail.com>
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

The firmware capability response carries per-board temperature
(min/max/crit) and voltage (min/max) thresholds. Parse and store them in
fbnic_fw_cap, and expose them through the hwmon interface as
temp1_{min,max,crit} and in0_{min,max}.

Zero is a valid threshold, so the fields are reset to the
FBNIC_SENSOR_NO_DATA sentinel in fbnic_mbx_init() as
fbnic_fw_parse_cap_resp() can return before it reaches the threshold
assignments.

Older firmware that do not report thresholds result in
fbnic_hwmon_is_visible() not exposing the thresholds in the sysfs,
only temp1_input and in0_input.

The mailbox is reinitialized on resume and AER recovery while the hwmon
device stays registered, so reads also reject the sentinel with -ENODATA
rather than reporting it as a value.

Signed-off-by: Zinc Lim <limzhineng2@gmail.com>
---
 drivers/net/ethernet/meta/fbnic/fbnic_fw.c    | 35 ++++++-
 drivers/net/ethernet/meta/fbnic/fbnic_fw.h    | 14 +++
 drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c | 98 ++++++++++++++++---
 3 files changed, 129 insertions(+), 18 deletions(-)

diff --git a/drivers/net/ethernet/meta/fbnic/fbnic_fw.c b/drivers/net/ethernet/meta/fbnic/fbnic_fw.c
index 82307f212f58..d9a00a2ef34d 100644
--- a/drivers/net/ethernet/meta/fbnic/fbnic_fw.c
+++ b/drivers/net/ethernet/meta/fbnic/fbnic_fw.c
@@ -95,15 +95,25 @@ static void fbnic_mbx_reset_desc_ring(struct fbnic_dev *fbd, int mbx_idx)
 					    FBNIC_IPC_MBX_DESC_HOST_CMPL);
 }
 
+static const struct fbnic_threshold fbnic_threshold_no_data = {
+	.min	= FBNIC_SENSOR_NO_DATA,
+	.max	= FBNIC_SENSOR_NO_DATA,
+	.crit	= FBNIC_SENSOR_NO_DATA,
+};
+
 void fbnic_mbx_init(struct fbnic_dev *fbd)
 {
+	struct fbnic_fw_cap fw_cap_reset;
 	int i;
 
 	/* Initialize lock to protect Tx ring */
 	spin_lock_init(&fbd->fw_tx_lock);
 
-	/* Reset FW Capabilities */
-	memset(&fbd->fw_cap, 0, sizeof(fbd->fw_cap));
+	/* Reset FW Capabilities and seed thresholds with sentinel */
+	memset(&fw_cap_reset, 0, sizeof(fw_cap_reset));
+	fw_cap_reset.temp = fbnic_threshold_no_data;
+	fw_cap_reset.volt = fbnic_threshold_no_data;
+	fbd->fw_cap = fw_cap_reset;
 
 	/* Seed cache with sentinel so the first read always refreshes. The
 	 * cache mirrors what firmware reported, so drop it when the mailbox
@@ -595,6 +605,11 @@ static const struct fbnic_tlv_index fbnic_fw_cap_resp_index[] = {
 	FBNIC_TLV_ATTR_STRING(FBNIC_FW_CAP_RESP_UEFI_COMMIT_STR,
 			      FBNIC_FW_CAP_RESP_COMMIT_MAX_SIZE),
 	FBNIC_TLV_ATTR_U32(FBNIC_FW_CAP_RESP_ANTI_ROLLBACK_VERSION),
+	FBNIC_TLV_ATTR_S32(FBNIC_FW_CAP_RESP_TEMP_MIN),
+	FBNIC_TLV_ATTR_S32(FBNIC_FW_CAP_RESP_TEMP_MAX),
+	FBNIC_TLV_ATTR_S32(FBNIC_FW_CAP_RESP_TEMP_CRIT),
+	FBNIC_TLV_ATTR_S32(FBNIC_FW_CAP_RESP_VOLT_MIN),
+	FBNIC_TLV_ATTR_S32(FBNIC_FW_CAP_RESP_VOLT_MAX),
 	FBNIC_TLV_ATTR_LAST
 };
 
@@ -742,6 +757,22 @@ static int fbnic_fw_parse_cap_resp(void *opaque, struct fbnic_tlv_msg **results)
 	fbd->fw_cap.anti_rollback_version =
 		fta_get_uint(results, FBNIC_FW_CAP_RESP_ANTI_ROLLBACK_VERSION);
 
+	fbd->fw_cap.temp.min =
+		fbnic_tlv_attr_get_signed(results[FBNIC_FW_CAP_RESP_TEMP_MIN],
+					  FBNIC_SENSOR_NO_DATA);
+	fbd->fw_cap.temp.max =
+		fbnic_tlv_attr_get_signed(results[FBNIC_FW_CAP_RESP_TEMP_MAX],
+					  FBNIC_SENSOR_NO_DATA);
+	fbd->fw_cap.temp.crit =
+		fbnic_tlv_attr_get_signed(results[FBNIC_FW_CAP_RESP_TEMP_CRIT],
+					  FBNIC_SENSOR_NO_DATA);
+	fbd->fw_cap.volt.min =
+		fbnic_tlv_attr_get_signed(results[FBNIC_FW_CAP_RESP_VOLT_MIN],
+					  FBNIC_SENSOR_NO_DATA);
+	fbd->fw_cap.volt.max =
+		fbnic_tlv_attr_get_signed(results[FBNIC_FW_CAP_RESP_VOLT_MAX],
+					  FBNIC_SENSOR_NO_DATA);
+
 	return 0;
 }
 
diff --git a/drivers/net/ethernet/meta/fbnic/fbnic_fw.h b/drivers/net/ethernet/meta/fbnic/fbnic_fw.h
index ddedb7c0e0a7..dde2929f8660 100644
--- a/drivers/net/ethernet/meta/fbnic/fbnic_fw.h
+++ b/drivers/net/ethernet/meta/fbnic/fbnic_fw.h
@@ -66,6 +66,12 @@ enum {
  */
 #define FBNIC_SENSOR_NO_DATA			S32_MIN
 
+struct fbnic_threshold {
+	s32 min;
+	s32 max;
+	s32 crit;
+};
+
 struct fbnic_fw_cap {
 	unsigned long state;
 	struct {
@@ -79,6 +85,8 @@ struct fbnic_fw_cap {
 	u8	link_speed;
 	u8	link_fec;
 	u32	anti_rollback_version;
+	struct fbnic_threshold temp;
+	struct fbnic_threshold volt;
 };
 
 struct fbnic_fw_completion {
@@ -261,6 +269,12 @@ enum {
 	FBNIC_FW_CAP_RESP_UEFI_VERSION			= 0x11,
 	FBNIC_FW_CAP_RESP_UEFI_COMMIT_STR		= 0x12,
 	FBNIC_FW_CAP_RESP_ANTI_ROLLBACK_VERSION		= 0x15,
+	/* 0x16 and 0x17 are reserved for future use */
+	FBNIC_FW_CAP_RESP_TEMP_MIN			= 0x18,
+	FBNIC_FW_CAP_RESP_TEMP_MAX			= 0x19,
+	FBNIC_FW_CAP_RESP_TEMP_CRIT			= 0x1a,
+	FBNIC_FW_CAP_RESP_VOLT_MIN			= 0x1b,
+	FBNIC_FW_CAP_RESP_VOLT_MAX			= 0x1c,
 	FBNIC_FW_CAP_RESP_MSG_MAX
 };
 
diff --git a/drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c b/drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c
index 0c3fe2a37227..4df808f850cf 100644
--- a/drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c
+++ b/drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c
@@ -7,24 +7,43 @@
 #include "fbnic.h"
 #include "fbnic_mac.h"
 
-static int fbnic_hwmon_sensor_id(enum hwmon_sensor_types type)
+static umode_t fbnic_hwmon_thr_visible(s32 thr)
 {
-	if (type == hwmon_temp)
-		return FBNIC_SENSOR_TEMP;
-	if (type == hwmon_in)
-		return FBNIC_SENSOR_VOLTAGE;
-
-	return -EOPNOTSUPP;
+	return thr == FBNIC_SENSOR_NO_DATA ? 0 : 0444;
 }
 
 static umode_t fbnic_hwmon_is_visible(const void *drvdata,
 				      enum hwmon_sensor_types type,
 				      u32 attr, int channel)
 {
-	if (type == hwmon_temp && attr == hwmon_temp_input)
-		return 0444;
-	if (type == hwmon_in && attr == hwmon_in_input)
-		return 0444;
+	const struct fbnic_dev *fbd = drvdata;
+
+	switch (type) {
+	case hwmon_temp:
+		switch (attr) {
+		case hwmon_temp_input:
+			return 0444;
+		case hwmon_temp_min:
+			return fbnic_hwmon_thr_visible(fbd->fw_cap.temp.min);
+		case hwmon_temp_max:
+			return fbnic_hwmon_thr_visible(fbd->fw_cap.temp.max);
+		case hwmon_temp_crit:
+			return fbnic_hwmon_thr_visible(fbd->fw_cap.temp.crit);
+		}
+		break;
+	case hwmon_in:
+		switch (attr) {
+		case hwmon_in_input:
+			return 0444;
+		case hwmon_in_min:
+			return fbnic_hwmon_thr_visible(fbd->fw_cap.volt.min);
+		case hwmon_in_max:
+			return fbnic_hwmon_thr_visible(fbd->fw_cap.volt.max);
+		}
+		break;
+	default:
+		break;
+	}
 
 	return 0;
 }
@@ -92,14 +111,58 @@ static int fbnic_hwmon_sensor_read(struct fbnic_dev *fbd, int id, long *val)
 	return err;
 }
 
+static int fbnic_hwmon_read_threshold(long thr, long *val)
+{
+	if (thr == FBNIC_SENSOR_NO_DATA)
+		return -ENODATA;
+
+	*val = thr;
+	return 0;
+}
+
+static int fbnic_hwmon_temp_read(struct fbnic_dev *fbd, u32 attr, long *val)
+{
+	switch (attr) {
+	case hwmon_temp_input:
+		return fbnic_hwmon_sensor_read(fbd, FBNIC_SENSOR_TEMP, val);
+	case hwmon_temp_min:
+		return fbnic_hwmon_read_threshold(fbd->fw_cap.temp.min, val);
+	case hwmon_temp_max:
+		return fbnic_hwmon_read_threshold(fbd->fw_cap.temp.max, val);
+	case hwmon_temp_crit:
+		return fbnic_hwmon_read_threshold(fbd->fw_cap.temp.crit, val);
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+static int fbnic_hwmon_in_read(struct fbnic_dev *fbd, u32 attr, long *val)
+{
+	switch (attr) {
+	case hwmon_in_input:
+		return fbnic_hwmon_sensor_read(fbd, FBNIC_SENSOR_VOLTAGE, val);
+	case hwmon_in_min:
+		return fbnic_hwmon_read_threshold(fbd->fw_cap.volt.min, val);
+	case hwmon_in_max:
+		return fbnic_hwmon_read_threshold(fbd->fw_cap.volt.max, val);
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
 static int fbnic_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
 			    u32 attr, int channel, long *val)
 {
 	struct fbnic_dev *fbd = dev_get_drvdata(dev);
-	int id;
 
-	id = fbnic_hwmon_sensor_id(type);
-	return id < 0 ? id : fbnic_hwmon_sensor_read(fbd, id, val);
+	switch (type) {
+	case hwmon_temp:
+		return fbnic_hwmon_temp_read(fbd, attr, val);
+	case hwmon_in:
+		return fbnic_hwmon_in_read(fbd, attr, val);
+	default:
+		return -EOPNOTSUPP;
+	}
 }
 
 static const struct hwmon_ops fbnic_hwmon_ops = {
@@ -108,8 +171,11 @@ static const struct hwmon_ops fbnic_hwmon_ops = {
 };
 
 static const struct hwmon_channel_info *fbnic_hwmon_info[] = {
-	HWMON_CHANNEL_INFO(temp, HWMON_T_INPUT),
-	HWMON_CHANNEL_INFO(in, HWMON_I_INPUT),
+	HWMON_CHANNEL_INFO(temp,
+			   HWMON_T_INPUT | HWMON_T_MIN | HWMON_T_MAX |
+			   HWMON_T_CRIT),
+	HWMON_CHANNEL_INFO(in,
+			   HWMON_I_INPUT | HWMON_I_MIN | HWMON_I_MAX),
 	NULL
 };
 
-- 
2.53.0-Meta


Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF6D55A0AC4
	for <linux-hwmon@vger.kernel.org>; Tue,  8 Sep 2026 22:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788908270; cv=none; b=b77RKuV0H+JD8ZnSuMj4wyh+BVwQNGY/DJu+6IMd/X7onJjOZPNdGvmlabXW3AKO861Zh0pHUkCYaiyBc4U5xyOtvuruSWDm69a8vJNKfZrV4ogYO9T+ZEnQ1v5EImUWFwraqTxipWHJm8OHK+7owbkzYuFAvpEyz4B+tDS0Lq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788908270; c=relaxed/simple;
	bh=8cAkOwgZLh+Oy0k1bQ/t56TdjDf/iePq+1QdF6j4UE4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q1b5nQENnvHu+hqlV3TS7geo54uswpSSRcCOXI3kssULNOw8fFPi79HUNE5Nupivnc0qnXYmG8oCWL7RfcxkqCHVa4qh7/DR436b57D9JcAXEXPYjZhveeSRZ4Y6s40knXkr2l2n3wnym9RybrK1aK619CmfUSGZ9A444QIxNcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KUmioN+1; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KUmioN+1"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3969e82ff8fso5450607a91.0
        for <linux-hwmon@vger.kernel.org>; Tue, 08 Sep 2026 15:57:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788908266; x=1789513066; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=26WqabfkuJ8OYIP/GyL3+m+5meAcn0wewttg1o1KS5o=;
        b=KUmioN+17JhydA/66SyV8sG8Lo9LGiERzsmiOcP+CwquOq8EDMC2wGB+x2Jjdkk30r
         4zbHCQLx5EIgy6fWTBMBD0mqGcbXURuSSIEzzuHwXRKzMtzzQJN6IFIz/ZFn6FTFRnl+
         LQ343OEAXSPULi5dbfmzBUHbs2ZQ1zG4KCGMBvywF17FxqyqZywvN5nxWszLrllornYL
         inNdbB3ah6G9nxLNuvPblbDWoFAi2C8cfAleCQPU83K5jeYA1+3po+wxz51QhQ2ARm1o
         kuYaWK3rOoeo6EN+INhdXWMajmUDzp5zBt2HjxysDg5FYYycFuuV4IsWp4TZzkiOXOwj
         a4MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788908266; x=1789513066;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=26WqabfkuJ8OYIP/GyL3+m+5meAcn0wewttg1o1KS5o=;
        b=VU3atdegq+swzFfRWx5aj1FB9Y0HZ4UwqG3Kv386ErAr28658S28Mo5RW0ArcBlagm
         sWaoKxDJv6LHvLPLYwX7dfpVE+3kA685VdQxbnV2jI7HGedwYZe4loywKGU5U1P4k/n2
         ybNfgCp0sBsJLwC6HjnKXT/7eqAhkVgqvsyPEmPW94WkeXc6Y81MxZiRS3heA68ahzBO
         MrAdMf+ifLcf+0ymNISpwnhjEmtYo5L1/zJ94H/UG2TlZg3yCVouwxFAKgoFhvR4+U6E
         zWfQPzB520VLt18cGNK1wBp8/ewOuRDuRlt0HU1FGJ7FYk6hIztyxDT4kk8Khfz199HP
         zzAQ==
X-Forwarded-Encrypted: i=1; AKwUvBx4dc8XA8IuW4LqiS9Rm+RsFlvtOpYzNWKLe8CIPMyWBd0nvRVk4vBzSDr4WIs9fiHKpsRSfpiKa7pQHA==@vger.kernel.org
X-Gm-Message-State: AFuF++lgAV0lUrW5+VTFQJHxZVFqc8r3G0T7kkkuAJ1R8SfPDiwAE1fZ
	Bz5r2u8na3QjkaEBBrr4sD0c0matxtLMMyBjJzILyEffrwZcX3x2mMFa
X-Gm-Gg: AYBFou1aaG2Iz2upt9qbAwaNb5kRvacNvubHHQBbMiBMb9PpbiuurjmllZ0XxT1s2a4
	8tVeMLXCfecPPn0JFVs81ssdBcZKBHeqJPsaZEqAo98qa3thioC+oh3PV1L/0bJy6XnQ1fewbo9
	5mTIxdXoncR8ZQPdG2IFobhFa/fqXSYXFqB0SZeCurK7Kf2lzI6Cg31Z5yJgVSTw5iCEz0NCrmA
	JehJ7GezQi/8gpdhugmzhp4g94//5UWKxl8BaGacypUejZ4A3YgbyCqTsDpGnvSh3ypvzhIBfKu
	XuhqDngqCyRdTccLiwylJQC11Wsvck/JLmBCGOQvj+AWEQ5sPgSwSMC4WssL11FOHIwt4G/wRzi
	W1fwXoTuvNxFXALIOmvcy4qCn65MTnRKALT6Luc5VZ1jFnj//XcHa7HhUw8sFk3mD4/Ps1NZuY/
	SYrF1+W1u+/vSJ0aCBVaT/zPFejWVfrDG8HBJ61QpetuRqu09FwfvLjkdsm0AlYbRHk4k0CA6U5
	nNA5Q==
X-Received: by 2002:a17:90a:e7d2:b0:381:1c96:829b with SMTP id 98e67ed59e1d1-39b260d296cmr43935572a91.3.1788908265997;
        Tue, 08 Sep 2026 15:57:45 -0700 (PDT)
Received: from localhost ([2620:10d:c090:500::6:91c1])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-333c9db92b1sm39279476eec.9.2026.09.08.15.57.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 15:57:45 -0700 (PDT)
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
Subject: [PATCH net-next v3 4/6] eth: fbnic: report temperature and voltage thresholds via hwmon
Date: Tue,  8 Sep 2026 15:57:35 -0700
Message-ID: <20260908225737.3034403-5-limzhineng2@gmail.com>
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

The firmware capability response carries per-board temperature
(min/max/crit) and voltage (min/max) thresholds. Parse and store them in
fbnic_fw_cap, and expose them through the hwmon interface as
temp1_{min,max,crit} and in0_{min,max}.

The thresholds are always exposed. Values the firmware did not report are
stored as the FBNIC_SENSOR_NO_DATA sentinel in the capability response
parser, and a read of such an attribute returns -ENODATA.

Signed-off-by: Zinc Lim <limzhineng2@gmail.com>
---
 drivers/net/ethernet/meta/fbnic/fbnic_fw.c    | 21 ++++++
 drivers/net/ethernet/meta/fbnic/fbnic_fw.h    | 14 ++++
 drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c | 67 ++++++++++++++-----
 3 files changed, 87 insertions(+), 15 deletions(-)

diff --git a/drivers/net/ethernet/meta/fbnic/fbnic_fw.c b/drivers/net/ethernet/meta/fbnic/fbnic_fw.c
index ff1674eff7ad..e5669dfd9790 100644
--- a/drivers/net/ethernet/meta/fbnic/fbnic_fw.c
+++ b/drivers/net/ethernet/meta/fbnic/fbnic_fw.c
@@ -575,6 +575,11 @@ static const struct fbnic_tlv_index fbnic_fw_cap_resp_index[] = {
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
 
@@ -702,6 +707,22 @@ static int fbnic_fw_parse_cap_resp(void *opaque, struct fbnic_tlv_msg **results)
 	/* Always assume we need a BMC reinit */
 	fbd->fw_cap.need_bmc_tcam_reinit = true;
 
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
index 42a5f83ddb45..68ffd49e0cdd 100644
--- a/drivers/net/ethernet/meta/fbnic/fbnic_fw.h
+++ b/drivers/net/ethernet/meta/fbnic/fbnic_fw.h
@@ -51,6 +51,12 @@ struct fbnic_fw_ver {
  */
 #define FBNIC_SENSOR_NO_DATA			S32_MIN
 
+struct fbnic_threshold {
+	s32 min;
+	s32 max;
+	s32 crit;
+};
+
 struct fbnic_fw_cap {
 	struct {
 		struct fbnic_fw_ver mgmt, bootloader;
@@ -67,6 +73,8 @@ struct fbnic_fw_cap {
 	u8	link_speed;
 	u8	link_fec;
 	u32	anti_rollback_version;
+	struct fbnic_threshold temp;
+	struct fbnic_threshold volt;
 };
 
 struct fbnic_fw_completion {
@@ -249,6 +257,12 @@ enum {
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
index c8e7ff1d36fc..7dc4d705f566 100644
--- a/drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c
+++ b/drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c
@@ -7,16 +7,6 @@
 #include "fbnic.h"
 #include "fbnic_mac.h"
 
-static int fbnic_hwmon_sensor_id(enum hwmon_sensor_types type)
-{
-	if (type == hwmon_temp)
-		return FBNIC_SENSOR_TEMP;
-	if (type == hwmon_in)
-		return FBNIC_SENSOR_VOLTAGE;
-
-	return -EOPNOTSUPP;
-}
-
 static umode_t fbnic_hwmon_is_visible(const void *drvdata,
 				      enum hwmon_sensor_types type,
 				      u32 attr, int channel)
@@ -87,14 +77,58 @@ static int fbnic_hwmon_sensor_read(struct fbnic_dev *fbd, int id, long *val)
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
@@ -103,8 +137,11 @@ static const struct hwmon_ops fbnic_hwmon_ops = {
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


Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B08FC3A7193
	for <linux-hwmon@vger.kernel.org>; Mon, 31 Aug 2026 21:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788211371; cv=none; b=CzT5L9tnaO3lGR5Jr20BzN/Asl5lCnQ3onEhqC/N1RFK7qUYYHNJXQkOdaU+ZqvFp5jYqdiAF/mSmDbFv+nWbOZZHL0RNGhVPmyd+xhdVZVELAQO+DXMb0APpMlKsX03vtf0W+diLKp3i13wv3JK3F4YJ/T3LKQIowyCUfYnbxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788211371; c=relaxed/simple;
	bh=7ryBp4J/qEyf2/01p+hdf/8QZoypRA4clk5o6hi7rC0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M2t+0A7Fmdqsu72B9AuTtpeJzzpjhaUOucSamUqma+IFiKI1xslgJ6K1KLp+LZHknBivtyOm8JulNOi/JoDcWoc9RfGQziQBDWG7nf7QDORu8PowAcGFBBK+EVLnY5dUCRZs+ee7urO+fNKAff/goRmOcbe/eXucrDpENcKXxXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q12Bf5r7; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q12Bf5r7"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-855d2bfae95so371595b3a.1
        for <linux-hwmon@vger.kernel.org>; Mon, 31 Aug 2026 14:22:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788211367; x=1788816167; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VGnbInnCX26l95VXtFdZ6NsvhwlhpXxdn0FnqPhv8qQ=;
        b=q12Bf5r7sKohjI04oZLLDJ6a4MJC4epZAHYaKAqhFKImSrCGeSpDTfmx0aZqvMOtga
         xk1e1EhnuXvS8Kf/GKFGuYS7hVrgv5B00Zl6PzbQQZ3D5FEsg69JMfvTplRBTArq94SR
         JyYBueDae1PezWvxvoOG6zQUNq/Kt0FQ8FcE/FNjvSTkyjypFCBkVED0eOWxxmlVp7PC
         LYAj93CEM8s5yIOnRcVKAPz3HIpu57nEazWC+WkiGCb6BPDd0BaxLmHpP+ZTpP9KutUw
         sZLeEo61CbbxzX731xW8bVUO7OUlde41qnZsajV7k1rSHPPZ4uJzWslI6l4VfJgWuZwD
         KueA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788211367; x=1788816167;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VGnbInnCX26l95VXtFdZ6NsvhwlhpXxdn0FnqPhv8qQ=;
        b=K2TjbFySUZmAQjuk2n3rFnMMru6VNTKAx4pJcuXTUwljkxn0ewVoF9rwVizzrSNMoX
         UbhNSek7G1XSInkiZHm2ZXvhnN2+pOFSmw6g5Xj02GQv2bco9qKzM/8sxsjzxQLtYk4X
         h7eWpz8WGa7juEv7hyFHpOuhm7xipIkEY88Evs9D/1HS7cXU58pHm2k1mNDxEy9l+mFr
         I/kdS4zgn+kJhsZSBL0MCgjIHjlP4z6sw0MAq/oLEAcH9nPOKfptc/Ro7wiKbqAR9czo
         xPnP6z1lbjm0iVIAWauaYzVaLvpVu4Sem7eTT5BIEtIq63xukJohOuafER2/PWF0/AOk
         MIhQ==
X-Forwarded-Encrypted: i=1; AHgh+RpJEImeJvTaSaj2J3mbNjF3Mq8O4ng39YZ5scnQ7x0QUSV6JW/gbsA0pq2/AhZpeZYhaiCljVox/v9D/w==@vger.kernel.org
X-Gm-Message-State: AFuF++kd807tOc0+rCm3aW/aHpK9LbSkeMh22aNmelKdNT7WswfVYtSR
	VIYBNTKpgj1nNmEZm2Usy1oTNy2qhEIKaQvkNudGh+E7UErCMrg6lN8IkL/FSA==
X-Gm-Gg: AR+sD12uZQwMuhhNNxS9w0fuBc7+mKYlmfiRjMJ7wWlzjFo5xrtELT+wYQb6K7ApuEm
	Hasd5HdaqtmjHldzd019bZ6ei8bZAC+EELeESbP4tLqMVqTssL8XcETD9SD0LBh3BHh8ELHt3vK
	TR0meRerunfsfPNWysKMLmqNASnDNWOod1VTOxDa1/ScneCL/v5FhdFG7+vt1UEEVUC9NH6cTQf
	wuhH1D3Z8cYLMQtR46yR6vmDO3PTtSDJpSABueR5sDF/CdPVbJSRwQX2upF7XpV+hbQ7XwPsT5r
	rMUOmWIxFb0ukZiAZ72uzXS+UH/XHcpp1vHpYuZngBQV5e2RHgpNPeK+w6TykrjUZ+ygEpkL6aA
	eTDtA6StjkVVrwS8ZxKgCPf2+j9KYmeAqFPOQ2Y8lDHh32ShkFfu/IzTs9vJneEQkN8JitHiskO
	LUJd5e/m+cWO9KZy3r13mY4E8TdDN4EqRtnjpXPDUDAhQon9SVDvnZDNxhPJoaqX+krSGu6gwnF
	uSnGw==
X-Received: by 2002:a05:6a21:e344:b0:3cc:f9a0:3ada with SMTP id adf61e73a8af0-3d818ab8a23mr799208637.16.1788211367000;
        Mon, 31 Aug 2026 14:22:47 -0700 (PDT)
Received: from localhost ([2620:10d:c090:500::6:bac7])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f8094dasm34373765eec.13.2026.08.31.14.22.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 14:22:46 -0700 (PDT)
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
Subject: [PATCH net-next v2 4/6] eth: fbnic: report temperature and voltage thresholds via hwmon
Date: Mon, 31 Aug 2026 14:22:32 -0700
Message-ID: <20260831212234.1212971-5-limzhineng2@gmail.com>
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
index 283d25fae79e..d814bd4041a0 100644
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
index f35cb0065093..4938f7b39140 100644
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
@@ -88,14 +78,58 @@ static int fbnic_hwmon_sensor_read(struct fbnic_dev *fbd, int id, long *val)
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
@@ -104,8 +138,11 @@ static const struct hwmon_ops fbnic_hwmon_ops = {
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


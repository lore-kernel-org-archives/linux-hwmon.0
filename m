Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D58ED46F4AD
	for <linux-hwmon@vger.kernel.org>; Tue, 21 Jul 2026 22:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784672157; cv=none; b=WP+sw/5Z7Kc/VxwAGI2Z9rcr79gLf6GdRW/8jdYj9G6ypAPUgfvksPZHJjshV8FB2UyeuNSJBxyD31ee9qY4Jiq8GinktIi4HJP/ZJEToGzx7nmg49/oUBCSBeezf6z2eAj8L1qftVdX2R/WzXL/QgM+8pJEuw4wy2ogKkMxoG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784672157; c=relaxed/simple;
	bh=ifp1aJY5qOZ7Br/E4drAZbVQP9feWG+J3taNEgbr3EI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P1zBYzieq2BJalVWiBZOBbc22zB6053z2XF9TXslbCgU7pkDDgzRy82/2IL35j0tsx8gODjwLdwU6lzPITxNwfNAYPjiVfPv2R7VIDzHPk2ECYLeAKGokitfB2DyrxzWO6F+7SFaMjhXk8JmR46heJep9dg7TSY6eIbfcJy0jrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j3ZeSsaU; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j3ZeSsaU"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-c9cf07d2df6so7465095a12.2
        for <linux-hwmon@vger.kernel.org>; Tue, 21 Jul 2026 15:15:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784672155; x=1785276955; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6ks0gOYljs2jStwnxy+hBglX07Lt+6Q3Ra+cMpNSoe4=;
        b=j3ZeSsaUy5e8JfsfmwyzHPMKMJpLfV0BWLSDY7vwDZEAsieGwmsTMpnJlXgA9lQyF1
         ZKfpSXIPHIkPxCVO0RUIoKZPFEOcmjgCnDFflTTHGtittckGvEzvbUwpRFYLGKCnAVNn
         OaX7f4Der9Ax/0RoohajdOSD/bTXysXLcL2FPcijfvAXjtpUeJPr5v2waMitVcXNuOOR
         Kfi5gT3vEt1RNhIjnfjG6mmi8WqhxZUk4R97j1w8t6INpMkyt9wPxpfVioDM1r/Vyktl
         jqsXAWHbjrQRsGZwNNnEIIu4npmRoisbAuRgHfCHJXjVTusWIN9h5hplEMmXtARKPVUO
         qW1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784672155; x=1785276955;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6ks0gOYljs2jStwnxy+hBglX07Lt+6Q3Ra+cMpNSoe4=;
        b=M/A7Nv2Z8FD7Kp4qYR9hxBfMje0k+aaF7aMslssJRd+LfdfLukPjjh/5tfD9LeWfFZ
         GW7MC6WvcTTbcA1FyJuY6iPcq4BFxFzOh/shTbc8RhokCj1tZ94BpF9G8EdD72mnX52F
         DNkTTerPUZRj8uEvKC0xIoEs21SWEqYPi79f5ua990j3s91ycqPwzG9Ak5o92URRl8h8
         ODM5gUJBDwD/fmDnlx4/WaFgkNX08ZrbJkEsy0qw/QIa+Qt6ZHJSJEmRT+tAIls6JhTA
         Dc0oEoe40Uk9YlZAvJXUlZ0O15KN3CLCI0s2wBS95hxHylVuG76wb8sEITaRfQjUAcWN
         fR1g==
X-Forwarded-Encrypted: i=1; AHgh+Ro35e4WhGMaymHmLu6vEalkcLkD4umyoNE74hnS4FH8OPk0tBJOdJB2TRfSF/KwH5hBlqWP6ou14Sjjwg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxYEFXKDe+y/c05xIqJHuF9+BOgynZjCmmmDcve4jq0M6Euds0g
	/UzixQn+PWBf/PJdbhV4DZY73Ws99r3IlCsAlhVH7HVBz5PZjF399U6z
X-Gm-Gg: AR+sD10gOY8hfJ5JeHahXISaXs3j+p7UOcsMciUfnOQoZ891sTP8fx6x2mwwCHJHILK
	wiQ74KBERSibpXMFrk7uzOCZRJ7Szf9/JN2K7v90uOQsRuFkOjWTO8tdfEcH3lrKRvloHenTZzr
	1lL9cozVxUAQ08yNFCV7xw+2xlrEhEaKji7FIcjGtpaZj8P+VqZNqyAevBFWy6Mo8js2xrIhTpO
	w47qWfxHQjYjpHeCQCa95nNRhkH5meTqmUfdx/Iwi28Mo4DebVcpNF6+zcaSxcatUqe6sFVatdK
	2EZMiFqrFEniuEXSm9N8y7Offbx4y4HhDF1SW64F2j9UVW22zAYVd86sKuanTDqLDSLvTpLJDWm
	m/+uCW6kEo/qGR1h9JSmK7pNwIT+VYMv2tAdO5Dnm3j+cfqQhUApP4q12AfQArhpSNcRJgR2i2i
	mZkCk51Q==
X-Received: by 2002:a05:6a20:9397:b0:3c3:8de3:8eee with SMTP id adf61e73a8af0-3c3ad95142fmr22790934637.61.1784672155062;
        Tue, 21 Jul 2026 15:15:55 -0700 (PDT)
Received: from localhost ([2620:10d:c090:500::9edb])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147e1cf8fasm2156161eec.31.2026.07.21.15.15.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 15:15:54 -0700 (PDT)
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
Subject: [PATCH net-next 6/6] eth: fbnic: firmware notifies hwmon on sensor threshold events
Date: Tue, 21 Jul 2026 15:15:40 -0700
Message-ID: <20260721221540.648272-7-limzhineng2@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260721221540.648272-1-limzhineng2@gmail.com>
References: <20260721221540.648272-1-limzhineng2@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The firmware sends an unsolicited message via the new
FBNIC_TLV_MSG_ID_SENSOR_THRESHOLD_EXCEEDED_RESP IPC message when a
temperature or voltage sensor crosses one of its thresholds. Parse this
message and translate it into the corresponding hwmon alarm
(temp1_{min,max,crit}_alarm or in0_{min,max}_alarm) via
hwmon_notify_event(), so userspace listeners are woken on the relevant
sysfs attribute.

fbnic_hwmon_notify_event() is driven from the FW mailbox IRQ path, so it
can run concurrently with hwmon registration and teardown. Guard the
publish/teardown of fbd->hwmon: register publishes it with WRITE_ONCE()
only after a successful registration (and leaves it NULL on failure),
unregister clears it with WRITE_ONCE(NULL) and then
synchronize_irq(fbd->fw_msix_vector) to drain any in-flight mailbox IRQ
before unregistering, and notify_event reads it once with READ_ONCE() and
skips the notification when it is NULL.

Signed-off-by: Zinc Lim <limzhineng2@gmail.com>
---
 drivers/net/ethernet/meta/fbnic/fbnic.h       |  1 +
 drivers/net/ethernet/meta/fbnic/fbnic_fw.c    | 54 +++++++++++++++
 drivers/net/ethernet/meta/fbnic/fbnic_fw.h    |  9 +++
 drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c | 68 ++++++++++++++++---
 4 files changed, 124 insertions(+), 8 deletions(-)

diff --git a/drivers/net/ethernet/meta/fbnic/fbnic.h b/drivers/net/ethernet/meta/fbnic/fbnic.h
index f647ef07704b..4a49c20e4a01 100644
--- a/drivers/net/ethernet/meta/fbnic/fbnic.h
+++ b/drivers/net/ethernet/meta/fbnic/fbnic.h
@@ -192,6 +192,7 @@ void fbnic_fw_free_mbx(struct fbnic_dev *fbd);
 
 void fbnic_hwmon_register(struct fbnic_dev *fbd);
 void fbnic_hwmon_unregister(struct fbnic_dev *fbd);
+void fbnic_hwmon_notify_event(struct fbnic_dev *fbd, int id, long val);
 
 int fbnic_mac_request_irq(struct fbnic_dev *fbd);
 void fbnic_mac_free_irq(struct fbnic_dev *fbd);
diff --git a/drivers/net/ethernet/meta/fbnic/fbnic_fw.c b/drivers/net/ethernet/meta/fbnic/fbnic_fw.c
index d814bd4041a0..6dca38076d7b 100644
--- a/drivers/net/ethernet/meta/fbnic/fbnic_fw.c
+++ b/drivers/net/ethernet/meta/fbnic/fbnic_fw.c
@@ -1639,6 +1639,57 @@ fbnic_fw_parser_test(void *opaque, struct fbnic_tlv_msg **results)
 	return err;
 }
 
+static const struct fbnic_tlv_index fbnic_threshold_exceeded_resp_index[] = {
+	FBNIC_TLV_ATTR_S32(FBNIC_FW_TSENE_THERM_EXCEEDED_FLAG),
+	FBNIC_TLV_ATTR_S32(FBNIC_FW_TSENE_VOLT_EXCEEDED_FLAG),
+	FBNIC_TLV_ATTR_S32(FBNIC_FW_TSENE_THERMAL),
+	FBNIC_TLV_ATTR_S32(FBNIC_FW_TSENE_VOLTAGE),
+	FBNIC_TLV_ATTR_LAST
+};
+
+static int fbnic_fw_parse_threshold_exceeded_resp(void *opaque,
+						  struct fbnic_tlv_msg **results)
+{
+	bool therm_exceeded, volt_exceeded;
+	struct fbnic_dev *fbd = opaque;
+	s32 value;
+
+	therm_exceeded =
+		fta_get_sint(results, FBNIC_FW_TSENE_THERM_EXCEEDED_FLAG);
+	volt_exceeded =
+		fta_get_sint(results, FBNIC_FW_TSENE_VOLT_EXCEEDED_FLAG);
+
+	if (!therm_exceeded && !volt_exceeded) {
+		dev_err(fbd->dev,
+			"Threshold exceeded message with no flag set\n");
+		return -EINVAL;
+	}
+
+	if (therm_exceeded) {
+		if (!results[FBNIC_FW_TSENE_THERMAL]) {
+			dev_err(fbd->dev,
+				"Thermal threshold exceeded but no value received\n");
+			return -EINVAL;
+		}
+		value = fta_get_sint(results, FBNIC_FW_TSENE_THERMAL);
+		dev_err(fbd->dev, "Thermal threshold exceeded: %d mC\n", value);
+		fbnic_hwmon_notify_event(fbd, FBNIC_SENSOR_TEMP, value);
+	}
+
+	if (volt_exceeded) {
+		if (!results[FBNIC_FW_TSENE_VOLTAGE]) {
+			dev_err(fbd->dev,
+				"Voltage threshold exceeded but no value received\n");
+			return -EINVAL;
+		}
+		value = fta_get_sint(results, FBNIC_FW_TSENE_VOLTAGE);
+		dev_err(fbd->dev, "Voltage threshold exceeded: %d mV\n", value);
+		fbnic_hwmon_notify_event(fbd, FBNIC_SENSOR_VOLTAGE, value);
+	}
+
+	return 0;
+}
+
 static const struct fbnic_tlv_parser fbnic_fw_tlv_parser[] = {
 	FBNIC_TLV_PARSER(TEST, fbnic_tlv_test_index, fbnic_fw_parser_test),
 	FBNIC_TLV_PARSER(FW_CAP_RESP, fbnic_fw_cap_resp_index,
@@ -1667,6 +1718,9 @@ static const struct fbnic_tlv_parser fbnic_fw_tlv_parser[] = {
 	FBNIC_TLV_PARSER(TSENE_READ_RESP,
 			 fbnic_tsene_read_resp_index,
 			 fbnic_fw_parse_tsene_read_resp),
+	FBNIC_TLV_PARSER(SENSOR_THRESHOLD_EXCEEDED_RESP,
+			 fbnic_threshold_exceeded_resp_index,
+			 fbnic_fw_parse_threshold_exceeded_resp),
 	FBNIC_TLV_PARSER(LOG_MSG_REQ,
 			 fbnic_fw_log_req_index,
 			 fbnic_fw_parse_log_req),
diff --git a/drivers/net/ethernet/meta/fbnic/fbnic_fw.h b/drivers/net/ethernet/meta/fbnic/fbnic_fw.h
index 68ffd49e0cdd..87301e608255 100644
--- a/drivers/net/ethernet/meta/fbnic/fbnic_fw.h
+++ b/drivers/net/ethernet/meta/fbnic/fbnic_fw.h
@@ -227,6 +227,7 @@ enum {
 	FBNIC_TLV_MSG_ID_QSFP_READ_RESP			= 0x39,
 	FBNIC_TLV_MSG_ID_TSENE_READ_REQ			= 0x3C,
 	FBNIC_TLV_MSG_ID_TSENE_READ_RESP		= 0x3D,
+	FBNIC_TLV_MSG_ID_SENSOR_THRESHOLD_EXCEEDED_RESP = 0x40,
 	FBNIC_TLV_MSG_ID_LOG_SEND_LOGS_REQ		= 0x43,
 	FBNIC_TLV_MSG_ID_LOG_MSG_REQ			= 0x44,
 	FBNIC_TLV_MSG_ID_LOG_MSG_RESP			= 0x45,
@@ -296,6 +297,14 @@ enum {
 	FBNIC_FW_TSENE_MSG_MAX
 };
 
+enum {
+	FBNIC_FW_TSENE_THERM_EXCEEDED_FLAG	= 0x0,
+	FBNIC_FW_TSENE_VOLT_EXCEEDED_FLAG	= 0x1,
+	FBNIC_FW_TSENE_THERMAL			= 0x2,
+	FBNIC_FW_TSENE_VOLTAGE			= 0x3,
+	FBNIC_FW_TSENE_EXCEEDED_MSG_MAX,
+};
+
 enum {
 	FBNIC_FW_OWNERSHIP_FLAG			= 0x0,
 	FBNIC_FW_OWNERSHIP_TIME			= 0x1,
diff --git a/drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c b/drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c
index c5cddd9cef12..eb910ba47f37 100644
--- a/drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c
+++ b/drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c
@@ -207,6 +207,8 @@ static const struct hwmon_chip_info fbnic_chip_info = {
 
 void fbnic_hwmon_register(struct fbnic_dev *fbd)
 {
+	struct device *hwmon;
+
 	if (!IS_REACHABLE(CONFIG_HWMON))
 		return;
 
@@ -214,22 +216,72 @@ void fbnic_hwmon_register(struct fbnic_dev *fbd)
 	fbd->hwmon_cache.temp_mdeg = FBNIC_SENSOR_NO_DATA;
 	fbd->hwmon_cache.volt_mv = FBNIC_SENSOR_NO_DATA;
 
-	fbd->hwmon = hwmon_device_register_with_info(fbd->dev, "fbnic",
-						     fbd, &fbnic_chip_info,
-						     NULL);
-	if (IS_ERR(fbd->hwmon)) {
+	hwmon = hwmon_device_register_with_info(fbd->dev, "fbnic", fbd,
+						&fbnic_chip_info, NULL);
+	if (IS_ERR(hwmon)) {
 		dev_notice(fbd->dev,
 			   "Failed to register hwmon device %pe\n",
-			   fbd->hwmon);
-		fbd->hwmon = NULL;
+			   hwmon);
+		return;
 	}
+
+	WRITE_ONCE(fbd->hwmon, hwmon);
 }
 
 void fbnic_hwmon_unregister(struct fbnic_dev *fbd)
 {
+	struct device *hwmon;
+
 	if (!IS_REACHABLE(CONFIG_HWMON) || !fbd->hwmon)
 		return;
 
-	hwmon_device_unregister(fbd->hwmon);
-	fbd->hwmon = NULL;
+	hwmon = fbd->hwmon;
+	/* Pair with READ_ONCE() in fbnic_hwmon_notify_event(). Publish NULL
+	 * and wait for any in-flight FW mailbox IRQ handler to finish so it
+	 * cannot dereference the hwmon device after we unregister it.
+	 */
+	WRITE_ONCE(fbd->hwmon, NULL);
+	synchronize_irq(fbd->fw_msix_vector);
+
+	hwmon_device_unregister(hwmon);
+}
+
+void fbnic_hwmon_notify_event(struct fbnic_dev *fbd, int id, long val)
+{
+	enum hwmon_sensor_types type;
+	struct device *hwmon;
+	s32 attr = -1;
+
+	switch (id) {
+	case FBNIC_SENSOR_TEMP:
+		type = hwmon_temp;
+
+		if (val <= fbd->fw_cap.temp.min)
+			attr = hwmon_temp_min_alarm;
+		else if (val >= fbd->fw_cap.temp.crit)
+			attr = hwmon_temp_crit_alarm;
+		else if (val >= fbd->fw_cap.temp.max)
+			attr = hwmon_temp_max_alarm;
+
+		break;
+	case FBNIC_SENSOR_VOLTAGE:
+		type = hwmon_in;
+
+		if (val <= fbd->fw_cap.volt.min)
+			attr = hwmon_in_min_alarm;
+		else if (val >= fbd->fw_cap.volt.max)
+			attr = hwmon_in_max_alarm;
+
+		break;
+	default:
+		return;
+	}
+
+	/* Pair with WRITE_ONCE() in fbnic_hwmon_unregister(). Skip the
+	 * notification if hwmon failed to register or has already been torn
+	 * down.
+	 */
+	hwmon = READ_ONCE(fbd->hwmon);
+	if (attr >= 0 && hwmon)
+		hwmon_notify_event(hwmon, type, attr, 0);
 }
-- 
2.53.0-Meta


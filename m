Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 058624BE443
	for <linux-hwmon@vger.kernel.org>; Wed, 14 Oct 2026 22:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792016559; cv=none; b=BbDQDXGdRyoGeafIOpOozej3Lc7D6wxZmufy6Kky83JGXHVfyz4U5IAnI5YXtdu/6K0VVP59RWw0lkKHGioC2vzPze5IVuvlWFnlc2e0/XLTBUXdv2fG69ZdyXJSFBsk0N1eY4OHvf/rmiInlv7sIurSs/MB/D9cpaTX6h6qeJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792016559; c=relaxed/simple;
	bh=EBuMN5J4oDjV5BPric1jegT7gBAVVm7y4kzJ39eNrpw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MDzxtN/1pJ3Jewt0TcJn+SxHj20f7W9IzvW5h36oBsA+YcsxKZFq7dr4L0PDNSfPWVvAXemEFOSvq1+ERgLFw0FPpVR1irqux9jRV7YuAgWfv57wG/fxKduYVB1Exa/eVbTQGaLBRbojpkFABGvUpV4VQwgi+g8zm3pScN9rdmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mXWXqjXS; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mXWXqjXS"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-30b6dad2382so10760689eec.0
        for <linux-hwmon@vger.kernel.org>; Wed, 14 Oct 2026 15:22:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792016557; x=1792621357; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NJYREQb5ZPjOy7rZOk1Aco85xHoWhNV2WbumcoqZWmM=;
        b=mXWXqjXSpXhP8PYYt3LxcrTfHkRhwOiiGPRapJG5O+0syheV1A6gL9i3PPz1ZV+TTh
         ambzQ6opJnTTZEV8JfBiIEVUWwnRAHVOz0iTVrbGcdRfJ6D89HUqrEY5ndAACEJo4Zzr
         zV6dMS62haPV/7s529lOEpbe+HdHSAw4kkL8iBRmx17tZOjpq0wvTq2aR4PCU0bWc0q/
         +9YtJfXFIThUHq9qCa0Lm/osP93Pv2NM1xJvw7XNQlpNp9LmOP8TSSckObWtFsOgVKco
         EYU9rLhwlMBmuELQxYHvACk3UQONlHivaZLXdI6eGMcvbIKf3AmyeQ9ZSQM/HhLHBX+r
         lUmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792016557; x=1792621357;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NJYREQb5ZPjOy7rZOk1Aco85xHoWhNV2WbumcoqZWmM=;
        b=m/nDpx0fAbWAMhtXYDEZMrJH4oioSmzlYycGjunx9wXv2SVOld5/TtKWRBQX0f5Z9i
         WLBC1/rXHIAoiwKydpBLXuvuX29arePOeHRV4chmBv47M4uE1VRbiC0CUBlSRS1Kmy/r
         Hn20gPvVFJtBDqebQQk1ZGsKHwMtcoWKjTVU/kTD3DLBfgDaAfOkjaDDJINp4CHXZlRq
         0CdDDIId1J6X95OYN/ln5+JH3q61SaLMklDzSQ1qZqggSCNALUhw9GlZwYFd/yx49DFu
         sI0GQGfgYNgbGtxUE8kt1bjbkdbsD1LGzdsso7mkKJQFHDh5E9bGCXFcVKKBe72gPkuJ
         TOqA==
X-Forwarded-Encrypted: i=1; AKwUvByFtYYDEtRE8qyDvDncKbaRmc3u8Pu2lSRw/Q8GiAqiOnFwfDLwPkqRFHqJ3c8TKfE7a9QE5OrUQXEbeQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYKjiCPW4iMRZqOIjVBVLOi8vRysTQi3lsaOoLnx5Vl90m/rnwS3
	Zf3UE6RASyAWJ9Qnq7QaYsjlOFl5by2CrkyaKCienJ9LNtYmmwBlwGnr
X-Gm-Gg: AYBFou2PrENihZU9eSUprkqto3bNeleshr9dTVzwz9nb5icZz0eRv97E2QSK8zCjZ2N
	1Si9b5GB6eIlErc+1HLpTDBCJfqj8cAP0TPKNXaKfkjY0zsf2frl0oMEP6/xwMKJPK7EXYIjebB
	h+6AqwlSDmn2zmph8Kw/7CH/QPUyLy/5SOnQO/06jgvJi70Wgzt3W6wuGju8Jy8Fj5cjE0uezxa
	CFOkutVscTZGylniFXynZiDRz6bdwOwM/2ULboZrmNhKYGvaT8PaJUM2AxfgbFcn9VC+3SlaAU0
	bh1FcXO7tTyqol3VESfm6EoNY4vriYcf9Cjg5i2/n1rdqBoL7wZod8r/ZDJG3V/12Sqd6KaJoDN
	oLS8Ns90VI4yKGfrGlft31lm4uWt9pI+RvKYgB+9ROPgyIFZYEAUAlV6NfBcJr6WqRMGEeeR8Vh
	olXkvlApX6eOnMeyUGa2aCdgj8luFq/dHjqhHwNr5cRX0AKWtt6u6zXR14KFzoD8d/cqOewSFmM
	iXvew==
X-Received: by 2002:a05:7301:1a0c:b0:359:c212:a4b6 with SMTP id 5a478bee46e88-359c212a4fdmr15418117eec.7.1792016557020;
        Wed, 14 Oct 2026 15:22:37 -0700 (PDT)
Received: from localhost ([2620:10d:c090:500::5:7561])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cb6a279sm55064177eec.30.2026.10.14.15.22.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 15:22:36 -0700 (PDT)
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
Subject: [PATCH net-next v4 5/6] eth: fbnic: report temperature and voltage alarms via hwmon
Date: Wed, 14 Oct 2026 15:22:23 -0700
Message-ID: <20261014222225.2803660-6-limzhineng2@gmail.com>
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

Firmware reports the range a sensor has entered on every threshold
crossing, including the one back into the normal range. Expose that as
temp1_alarm and in0_alarm, so the alarm reflects a condition the
hardware raised and an excursion that starts and ends between two sysfs
reads is still caught. Each crossing wakes anything polling the
attribute through hwmon_notify_event().

Each alarm is only visible if all of its thresholds are reported by the
firmware. Voltage has no crit threshold, only min and max.

Firmware only reports a range when it changes, so a sensor already out of
range when the driver attaches has nothing cached. The first alarm read
resolves that via a sensor read, its response carrying the range.
Old firmware that doesn't report a range leaves the alarm to be
classified from the reading against the thresholds, with no range to
notify on.

fbnic_hwmon_notify_event() runs from the mailbox IRQ, so it can race
registration and teardown. Publish fbd->hwmon with WRITE_ONCE() only
after a successful registration, clear it with WRITE_ONCE(NULL) followed
by synchronize_irq() to drain any in-flight handler, and skip the
notification when the read returns NULL.

Signed-off-by: Zinc Lim <limzhineng2@gmail.com>
---
 drivers/net/ethernet/meta/fbnic/fbnic.h       |   1 +
 drivers/net/ethernet/meta/fbnic/fbnic_fw.c    |   8 +-
 drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c | 146 ++++++++++++++++--
 3 files changed, 142 insertions(+), 13 deletions(-)

diff --git a/drivers/net/ethernet/meta/fbnic/fbnic.h b/drivers/net/ethernet/meta/fbnic/fbnic.h
index 93bf7004b67d..90e54cffe6a9 100644
--- a/drivers/net/ethernet/meta/fbnic/fbnic.h
+++ b/drivers/net/ethernet/meta/fbnic/fbnic.h
@@ -200,6 +200,7 @@ void fbnic_fw_free_mbx(struct fbnic_dev *fbd);
 
 void fbnic_hwmon_register(struct fbnic_dev *fbd);
 void fbnic_hwmon_unregister(struct fbnic_dev *fbd);
+void fbnic_hwmon_notify_event(struct fbnic_dev *fbd, int id);
 
 int fbnic_mac_request_irq(struct fbnic_dev *fbd);
 void fbnic_mac_free_irq(struct fbnic_dev *fbd);
diff --git a/drivers/net/ethernet/meta/fbnic/fbnic_fw.c b/drivers/net/ethernet/meta/fbnic/fbnic_fw.c
index 7863f6ba1e7d..9485665cba46 100644
--- a/drivers/net/ethernet/meta/fbnic/fbnic_fw.c
+++ b/drivers/net/ethernet/meta/fbnic/fbnic_fw.c
@@ -1738,8 +1738,10 @@ static int fbnic_fw_parse_threshold_exceeded_resp(void *opaque,
 				alarm, value);
 
 		/* Old firmware reports no range, leave the cache alone */
-		if (alarm != FBNIC_FW_TSENE_ALARM_DEPRECATED)
+		if (alarm != FBNIC_FW_TSENE_ALARM_DEPRECATED) {
 			WRITE_ONCE(fbd->hwmon_cache.temp_alarm, alarm);
+			fbnic_hwmon_notify_event(fbd, FBNIC_SENSOR_TEMP);
+		}
 		rec_flag = true;
 	}
 
@@ -1756,8 +1758,10 @@ static int fbnic_fw_parse_threshold_exceeded_resp(void *opaque,
 				alarm, value);
 
 		/* Old firmware reports no range, leave the cache alone */
-		if (alarm != FBNIC_FW_TSENE_ALARM_DEPRECATED)
+		if (alarm != FBNIC_FW_TSENE_ALARM_DEPRECATED) {
 			WRITE_ONCE(fbd->hwmon_cache.volt_alarm, alarm);
+			fbnic_hwmon_notify_event(fbd, FBNIC_SENSOR_VOLTAGE);
+		}
 		rec_flag = true;
 	}
 
diff --git a/drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c b/drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c
index 4df808f850cf..310a2c52bb4d 100644
--- a/drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c
+++ b/drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c
@@ -29,6 +29,10 @@ static umode_t fbnic_hwmon_is_visible(const void *drvdata,
 			return fbnic_hwmon_thr_visible(fbd->fw_cap.temp.max);
 		case hwmon_temp_crit:
 			return fbnic_hwmon_thr_visible(fbd->fw_cap.temp.crit);
+		case hwmon_temp_alarm:
+			return fbnic_hwmon_thr_visible(fbd->fw_cap.temp.min) &
+			       fbnic_hwmon_thr_visible(fbd->fw_cap.temp.max) &
+			       fbnic_hwmon_thr_visible(fbd->fw_cap.temp.crit);
 		}
 		break;
 	case hwmon_in:
@@ -39,6 +43,9 @@ static umode_t fbnic_hwmon_is_visible(const void *drvdata,
 			return fbnic_hwmon_thr_visible(fbd->fw_cap.volt.min);
 		case hwmon_in_max:
 			return fbnic_hwmon_thr_visible(fbd->fw_cap.volt.max);
+		case hwmon_in_alarm:
+			return fbnic_hwmon_thr_visible(fbd->fw_cap.volt.min) &
+			       fbnic_hwmon_thr_visible(fbd->fw_cap.volt.max);
 		}
 		break;
 	default:
@@ -120,6 +127,74 @@ static int fbnic_hwmon_read_threshold(long thr, long *val)
 	return 0;
 }
 
+static bool fbnic_hwmon_at_or_above(long val, s32 thr)
+{
+	return thr != FBNIC_SENSOR_NO_DATA && val >= thr;
+}
+
+static bool fbnic_hwmon_below(long val, s32 thr)
+{
+	return thr != FBNIC_SENSOR_NO_DATA && val < thr;
+}
+
+static u8 fbnic_hwmon_classify(const struct fbnic_threshold *thr, long val)
+{
+	if (fbnic_hwmon_at_or_above(val, thr->crit))
+		return FBNIC_FW_TSENE_ALARM_CRIT;
+	if (fbnic_hwmon_at_or_above(val, thr->max))
+		return FBNIC_FW_TSENE_ALARM_ABOVE_MAX;
+	if (fbnic_hwmon_below(val, thr->min))
+		return FBNIC_FW_TSENE_ALARM_BELOW_MIN;
+
+	return FBNIC_FW_TSENE_ALARM_NORMAL;
+}
+
+static int fbnic_hwmon_alarm_read(struct fbnic_dev *fbd,
+				  enum hwmon_sensor_types type, long *val)
+{
+	struct fbnic_hwmon_cache *cache = &fbd->hwmon_cache;
+	const struct fbnic_threshold *thr;
+	u8 *cached, alarm;
+	long reading;
+	int id, err;
+
+	switch (type) {
+	case hwmon_temp:
+		thr = &fbd->fw_cap.temp;
+		cached = &cache->temp_alarm;
+		id = FBNIC_SENSOR_TEMP;
+		break;
+	case hwmon_in:
+		thr = &fbd->fw_cap.volt;
+		cached = &cache->volt_alarm;
+		id = FBNIC_SENSOR_VOLTAGE;
+		break;
+	default:
+		return -EOPNOTSUPP;
+	}
+
+	/* Paired with WRITE_ONCE() on the mailbox thread. Firmware only
+	 * reports on a threshold crossing, so nothing is cached until the
+	 * first one. Read the sensor, whose response carries the range.
+	 */
+	alarm = READ_ONCE(*cached);
+	if (alarm == FBNIC_FW_TSENE_ALARM_UNKNOWN) {
+		err = fbnic_hwmon_sensor_read(fbd, id, &reading);
+		if (err)
+			return err;
+
+		alarm = READ_ONCE(*cached);
+
+		/* Firmware too old to report a range, derive it instead */
+		if (alarm == FBNIC_FW_TSENE_ALARM_UNKNOWN)
+			alarm = fbnic_hwmon_classify(thr, reading);
+	}
+
+	*val = alarm != FBNIC_FW_TSENE_ALARM_NORMAL;
+
+	return 0;
+}
+
 static int fbnic_hwmon_temp_read(struct fbnic_dev *fbd, u32 attr, long *val)
 {
 	switch (attr) {
@@ -131,6 +206,8 @@ static int fbnic_hwmon_temp_read(struct fbnic_dev *fbd, u32 attr, long *val)
 		return fbnic_hwmon_read_threshold(fbd->fw_cap.temp.max, val);
 	case hwmon_temp_crit:
 		return fbnic_hwmon_read_threshold(fbd->fw_cap.temp.crit, val);
+	case hwmon_temp_alarm:
+		return fbnic_hwmon_alarm_read(fbd, hwmon_temp, val);
 	default:
 		return -EOPNOTSUPP;
 	}
@@ -145,6 +222,8 @@ static int fbnic_hwmon_in_read(struct fbnic_dev *fbd, u32 attr, long *val)
 		return fbnic_hwmon_read_threshold(fbd->fw_cap.volt.min, val);
 	case hwmon_in_max:
 		return fbnic_hwmon_read_threshold(fbd->fw_cap.volt.max, val);
+	case hwmon_in_alarm:
+		return fbnic_hwmon_alarm_read(fbd, hwmon_in, val);
 	default:
 		return -EOPNOTSUPP;
 	}
@@ -172,10 +251,11 @@ static const struct hwmon_ops fbnic_hwmon_ops = {
 
 static const struct hwmon_channel_info *fbnic_hwmon_info[] = {
 	HWMON_CHANNEL_INFO(temp,
-			   HWMON_T_INPUT | HWMON_T_MIN | HWMON_T_MAX |
-			   HWMON_T_CRIT),
+			   HWMON_T_INPUT | HWMON_T_ALARM |
+			   HWMON_T_MIN | HWMON_T_MAX | HWMON_T_CRIT),
 	HWMON_CHANNEL_INFO(in,
-			   HWMON_I_INPUT | HWMON_I_MIN | HWMON_I_MAX),
+			   HWMON_I_INPUT | HWMON_I_ALARM |
+			   HWMON_I_MIN | HWMON_I_MAX),
 	NULL
 };
 
@@ -186,25 +266,69 @@ static const struct hwmon_chip_info fbnic_chip_info = {
 
 void fbnic_hwmon_register(struct fbnic_dev *fbd)
 {
+	struct device *hwmon;
+
 	if (!IS_REACHABLE(CONFIG_HWMON))
 		return;
 
-	fbd->hwmon = hwmon_device_register_with_info(fbd->dev, "fbnic",
-						     fbd, &fbnic_chip_info,
-						     NULL);
-	if (IS_ERR(fbd->hwmon)) {
+	hwmon = hwmon_device_register_with_info(fbd->dev, "fbnic",
+						fbd, &fbnic_chip_info,
+						NULL);
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
+void fbnic_hwmon_notify_event(struct fbnic_dev *fbd, int id)
+{
+	enum hwmon_sensor_types type;
+	struct device *hwmon;
+	u32 attr;
+
+	if (!IS_REACHABLE(CONFIG_HWMON))
+		return;
+
+	switch (id) {
+	case FBNIC_SENSOR_TEMP:
+		type = hwmon_temp;
+		attr = hwmon_temp_alarm;
+		break;
+	case FBNIC_SENSOR_VOLTAGE:
+		type = hwmon_in;
+		attr = hwmon_in_alarm;
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
+	if (hwmon)
+		hwmon_notify_event(hwmon, type, attr, 0);
 }
-- 
2.53.0-Meta


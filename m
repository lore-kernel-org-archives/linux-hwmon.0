Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27B4D4C14FC
	for <linux-hwmon@vger.kernel.org>; Wed, 14 Oct 2026 22:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792016561; cv=none; b=BSTIgMWNWpVjHo8sosAG5mtBNlh7ZoGdWo8VX9P/ULPYYB/B0X2IWSYzOWVLpYUOn3bW5DzIKZMUyyfAPYg+vuyF2oiOuoCj3Gvr/dX5BJ/y9UGNJg0RlunrJAGlU4DhuvsC0gd4sifeqg/etYrWeArc+Jdd0T3T4ruUprtfjno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792016561; c=relaxed/simple;
	bh=yHLMDM/48dcDq/Dd2thjDfocEkPnBBmEY6ZjqusswBU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ru9WqFVeUI14ybo6z+vWUJj9sGCeHwBlDAkDbSfsQAQVZtgR1DPSJ9gMuPXmNGul/lBOWakK7H0ZOsXgxeZ2SBhT8xwG24Br+51RSFtZA7qeWi4OIj4HOy9UqCSwzqYcrKwJbjHtvic4BK92B8VM4jvEzVrSffmdDAfepk9EvR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eof+hDF4; arc=none smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eof+hDF4"
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-15ea896ddc8so2152864c88.0
        for <linux-hwmon@vger.kernel.org>; Wed, 14 Oct 2026 15:22:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792016559; x=1792621359; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W2+TdeI/FqKLxgmSZUeosOnsLC255UKO2RqcJWHBdyk=;
        b=eof+hDF4EuNCH+ObZmq77+1Iw9ZNd/zQ+I3oz6w3OVOO1DUI+y+ZOOxjv8wXlC+7Ru
         7d3Ynnzo8jTHbtV7D0EAH5HrIleBWcLLS5+2qDSEY/Nb4D0I/7bN7yjF+6VhGE83rFpt
         NjiFX9yZPAMXczZ8VTKUM5AyW5B30wl1yOIVgYaFyTc+uIwBvEgj7NPrAItdfLSOQh+A
         xOwu0srD9o12u8INwxvKpnQapQ4BZl3mzMaubnjr5Rou+ip9j2vrnp936EXGoj0TLwq+
         cah0brhJ4OQYCIxo/fgmF614pIRk/mGnX4O6cfzRB+5GJ+QircpcngF2EPx5JU5nxjWy
         5i7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792016559; x=1792621359;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=W2+TdeI/FqKLxgmSZUeosOnsLC255UKO2RqcJWHBdyk=;
        b=KNpeaAwIOiu5y+Be1eASs1hQ5oTry5Y2BRJIe4eEwA2R+AJe2XSJgnnXTuy+U8pEn2
         f8vo7iJ5Rh8xQnOPWpQAqM+QqZbM3gb7Z9uCf+wdZsVtvFcTGs5zZYRoZ7Nut/YSUjCt
         5iGkp4i9X/ckqy7ZXwllTFAgvIoT6qL5OvbYH82AWxY73g4pdZWs/VSHGFttnC/a7yAM
         J1DwyfD1obqACKMSsLdvJJa9ylThShlxF4nESkB+zrYTFwR7xJr9a62zvDYgmB+cuVfX
         lEtgo4RyRtdKClqADRlEBAXFi4rfp+6eiA+Np/za4+5h2nASiRGD2uMvcxcydyIJTfj1
         QrjQ==
X-Forwarded-Encrypted: i=1; AKwUvBzaYJxJSzJh0BmUPNwZ8zrccyV5FxCjsqONwc+mQQYXSYtqZmQLqSC0b6jJs4hp+/rSZRcxyfneqiALcA==@vger.kernel.org
X-Gm-Message-State: AFq9FYIOIheDSPfGnwlO1EGl/JkN+DvTZnAciAVUn3C7ychgzHcbxxpR
	fZ3u7pjfNkHJ8LoJ7TwFC7ZE/nJjCIs5ZLWfS1lGlZ/O89y3utWCNOFb
X-Gm-Gg: AYBFou0oBCRkKgVueZmuBW43zadphWqfzVuS9qfNzOB85yhRnYjh2y95R7AxRdSsi7A
	dWCqUUqPQwnjVQ6t0tbNgzmq/v+GufdpEK72MfemJkwlkkSvrcTMId/AVrSBsActLaN8ha+p6UF
	Ag32Gq150g0wGik2LPQJGXpNn/Kj0iCMaiF2y6lIGixveTD0GXZ5aFN83WMtPlJXyEDwnjOJuGF
	EHTZ9lWBR0WVLNJqOPLYAmGcRM6w59slp70XsdPFjZ6tw7tMQZwodoP9tBIdVlLgDsATKdnVoO1
	fG4rDCkUkgCS53EElW675K1HBbCFQxIUONePn1MPx+607PlNsfmDoST2Y2maX4ivpNw+a3daCAq
	tceqM/E+xR9DDt4R1YUHHbSIM9wtHH4AJnKFsLpzsyoUjzwVfUiRYI9mtJ+J2pvkC9+gPJqIjt4
	zKZyWamBAP56bfovyZXIEXmRzceJchweXTQV+lvUh5qiaKR4roivp64W2BskSBQNcwSdJ8UFTx5
	sy8Ew==
X-Received: by 2002:a05:7022:eb53:20b0:170:64b:b388 with SMTP id a92af1059eb24-170064bb41amr18274573c88.46.1792016558840;
        Wed, 14 Oct 2026 15:22:38 -0700 (PDT)
Received: from localhost ([2620:10d:c090:500::5:7561])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1761ed641ddsm24225058c88.1.2026.10.14.15.22.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 15:22:38 -0700 (PDT)
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
Subject: [PATCH net-next v4 6/6] eth: fbnic: derive the alarm range on older firmware
Date: Wed, 14 Oct 2026 15:22:24 -0700
Message-ID: <20261014222225.2803660-7-limzhineng2@gmail.com>
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

Firmware that predates range reporting uses the threshold event to flag
that a limit was exceeded, with the attribute hardcoded to 1, rather than
reporting which range the sensor entered. The range enum reserves that
value as FBNIC_FW_TSENE_ALARM_DEPRECATED. It does not indicate which
limit was crossed, so it is not cached and the alarm classifies a fresh
reading on every sysfs read.

Such firmware re-arms the trip points around the range the reading
landed in, so every crossing interrupts, including the one back to
normal. The event carries the reading that tripped it, so derive the
range from that, against the same capability response thresholds and
boundaries firmware uses. The alarm then tracks crossings there too, and
wakes anything polling the sysfs attribute.

An event can arrive before the capability response that carries those
thresholds, since rx messages are parsed while polling for it. There is
nothing to classify against yet, so the reading would come back as the
normal range and stick there. Leave the range unknown and let the read
path derive it once the thresholds are in.

Signed-off-by: Zinc Lim <limzhineng2@gmail.com>
---
 drivers/net/ethernet/meta/fbnic/fbnic.h       |  1 +
 drivers/net/ethernet/meta/fbnic/fbnic_fw.c    | 18 +++++++++---
 drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c | 29 +++++++++++++++++++
 3 files changed, 44 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/meta/fbnic/fbnic.h b/drivers/net/ethernet/meta/fbnic/fbnic.h
index 90e54cffe6a9..8180028b20a2 100644
--- a/drivers/net/ethernet/meta/fbnic/fbnic.h
+++ b/drivers/net/ethernet/meta/fbnic/fbnic.h
@@ -201,6 +201,7 @@ void fbnic_fw_free_mbx(struct fbnic_dev *fbd);
 void fbnic_hwmon_register(struct fbnic_dev *fbd);
 void fbnic_hwmon_unregister(struct fbnic_dev *fbd);
 void fbnic_hwmon_notify_event(struct fbnic_dev *fbd, int id);
+void fbnic_hwmon_old_notify_event(struct fbnic_dev *fbd, int id, s32 value);
 
 int fbnic_mac_request_irq(struct fbnic_dev *fbd);
 void fbnic_mac_free_irq(struct fbnic_dev *fbd);
diff --git a/drivers/net/ethernet/meta/fbnic/fbnic_fw.c b/drivers/net/ethernet/meta/fbnic/fbnic_fw.c
index 9485665cba46..cfec30e5cb98 100644
--- a/drivers/net/ethernet/meta/fbnic/fbnic_fw.c
+++ b/drivers/net/ethernet/meta/fbnic/fbnic_fw.c
@@ -1737,8 +1737,13 @@ static int fbnic_fw_parse_threshold_exceeded_resp(void *opaque,
 			dev_err(fbd->dev, "Thermal alarm %u, temperature is currently %dmC!\n",
 				alarm, value);
 
-		/* Old firmware reports no range, leave the cache alone */
-		if (alarm != FBNIC_FW_TSENE_ALARM_DEPRECATED) {
+		if (alarm == FBNIC_FW_TSENE_ALARM_DEPRECATED) {
+			/* Nothing to derive the range from, so do not guess */
+			if (have_temp)
+				fbnic_hwmon_old_notify_event(fbd,
+							     FBNIC_SENSOR_TEMP,
+							     value);
+		} else {
 			WRITE_ONCE(fbd->hwmon_cache.temp_alarm, alarm);
 			fbnic_hwmon_notify_event(fbd, FBNIC_SENSOR_TEMP);
 		}
@@ -1757,8 +1762,13 @@ static int fbnic_fw_parse_threshold_exceeded_resp(void *opaque,
 			dev_err(fbd->dev, "Voltage alarm %u, voltage is currently %dmV!\n",
 				alarm, value);
 
-		/* Old firmware reports no range, leave the cache alone */
-		if (alarm != FBNIC_FW_TSENE_ALARM_DEPRECATED) {
+		if (alarm == FBNIC_FW_TSENE_ALARM_DEPRECATED) {
+			/* Nothing to derive the range from, so do not guess */
+			if (have_volt)
+				fbnic_hwmon_old_notify_event(fbd,
+							     FBNIC_SENSOR_VOLTAGE,
+							     value);
+		} else {
 			WRITE_ONCE(fbd->hwmon_cache.volt_alarm, alarm);
 			fbnic_hwmon_notify_event(fbd, FBNIC_SENSOR_VOLTAGE);
 		}
diff --git a/drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c b/drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c
index 310a2c52bb4d..9fa9eb843c68 100644
--- a/drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c
+++ b/drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c
@@ -302,6 +302,35 @@ void fbnic_hwmon_unregister(struct fbnic_dev *fbd)
 	hwmon_device_unregister(hwmon);
 }
 
+void fbnic_hwmon_old_notify_event(struct fbnic_dev *fbd, int id, s32 value)
+{
+	const struct fbnic_threshold *thr;
+	u8 *cached;
+
+	switch (id) {
+	case FBNIC_SENSOR_TEMP:
+		thr = &fbd->fw_cap.temp;
+		cached = &fbd->hwmon_cache.temp_alarm;
+		break;
+	case FBNIC_SENSOR_VOLTAGE:
+		thr = &fbd->fw_cap.volt;
+		cached = &fbd->hwmon_cache.volt_alarm;
+		break;
+	default:
+		return;
+	}
+
+	/* Event arrived before the capability response containing
+	 * the thresholds.
+	 */
+	if (thr->min == FBNIC_SENSOR_NO_DATA ||
+	    thr->max == FBNIC_SENSOR_NO_DATA)
+		return;
+
+	WRITE_ONCE(*cached, fbnic_hwmon_classify(thr, value));
+	fbnic_hwmon_notify_event(fbd, id);
+}
+
 void fbnic_hwmon_notify_event(struct fbnic_dev *fbd, int id)
 {
 	enum hwmon_sensor_types type;
-- 
2.53.0-Meta


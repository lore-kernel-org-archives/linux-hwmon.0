Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6234C4BD342
	for <linux-hwmon@vger.kernel.org>; Wed, 14 Oct 2026 22:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792016559; cv=none; b=tW41R3qa0cVAS1G15Q9Vz11GjP3OKOBw1yFnbjMCIonzvNCqxbNTMJkCiPn85hpuZ2OfbLWsjgr8KTKdl+hYR3eH7lH9WNg1cKwjs5ofRSfGco/Ku/SFdNT4mjKvPBr3SbreDx5Sww89fNQ8I2eNexaDOSTUM3+PrSws/2TVsjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792016559; c=relaxed/simple;
	bh=EthV+fKC7r0gRY5Zt/El0LeCzRZBKmVZIm2vYoYc9xI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bIi5dCzv1L/uvIlV5HuKTH4ihecfHTa9IV4DTuw7IyRHbtNQgj51RMyIBBvMtWZh+0PWsRvbYjg/zIlBK7I12JCQIF/kHot7n9VZItXJYXlzFq0wT2k3A3o4YbJw7vpRQxw+5AouSw1Ls18lQCThCARmiizYRQ34YM9kFX2AGZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WczC9+P8; arc=none smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WczC9+P8"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-3535a54bed9so2176536eec.1
        for <linux-hwmon@vger.kernel.org>; Wed, 14 Oct 2026 15:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792016555; x=1792621355; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NAUOSNgX4GalX34B0sJy0b8YWJ0GNPgkKHnq+rouh2w=;
        b=WczC9+P8S7IDIUvTargFleFdekXizYGhvn3iBdsbTlHyeJE3wmbjcUexnrsGsj2t28
         yMICQSMpyUeN2T/iBXLjmJe6CX8hfdhjiMTbZ5TQ9FPB3YJ0EtVa9CBn6GWnvSYK3Srw
         UGtAZzai8i1YlNCa3byLBY3wABrWB/m8psfVyLI1xjtS57U8BLTNem6J+MpgW5LwNl8E
         Z/svSNnoFrExyf7cEbDZx01bf4e+PYK4AriKuwF3ulLSvyGEYuj7JoTcDiGlNNeYWAWV
         Y3H1I7CeDtyhnFpGcawb+M5mMUqHj3Ad2FzpfPtukqOsj6CuLDbYgLFgCqlsu+Ro9BGv
         IHcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792016555; x=1792621355;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NAUOSNgX4GalX34B0sJy0b8YWJ0GNPgkKHnq+rouh2w=;
        b=MKoR6vDExqIWMPzciD6matFIt+b0Xg/WmzWuLlFWuvwYglU7P4IhHHppAmBexYpTSB
         bDi802p6wjfT8MFMW9QbGmaRWXPrret4pWEhEWi0WDGsTEcVPBM/tDSmajDy/FexBVQ1
         BlJT7HiRIUBFPQTPymSTIUFaEt7cPx+C0NkTCQ28oKTeQYX34D/mqqLowlQ28oKA3Hj9
         CMLdVv/TjVTZKop1pfpf0LDy/o4RhPdyqaxmzFK7l+UGSG09ZBK7faF7xzbxLSIYiM6W
         fOkiUN13lO+1jRo9JHvFtJ6bUWfCJjGG5d9uN8NHOrXvrx5lIayPGtG0aoRNmZwQZg+9
         o3RQ==
X-Forwarded-Encrypted: i=1; AKwUvBwY3dWoXYUVAZ2TiCn2IfZDQ649SuSvbenR2yechjwsn79POX2/rsfgPd87iOJugBQg3rCLAiBYPEeHlg==@vger.kernel.org
X-Gm-Message-State: AFq9FYJNBTfL9wGZNzBLf/ckG54bsHTgWAnNoIXaSQIYXD8pI5kXGsRm
	ML89eZjvd5JD4fyT0YiCYpNyUmAL0SjNv4s5zyWLdeiYBTYuIFI0vEEb
X-Gm-Gg: AYBFou2s345DEhrwsfOTWl3V/rP/B2NHwsxt8I9z8ZSHzLU1w9Fwfl6WnCHxYecDQVz
	l1pdc2MyQaJXeUPWClexLEYpZ1l6Ji31m+n4Jwl6hthAlfwQFIG5MI3QB/QoFY034NXxlij80l1
	3TWZxLpzB1sF+ZDx3oadIEmiYMILzhvccuqlHy0mN5OKn9KivEngCSCSdOJxG/x3TDalH8zccxh
	zUSCystTRN/Bp5k9qImeDkxkdMVgeDjQAtHhGeiiKywspX9xwN1rCTLMgTnP3A3N89D0gf/9agW
	GuDM/j/vD/UrR7OwvvtsIot3u1W+BCkkAo31iKLYR/H0YZzZkyD4TjG6RjFit958nv4iZw610cW
	EzWinIA+qLZUg2GDIOj/O9GQmAftfsIp2y6Tioh97arc7azsduIHxLMW55WMgbMb02RfsXKTND5
	sfLyUz5wxmCN4BE7WbiqRlTMNLnsRPHzmOYlOQjthoektu0Kza8EyHw/avOBG4TsJEVooZCMvqb
	wslxA==
X-Received: by 2002:a05:7300:ec8e:b0:351:7e90:6035 with SMTP id 5a478bee46e88-3537ddf9efemr24364284eec.4.1792016555342;
        Wed, 14 Oct 2026 15:22:35 -0700 (PDT)
Received: from localhost ([2620:10d:c090:500::5:7561])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35ea672d82esm3986115eec.9.2026.10.14.15.22.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 15:22:34 -0700 (PDT)
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
Subject: [PATCH net-next v4 4/6] eth: fbnic: parse the alarm range reported by firmware
Date: Wed, 14 Oct 2026 15:22:22 -0700
Message-ID: <20261014222225.2803660-5-limzhineng2@gmail.com>
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

Firmware reports which range a sensor is in: normal, below min, above
max, above crit. It sends the range in an unsolicited event on every
trip point crossing, including the crossing back into the normal range,
and in the response to a sensor read. Parse both and keep the last
reported range per sensor, so the driver holds a condition the hardware
reported.

The range is cached from the mailbox thread in both cases, so an event
and a read response cannot be applied out of the order firmware sent
them. It is seeded alongside the rest of the sensor cache in
fbnic_mbx_init(), before the mailbox interrupt is enabled, since an
event can arrive as soon as it is.

Firmware predating range reporting sends ALARM_DEPRECATED for every
threshold event and omits the range from the read response entirely.
Neither is cached, as neither says which limit was crossed.

Subsequent patches in this series will consume the cached range.

Signed-off-by: Zinc Lim <limzhineng2@gmail.com>
---
 drivers/net/ethernet/meta/fbnic/fbnic.h    |  2 +
 drivers/net/ethernet/meta/fbnic/fbnic_fw.c | 84 ++++++++++++++++++++++
 drivers/net/ethernet/meta/fbnic/fbnic_fw.h | 23 ++++++
 3 files changed, 109 insertions(+)

diff --git a/drivers/net/ethernet/meta/fbnic/fbnic.h b/drivers/net/ethernet/meta/fbnic/fbnic.h
index 857a64b518f3..93bf7004b67d 100644
--- a/drivers/net/ethernet/meta/fbnic/fbnic.h
+++ b/drivers/net/ethernet/meta/fbnic/fbnic.h
@@ -26,6 +26,8 @@ struct fbnic_hwmon_cache {
 	unsigned long last_read;
 	s32 temp_mdeg;
 	s32 volt_mv;
+	u8 temp_alarm;
+	u8 volt_alarm;
 };
 
 struct fbnic_dev {
diff --git a/drivers/net/ethernet/meta/fbnic/fbnic_fw.c b/drivers/net/ethernet/meta/fbnic/fbnic_fw.c
index d9a00a2ef34d..7863f6ba1e7d 100644
--- a/drivers/net/ethernet/meta/fbnic/fbnic_fw.c
+++ b/drivers/net/ethernet/meta/fbnic/fbnic_fw.c
@@ -121,6 +121,8 @@ void fbnic_mbx_init(struct fbnic_dev *fbd)
 	 */
 	fbd->hwmon_cache.temp_mdeg = FBNIC_SENSOR_NO_DATA;
 	fbd->hwmon_cache.volt_mv = FBNIC_SENSOR_NO_DATA;
+	fbd->hwmon_cache.temp_alarm = FBNIC_FW_TSENE_ALARM_UNKNOWN;
+	fbd->hwmon_cache.volt_alarm = FBNIC_FW_TSENE_ALARM_UNKNOWN;
 
 	/* Reinitialize mailbox memory */
 	for (i = 0; i < FBNIC_IPC_MBX_INDICES; i++)
@@ -1466,6 +1468,8 @@ static const struct fbnic_tlv_index fbnic_tsene_read_resp_index[] = {
 	FBNIC_TLV_ATTR_S32(FBNIC_FW_TSENE_THERM),
 	FBNIC_TLV_ATTR_S32(FBNIC_FW_TSENE_VOLT),
 	FBNIC_TLV_ATTR_S32(FBNIC_FW_TSENE_ERROR),
+	FBNIC_TLV_ATTR_U32(FBNIC_FW_TSENE_THERM_ALARM_STATE),
+	FBNIC_TLV_ATTR_U32(FBNIC_FW_TSENE_VOLT_ALARM_STATE),
 	FBNIC_TLV_ATTR_LAST
 };
 
@@ -1476,6 +1480,7 @@ static int fbnic_fw_parse_tsene_read_resp(void *opaque,
 	struct fbnic_dev *fbd = opaque;
 	s32 err_resp;
 	int err = 0;
+	u32 alarm;
 
 	/* Verify we have a completion pointer to provide with data */
 	cmpl_data = fbnic_fw_get_cmpl_by_type(fbd,
@@ -1497,6 +1502,20 @@ static int fbnic_fw_parse_tsene_read_resp(void *opaque,
 	cmpl_data->u.tsene.millivolts =
 		fta_get_sint(results, FBNIC_FW_TSENE_VOLT);
 
+	/* Cache here so that it and the threshold event land in the order firmware
+	 * sent them. Firmware predating alarm state reporting sends neither
+	 * attribute.
+	 */
+	alarm = fbnic_tlv_attr_get_unsigned(results[FBNIC_FW_TSENE_THERM_ALARM_STATE],
+					    FBNIC_FW_TSENE_ALARM_UNKNOWN);
+	if (alarm != FBNIC_FW_TSENE_ALARM_UNKNOWN)
+		WRITE_ONCE(fbd->hwmon_cache.temp_alarm, alarm);
+
+	alarm = fbnic_tlv_attr_get_unsigned(results[FBNIC_FW_TSENE_VOLT_ALARM_STATE],
+					    FBNIC_FW_TSENE_ALARM_UNKNOWN);
+	if (alarm != FBNIC_FW_TSENE_ALARM_UNKNOWN)
+		WRITE_ONCE(fbd->hwmon_cache.volt_alarm, alarm);
+
 msg_err:
 	cmpl_data->result = err_resp ? : err;
 	complete(&cmpl_data->done);
@@ -1689,6 +1708,68 @@ fbnic_fw_parser_test(void *opaque, struct fbnic_tlv_msg **results)
 	return err;
 }
 
+static const struct fbnic_tlv_index fbnic_threshold_exceeded_resp_index[] = {
+	FBNIC_TLV_ATTR_U32(FBNIC_FW_TSENE_THERM_ALARM),
+	FBNIC_TLV_ATTR_U32(FBNIC_FW_TSENE_VOLT_ALARM),
+	FBNIC_TLV_ATTR_S32(FBNIC_FW_TSENE_THERMAL),
+	FBNIC_TLV_ATTR_S32(FBNIC_FW_TSENE_VOLTAGE),
+	FBNIC_TLV_ATTR_LAST
+};
+
+static int fbnic_fw_parse_threshold_exceeded_resp(void *opaque,
+						  struct fbnic_tlv_msg
+						  **results)
+{
+	struct fbnic_dev *fbd = opaque;
+	bool rec_flag = false;
+	u32 alarm;
+	s32 value;
+
+	if (results[FBNIC_FW_TSENE_THERM_ALARM]) {
+		bool have_temp = !!results[FBNIC_FW_TSENE_THERMAL];
+
+		alarm = fta_get_uint(results, FBNIC_FW_TSENE_THERM_ALARM);
+		value = fta_get_sint(results, FBNIC_FW_TSENE_THERMAL);
+		if (!have_temp)
+			dev_err(fbd->dev, "Thermal alarm %u received with no temperature!\n",
+				alarm);
+		else if (alarm != FBNIC_FW_TSENE_ALARM_NORMAL)
+			dev_err(fbd->dev, "Thermal alarm %u, temperature is currently %dmC!\n",
+				alarm, value);
+
+		/* Old firmware reports no range, leave the cache alone */
+		if (alarm != FBNIC_FW_TSENE_ALARM_DEPRECATED)
+			WRITE_ONCE(fbd->hwmon_cache.temp_alarm, alarm);
+		rec_flag = true;
+	}
+
+	if (results[FBNIC_FW_TSENE_VOLT_ALARM]) {
+		bool have_volt = !!results[FBNIC_FW_TSENE_VOLTAGE];
+
+		alarm = fta_get_uint(results, FBNIC_FW_TSENE_VOLT_ALARM);
+		value = fta_get_sint(results, FBNIC_FW_TSENE_VOLTAGE);
+		if (!have_volt)
+			dev_err(fbd->dev, "Voltage alarm %u received with no voltage!\n",
+				alarm);
+		else if (alarm != FBNIC_FW_TSENE_ALARM_NORMAL)
+			dev_err(fbd->dev, "Voltage alarm %u, voltage is currently %dmV!\n",
+				alarm, value);
+
+		/* Old firmware reports no range, leave the cache alone */
+		if (alarm != FBNIC_FW_TSENE_ALARM_DEPRECATED)
+			WRITE_ONCE(fbd->hwmon_cache.volt_alarm, alarm);
+		rec_flag = true;
+	}
+
+	if (!rec_flag) {
+		dev_warn(fbd->dev,
+			 "Threshold exceeded message received but no alarm found!\n");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 static const struct fbnic_tlv_parser fbnic_fw_tlv_parser[] = {
 	FBNIC_TLV_PARSER(TEST, fbnic_tlv_test_index, fbnic_fw_parser_test),
 	FBNIC_TLV_PARSER(FW_CAP_RESP, fbnic_fw_cap_resp_index,
@@ -1717,6 +1798,9 @@ static const struct fbnic_tlv_parser fbnic_fw_tlv_parser[] = {
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
index dde2929f8660..3b4787277408 100644
--- a/drivers/net/ethernet/meta/fbnic/fbnic_fw.h
+++ b/drivers/net/ethernet/meta/fbnic/fbnic_fw.h
@@ -239,6 +239,7 @@ enum {
 	FBNIC_TLV_MSG_ID_QSFP_READ_RESP			= 0x39,
 	FBNIC_TLV_MSG_ID_TSENE_READ_REQ			= 0x3C,
 	FBNIC_TLV_MSG_ID_TSENE_READ_RESP		= 0x3D,
+	FBNIC_TLV_MSG_ID_SENSOR_THRESHOLD_EXCEEDED_RESP = 0x40,
 	FBNIC_TLV_MSG_ID_LOG_SEND_LOGS_REQ		= 0x43,
 	FBNIC_TLV_MSG_ID_LOG_MSG_REQ			= 0x44,
 	FBNIC_TLV_MSG_ID_LOG_MSG_RESP			= 0x45,
@@ -305,9 +306,31 @@ enum {
 	FBNIC_FW_TSENE_THERM			= 0x0,
 	FBNIC_FW_TSENE_VOLT			= 0x1,
 	FBNIC_FW_TSENE_ERROR			= 0x2,
+	FBNIC_FW_TSENE_THERM_ALARM_STATE	= 0x3,
+	FBNIC_FW_TSENE_VOLT_ALARM_STATE		= 0x4,
 	FBNIC_FW_TSENE_MSG_MAX
 };
 
+enum {
+	FBNIC_FW_TSENE_THERM_ALARM		= 0x0,
+	FBNIC_FW_TSENE_VOLT_ALARM		= 0x1,
+	FBNIC_FW_TSENE_THERMAL			= 0x2,
+	FBNIC_FW_TSENE_VOLTAGE			= 0x3,
+	FBNIC_FW_TSENE_EXCEEDED_MSG_MAX,
+};
+
+enum {
+	FBNIC_FW_TSENE_ALARM_NORMAL		= 0x0,
+	FBNIC_FW_TSENE_ALARM_DEPRECATED		= 0x1,
+	FBNIC_FW_TSENE_ALARM_BELOW_MIN		= 0x2,
+	FBNIC_FW_TSENE_ALARM_ABOVE_MAX		= 0x3,
+	FBNIC_FW_TSENE_ALARM_CRIT		= 0x4,
+	/* Driver internal, never sent by firmware. 0xff so its out of
+	 * range wherever the range is held in a u8.
+	 */
+	FBNIC_FW_TSENE_ALARM_UNKNOWN		= 0xff,
+};
+
 enum {
 	FBNIC_FW_OWNERSHIP_FLAG			= 0x0,
 	FBNIC_FW_OWNERSHIP_TIME			= 0x1,
-- 
2.53.0-Meta


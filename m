Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 630F739D6FA
	for <linux-hwmon@vger.kernel.org>; Mon, 31 Aug 2026 21:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788211371; cv=none; b=gQz8e2PtEf4vty5FLZcwcUwfDey1GiadbdeUmBhW6VlcTayNG17YSIOqdK1xqiUcPpaoHvbTiYmLKJug1gM8dan8xbhTeONCy344t7cxaVC6Qz6E3WpxquHXYx9yml4/91ou1n9vU6jQeACxcr5yUaX4C8ZFSGPqq4a9bcRh0Zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788211371; c=relaxed/simple;
	bh=QK8aNSzL7ND4hoq7Mvy7TvP92pxHrFlqyV4BOQPaCNA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oQUjADRghXxxlmzpwO8L0Upsh8j3Z/bAq5w3RRdV8/e8yy5gF7WgnYWMYaPH1I/BJs6+HW97iOiuYMqnEGqF/6TyPuO2j7poM94taC9lyhTM/7iGivYCRH/wbibmdSSYy8kdBVORv1yyEWlOQNuIUTBeNbKzUCkvgPUMuhT+jek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XO0GHDn7; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XO0GHDn7"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3964e480f76so200560a91.1
        for <linux-hwmon@vger.kernel.org>; Mon, 31 Aug 2026 14:22:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788211368; x=1788816168; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uEYLADmFkDVF9LXmlc95J2Vic5BUF75td03Fx2o+E0U=;
        b=XO0GHDn7GpzT5k+cdUnSrhHqYKwLHiNcEqjlQDZawpG0UHdJN1hXwK+WnSQqBq6uSn
         h/5HwOwKQmXQ1AJ+8ZIFFJ4dTeFrDo9nWn6p1Wb21nvKi2yVDV0ir8/YA4iiebpb2uz2
         BlbUzIxADY/qBd/CqvwaKtpyDqO3U77kPDh5N2acL5SPiG3Kg9zI55251DuuyIb7BRvE
         8WNr7znVi8FxO9BzVlmBnmd4zgfzB6VwCeqg5baRUybeWuvSn2TEQOslMTVNWf2Lpo1Y
         pL8RL2/hRHzanvMdNqypzpLIrsKgzI6z923F0/ycWocH0gSGvAlaa3M8zUSLlg7VwdtA
         EFnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788211368; x=1788816168;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uEYLADmFkDVF9LXmlc95J2Vic5BUF75td03Fx2o+E0U=;
        b=K/lZvb/A4bbYX5PCQSrif0mBmbAhUwc1oeFr/CO75gWsI5d5/S/tYQTWngvnXizF+u
         pH6bJjz3RXS5Ss8gLK8hh1spcfgck8FiMMaa3hzIhu7Q/nlzcm8tzoOcfH7CpHIipeSK
         B7330pEuvreXsuM/vaVVepR9g0CO0alIX9mmhjQt8zonyfbDkbHj6wNCYIKLEiSekFjR
         q/jptKAayqayJfeN2lV6qmUhxZm1r+XUDm8PbSybp3Pzh/EHjMdg3SC0lHaur46uGQnR
         L6DWTbrIiqk9+7IiW3hA2K/nrEE/M+pC/0aenHidamv5CULxICTYR8FUeQ/L/DqwBasj
         1Z6g==
X-Forwarded-Encrypted: i=1; AKwUvBx4qjwF2ICnK9tnF1DFkdg4Baeb7SBebuNTevwsdPtRkRwMzQv43qOFigwomAqHyigeHcCkTIKEn1WPrQ==@vger.kernel.org
X-Gm-Message-State: AFuF++n1jrIctQJmJTxIxd3j7a/wJuUoGslIiaI3Y/AALomms5qTbwvh
	JZhY090rcTceTOQXIIKTX/XaxWJn0LH79bIpf6Xid68Pv+XMMijOHzmZ
X-Gm-Gg: AYBFou1byOG9baYqensPGMSvcu8/ivQe0jrd/ad9kcDGapTgqtoWVm9jOjJmE8aMPG0
	JHNJv1t04oeZQlZN5lGk4Imi+sUb0/SVK3SRjsguFwzLDOm4CCnxEsBmfIHPMz3gTuzvShU51Z1
	7FB8kIZBSOvc9leEQteii7OEq4PRW7Phd8zKgQvGRyc4d7nUKUwo4ZrD14J4GQo6mrreqRNi4/8
	X0oMjlePsd/upz1JIIqdIGykfXWe2cshsdS5BtUW4nASDipTJ+X3fey5jkslgvAy4dPlJGCaPTi
	LJ/cWVQrwfUPnQHLETQrutgg8c+rqupMOtYi8v4pcphrNDvJkqCIFHdC0DA24MdsjZSn7xAPKbk
	Pa9ecUZfwpriu6ZtGx1iwWZ7JGMZFGP4TkLQQa3PiJLC9YJ/PpK2rmIlTuaETYKs9gBJTikqKZ4
	e5hqdck3SeYo2eEQiEbuD5NhnmUpoxVZBaQ6MONHh3CgBZLPTB+q3fVqJ5IOtxOpQPkw0=
X-Received: by 2002:a17:90a:e7cb:b0:398:bbe9:73af with SMTP id 98e67ed59e1d1-398bbe97548mr18505107a91.7.1788211368378;
        Mon, 31 Aug 2026 14:22:48 -0700 (PDT)
Received: from localhost ([2620:10d:c090:500::6:bac7])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e0d2e465sm47179945c88.4.2026.08.31.14.22.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 14:22:48 -0700 (PDT)
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
Subject: [PATCH net-next v2 5/6] eth: fbnic: report temperature and voltage alarms via hwmon
Date: Mon, 31 Aug 2026 14:22:33 -0700
Message-ID: <20260831212234.1212971-6-limzhineng2@gmail.com>
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

Building on the temperature and voltage thresholds stored in
fbnic_fw_cap, expose alarm attributes through the hwmon interface:
temp1_{min,max,crit}_alarm and in0_{min,max}_alarm.

Each alarm is computed by taking a live sensor reading and comparing it
against the corresponding stored threshold. The static thresholds
(min/max/crit) are returned first straight from fbnic_fw_cap without a
firmware round-trip, and unsupported attributes are rejected up front, so
only attributes that actually need a live value fall through to a single
sensor read that then feeds input and every alarm.

A threshold the firmware did not populate reports -ENODATA for both the
threshold attribute and its alarm.

Signed-off-by: Zinc Lim <limzhineng2@gmail.com>
---
 drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c | 68 +++++++++++++++++--
 1 file changed, 61 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c b/drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c
index 4938f7b39140..c5cddd9cef12 100644
--- a/drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c
+++ b/drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c
@@ -87,34 +87,84 @@ static int fbnic_hwmon_read_threshold(long thr, long *val)
 	return 0;
 }
 
+static int fbnic_hwmon_read_alarm(long a, long b, long *val)
+{
+	if (a == FBNIC_SENSOR_NO_DATA || b == FBNIC_SENSOR_NO_DATA)
+		return -ENODATA;
+
+	*val = a >= b;
+	return 0;
+}
+
 static int fbnic_hwmon_temp_read(struct fbnic_dev *fbd, u32 attr, long *val)
 {
+	int err;
+
 	switch (attr) {
-	case hwmon_temp_input:
-		return fbnic_hwmon_sensor_read(fbd, FBNIC_SENSOR_TEMP, val);
 	case hwmon_temp_min:
 		return fbnic_hwmon_read_threshold(fbd->fw_cap.temp.min, val);
 	case hwmon_temp_max:
 		return fbnic_hwmon_read_threshold(fbd->fw_cap.temp.max, val);
 	case hwmon_temp_crit:
 		return fbnic_hwmon_read_threshold(fbd->fw_cap.temp.crit, val);
+	case hwmon_temp_input:
+	case hwmon_temp_min_alarm:
+	case hwmon_temp_max_alarm:
+	case hwmon_temp_crit_alarm:
+		break;
 	default:
 		return -EOPNOTSUPP;
 	}
+
+	err = fbnic_hwmon_sensor_read(fbd, FBNIC_SENSOR_TEMP, val);
+	if (err)
+		return err;
+
+	switch (attr) {
+	case hwmon_temp_input:
+		return 0;
+	case hwmon_temp_min_alarm:
+		return fbnic_hwmon_read_alarm(fbd->fw_cap.temp.min, *val, val);
+	case hwmon_temp_max_alarm:
+		return fbnic_hwmon_read_alarm(*val, fbd->fw_cap.temp.max, val);
+	case hwmon_temp_crit_alarm:
+		return fbnic_hwmon_read_alarm(*val, fbd->fw_cap.temp.crit, val);
+	}
+
+	return -EOPNOTSUPP;
 }
 
 static int fbnic_hwmon_in_read(struct fbnic_dev *fbd, u32 attr, long *val)
 {
+	int err;
+
 	switch (attr) {
-	case hwmon_in_input:
-		return fbnic_hwmon_sensor_read(fbd, FBNIC_SENSOR_VOLTAGE, val);
 	case hwmon_in_min:
 		return fbnic_hwmon_read_threshold(fbd->fw_cap.volt.min, val);
 	case hwmon_in_max:
 		return fbnic_hwmon_read_threshold(fbd->fw_cap.volt.max, val);
+	case hwmon_in_input:
+	case hwmon_in_min_alarm:
+	case hwmon_in_max_alarm:
+		break;
 	default:
 		return -EOPNOTSUPP;
 	}
+
+	err = fbnic_hwmon_sensor_read(fbd, FBNIC_SENSOR_VOLTAGE, val);
+	if (err)
+		return err;
+
+	switch (attr) {
+	case hwmon_in_input:
+		return 0;
+	case hwmon_in_min_alarm:
+		return fbnic_hwmon_read_alarm(fbd->fw_cap.volt.min, *val, val);
+	case hwmon_in_max_alarm:
+		return fbnic_hwmon_read_alarm(*val, fbd->fw_cap.volt.max, val);
+	}
+
+	return -EOPNOTSUPP;
 }
 
 static int fbnic_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
@@ -139,10 +189,14 @@ static const struct hwmon_ops fbnic_hwmon_ops = {
 
 static const struct hwmon_channel_info *fbnic_hwmon_info[] = {
 	HWMON_CHANNEL_INFO(temp,
-			   HWMON_T_INPUT | HWMON_T_MIN | HWMON_T_MAX |
-			   HWMON_T_CRIT),
+			   HWMON_T_INPUT |
+			   HWMON_T_MIN | HWMON_T_MIN_ALARM |
+			   HWMON_T_MAX | HWMON_T_MAX_ALARM |
+			   HWMON_T_CRIT | HWMON_T_CRIT_ALARM),
 	HWMON_CHANNEL_INFO(in,
-			   HWMON_I_INPUT | HWMON_I_MIN | HWMON_I_MAX),
+			   HWMON_I_INPUT |
+			   HWMON_I_MIN | HWMON_I_MIN_ALARM |
+			   HWMON_I_MAX | HWMON_I_MAX_ALARM),
 	NULL
 };
 
-- 
2.53.0-Meta


Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBD5446D57A
	for <linux-hwmon@vger.kernel.org>; Tue, 21 Jul 2026 22:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784672155; cv=none; b=WPlXQywsVc8WDoE7r5gCySvhnnCqdMOA1DY3kaiJIgL0y//3v1YibHKpwbO86UI1jr0KhChKMaqVZh7lVsAi1UZOQQ4vgjBTAmdkJKdzZp7e97ZI3egpfH1j5zr8TMbD7ZIm1BT1EyNlI7Ynme59oLWgXzsXHNeTrVW4yP1xF0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784672155; c=relaxed/simple;
	bh=QK8aNSzL7ND4hoq7Mvy7TvP92pxHrFlqyV4BOQPaCNA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mD8uVIyiFcurNIng9myx8jUXZmlkEFfubNn7ojgEgi5D3Y+PWsc4W7icvfC23efAFHYNsmIERrCFIHK3rClw+NAKd4lCCsGyhr45phUWF7Dc76KHFbY80eR1e+6+9vXQ1V8b+Dsi2DMCINOMia15l0ok7R1wwTufqUpvOyjxMIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=frznfk/r; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="frznfk/r"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2cc73e322dbso141788385ad.1
        for <linux-hwmon@vger.kernel.org>; Tue, 21 Jul 2026 15:15:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784672153; x=1785276953; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uEYLADmFkDVF9LXmlc95J2Vic5BUF75td03Fx2o+E0U=;
        b=frznfk/rezMDGNw7EBKCLS4OUqj5L49ZmRDkxylL63IioUDNZJwKZ1MO/Bc+iYCZK+
         edM3vtY38GtRP7KKx1yTz4IVi4CPj/CB27vVb7+RdFe3AKGtPSYR7LLDg3OoEiEj0Dvd
         hvE3veo9x8DY0PtPDIqu4aXK6xmvYjiaU6l5pGeAyn3L+PylPqXLoeDzqMgM2ZRBjO/R
         8R93YxJodRXdlDvl5qNDYng2f7NOe8w+ZqD/8rgSMlcFFUFsEFn6Nx77IpRiYQ4/FFXO
         6uTsN4vSPERVRWdGL6CUxb7MrjfiN2bW+4pLrw8UN75UDx72x2FG+5i76OK3wAh1ys4F
         /1Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784672153; x=1785276953;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uEYLADmFkDVF9LXmlc95J2Vic5BUF75td03Fx2o+E0U=;
        b=FxNPySdH4hdY8AP0PiJRIY5xbrKdHEDEEoYMxOqTqAQh5ttPGWmcPtqRk3BrGp920X
         PdVV44uSj9FMncWsaoIiVkAjERCSvJ5heBy58AGNEgCepzZsuP/qTYav85UxCNWLIvPo
         YKod70H4/09odhsemJ2Ods8ntrwSS5Ycu5RM/LCc0cJu0DPiNb7rJk+awXCTDd2pqMql
         8eFLpgDo0mskRFR/Q8hgPqDGaetikOPLEUkTzYhukX1dpnaMNFjavIdwz+Ntot994AyQ
         wl47s0cUeQuYHNylHNON5GA3fTd0eL2YXpNLgmGCD3rUFqIG8UrDFLHUO4SImRbqzY9I
         o1bw==
X-Forwarded-Encrypted: i=1; AHgh+Rr/6eDZZGNN6EPjsVP39czAsc3dRmPMaTURXGgn8rpQ1OU9tyav2XhgBiB/++5XTc4pw8c6mqVZ1SMY+A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyLEfQ0rm6Zd9Tg3S4bsELkxhx7AoEhkafvS2N/TCpVaoTGk/oZ
	d5ze+4BDfacpF1uBoBMR9UrRkrHLf7Ty80CpisVg7nvVnSlB70lH1vzJ
X-Gm-Gg: AR+sD11BurCS+U0bFDL0JVzMgVt2xD6r/j/hQgT26LITYq+3+A7zumCr+d4pKHet0E6
	PPSibUmS0Ze9mc44vb+SAqDY4CIOIjAtRLEj5SDDXeFEza/0zpCe63Yd6WWElwAjDe2SZu/3Utv
	YTWlGvAwJkq4x73WkCq6zy4Vnml+B26srtGH7HvGQKDKzR0z90XgXEYmb33FTuQ36JtGHgnnplH
	6d65Yky8mbae6q0YWLR7DPfjTzXxpXmxi3DWv3nrF4kqoSAEiH9OPKjLfrYvmNwO2NPnrfoCv1x
	PwDOe/gSN1SuSC1nVHUUpaFqjmsCh6kKcibFe0rWbeDyaVjjpLYyNqlAmUlR8dc0iQow53fxLRT
	qYKbEr88QfqreQeYSzVj6vnqFOlHR7RaWBIhmPILBwxJDQawlvVCvEdU85sO1v2hyU1RhwLK856
	8zniRpNwD5KiqLGife
X-Received: by 2002:a05:6a21:1404:b0:3b4:e4f6:4f15 with SMTP id adf61e73a8af0-3c3ad676326mr21536990637.5.1784672152988;
        Tue, 21 Jul 2026 15:15:52 -0700 (PDT)
Received: from localhost ([2620:10d:c090:500::9edb])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147dc1a689sm2388931eec.4.2026.07.21.15.15.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 15:15:52 -0700 (PDT)
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
Subject: [PATCH net-next 5/6] eth: fbnic: report temperature and voltage alarms via hwmon
Date: Tue, 21 Jul 2026 15:15:39 -0700
Message-ID: <20260721221540.648272-6-limzhineng2@gmail.com>
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


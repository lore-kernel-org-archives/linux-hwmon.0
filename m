Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39A9E37EFE3
	for <linux-hwmon@vger.kernel.org>; Mon, 24 Aug 2026 17:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787593877; cv=none; b=uYhpIGh0cd2vjh3G/eiSPnfUhvmheIhua8rxIB/xPlJ7NVQuniTjKLzNb0tul0Np/yMwUN36Hqnb3hbBhJaaCCprBmNxwSxyNb54PTDFxDEw0Kr7qWrnnLiBlUs2uWqR2eg2OnYtvmcqH6aiY+BqAWUawAhvxZaEFQu252yIw08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787593877; c=relaxed/simple;
	bh=QK8aNSzL7ND4hoq7Mvy7TvP92pxHrFlqyV4BOQPaCNA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fEHq3briiYf2FAmD2k2lbEddmM32bO3Urrg9dzhW+KmcIA5UfaP1P5xx9ifC7YHpaWmK8/NgpDyLx5cUjnxjdiEOWfmD70aXScyQhBBKhC8H79IeZsWfJRd6BEZaODAyxAGHUQkCpstLDrnIwa4yh8Dgr8y5nrY1uwn7pyf3Cbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AzsZ6A3F; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AzsZ6A3F"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2cfbbdfa60bso30945085ad.3
        for <linux-hwmon@vger.kernel.org>; Mon, 24 Aug 2026 10:51:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787593872; x=1788198672; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uEYLADmFkDVF9LXmlc95J2Vic5BUF75td03Fx2o+E0U=;
        b=AzsZ6A3F0/ybYAE6nTxi77LwT5HH0epSZBs6TmmkRBw6Y66eFaS5uWfJ9r/6AqpSs2
         Fkf6MJsNN+P1FeOeg/6oCn0aAsBzmOKVlApye4M9F3+qbf+ixkZpBBetzZaYwTSQyLSZ
         PqmD1fK0FGehDrCKZ1K9qYTxZ+R+Y05Xox5C4D8mSdcOcIY6LaRx2ivUkOqP6kOpBLvC
         MntIxeD0M1aSyxCzLzVt1h4fF9RDkzi268djjdoQjIDhHbvWdCoZHQrA5UoIVzD3aaXa
         dAJeQEywY9tXuhmjNy+my4RgRwZYQzGfTExbnM/NlwWXA3PPjXem5wq4KHoNISyxdHSe
         /NWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787593872; x=1788198672;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uEYLADmFkDVF9LXmlc95J2Vic5BUF75td03Fx2o+E0U=;
        b=DQDa2/1IUdTLBhwoGo4/4Oxng3nJte7gQl/hVGu1L9q7qkug/bWdUJM17VZgF5eed4
         RjjCAct1FCO4NSIrTTcN4rvGA5sZv9hp1a4uL/XWPMpB+0AxAEwtpfXnOsRrvDfbA289
         gMn7IlwK5u9GegRMVtvD+Fnv7dbo4l7W0+WivpI07ccS6S/IZigsry87XPL60d4vYFoD
         QWhCeTO+X64WGhJDqPpPFzYH1v2PNGVIaEJek9L6p1ICT0r2gJqfJ5ANw35rbAAIUKEE
         qBveCRdXDVa5daDDNexys0mykv+5rFVQnpO6gP3Y2GwVLcoDhgyMAzfS1iwsrnv16LUG
         g4/w==
X-Forwarded-Encrypted: i=1; AHgh+RokPOORqhUsscG7wN8L7BnoZ1sdP5xe5FdAEuONZsvp1f3Yzu4MbLrAu7OHrzDMhD+z1LGAaUL0WsGQLw==@vger.kernel.org
X-Gm-Message-State: AFuF++lIDmys68ZhjCZWyg1WZq5F95L/LYrpxHTHu1yfCrrycikt5dLL
	BENWsIiSDvIV0PMWKlVxSqTJeSxLl8Eq4UdAs/uwRK/qofZRxgrGOmzw
X-Gm-Gg: AR+sD13lOBdQXwZySiEl4ml+ikgSDybAQtxL6T4suYEmBNK6N5dyRck3pQzlm3TR6H5
	mf48gW5EdTCGVqxzqQAWDBKW3wz3vhuJHry77R21nZV2Qy8kMD04u/fsX+xc2APazlfXVbuBauH
	LCRlC59G+5MB6l7Urv0iAxNeFo2X4VWvfPy7UrBYMQmrl2fbLTuKO6G2qH0+etrw3WqwFaSFuob
	q6b0eRkTv8cedb2tfDz8vlJfyU2vgvYpgOGp68AC+/VLG+u1FGioFxrK6wPsrVa0X3LLigBG8nj
	6HM2sGAZZOrquBn+olmxAoEzNJFnjE9wQWll9o45KWZHQNY4aSSuhw8SmMD8+Rmwy1YpAIS/bMU
	MIRXCWN/Y+H54VRSuWq0azR+Qe2b8tDbjOqiGMlXLlRfPAdk14mVp/RGv8zK2p039zI6oISX3Eh
	O55wkUmM4m+GqwPeRyumNE2S1apVFSKgwmaXhUGnV4XeRjQ+2x/pf2s2SoCleNxlctV6s=
X-Received: by 2002:a17:902:e74b:b0:2ca:2079:91cc with SMTP id d9443c01a7336-2d6dcaad3fdmr14430375ad.5.1787593872430;
        Mon, 24 Aug 2026 10:51:12 -0700 (PDT)
Received: from localhost ([2620:10d:c090:500::4:ddd2])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327f90cb8e3sm42038477eec.12.2026.08.24.10.51.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 10:51:12 -0700 (PDT)
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
Subject: [PATCH net-next v2 5/6] eth: fbnic: report temperature and voltage alarms via hwmon
Date: Mon, 24 Aug 2026 10:50:58 -0700
Message-ID: <20260824175059.2485048-6-limzhineng2@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260824175059.2485048-1-limzhineng2@gmail.com>
References: <20260824175059.2485048-1-limzhineng2@gmail.com>
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


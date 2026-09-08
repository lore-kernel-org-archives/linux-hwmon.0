Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA90F5A985C
	for <linux-hwmon@vger.kernel.org>; Tue,  8 Sep 2026 22:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788908272; cv=none; b=GM8PP48G61RWJc6VZZbwSr92s7ejzDYsYe26fjUBVHBeSjGwN7Q+PkKAok2MAc+RoMqpptBOD2onx+RV8r5tU/QH2aX7h48NJD2EU5TydQP8Q04Y8ZdBNrD7Dny8GbF5foH/YXR3KBiP2javEkaWEOQ4I2/UXHXj/uQMDESZeyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788908272; c=relaxed/simple;
	bh=1Apm140TmjwBykNP41BteAIeCrQSM7GPOdDxj4xmsQ0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EADhX4lA7YDAnNUfLUjYFNN/rnjYCsu8B9GWaYsiXB90RGhxHNN3uV/aM5V8GUqtPW5v+xKyOuY1Oh75QCFSIH7rqe2zmWkpuTXmIaNer2inxohAhJ5gJo73IInGzuZH6lk79xQjR7s/Rk5XuC+i700SgRkPiQxY6aBE9ElbDxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j/xitQhj; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j/xitQhj"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2d6e954afbdso34105835ad.2
        for <linux-hwmon@vger.kernel.org>; Tue, 08 Sep 2026 15:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788908267; x=1789513067; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oHf4Kdg2iAelN0tBevBJGIWkTeGE4acBiDza9UpBpm8=;
        b=j/xitQhj4SVNUNz7zWVeTpmy277/EjWq1HWLVCPAOuqcBDYBNXAe0aRnSj18rUwAke
         Ii8F0N5Z5PWiw9XqvLsvGyvSHchB8Dp7XlqTTsbbqwPBG34DVgd+wa8SmvRGHbrnbJJT
         9iR4XZCenlQwniSHJG/26Kk2jJXRbk54YdNBXQjT2CzOzQ0+KP1UPSpC9EU1ma+Acm8v
         fOtKVJUz13rHKgV3D5T+FYYnvWA/HvKQwqm7Em9AnWQEZzF23D9iQqV0LanDTE2EAfQV
         uVCffVU5PnbedGiqLybe0qhWGA5uA2Ej/4xyj4O7I2h6itzwxgmGwkjDu2PFWYXlVcPq
         8YUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788908267; x=1789513067;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oHf4Kdg2iAelN0tBevBJGIWkTeGE4acBiDza9UpBpm8=;
        b=jGTwTy+VMTrxVh7PPBaTasZDV1DMsiY5QMcw8ZcBKi+K/qIrQ2HdUpU0/FIPmlivu4
         Tb4nSeTAyTL3X+l3Y2+CZSPSJGFC2Vmk7f3qqIosdtvkbzrxHn+KT7hcyA29lvvg20Bs
         6BigvqHm9s/TVuJB6fb8j/WnVkNVc+cUaqOUJSNG5gvB+mgISkzGZvrhNqk3D4JMqAs4
         U2v2+khiiIv5PVtrZ8VOlA++1rSzfIxUOfrmO553pSGlq1PnbMt7wsAvMKOlb1t2skD4
         pRLtPZO4Dc13LAfUSDRORAGMpHEivkoOUywui9q+96ZhY55oZhxQalmIRIqzhTqkhcOH
         vzFQ==
X-Forwarded-Encrypted: i=1; AKwUvBwT2XUs1SaAwNed+jF2yIE1Vj6bbAlYjPO74It6kVU5SJDicjVeB2yJOeubNJpdgw3JdgghivUubQofpg==@vger.kernel.org
X-Gm-Message-State: AFuF++nSmO6AV9NGN2cFMFw5+DTwQyZPDQ5j7HaMviT6Ql85w4Qun5rn
	3e8g3HvEjxTDjzhbzq0TK4AzBBFsLbkc7IqF9DeJMVYlKj2cMzinlMHc
X-Gm-Gg: AYBFou1nqotDFAvQHHxkfrB0B7mcYPBjpVgKlqzSQ8BvpML8amQu/tRXMcFhxmnJuLb
	b2oWWyXuXUZDjhVwp7pwgMiWxwGTsHLnarV/+OM95Ilbv6a8os76pUxHxgaov5qf8UOxjUi47i7
	r1GK6gqXJodfuQFtXWzMEGlxBzrnuhf+9eTZ/faXbjyK9dG2Z59qLKdpxaRQTI9kaiZjmgeRcwZ
	q2L/DyC8sYoNX5KLPuYej9ucceOQ7EJfxCqGBjK5ZKGPA8gVGvgZ/pXBUNORcMqnEHB+dXXZdGP
	iycSYJJO5fo/3TMu0bTWuJsCdI6tyRzHkojM2i32nKWwj9IOwnmZ2LQqdmsAGwzR58/u61Hd9fi
	Ay6tWnc2CnYjEYA3uaPqSSiNRMpNUBYs+WHx1eZGea0JxPuIErBmLlA47xaz3VerabWuojlh7CH
	WkjpdDNTTOnAWy3qy2q5VhOdFrCM5uxjTOzjjoJWt4IEzB2wQW3JOIE7KDdqR3xAt+mBiT0d/T2
	AhCurMj
X-Received: by 2002:a17:90b:33c1:b0:398:9bd1:3214 with SMTP id 98e67ed59e1d1-39b262dfa81mr43767196a91.21.1788908267472;
        Tue, 08 Sep 2026 15:57:47 -0700 (PDT)
Received: from localhost ([2620:10d:c090:500::6:91c1])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-333959d5f69sm37289140eec.0.2026.09.08.15.57.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 15:57:47 -0700 (PDT)
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
Subject: [PATCH net-next v3 5/6] eth: fbnic: report temperature and voltage alarms via hwmon
Date: Tue,  8 Sep 2026 15:57:36 -0700
Message-ID: <20260908225737.3034403-6-limzhineng2@gmail.com>
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
index 7dc4d705f566..11fa8aab0f5b 100644
--- a/drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c
+++ b/drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c
@@ -86,34 +86,84 @@ static int fbnic_hwmon_read_threshold(long thr, long *val)
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
@@ -138,10 +188,14 @@ static const struct hwmon_ops fbnic_hwmon_ops = {
 
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


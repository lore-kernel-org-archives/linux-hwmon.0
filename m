Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0C7830EF83
	for <linux-hwmon@vger.kernel.org>; Tue,  3 Feb 2026 12:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770120971; cv=none; b=ES2Zugx+V3GA/uhr7acyDD7UOHmW/H8BU+LA3Nyo6gt9Od0BGR7cuMTUs0xknLAsOeRoRrApGRANLbydEy3LBss7fGP8B+SQ4QdxaMg0Thu2siunqZSHPYoGZLMNw0VadBCFgf7TB6LFq6cNa0oFpajTx1WWewB96egQgEEsbWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770120971; c=relaxed/simple;
	bh=oBNlv8tpYIAfycUufaW2kqcNJPt0+IY20m9BXQcCGbE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XKLWWn/on8DfwfAykx5rbi9Rao1h0c//pM4onEZbMMPPfZ6U1oLrKLDLI6ZElzVPm4VDHff80MRZZxS340Yi3/KXR1Uvc7zsNToTTXOM9ac+QXlLnKxCKODz4fvt0/wRhbC8X9qsG/R3Uk06VV436HImsOq39Uh5hRjvLJCqdyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QmXap9PL; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QmXap9PL"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-82318b640beso3116372b3a.0
        for <linux-hwmon@vger.kernel.org>; Tue, 03 Feb 2026 04:16:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770120969; x=1770725769; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ibRrXpgw1lU51ODUe8Kbvxi0SMmu3MLTIurVFgESCMQ=;
        b=QmXap9PLs4e9k2Ck8cvMq/l+QVIdgig/sfrpTF05+SKiJq0/kOCfLjp0yFnV5NO2jn
         2T0O0C3wrQVYKah+5qLf5JkbAdWWVWlUepvhxW2lIcN7N7NkVjC3BtFbMUrmaX7A+YBt
         T3GrlnVWscAtFnUS3nfkEPD43doQ4kxcEeP6kpBWp/n7TVG9SLL8JYRik8sujwRKYi++
         YQx/DinXD4AUOTq13LMYQVx4UIShP6uO5VS5TVFZwU3u/jfNZd0w0gmNETK6gPi4/Ulm
         4P8ooZLcyk3WuY0hdAdeJHodROOUSjP/6Ti2nCnWLEDH/eYz1qWm1VuRKtB5vbAqLsu/
         u8qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770120969; x=1770725769;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ibRrXpgw1lU51ODUe8Kbvxi0SMmu3MLTIurVFgESCMQ=;
        b=ZI/wb7mqHKL3jIZ6RUxBI7tjHzJsFL7eaaiZrUn7T0PtJU5SrG6ONRJhB5ZC3yHyON
         QKeb5J2EQw5txRum8hAFpKbzxEs/LSfBERow+9uAKfTpzwZlzVMKgE5elmgJi0i5v2Zb
         ycowQMQSX8Mrudcl3kY6YUEt9gWsFhZXqg3gC6FdQIrdv8P3Ev+2Y7LChu+kSAqTTRdc
         DbSO2o+HHxxHIEjx2J+3V93ISryFYOfg5IcDa7+CEziVu82xDzEBqUFw8Hm49wcySO57
         V5KaEvfmn6L6QO1MCAgyKAQML9iJPdDi0nMeMwYf0sJd6hG/RvQtSz4syiS4SCzeLDj4
         pn1A==
X-Gm-Message-State: AOJu0YyHF37HE5BCFXgEOMQiot1vGy4AyiaZx/KEHVAo9kHZWK1qmnai
	MTX/bXZPh4+ens8/izQiH+1BYx1EXJG/n8lmOfo0WEuEqN4BtlCwdNPV
X-Gm-Gg: AZuq6aIdPFRKUg85OCsQpe8k1tb7mcMXnrWTTHq3HE0OIuGJfus4Aegw04lCadpXx0G
	gxiMwY379EcoC9YUNb5hcVQLOLR66TURs0RyNqLo3sNaoCgCjSZVpNMrbmGCa88q3Rh2sTW4xFf
	OG7DKQ1Q5uxgw9Y/mCSHGdfuXpzf6fGyoiH8Qrhf1npQxn66qdwI0Spj4L9FbLqoPy5tYO/3ek2
	bnpX52dst/Qz8Xw7do5EXf8U9BszSlmMHQ1ITiKlqvG20ZohDID0bw61NLgt+yZz0FEKSd78mV4
	iSANBayIZMTJ178C9SPFiFrTpobli9jLo5mVq/4edaey5l0oG2eh46YNeAaOabkA6ZcGlTTuznu
	CjTm72ZORx/gUPr6+mF/0C6CYbahUO2T4QyvkXNkj79QnHHKKtOWi1ydQ8jAoyq/qaT7PuvvOk3
	eQL0EuA4ZRQ8C2nJaVZfrOhC+L2guCCe9PcfOzaTHe8ayvBZMAq3qOrLg4mElHpeItnR6fM8hKZ
	7GWP71khMJTHAzqIIoAZFPbiJxkruTVRInfp7pW0fbBulqreeABGwU4E32g1nS7FYbA
X-Received: by 2002:aa7:9064:0:b0:81f:50b1:51f2 with SMTP id d2e1a72fcca58-823aa71118cmr12594872b3a.41.1770120968901;
        Tue, 03 Feb 2026 04:16:08 -0800 (PST)
Received: from 2045D.localdomain (120.sub-75-226-39.myvzw.com. [75.226.39.120])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82379bfb924sm19339481b3a.34.2026.02.03.04.16.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 04:16:08 -0800 (PST)
From: Gui-Dong Han <hanguidong02@gmail.com>
To: linux@roeck-us.net
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com,
	Gui-Dong Han <hanguidong02@gmail.com>,
	Ben Hutchings <ben@decadent.org.uk>,
	stable@vger.kernel.org
Subject: [PATCH] hwmon: (max16065) Use READ/WRITE_ONCE to avoid compiler optimization induced race
Date: Tue,  3 Feb 2026 20:14:43 +0800
Message-ID: <20260203121443.5482-1-hanguidong02@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Simply copying shared data to a local variable cannot prevent data
races. The compiler is allowed to optimize away the local copy and
re-read the shared memory, causing a Time-of-Check Time-of-Use (TOCTOU)
issue if the data changes between the check and the usage.

To enforce the use of the local variable, use READ_ONCE() when reading
the shared data and WRITE_ONCE() when updating it. Apply these macros to
the three identified locations (curr_sense, adc, and fault) where local
variables are used for error validation, ensuring the value remains
consistent.

Reported-by: Ben Hutchings <ben@decadent.org.uk>
Closes: https://lore.kernel.org/all/6fe17868327207e8b850cf9f88b7dc58b2021f73.camel@decadent.org.uk/
Fixes: f5bae2642e3d ("hwmon: Driver for MAX16065 System Manager and compatibles")
Fixes: b8d5acdcf525 ("hwmon: (max16065) Use local variable to avoid TOCTOU")
Cc: stable@vger.kernel.org
Signed-off-by: Gui-Dong Han <hanguidong02@gmail.com>
---
 drivers/hwmon/max16065.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/hwmon/max16065.c b/drivers/hwmon/max16065.c
index 4c9e7892a73c..43fbb9b26b10 100644
--- a/drivers/hwmon/max16065.c
+++ b/drivers/hwmon/max16065.c
@@ -151,27 +151,27 @@ static struct max16065_data *max16065_update_device(struct device *dev)
 		int i;
 
 		for (i = 0; i < data->num_adc; i++)
-			data->adc[i]
-			  = max16065_read_adc(client, MAX16065_ADC(i));
+			WRITE_ONCE(data->adc[i],
+				   max16065_read_adc(client, MAX16065_ADC(i)));
 
 		if (data->have_current) {
-			data->adc[MAX16065_NUM_ADC]
-			  = max16065_read_adc(client, MAX16065_CSP_ADC);
-			data->curr_sense
-			  = i2c_smbus_read_byte_data(client,
-						     MAX16065_CURR_SENSE);
+			WRITE_ONCE(data->adc[MAX16065_NUM_ADC],
+				   max16065_read_adc(client, MAX16065_CSP_ADC));
+			WRITE_ONCE(data->curr_sense,
+				   i2c_smbus_read_byte_data(client, MAX16065_CURR_SENSE));
 		}
 
 		for (i = 0; i < 2; i++)
-			data->fault[i]
-			  = i2c_smbus_read_byte_data(client, MAX16065_FAULT(i));
+			WRITE_ONCE(data->fault[i],
+				   i2c_smbus_read_byte_data(client, MAX16065_FAULT(i)));
 
 		/*
 		 * MAX16067 and MAX16068 have separate undervoltage and
 		 * overvoltage alarm bits. Squash them together.
 		 */
 		if (data->chip == max16067 || data->chip == max16068)
-			data->fault[0] |= data->fault[1];
+			WRITE_ONCE(data->fault[0],
+				   data->fault[0] | data->fault[1]);
 
 		data->last_updated = jiffies;
 		data->valid = true;
@@ -185,7 +185,7 @@ static ssize_t max16065_alarm_show(struct device *dev,
 {
 	struct sensor_device_attribute_2 *attr2 = to_sensor_dev_attr_2(da);
 	struct max16065_data *data = max16065_update_device(dev);
-	int val = data->fault[attr2->nr];
+	int val = READ_ONCE(data->fault[attr2->nr]);
 
 	if (val < 0)
 		return val;
@@ -203,7 +203,7 @@ static ssize_t max16065_input_show(struct device *dev,
 {
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(da);
 	struct max16065_data *data = max16065_update_device(dev);
-	int adc = data->adc[attr->index];
+	int adc = READ_ONCE(data->adc[attr->index]);
 
 	if (unlikely(adc < 0))
 		return adc;
@@ -216,7 +216,7 @@ static ssize_t max16065_current_show(struct device *dev,
 				     struct device_attribute *da, char *buf)
 {
 	struct max16065_data *data = max16065_update_device(dev);
-	int curr_sense = data->curr_sense;
+	int curr_sense = READ_ONCE(data->curr_sense);
 
 	if (unlikely(curr_sense < 0))
 		return curr_sense;
-- 
2.43.0


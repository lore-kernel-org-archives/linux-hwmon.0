Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F14A13A260
	for <linux-hwmon@vger.kernel.org>; Thu,  4 Jul 2024 21:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720129049; cv=none; b=m4zR9FqWjSNod+u9wg7TEsuon9WIkf8RFBecxvYrBDMBOnhRk0vCs8CgkhQMsF2/wSHK4P9IlYtCKrdlNVZak4XvGSLCCTx5samc0WpEoDDSlPancOzwMoWUXPn/gMscBpvoKwCblNpkFF0bRJIbenf8vt7Y9yTzIt35XuQ13SM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720129049; c=relaxed/simple;
	bh=nSYTLfykq6Q7koEBiKI6IES9qjeWkhUyTRkStFXF/3Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=quyv8iElwBKKMM3LRwBKWj1yJ8lDrxfS8Jg8R/P/A3SJA5xl7FcspvriZP04tqC9GycD2HW8LoKwtSFd9MrNIukxxke5RiIQtrP6FDmeDwVbIOaZ/gT0y7dGvnEwVd67CIGioHe9KWarLCnnXedFNQFCE8WIsFn44aqiucL1gxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U4ybxYzA; arc=none smtp.client-ip=209.85.167.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U4ybxYzA"
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-3d55f198f1eso511341b6e.0
        for <linux-hwmon@vger.kernel.org>; Thu, 04 Jul 2024 14:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720129046; x=1720733846; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tRzuR0zVRtJexew852wMyGOvZW75YybIt7u3laQ/oyY=;
        b=U4ybxYzAE+Hn8TxesBE+mWLuMIdJgVmcGa2C6UdCL+R0toXNXstX5JmYYhYkpihc6k
         iQqD7t/95udPjCYknPHEvX6Fq+RGPDgC1/DLAuyawQtpHxiSlKGgmIHq4SdibYVRVdkC
         lNUrfKRCYjGFf+cH2zYD5awx3qgik9ZJgVUhpx/FyHZLMv14RsLPUj3Oov2yU03XEiP+
         +h6LcQGzNGVAu5i+pZ9LODarRDtB3685lC1gIEIvYCqHtDTQvLxtI7YogyH25mKkpM2T
         WsYv+kWpork5DVPHvzHXKr4GihwUlR2vip9AoOk+/12mCxhtiA2+JQoanenjs7Qcdnzs
         Ndyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720129046; x=1720733846;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tRzuR0zVRtJexew852wMyGOvZW75YybIt7u3laQ/oyY=;
        b=QltdzMESUkbl6pjuY9HkQ4cf35D5zMW3LJd+p7z/o6M3NVhYLSW6xmOjDPLU00Tl94
         B5rcc2W2yNluG/bgjEG7HBmXHWi8TVZz4eLbbOY0XozFxFNFPVE+D1dLtp1N4oDxFLkR
         qYnUURvnleaQaEcsHuU0YlfXGOQMStnnDO//MO4NPtHJawQRNTdaq8Y1KZtbIvtRKmwt
         1LLph1VZdjRi4/WJ8EBuYcXeqULsCz3h2d9uNxaHjFSPfiw7c6jzsITgD84ZA+MblZO7
         11nxlIpjQ4d3zUQYh4DLWv8nNiwl+MVKd1/FZ+4HPnK/CAAKT/7W3wRy/9gnkO1A7KzC
         vIZg==
X-Gm-Message-State: AOJu0YzOK+Ew6ijRdDOZ6VNC3N4pDlTlIiFLfin7hAmfvgxbHWSSVLym
	2kJCyFc1eJaNU0fa1KsZm5iyGTM9zvIgd0eGPgGg5IFFVbwOBU4Z21MVew==
X-Google-Smtp-Source: AGHT+IGLPmxmiXKpO5Lqv/tEXrBJFNWmKGOWGAlL6mxH6S5vBO0oDcbGZPkDXJs6QG5EKOi6f3Gj0A==
X-Received: by 2002:a05:6808:3090:b0:3d5:6306:97af with SMTP id 5614622812f47-3d914eae92dmr3111866b6e.46.1720129045605;
        Thu, 04 Jul 2024 14:37:25 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70803ed31ebsm12724240b3a.110.2024.07.04.14.37.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 14:37:24 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 4/7] hwmon: (g762) Use bit operations
Date: Thu,  4 Jul 2024 14:37:09 -0700
Message-Id: <20240704213712.2699553-5-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240704213712.2699553-1-linux@roeck-us.net>
References: <20240704213712.2699553-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use bit operations to make the code easier to read and avoid duplication.
While at it, improve column alignment in defines.

No functional change.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/g762.c | 130 +++++++++++++------------------------------
 1 file changed, 40 insertions(+), 90 deletions(-)

diff --git a/drivers/hwmon/g762.c b/drivers/hwmon/g762.c
index 37d8a45610a3..59077e54d47e 100644
--- a/drivers/hwmon/g762.c
+++ b/drivers/hwmon/g762.c
@@ -27,6 +27,8 @@
  *       http://www.gmt.com.tw/product/datasheet/EDS-762_3.pdf
  */
 
+#include <linux/bits.h>
+#include <linux/bitfield.h>
 #include <linux/clk.h>
 #include <linux/device.h>
 #include <linux/err.h>
@@ -59,35 +61,32 @@ enum g762_regs {
 };
 
 /* Config register bits */
-#define G762_REG_FAN_CMD1_DET_FAN_FAIL  0x80 /* enable fan_fail signal */
-#define G762_REG_FAN_CMD1_DET_FAN_OOC   0x40 /* enable fan_out_of_control */
-#define G762_REG_FAN_CMD1_OUT_MODE      0x20 /* out mode: PWM or DC */
-#define G762_REG_FAN_CMD1_FAN_MODE      0x10 /* fan mode: closed/open-loop */
-#define G762_REG_FAN_CMD1_CLK_DIV_ID1   0x08 /* clock divisor value */
-#define G762_REG_FAN_CMD1_CLK_DIV_ID0   0x04
-#define G762_REG_FAN_CMD1_PWM_POLARITY  0x02 /* PWM polarity */
-#define G762_REG_FAN_CMD1_PULSE_PER_REV 0x01 /* pulse per fan revolution */
+#define G762_REG_FAN_CMD1_DET_FAN_FAIL	BIT(7)	/* enable fan_fail signal */
+#define G762_REG_FAN_CMD1_DET_FAN_OOC	BIT(6)	/* enable fan_out_of_control */
+#define G762_REG_FAN_CMD1_OUT_MODE	BIT(5)	/* out mode: PWM or DC */
+#define G762_REG_FAN_CMD1_FAN_MODE	BIT(4)	/* fan mode: closed/open-loop */
+#define G762_REG_FAN_CMD1_CLK_DIV_MASK	GENMASK(3, 2)
+#define G762_REG_FAN_CMD1_PWM_POLARITY	BIT(1)	/* PWM polarity */
+#define G762_REG_FAN_CMD1_PULSE_PER_REV	BIT(0)	/* pulse per fan revolution */
 
-#define G762_REG_FAN_CMD2_GEAR_MODE_1   0x08 /* fan gear mode */
-#define G762_REG_FAN_CMD2_GEAR_MODE_0   0x04
-#define G762_REG_FAN_CMD2_FAN_STARTV_1  0x02 /* fan startup voltage */
-#define G762_REG_FAN_CMD2_FAN_STARTV_0  0x01
+#define G762_REG_FAN_CMD2_GEAR_MASK	GENMASK(3, 2)
+#define G762_REG_FAN_CMD2_FAN_STARTV_MASK GENMASK(1, 0)	/* fan startup voltage */
 
-#define G762_REG_FAN_STA_FAIL           0x02 /* fan fail */
-#define G762_REG_FAN_STA_OOC            0x01 /* fan out of control */
+#define G762_REG_FAN_STA_FAIL		BIT(1)	/* fan fail */
+#define G762_REG_FAN_STA_OOC		BIT(0)	/* fan out of control */
 
 /* Config register values */
-#define G762_OUT_MODE_PWM            1
-#define G762_OUT_MODE_DC             0
+#define G762_OUT_MODE_PWM		1
+#define G762_OUT_MODE_DC		0
 
-#define G762_FAN_MODE_CLOSED_LOOP    2
-#define G762_FAN_MODE_OPEN_LOOP      1
+#define G762_FAN_MODE_CLOSED_LOOP	2
+#define G762_FAN_MODE_OPEN_LOOP		1
 
-#define G762_PWM_POLARITY_NEGATIVE   1
-#define G762_PWM_POLARITY_POSITIVE   0
+#define G762_PWM_POLARITY_NEGATIVE	1
+#define G762_PWM_POLARITY_POSITIVE	0
 
 /* Register data is read (and cached) at most once per second. */
-#define G762_UPDATE_INTERVAL    HZ
+#define G762_UPDATE_INTERVAL		HZ
 
 /*
  * Extract pulse count per fan revolution value (2 or 4) from given
@@ -101,16 +100,14 @@ enum g762_regs {
  * register value.
  */
 #define G762_CLKDIV_FROM_REG(reg) \
-	(1 << (((reg) & (G762_REG_FAN_CMD1_CLK_DIV_ID0 |	\
-			 G762_REG_FAN_CMD1_CLK_DIV_ID1)) >> 2))
+	BIT(FIELD_GET(G762_REG_FAN_CMD1_CLK_DIV_MASK, reg))
 
 /*
- * Extract fan gear mode multiplier value (0, 2 or 4) from given
+ * Extract fan gear mode multiplier value (1, 2 or 4) from given
  * FAN_CMD2 register value.
  */
 #define G762_GEARMULT_FROM_REG(reg) \
-	(1 << (((reg) & (G762_REG_FAN_CMD2_GEAR_MODE_0 |	\
-			 G762_REG_FAN_CMD2_GEAR_MODE_1)) >> 2))
+	BIT(FIELD_GET(G762_REG_FAN_CMD2_GEAR_MASK, reg))
 
 struct g762_data {
 	struct i2c_client *client;
@@ -303,32 +300,15 @@ static int do_set_fan_div(struct device *dev, unsigned long val)
 	if (IS_ERR(data))
 		return PTR_ERR(data);
 
+	if (hweight_long(val) != 1 || val > 8)
+		return -EINVAL;
+
 	mutex_lock(&data->update_lock);
-	switch (val) {
-	case 1:
-		data->fan_cmd1 &= ~G762_REG_FAN_CMD1_CLK_DIV_ID0;
-		data->fan_cmd1 &= ~G762_REG_FAN_CMD1_CLK_DIV_ID1;
-		break;
-	case 2:
-		data->fan_cmd1 |=  G762_REG_FAN_CMD1_CLK_DIV_ID0;
-		data->fan_cmd1 &= ~G762_REG_FAN_CMD1_CLK_DIV_ID1;
-		break;
-	case 4:
-		data->fan_cmd1 &= ~G762_REG_FAN_CMD1_CLK_DIV_ID0;
-		data->fan_cmd1 |=  G762_REG_FAN_CMD1_CLK_DIV_ID1;
-		break;
-	case 8:
-		data->fan_cmd1 |=  G762_REG_FAN_CMD1_CLK_DIV_ID0;
-		data->fan_cmd1 |=  G762_REG_FAN_CMD1_CLK_DIV_ID1;
-		break;
-	default:
-		ret = -EINVAL;
-		goto out;
-	}
+	data->fan_cmd1 &= ~G762_REG_FAN_CMD1_CLK_DIV_MASK;
+	data->fan_cmd1 |= FIELD_PREP(G762_REG_FAN_CMD1_CLK_DIV_MASK, __ffs(val));
 	ret = i2c_smbus_write_byte_data(data->client, G762_REG_FAN_CMD1,
 					data->fan_cmd1);
 	data->valid = false;
- out:
 	mutex_unlock(&data->update_lock);
 
 	return ret;
@@ -343,28 +323,15 @@ static int do_set_fan_gear_mode(struct device *dev, unsigned long val)
 	if (IS_ERR(data))
 		return PTR_ERR(data);
 
+	if (val > 2)
+		return -EINVAL;
+
 	mutex_lock(&data->update_lock);
-	switch (val) {
-	case 0:
-		data->fan_cmd2 &= ~G762_REG_FAN_CMD2_GEAR_MODE_0;
-		data->fan_cmd2 &= ~G762_REG_FAN_CMD2_GEAR_MODE_1;
-		break;
-	case 1:
-		data->fan_cmd2 |=  G762_REG_FAN_CMD2_GEAR_MODE_0;
-		data->fan_cmd2 &= ~G762_REG_FAN_CMD2_GEAR_MODE_1;
-		break;
-	case 2:
-		data->fan_cmd2 &= ~G762_REG_FAN_CMD2_GEAR_MODE_0;
-		data->fan_cmd2 |=  G762_REG_FAN_CMD2_GEAR_MODE_1;
-		break;
-	default:
-		ret = -EINVAL;
-		goto out;
-	}
+	data->fan_cmd2 &= ~G762_REG_FAN_CMD2_GEAR_MASK;
+	data->fan_cmd2 |= FIELD_PREP(G762_REG_FAN_CMD2_GEAR_MASK, val);
 	ret = i2c_smbus_write_byte_data(data->client, G762_REG_FAN_CMD2,
 					data->fan_cmd2);
 	data->valid = false;
- out:
 	mutex_unlock(&data->update_lock);
 
 	return ret;
@@ -526,32 +493,15 @@ static int do_set_fan_startv(struct device *dev, unsigned long val)
 	if (IS_ERR(data))
 		return PTR_ERR(data);
 
+	if (val > 3)
+		return -EINVAL;
+
 	mutex_lock(&data->update_lock);
-	switch (val) {
-	case 0:
-		data->fan_cmd2 &= ~G762_REG_FAN_CMD2_FAN_STARTV_0;
-		data->fan_cmd2 &= ~G762_REG_FAN_CMD2_FAN_STARTV_1;
-		break;
-	case 1:
-		data->fan_cmd2 |=  G762_REG_FAN_CMD2_FAN_STARTV_0;
-		data->fan_cmd2 &= ~G762_REG_FAN_CMD2_FAN_STARTV_1;
-		break;
-	case 2:
-		data->fan_cmd2 &= ~G762_REG_FAN_CMD2_FAN_STARTV_0;
-		data->fan_cmd2 |=  G762_REG_FAN_CMD2_FAN_STARTV_1;
-		break;
-	case 3:
-		data->fan_cmd2 |=  G762_REG_FAN_CMD2_FAN_STARTV_0;
-		data->fan_cmd2 |=  G762_REG_FAN_CMD2_FAN_STARTV_1;
-		break;
-	default:
-		ret = -EINVAL;
-		goto out;
-	}
+	data->fan_cmd2 &= ~G762_REG_FAN_CMD2_FAN_STARTV_MASK;
+	data->fan_cmd2 |= FIELD_PREP(G762_REG_FAN_CMD2_FAN_STARTV_MASK, val);
 	ret = i2c_smbus_write_byte_data(data->client, G762_REG_FAN_CMD2,
 					data->fan_cmd2);
 	data->valid = false;
- out:
 	mutex_unlock(&data->update_lock);
 
 	return ret;
@@ -722,7 +672,7 @@ static ssize_t fan1_div_show(struct device *dev, struct device_attribute *da,
 	if (IS_ERR(data))
 		return PTR_ERR(data);
 
-	return sprintf(buf, "%d\n", G762_CLKDIV_FROM_REG(data->fan_cmd1));
+	return sprintf(buf, "%ld\n", G762_CLKDIV_FROM_REG(data->fan_cmd1));
 }
 
 static ssize_t fan1_div_store(struct device *dev, struct device_attribute *da,
@@ -753,7 +703,7 @@ static ssize_t fan1_pulses_show(struct device *dev,
 	if (IS_ERR(data))
 		return PTR_ERR(data);
 
-	return sprintf(buf, "%d\n", G762_PULSE_FROM_REG(data->fan_cmd1));
+	return sprintf(buf, "%ld\n", G762_PULSE_FROM_REG(data->fan_cmd1));
 }
 
 static ssize_t fan1_pulses_store(struct device *dev,
-- 
2.39.2


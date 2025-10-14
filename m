Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D1162FF66B
	for <linux-hwmon@vger.kernel.org>; Tue, 14 Oct 2025 15:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760455523; cv=none; b=XrFZwyoV27Vv0VFx3IxKIxwz79EiQCXtPi+bFvZ+OWPYPnx6i6TXvnLpdEYa3xldN8AcoxZNT1QjFCCnMg5V8qDLRv3DDB5SDyeYVITKYDHn4M4nEaK48fSuJFaiC31/aNy1EX0XhCh7CznIv7NO9tHTJ8gib99732MrhWgCcdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760455523; c=relaxed/simple;
	bh=yu0nro5kUwJsx9u+BnZQMJr1oS7f/l4hxqe6/cwK5qM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cio8AvUc7gdXeK4ifR89XuKOGos4SfklHOTqpOiedO1mjGnpxSgx7iDuOzwW6W3UbVBS8YwG003ELozHAv+NA8FA+d9HwbXgQHt0I2cH919a2K5A2rFcY5dlqMIKm9LBzgVZ36P+93JdKJcjEeUcCRgaNEX/RvVYZLUQNBGQU2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mbEWcfSZ; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mbEWcfSZ"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-27eed7bdfeeso60055235ad.0
        for <linux-hwmon@vger.kernel.org>; Tue, 14 Oct 2025 08:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760455521; x=1761060321; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vu0Rlb6Zxo5hYZk4htqlM38m5viPK9F2A4AQPur70Bc=;
        b=mbEWcfSZRGImlDI5VVibq1++fiTBr8EVsV00TkysMARejW9a06STpN5UjvGbdAiW2X
         UsMdKdze2aB8n/uGNRYbykRAXbBhU4QlykmCDI3PHtx75dk3x5cEx6KWp/4ueNCBHp2B
         1Jxh0EXN6/LJdxvC4pJceNRdngGpHDgacSf9fVYucgHpN00TjtK0tMgRd4+2kXgjxoXh
         iD5TnR5779mK+xSn6fcLGPinFbUauiIOceo6/CMvMVII9A1C51rPAjMfFuSBSjG39cgk
         tmj5nsuJQh66ZBr/Ui3s5ehzG81Jx2ARIhsM/V7gin1+CXcJJKWDArs2KX6ALEcHACfK
         K8XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760455521; x=1761060321;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Vu0Rlb6Zxo5hYZk4htqlM38m5viPK9F2A4AQPur70Bc=;
        b=l895BpWbC78Dwl8TmxKu4NvtPgwq7xuORSO45h+bgIvKlvxaqEgaf7qI68R9XSNyVf
         IyAPaOb/l1KIdaET26FvgoBNgoUDfXqDNiZ+lpcFASBthcdwxartuEcCSzjGyJDSVIjZ
         U5dBPSJGDnTD3kWnZanpm5Qj/einhyQbXuKDmpm4oLSg1m1Goj66w8YUBuQPfpG4slrh
         G8beB4II5/K+wU4uZeFlxOjcfX0wOzju+dgk0qNK17zi4OfBEyp5vHowE7QPGujW1eCi
         inY35si56AftLQJIDPzrma4oKrzQrK6rbj2ajwRmiXEr9oIQzTCGm4NN5Bti3xZRqB/x
         lwPw==
X-Gm-Message-State: AOJu0Ywymg5SU5MuG0NgsuHrBto/+Z3/0/bXu3P+XILpRtD1U10NpBo+
	/JnJkUEUc5DjS3dsQQE9+o6/oUX3ZVc4sd5royHByzTp/n9HDV/Pu4TqL9zJiQ==
X-Gm-Gg: ASbGncvhGFe1c47ICj+LMoUGYb5xyCwUy1WV3AHnjZVJ6f4d063laJP3sYe74lx3Nu/
	4Radmu9dLzxWfYXD9i/1X2kKTrL8uI5fR02cHUDmV9tQMR+y+U8J4q8KrZnpDuNwyyfvYMeA5OX
	hNRYfrWpO69T1EFIA3Lj/LJgp8vnWRxhB0fk3VwwQNo1bfqd2/FcJ4Wb+TtyT5qem1JchW2hTmc
	wTA1XI0rFRRh5SqEz6weqx3UrglfPAw7K/W2OoHRfmRCXdZENRCNnvLKxa1cu9tWi7UYLBIdpaA
	QIvF4PLUtKYb/gZ2oqb1/HoXd21/nmVg8RLmieLlhm4Lz3bAdSGXQDzPM0937zIgV0pxkTA7Pzz
	n/WVdgUnMyMIO91+nUWNXEWoaIhf/3ABL7P2wehhUKkjYHVj0ErW/GGOC15VouRXq
X-Google-Smtp-Source: AGHT+IEbOn+yugGGd6nhWSTz+UubLW34p/LJxOp9B4L3+WzpA6kDPV/tZPl39Qnt5fmT+wCw5eba2w==
X-Received: by 2002:a17:903:1a8e:b0:266:3f63:3500 with SMTP id d9443c01a7336-28ec9c289d7mr347134315ad.12.1760455521336;
        Tue, 14 Oct 2025 08:25:21 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b61a3a693sm16487003a91.6.2025.10.14.08.25.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 08:25:20 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 01/20] hwmon: (jc42) Rely on subsystem locking
Date: Tue, 14 Oct 2025 08:24:56 -0700
Message-ID: <20251014152515.785203-2-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20251014152515.785203-1-linux@roeck-us.net>
References: <20251014152515.785203-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Attribute access is now serialized in the hardware monitoring core,
so locking in the driver code is no longer necessary. Drop it.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/jc42.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/drivers/hwmon/jc42.c b/drivers/hwmon/jc42.c
index 06f0ab2f52fa..6549dc543781 100644
--- a/drivers/hwmon/jc42.c
+++ b/drivers/hwmon/jc42.c
@@ -19,7 +19,6 @@
 #include <linux/i2c.h>
 #include <linux/hwmon.h>
 #include <linux/err.h>
-#include <linux/mutex.h>
 #include <linux/regmap.h>
 
 /* Addresses to scan */
@@ -179,7 +178,6 @@ static struct jc42_chips jc42_chips[] = {
 
 /* Each client has this additional data */
 struct jc42_data {
-	struct mutex	update_lock;	/* protect register access */
 	struct regmap	*regmap;
 	bool		extended;	/* true if extended range supported */
 	bool		valid;
@@ -216,8 +214,6 @@ static int jc42_read(struct device *dev, enum hwmon_sensor_types type,
 	unsigned int regval;
 	int ret, temp, hyst;
 
-	mutex_lock(&data->update_lock);
-
 	switch (attr) {
 	case hwmon_temp_input:
 		ret = regmap_read(data->regmap, JC42_REG_TEMP, &regval);
@@ -295,8 +291,6 @@ static int jc42_read(struct device *dev, enum hwmon_sensor_types type,
 		break;
 	}
 
-	mutex_unlock(&data->update_lock);
-
 	return ret;
 }
 
@@ -308,8 +302,6 @@ static int jc42_write(struct device *dev, enum hwmon_sensor_types type,
 	int diff, hyst;
 	int ret;
 
-	mutex_lock(&data->update_lock);
-
 	switch (attr) {
 	case hwmon_temp_min:
 		ret = regmap_write(data->regmap, JC42_REG_TEMP_LOWER,
@@ -356,8 +348,6 @@ static int jc42_write(struct device *dev, enum hwmon_sensor_types type,
 		break;
 	}
 
-	mutex_unlock(&data->update_lock);
-
 	return ret;
 }
 
@@ -498,7 +488,6 @@ static int jc42_probe(struct i2c_client *client)
 		return PTR_ERR(data->regmap);
 
 	i2c_set_clientdata(client, data);
-	mutex_init(&data->update_lock);
 
 	ret = regmap_read(data->regmap, JC42_REG_CAP, &cap);
 	if (ret)
-- 
2.45.2


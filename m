Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 387C13F4DE2
	for <linux-hwmon@vger.kernel.org>; Mon, 14 Sep 2026 07:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789371412; cv=none; b=bxyz7WDUtkzYCipxhT8m/e5hPnwVuk9iABM/vj9Xebkby5Q4cUy/Sswb7LxctWJZ/fb0nx4LUK5bD1hdWlgx7Lv2IJjJnvPa455Bvn1glkDf0nL0ad1JmzYEOKAU3ezufcycWYVvTycTU0lq+9rgB+Atf/FCml3nA4/6b7A2Ph8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789371412; c=relaxed/simple;
	bh=43eSICE1JFCHbUysIojzxY8vifR5XctKj84YnjLrDo0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VZpcE08/mfeA1DtjwkUV8UXmWcc2i2ZDKo8uCamuv+4MlGmjh01PGmACwxx2oX/HKgfJO8kmO8jKxN4kqMw9SJ0CB7uJXUAaLlOti7zXzHxsP/hlX9MtXu2nPsRnh+7Fnem4+oAyQX7k/cMUUqMumNFbtty3/ncTxdA00IZA7Rk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DlUc9Cay; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DlUc9Cay"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39b2ad83dc6so1840174a91.0
        for <linux-hwmon@vger.kernel.org>; Mon, 14 Sep 2026 00:36:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789371409; x=1789976209; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Zs5RXec5ahUX7Llb9LiQLgtyAF4x1ZaNDold6Hb9HRg=;
        b=DlUc9CayapBhnz0xNIZhbbaeGZX+YLmkBUwihPws8llhzf6+vYqjMXR6T9dZ4702AZ
         o5egEuu3JjZbcTPCqS80ly+Vwwh1brO+iohquJd46hWPKC9LJhNaFE1/GD0ErRh2aBY4
         4fkr2gJr4FG0NtBdGnLouoWtYrEFRT32iJanUkNFitPZSEZR2dhX+q1KqJHW1iUAMzsr
         ibecJ7LmjIDYjFokSSH9CWB1WG2y93GZPHgqFdg5Yj2hzLIf1MHRZYJ5br8ma6D+X0bS
         xnkGz+YnsdL/L5/c9mkRqhy7ymCBmt5br6MUVovOvAXJIhDeKsxWOgtUlwLsDn50itWK
         ebSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789371409; x=1789976209;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Zs5RXec5ahUX7Llb9LiQLgtyAF4x1ZaNDold6Hb9HRg=;
        b=P9EvltgRFnqFbc1P4XlYAg8kDl5vxj5ivZLr4Nh6EgEPbT+PeoyN/bYIsLGQ4MuwVJ
         E3OV2uU4ZUDP3ii31Y9rJECQkWw684uNuw0xjLaKHNZwzBWzYHm89jn5rl/L+OS6yat8
         WsVikhA2P34kEy3jM2aPnmKrYZcu2icdeu64ZDHbap4cyoEmRzU6up8ae7gqnqDsvtrG
         sqnS47WLPm89U54DeLvKmJESjaqW6xEhSB6RIYHiLKM3exc4HKyRBct7dUp2PtELkNxq
         84TqA/SJvOGMCsbUcJwfhmX5rmuKhtyPqpMASvVDwk+6SJm5V1TGbKMnAn4O7sOwwIot
         LoLg==
X-Forwarded-Encrypted: i=1; AKwUvBzf2w+97DD4Tk9JK1upx1xgQiL4sU0+J62/X5a8BGjy/KAdPaEZr8rg72xvKyMqdAq9prbViV9fNHGPsA==@vger.kernel.org
X-Gm-Message-State: AFuF++mKtY5Dy3iP7LKkFWHMWsb7ihalLsclsjLqh2gPZiALUkHbiZYt
	lM6KI4LnXuCidj3vSPg/4ILDZSsmfN06rMlQFrT60etq+vmUhgwMHd2k
X-Gm-Gg: AYBFou0XZPB5pMqElowQpdZaw6+ZSi88tCmqhX8w9xOb6NBZmuX5MFC6s+mCvr8nD9Q
	42DbzUwK7Bn3kAYT4XdWI+tiwjK+Ke1nQ/Rg0c4y4QD5rSV+KzgdgsfGRZlFSpxIkMrBf5mK54L
	r+LLH3DSU9pOnZewz4G58yuxuk31yUXi8u8r7JpYWc24NKrgGlb8Bzddt8+8l7T3VwkUea/zHW9
	KsxJOXUbNlB/RNShjZyzIhsd+TK1LCQcztEokM4Edz1iG+ODqJMAbJZ7wWOxE5pQ9kbqhRHz9hj
	VfZjwH8PBgaT6iziSy5JzDqCnE8mdOyqo45aMf0R/Wuz218WqYfxpZCALLJz/sKa8Fvkfh0VpeU
	K8yIv6e1D+IHDekehPmxmW5XDcM6oktr93brVRdWA9Dd6vQTH1c8gIrijEESVROHhIab6W8K6YU
	sY5XZcg7nGh4Y8vptkQUSmBeZM+9oLg3ZEGo97q7byi6kATL0YiAGjjQ==
X-Received: by 2002:a17:90b:2c88:b0:398:e969:87ef with SMTP id 98e67ed59e1d1-39dec0f773fmr3230664a91.24.1789371408788;
        Mon, 14 Sep 2026 00:36:48 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1002::de93])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39dada5c76asm17870870a91.12.2026.09.14.00.36.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:36:48 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Rudolf Marek <r.marek@assembler.cz>,
	Guenter Roeck <linux@roeck-us.net>,
	Sven Anders <anders@anduras.de>,
	Jean Delvare <khali@linux-fr.org>,
	Hans de Goede <hansg@kernel.org>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] hwmon: (w83793) release probe data through kref
Date: Mon, 14 Sep 2026 15:36:38 +0800
Message-ID: <20260914073638.1662500-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

w83793_probe() initializes data->kref to manage the lifetime of the
driver data. The normal remove path drops the driver-owned reference
with kref_put(), while watchdog users take and release additional
references through the same kref.

However, the probe error path still frees data directly with kfree().
This bypasses the kref-managed lifetime and discards the initial
reference without a matching kref_put(), leaving the reference
accounting unbalanced.

Drop the probe-owned reference with kref_put() instead and let
w83793_release_resources() perform the final free, matching the normal
remove path.

This issue was found by manual code inspection.

Fixes: 5852f9609d21 ("hwmon: (w83793) Add watchdog functionality")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/hwmon/w83793.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/w83793.c b/drivers/hwmon/w83793.c
index a548586369e1..c6ef04c69856 100644
--- a/drivers/hwmon/w83793.c
+++ b/drivers/hwmon/w83793.c
@@ -1928,7 +1928,9 @@ static int w83793_probe(struct i2c_client *client)
 	for (i = 0; i < ARRAY_SIZE(w83793_temp); i++)
 		device_remove_file(dev, &w83793_temp[i].dev_attr);
 free_mem:
-	kfree(data);
+	mutex_lock(&watchdog_data_mutex);
+	kref_put(&data->kref, w83793_release_resources);
+	mutex_unlock(&watchdog_data_mutex);
 exit:
 	return err;
 }
-- 
2.43.0


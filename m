Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DA6F437107
	for <linux-hwmon@vger.kernel.org>; Mon,  3 Aug 2026 19:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785785744; cv=none; b=mhJR9AojQAlDZkOG5C4ILguB7L4a0uGrhZAasRTz3rD4KDzNMk+deque2GkfrdxHyGOeaMmvURGzkCf8r3PoVf14jtW/ZKxzsPUzPA5QT/+SL+199cEMjqb8XJYLs2oMLus1i8SGSeeHasR1BjOZ374FnaDIf5kRdeMDDkYP8Ro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785785744; c=relaxed/simple;
	bh=Ejm1EjVj3KgxcvLLkmvtfPx/N9NZ15VwTdXwVvjWiuI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mbEX9Rb9fsnaGk4dK0XQl5IEdRv5fPT9uH5jFLn8BbZpPKau587VAujUmXPHiPjDTs/Nw9JSQg/GknsKc5piOpAHsUuD8bLTCmron1+CanHMUEpA/W7TpD4YtNTGjE4ooAzNFB8or3FJ7BTQRT/juNfti3cHjbNed9sf08LwWUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BYS7i84P; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BYS7i84P"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2cea3004256so42052085ad.0
        for <linux-hwmon@vger.kernel.org>; Mon, 03 Aug 2026 12:35:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785785743; x=1786390543; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MYsTRe4LgwWNdUnAZkn8EKt4KU318nYWm4jl0uqk/9w=;
        b=BYS7i84PH4G2yqLs+P5/1tB8D6pVk1F7r4bhmglxAU+I/cAMQspu0qfXB3AyN+3mS+
         5np31aI+OI4XCUi6wiCXDxgJQ7xB2Khhbd4AQ2UZa3037bfmx6uSirLTyU36tIqi+DyD
         rTbuVA9JzU76UQhGx38BrdaooO8HtypRopji5Xm6ClXrv1aQ71KcI0JjpURnlBnY8HdK
         gwWXDGba6psKUqT2u7AoQEA7ZxY6ZR4Prk3WJORCc4W2mV+Q+sNgbsE7bXzw4Zx03Zz7
         TcUO96SROk1hf6o5mtv6N8n7yn8xIENECdAxWZgGAbvkeSYjZ6rMUsd5w55IUV7OkQ6g
         dbTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785785743; x=1786390543;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MYsTRe4LgwWNdUnAZkn8EKt4KU318nYWm4jl0uqk/9w=;
        b=lgFzyvxZ55HvIXgXbgGbpjMbe7sdEXRgPnroKv4O/fk3pajBOJsWF5Brm0XZ4Dfmxb
         KpusKrKbv7Yurczy0y0jhACN1Bxvuzg2mBopi7xrsKFKK/eE/+SFh/ogUHbSXNHKXADz
         8mAUL5rz8kZjRUpAqeCmlpeqola2rdKA3GvbmPAEodaC5yeG5ivRAu64KzXPgcLgMaAX
         3i9eOl6SVCDV+McYz2lNrmAGcUtq2dMHJ7KMb9xNUFxNSClh9lZyKs4BwMH87prGq8NN
         N/bEYj+K8iM315mNcF2ijmmQcQCzS4tRARg5yh0sX5l7FP8DdxrVv75O4zZhRzszArDk
         YJvw==
X-Gm-Message-State: AOJu0YyjL2zAiNX6WpyyC0guToqVMqZtT8abXtr3QqTaF4B4VzjZPNTU
	HepVUfhgXGT7etzc4GUCk1c8sawB6i4LgkIir+i3LPONsSQNuFvJG24Ft7Mgrg==
X-Gm-Gg: AR+sD11X2w2DFnSDmYEMK4mR5zSkGhSRz4/88o/ZeNuEaPbTLloSQ1hOKr9KCbnTd/F
	UtS0nKmIvogyWVmhEoKVUo0Lt+QDpwAB0tIEkTg7MDiTIYShfzQdclBT8kolEWucfyGyip1mdBF
	TupG4qtOtmOLyK8tCFSidXyMvLqP9Hi6IRdgHHTLyWyqANtt3bDOqVLulL2qkMUzPnmYMDjxY3r
	DqjSsYNZoDDLg5QVLe0cTOa1WKIq6iBlmtMHblKWd/nsWMY0DhJqa2vu7FT6nFsHjx1QKUkXhu4
	JgrS6XnkYeT5CI4R+x7sTfJt6pSDn+sn0FkDdYZRlEu3QDHSfq7Zrs+fK/pYyQAGCn8MX78xqIm
	LbAjcOWiw0Lmlh2orFRadk9ltcUFDbInC1OZijzBW0SwCTGDdciRDiu3+LmWUWFNVsxmoZavZcI
	7N7MfpYGxbTfuTeQ/LiazNHrPI/Z2pbVNzBhQu4rw/uqt5QroFQsemziRIipXkBxAW8kusWl0SH
	g==
X-Received: by 2002:a17:903:2c0e:b0:2c9:97a7:71b1 with SMTP id d9443c01a7336-2d0524c91c7mr115923375ad.44.1785785742603;
        Mon, 03 Aug 2026 12:35:42 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d04b0eb5a3sm42941865ad.46.2026.08.03.12.35.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 12:35:42 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 2/5] hwmon: (pmbus/adm1275) Use pmbus_read_smbus_i2c_block_data for block commands
Date: Mon,  3 Aug 2026 12:35:32 -0700
Message-ID: <20260803193535.2286578-3-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260803193535.2286578-1-linux@roeck-us.net>
References: <20260803193535.2286578-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The driver uses i2c_smbus_read_block_data() for PMBus block commands.
Use pmbus_read_smbus_i2c_block_data() instead to enable the driver to work
with I2C controllers which do not support i2c_smbus_read_block_data().

Drop the functionality check to get an explicit error message if the
required SMBus commands are not supported.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/pmbus/adm1275.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/hwmon/pmbus/adm1275.c b/drivers/hwmon/pmbus/adm1275.c
index 174f9bcba7e2..beb32a878d1c 100644
--- a/drivers/hwmon/pmbus/adm1275.c
+++ b/drivers/hwmon/pmbus/adm1275.c
@@ -553,12 +553,7 @@ static int adm1275_probe(struct i2c_client *client)
 	u32 shunt;
 	u32 avg;
 
-	if (!i2c_check_functionality(client->adapter,
-				     I2C_FUNC_SMBUS_READ_BYTE_DATA
-				     | I2C_FUNC_SMBUS_BLOCK_DATA))
-		return -ENODEV;
-
-	ret = i2c_smbus_read_block_data(client, PMBUS_MFR_ID, block_buffer);
+	ret = pmbus_read_smbus_i2c_block_data(client, PMBUS_MFR_ID, block_buffer);
 	if (ret < 0) {
 		dev_err(&client->dev, "Failed to read Manufacturer ID\n");
 		return ret;
@@ -570,7 +565,7 @@ static int adm1275_probe(struct i2c_client *client)
 		return -ENODEV;
 	}
 
-	ret = i2c_smbus_read_block_data(client, PMBUS_MFR_MODEL, block_buffer);
+	ret = pmbus_read_smbus_i2c_block_data(client, PMBUS_MFR_MODEL, block_buffer);
 	if (ret < 0) {
 		dev_err(&client->dev, "Failed to read Manufacturer Model\n");
 		return ret;
-- 
2.45.2


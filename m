Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFD82420E8F
	for <linux-hwmon@vger.kernel.org>; Sun, 18 Oct 2026 05:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792303076; cv=none; b=Nijj93I0ndhWKWWNyPwDnDnXkBkn5DeUAIicDaJLxcDwYk5rYzkUiPIorbSxzZWEnLbgmoM4uCL5XLAYCoqm+Hi3WzfpcJeSlUG8uLuRzJh48OHJiIeXrZmWivlwSlBvXfuEvvAFToKHxpVAyOPeNu5lQx6MeR67aAiXZVZQ70E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792303076; c=relaxed/simple;
	bh=JWaDXYgIGnvEaK4YCYQcZN13gfUQ0iE+ZHAmZz2HRiQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=I3fNPpKk8YO5u3HRKBfLfOzY+762fjZBDN7hNePC5h/omzUHWAAAuDD9JVR8K6VcDUa3ITpFRAbCFfkTVPapYk45hz0LDNpyzP3D2w3zA2IdMaIbDSe4cGUMztM4J03y0bxidigTGaZ4qKCSy2DeMbzJuZlEV+tVTlA+x6KbSjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Odzl3ztd; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Odzl3ztd"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3ac91ac8924so693861a91.1
        for <linux-hwmon@vger.kernel.org>; Sat, 17 Oct 2026 22:57:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792303073; x=1792907873; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7vuD6aGC6+Vp24CLjJRgs4xu1KFByF0l1xE8KhyU7tM=;
        b=Odzl3ztdBX9pBMEGYp5hBS3EKD3KJ5fwhUVu9TCCd7PHQVE5N/GxZHmxHqVBUTUF7/
         DIR3JJviwz//Kj5LRV/4ZK/7mjoNwECe7SNcTp2vBdZevpNHW6TOBGuJh1+Lv5ZKtIHm
         IS5Xqg/BFfmgFk7ahJGoUqS3aOsYe1g8dBIlWJiJDOPG45prtRHwcFdVOKQMYfXkCtIT
         OUEVozomgyMml1Dc3kdaCgD4BboNdnFttsvYW4MZlKVuQ21O1MMRzWZBMY6ngXu17oIr
         cZJHnGeM9p5QI7wlVTTRfBMLGKE1R92fownhyNK0RU6qK0D5KSFsaH9xc7uOwb9AXHpT
         v6kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792303073; x=1792907873;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7vuD6aGC6+Vp24CLjJRgs4xu1KFByF0l1xE8KhyU7tM=;
        b=i0OZ3jcDlUzChgYcwkNwRZxRLW3ulYn5MwsldQAH+EtCb/gxdu4z2/waW+9v2Q9S7d
         hSD2fWYey5EYuXDdlmFHYUiaqCJfDvSqkvJ9JphGhNHd1qwlikmqZRYP4CcucWx9KnU8
         31Zk/b7DrIIYbV77s23c8qyfjXB7z3/CjvXrE3JkoAZX6G6LbWIYIblSGkqa9xGHRQwO
         93bHc2RLavrXJUVSJF5u5y98MzQUD3pFWLtxY+dETBNVxVClUqykuYk/dSHa19dcGCrs
         9tCZvP6BfGZBfr17ohyKONTnmoi2D4A98Rj5iYOfdONI1LmJ8PUiMtIw0aTGKoE6kRpk
         QbAQ==
X-Gm-Message-State: AFq9FYJ/z7rB7xPoMppDsC4coSOcVmAfBmD1bJgnGliNqVBUHwxNXr99
	67OfAGVLBA/bCuf1yAQcFdifv7d1kovGp0BtqyLjnEAcPVVcWTtGxlt3ENA2COHE0UM=
X-Gm-Gg: AYBFou0JeZL6yzuO708pMhJPVpIGPbT+oupa9JE/JzvWuBJgGhyKSY9zCvUHh0pf3sQ
	R3pQCv+y+VQk5ncMA5xC9E4FRkPrmv3afwRWYsiruxUXb6wSgOs2ghsPY+V15YnRNjPAT6+7tsy
	EPP3xRqPYjr/OB/N1gUnRemjzW7Pd3JZ0mKy6UBe/UoG2F98BWeTpcIOvf/lMa1Xey8VL7fJph7
	I2skVk3w71iusHD+J6ZAzEfBoBiILrkz+DOZ6ReUtp7tKPoVggF5VpqrGVjpgJSEyR6xGxhby8F
	UTxTOEtZFGWb6LTToXzPxVOvrFmgzqg2krjGDYKivDD4LliKtwKoZi3BmRICrjdgqrnTpVRoZ9E
	N6V40SZgquOjWSOdwKsbZWKsRqi0oS6VJO7rDkEjkcUGzP0j+COPXzUkaBnj+XAblRzQBOD2Ngc
	i4zFrJftNsIthlpEoygv8vs6fpfg+6ON8AIkjbyPogUe5DRQYwnI67EJy1p6S6P2MGBev2FyiMd
	rEIPYJjeLNs1Vc=
X-Received: by 2002:a17:90b:39ac:b0:3ac:80dc:f407 with SMTP id 98e67ed59e1d1-3acef5fce4fmr3812129a91.60.1792303072998;
        Sat, 17 Oct 2026 22:57:52 -0700 (PDT)
Received: from asahi.tail4da9e3.ts.net ([218.48.198.193])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acc43a1981sm10623245a91.2.2026.10.17.22.57.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 22:57:52 -0700 (PDT)
From: "Baek Kyu, Kim" <pocj8ur4in@gmail.com>
To: victor.duicu@microchip.com,
	linux@roeck-us.net
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Baek Kyu, Kim" <pocj8ur4in@gmail.com>
Subject: [PATCH] hwmon: (mcp9982) Update the interval cache only after successful writes
Date: Sun, 18 Oct 2026 14:57:50 +0900
Message-ID: <20261018055750.1318723-1-pocj8ur4in@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mcp9982_write() updates interval_idx before writing the conversion-rate
register. If the write fails without changing the register, subsequent
update_interval reads report the requested interval instead of the
previous setting.

Update interval_idx only after regmap_write() succeeds, leaving the
previous cached interval in place on error.

Fixes: e2fe950f34e5 ("hwmon: add support for MCP998X")
Signed-off-by: Baek Kyu, Kim <pocj8ur4in@gmail.com>
---
Tested under ARM64 QEMU with an emulated SMBus adapter through the hwmon
sysfs interface. Rejected writes reproduce the incorrect interval;
the fix retains the previous value. Successful writes, retries and
MCP9982D's interval limit were also checked. No physical sensor was tested.

 drivers/hwmon/mcp9982.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/mcp9982.c b/drivers/hwmon/mcp9982.c
index 3918dc36c946..2cd41dcbd9af 100644
--- a/drivers/hwmon/mcp9982.c
+++ b/drivers/hwmon/mcp9982.c
@@ -624,6 +624,7 @@ static int mcp9982_write(struct device *dev, enum hwmon_sensor_types type, u32 a
 {
 	struct mcp9982_priv *priv = dev_get_drvdata(dev);
 	unsigned int idx;
+	int ret;
 	u8 addr;
 
 	switch (type) {
@@ -640,9 +641,13 @@ static int mcp9982_write(struct device *dev, enum hwmon_sensor_types type, u32 a
 
 			idx = find_closest_descending(val, mcp9982_update_interval,
 						      ARRAY_SIZE(mcp9982_update_interval));
+			ret = regmap_write(priv->regmap, MCP9982_CONV_ADDR, idx);
+			if (ret)
+				return ret;
+
 			priv->interval_idx = idx;
 
-			return regmap_write(priv->regmap, MCP9982_CONV_ADDR, idx);
+			return 0;
 		default:
 			return -EINVAL;
 		}

base-commit: 58161ead29e50d70a317ea26b472e0c7508e69da
-- 
2.55.0


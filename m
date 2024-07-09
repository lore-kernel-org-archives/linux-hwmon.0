Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DFEF13211E
	for <linux-hwmon@vger.kernel.org>; Tue,  9 Jul 2024 22:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720565393; cv=none; b=q6HWN4TwTdsYPbMDbhzjXG9wgr1g4fsGg0jRqjQpOmWdwCwQEF5/6CZXteTP0+hfXFyaqGvVgg9uQsw9NY2LZyXiRIv6M54kAjWSjiFVqkLWhL0U3BRSL0GYfIrHoLvqLdCbTBZFEE5mZWN0XRyqa0zn+LDhGRxNDdJTF4iN5/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720565393; c=relaxed/simple;
	bh=3rKZQ73CNn8+pw+2DifuBFIfjtP48NDa1NyDXsuyt+c=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=nDmnaN505jmIaEHUlRKo3QzLKNdAkJcnpwB/btvAr/dcoB8GL3npEBia2mgwsnAc+LCj8fwIZKkreguv0W5jGbN2SfyLMsUV5aNWWlDauqfNnoroY56rcvI7+rVI0fR91uFk1fxeW004AAS+vYRX8OCMxBo+ZXUryeqqTekW7FA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MEC6Kq+8; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MEC6Kq+8"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1fb3037b47dso38778805ad.2
        for <linux-hwmon@vger.kernel.org>; Tue, 09 Jul 2024 15:49:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720565391; x=1721170191; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=CrElP78f2XC+z73SEFgv7/cr7c4YhSKvpuYbbNHDQYc=;
        b=MEC6Kq+85ZvXnkzU/3FXz2TL3rmazG3mGxYzrDJxtLGGVvSKgY5dq4vME/twYOOWry
         DHs8/vLAqIqBFp8qjhim98jtSn0cvSox+shi5NbdSH3hfGJzA32n/nTO9vNv+bONlKui
         bx2aZSZetj0VdZT9NR1Ft2FadgDG9EaJ+O5e1d2ML5Nu677arGbbiFSZnDVRC9RnMJzm
         WElzJ/oGaYWoEvjnPv7lmpAfyjASaLHaMaF3OA2jKIL3zErQ0EfAdCtGzkFIUCOlIIf8
         zJnjlFLuTEelOWAJU6aGWIQAeoF/MLaHNwUNi8VgVqns1RCdlRLn9XidViSrlNr02fHJ
         jA+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720565391; x=1721170191;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CrElP78f2XC+z73SEFgv7/cr7c4YhSKvpuYbbNHDQYc=;
        b=Y+/y2sfB46GLOuRIajOyxwDfP0XupjM/d3WF2jORapk9uACCJkmJEBv5iqVc4tFnAo
         U8bIQQMczQPWR5nyFljVPZ4BziBb7ne6POXydH5DUNooHIGCbdFnQdWRs5lvA1Soz72F
         KHJ3yy7X3fse68Y0mom+0xzY6PLsT1232JuhrhqeVRKLuHAjBhTRlq2UchbG2Gtm14Lo
         tqYC+FqYxtqWBWfj2brVYcQgFHpQOl7jblWihthTFJv1F9pDBORHA2hOvBXvBa9wf3o8
         BP1Hq2Ir61xyHgvKTHYQw3FabzJ1Ud1Ittn80eNSwP6DL/ozgDCXQM11HCX9k3D3UQfe
         jBow==
X-Gm-Message-State: AOJu0Yy0JCWBGY0IaTdPwaYTx0/tTS1C5Xooha0w155grHrOj4g/U3uE
	tWMfz7z5dxZMZbAeVY6+Vj6HJNcHnpo2ybbS393zfiqc3ZUojD0/RIBlQQ==
X-Google-Smtp-Source: AGHT+IHf1Lsy31afa5YlEokz1HpAii9HFDSZD4dU+PVbEa7nL45sYYmlZ9/aZIMksV8UPUmgWsw/aw==
X-Received: by 2002:a17:902:ea05:b0:1fb:8a0e:76f9 with SMTP id d9443c01a7336-1fbb6d5ee12mr31903625ad.39.1720565390944;
        Tue, 09 Jul 2024 15:49:50 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fbb6a2bef3sm21217655ad.105.2024.07.09.15.49.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jul 2024 15:49:49 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>,
	Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH] hwmon: (g762) Initialize fans after configuring clock
Date: Tue,  9 Jul 2024 15:49:47 -0700
Message-Id: <20240709224947.1953794-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adding support for G761 included adding support for an internal clock.
Enabling the internal clock requires setting a bit in the FAN_CMD2
register. This is implemented in g762_fan_init(). However, g762_fan_init()
is called before clock support is selected, and the flag indicating that
the internal clock should be used is not yet set.

Initialize the clock before initializing the fan to solve the problem.
While at it, also add "g7621" to the i2c_device_id array.

Cc: Christian Marangi <ansuelsmth@gmail.com>
Fixes: 6ce402327a6f ("hwmon: g672: add support for g761")
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/g762.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/g762.c b/drivers/hwmon/g762.c
index a00cf3245eec..4fa3aa1271da 100644
--- a/drivers/hwmon/g762.c
+++ b/drivers/hwmon/g762.c
@@ -44,6 +44,7 @@
 #define DRVNAME "g762"
 
 static const struct i2c_device_id g762_id[] = {
+	{ "g761" },
 	{ "g762" },
 	{ "g763" },
 	{ }
@@ -1083,15 +1084,16 @@ static int g762_probe(struct i2c_client *client)
 	data->client = client;
 	mutex_init(&data->update_lock);
 
+	/* Get configuration via DT ... */
+	ret = g762_of_clock_enable(client);
+	if (ret)
+		return ret;
+
 	/* Enable fan failure detection and fan out of control protection */
 	ret = g762_fan_init(dev);
 	if (ret)
 		return ret;
 
-	/* Get configuration via DT ... */
-	ret = g762_of_clock_enable(client);
-	if (ret)
-		return ret;
 	ret = g762_of_prop_import(client);
 	if (ret)
 		return ret;
-- 
2.39.2


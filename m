Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792897594;
	b=hlVPzQ7LhDDJMLwl3Cyb5rKWW6m26JiW33QFCRAjS7XMVdhik3Ztlus2tiYNujs0HCPg
	 yxQL5Ro6upi2n2DUbhJgos5vwnTFvHpi1FZVjEABFwnGps/sP0Rvn2YsVBIhgn9dMe32/
	 EgptSXmUYd2QAtTBpVzDJxD5Xtk6B8mWQcbrsGi9yCkKLyB2wWjsjtTaMfxnXk/i5ZDhE
	 WycIkJW1Ia8JZwGpD4tgaUzQlRE40EiUjs6SqGZ2bgzah3Cdpnafs5Xg9N0BP1DBxeQB/
	 qml8i3fW9Sz+bxX2uHbdcVQybexbwDDGPY1uDN3qX2/3cIVSpYFQLcdaMEGsI+GP0Ng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792897594;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=YNx+zirtnSG3n2/5SJ6TBRQJ3Q3MVvqER2bsi18Z5lA=;
	b=F+TqkaqxSkb5U9QR09vvPvOUE2Eoqg31ZMpTTjZVv0OQy0NdB42E3xhb2L5zfJNLKGDp
	 +va7FLRghbCKt9yPDydKtQLKPbgkqk7NtUUbzN2MR98RBe2zokCFlmrGX3kWbuw/iKKsc
	 l/II8qAJQIxooTKAnbk4uWjTuhoQcDov+ha02J31v+gI7CNACZU0zaiZvuqjagjJmwJxz
	 91/mgUIzy3fiQ6cPWdkS2bqWJCdBaxQHppE3Nl+KIYBunvCiFIQKRGSOKhEqXcFdRWOQA
	 oF3NP5nX0Ejg0uxT+vNpZndkqYl9R36qi18Gov4He2znOziLhKwTKtE/xF7aHXD2tpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="L2oL+/3j";
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AAD160A263C
	for <linux-hwmon@vger.kernel.org>; Sun, 25 Oct 2026 03:06:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7AAD160A263C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=L2oL+/3j
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-35cd4e8bdbdso3523356eec.1
        for <linux-hwmon@vger.kernel.org>; Sat, 24 Oct 2026 20:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792897594; x=1793502394; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YNx+zirtnSG3n2/5SJ6TBRQJ3Q3MVvqER2bsi18Z5lA=;
        b=L2oL+/3jDtkq1986Ixl4Peccd9BWu2QlppKaq+FnZbbduCt96S2+NatNAy1Aw+NXwI
         x1RpXhCmdiKBo0t+G+ktVcCoeoLqcLRCKVXWoFSe26rKR2cjAnvdJPbqlci5jyqAgZSc
         pIRNuo4RKXHKYplkRGNK49Dg0WLq4BuMci6r7GS4gA07PYQ/M9CNTt5ij16vGeSiOPi7
         SQ7LYn3dffYU5zqjvBi7GB45tUYgCUGu4CJE4H5bM6S3ePgirMvjRAwrPeZ/2uGZ1cTC
         EjraWnAsovp4TPYR2gwsDuvG8Mkbi3LQT6ubugnooLLx7YdLSG5HEAloMdo3vuWIYoo7
         SXxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792897594; x=1793502394;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YNx+zirtnSG3n2/5SJ6TBRQJ3Q3MVvqER2bsi18Z5lA=;
        b=xxjREbPaky/N8VBVmji4mQyqd+qhvG4qgdvJFOjnw6OYroIvToEs2xjvdr/Wtl8pIo
         ZiW8HcfF+fbDnBrVBlJyWAwtiq1YrWVfUvdO8C2h16wDK+LWYwRudUarZfEs1po0RjwA
         UINCc7nU6PcXv7heENnHwEjS5P53NQ24lU1jW9UN8rUfa/pmf/IFO1lHQ0uGVFA2c7YK
         WViKhbEcuDA2QQkkBgCiubXwtXw8cTx669WbSbMkFzAzYOK+StDRaVOwApsnD1TmVTPv
         e+LmopF0jx9qYY9soKijg2C2e5FXG671BRT1XoL5b1A+tkMGXR/k+T6d0OijLnjOpI7q
         qvDQ==
X-Gm-Message-State: AFq9FYICxdbJEIBzkXXuFsc7peqQVTIIcJkE/XeTdW7fp1tiTeqhBhIX
	8jLFJGncqVHFDRyguecKkohzCYKft502qtWGJeeCaiZ1BXnI1pIxTctT
X-Gm-Gg: AYBFou3jzimlL0KHxpYmhKUHvAp80mwhy18H/FTgt7bO0IhJ4ha44Ryoa9IqONR4qKp
	O7zJnXgojfEqkEqs21SKO7d8ox1W0+Y6TI2WXseIpupOqpnvWp08a/tAUIpN1xkSQwMzq0yVna2
	13YBtPm9nbUbNGrZLC/g7X7L5yiQQuepXpTGSDr++YiAuEy5mLPe/mSEVzhF8e4n+0DpngP75iy
	pV3WwOTmPzLy3WKnQ8nupOzPKMqCd0d1koe+RPq1/4iANsFxyoCi8G25IzSVJ0p0ojA8zt8V9dz
	WO55Rsm9iZxFvzUlCh1O/u5zYuwk65/pG1YEI3g9Dfl3R0vMcZocQuIuwArrNvfC6tlDj+IcrnP
	o4Zhh+6z0sMv6wQaHixX7m3d0cDOiT7HeEfBSMp5Z9KQLwZHn5j58lDJGynFn/VT6GCAz0wOBX2
	1b/S6pqfemwXffG+WuM9Bw5UgJALFLrOKGZKcEGTQSZYXlWMrNvI8Xe6wbVNNE8v48PSl10cAJo
	bvb6+jwj1Nv9ezZ3yjZCNfXG3+TCe2KAArQpi0Xqc2idJqPOmqEe9tT8HhB3LNFl+CE6mvmIG3H
	Y6fSOKc17Yw4qEygZHD1oQsHKkr1mGtr1/oIoDxxRf4=
X-Received: by 2002:a05:7301:7bc4:b0:360:51af:3146 with SMTP id 5a478bee46e88-369e861475bmr7533497eec.14.1792897593645;
        Sat, 24 Oct 2026 20:06:33 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:8fe4:693:7158:24de])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ec9276sm20245992eec.25.2026.10.24.20.06.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 20:06:33 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Sat, 24 Oct 2026 20:06:21 -0700
Subject: [PATCH 18/31] hwmon: (pmbus/lx1308) use 4-argument
 i2c_smbus_read_block_data()
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261024-hwmon-i2c-smbus-read-block-data-v1-18-e81941ad0cd3@gmail.com>
References: <20261024-hwmon-i2c-smbus-read-block-data-v1-0-e81941ad0cd3@gmail.com>
In-Reply-To: <20261024-hwmon-i2c-smbus-read-block-data-v1-0-e81941ad0cd3@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>, 
 Cosmo Chou <cosmo.chou@quantatw.com>, Andy Chung <andy.chung@amd.com>, 
 Ninad Palsule <ninad@linux.ibm.com>, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>, 
 Robert Marko <robert.marko@sartura.hr>, 
 Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>, 
 Daniel Nilsson <daniel.nilsson@flex.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.17-dev-e56a4

Pass sizeof(buf) - 1 to i2c_smbus_read_block_data() in lx1308_probe()
to leave space for the NUL terminator.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/hwmon/pmbus/lx1308.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/pmbus/lx1308.c b/drivers/hwmon/pmbus/lx1308.c
index 0c453393796b..37519bda594f 100644
--- a/drivers/hwmon/pmbus/lx1308.c
+++ b/drivers/hwmon/pmbus/lx1308.c
@@ -151,7 +151,8 @@ static int lx1308_probe(struct i2c_client *client)
 	const struct i2c_device_id *mid;
 	int ret;
 
-	ret = i2c_smbus_read_block_data(client, PMBUS_MFR_ID, buf);
+	ret = i2c_smbus_read_block_data(client, PMBUS_MFR_ID,
+					sizeof(buf) - 1, buf);
 	if (ret < 0)
 		return dev_err_probe(&client->dev, ret,
 				     "Failed to read manufacturer id\n");
@@ -161,7 +162,8 @@ static int lx1308_probe(struct i2c_client *client)
 		return dev_err_probe(&client->dev, -ENODEV,
 				     "Unsupported Manufacturer ID '%s'\n", buf);
 
-	ret = i2c_smbus_read_block_data(client, PMBUS_MFR_MODEL, buf);
+	ret = i2c_smbus_read_block_data(client, PMBUS_MFR_MODEL,
+					sizeof(buf) - 1, buf);
 	if (ret < 0)
 		return dev_err_probe(&client->dev, ret,
 				     "Failed to read Manufacturer Model\n");
@@ -175,7 +177,8 @@ static int lx1308_probe(struct i2c_client *client)
 		return dev_err_probe(&client->dev, -ENODEV,
 				     "Unsupported Manufacturer Model '%s'\n", buf);
 
-	ret = i2c_smbus_read_block_data(client, PMBUS_MFR_REVISION, buf);
+	ret = i2c_smbus_read_block_data(client, PMBUS_MFR_REVISION,
+					sizeof(buf) - 1, buf);
 	if (ret < 0)
 		return dev_err_probe(&client->dev, ret,
 				     "Failed to read Manufacturer Revision\n");

-- 
2.56.0.257.gf7497c7d27-goog


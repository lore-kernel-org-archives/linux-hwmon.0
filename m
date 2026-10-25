Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792897609;
	b=ZbgY97trba6HUDAU+9m2YNASsu14tkoj7zUNPOsvjrENQw9CmxmyNE/Fl0evIC7XiVWQ
	 K8UANIiC4HWzIR1ACAbeP0S+nwJWnzkk2BxlwPdQqd3yEIDVU5ELdxlPCqpjRRUEgvf4C
	 +IBLRoao25O4KWlXW/L4+sEVD0OLNFH0oRJKJP8PU8Ionv1hYlkieTkjhgOG0CxaGE/xU
	 ibmSFfacGDkN7wmI4so4m4fcduPw4V36AL8B/ixTdGySk24/yUbRlmx900IXFvP6WA/rJ
	 F+7OKXpL0unUzdiJwP6vQbanDnoxrqMiLgIs+oYkbJHXYh85xyCEkb30XvFlzcxYfXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792897609;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=3rGqzJtTbleWU483rEk48ZN2IurDibhE4wP0iwmdKYc=;
	b=mBAuvdG2JRiGiLfpBOqHI+QkU6W/Xf4MZvTS7aeBhnLAPCWAl/N6LvnHwqgJETskYRYR
	 RtCXVczNq4WR98VYAeXeOXPl505AOwomJwiFIiaLUuaLxaJx104twQIGzE8pbu2lxlSg7
	 8K1da9FAC2pYMxLpyxsm1iIK8fbfWnyaRtzeJALAcXklJKcKaCaVZCYjdJ9LPnyfoy5eW
	 e+51BM+EKnLK5/0Dhba/EOirrPOs8jxDs12eNjYbFyGEbJF0b0noMGLPYmdHBkX2pKsaI
	 g9LGi0zGDtRD6ynKlvcBTLwAkG3gRsryeH8NDVRpYSLzaOAoqAVxTRGMGVSfK3YtraA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=E8aklddD;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD1FE606AA7A
	for <linux-hwmon@vger.kernel.org>; Sun, 25 Oct 2026 03:06:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD1FE606AA7A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=E8aklddD
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso3879371eec.0
        for <linux-hwmon@vger.kernel.org>; Sat, 24 Oct 2026 20:06:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792897608; x=1793502408; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3rGqzJtTbleWU483rEk48ZN2IurDibhE4wP0iwmdKYc=;
        b=E8aklddD27UCh36Jr8rrd0zz890LZrmX/m+fXIitVLaCRl83GkN2nhv+4hthaas2yP
         R2KmxGF+BvbEhK82imFzFOkyeNZef5R/NuMSisMs4LJkTBeNAa2YKJL3lau4rg+UTacI
         vQcwg6HV9+sHO/wyYroYaVwnU6YgVBwAe+QbBeTB9aGeEbcdEw0CxMMjZN+w/NaL9O8p
         AILOL2U06rzAxw0V69+GYCLsxZqzO5wWeeqK2o9o6aAk++RFI+4UJlDTW9oPNcKvUEnB
         DUfr7FIHShUgy+LgTfbZFU1L1tnCzVUR3BdiR00uKEoqmc0mMmWDokCbjNiHSMNekwUn
         vZ9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792897608; x=1793502408;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3rGqzJtTbleWU483rEk48ZN2IurDibhE4wP0iwmdKYc=;
        b=a9kgiiAp7ThP/Hum+v1cB0CoMhew9FtJU3tbW5Kx8+rBSXqxt+SZgB5vJtM3XuU6kg
         mtB5S9h8/mQxUwhzVtMgbaiZt97bCBbkPNmjiBWs5t9oIWWrqLPq1EACoMWN/9gd77wR
         VAOeLDfSyaNBfsj/N0yoUoCQuNAZAsSmpzMt2bAgdY4CzF0munDZwEeLmnf4KnB7ypvF
         CUetzEZQFbpCtlRXmgPi010ChEldNmB9uxkU2Gt4aFWj6eC1VxXMVqeh4xyS9+TYxfO5
         jMsAG3V77BAHwdM5IF7MIH8/UHor0Zq6uCACBQltR8/Kj+gX5k5GQGPMkh2Q1QkWg0J2
         9kaw==
X-Gm-Message-State: AFq9FYI+si7n7MnNlgigS/CWQjhuyot7eUW/OVyvh3uXyGgCTeanPZeO
	ujyNiFDTF/xvTcx7APqPBwbB2eLw5Ia2Fw3oTSlRTedzxqq6ahCRc3oS
X-Gm-Gg: AYBFou1LpK7ZcdO30D9JuG4fB+YuXDY+jPuswIGroLnVYKlt3/DVBwyp0Z9X4yy/V0F
	Z0EUCnLo0MNvgeheCOapzxoX/dZiU+43LRTmVjDDnHsYlqmZuX5clGo52Tiz9WcFIN/2Em5iWEw
	e+vZkFSmSOu5CXfaGcxrsd7VToOy/AOD1kIloJ2j5uDmgaDP7cTIjqXXfaDYdgN30nn61yc2R8Y
	+5yJC9rPz6iMOQKNSr4ZWX5dsupZi5gCE82ik2Uf9LrMwR8Z7yyGJ2L/sAAo5qcTnSDIqTA1wf2
	IvkssYUbaYuga8luy7CZkU2NIFWZQi+OAPx6r9d9BlwLaDU7ZrAGJC/tiI34gKJuW6eUgTzG6SA
	/6AkdMjeaffU1KAH03O/lOsKMiAMAYCpxun/RRWzvVB9bCQ39puQ1kgy+TJBNCTThDy5ISayRdg
	/prMRgtB1BJ2ItFBTFH4wAVdKgQkS3GR0lt+rJZgqfs4LtOalj8V5QWvJ/qW8Ylz7fjHc89mTeU
	tqQiHLxq9tM54rxbHSIwIHIsGlecGL4VXgs2bAAMg5476IvHOYGV2rCmRU6RLvJBCk6oxB9IeW2
	FqZKrQaOVYNx7ve1ZytKHvn6UMaXDICuWQkjcf+tSpFT
X-Received: by 2002:a05:693c:69cf:b0:360:ca2f:ce6f with SMTP id 5a478bee46e88-369e8362b3fmr5037652eec.1.1792897607949;
        Sat, 24 Oct 2026 20:06:47 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:8fe4:693:7158:24de])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ec9276sm20245992eec.25.2026.10.24.20.06.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 20:06:47 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Sat, 24 Oct 2026 20:06:31 -0700
Subject: [PATCH 28/31] hwmon: (pmbus/tps53679) use 4-argument
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
Message-Id: <20261024-hwmon-i2c-smbus-read-block-data-v1-28-e81941ad0cd3@gmail.com>
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

Pass the buffer size to i2c_smbus_read_block_data() in
tps53679_identify_chip() and tps536xx_read_block().

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/hwmon/pmbus/tps53679.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/pmbus/tps53679.c b/drivers/hwmon/pmbus/tps53679.c
index a04a632a5091..e6c5fd630f86 100644
--- a/drivers/hwmon/pmbus/tps53679.c
+++ b/drivers/hwmon/pmbus/tps53679.c
@@ -110,7 +110,8 @@ static int tps53679_identify_chip(struct i2c_client *client,
 		return -ENODEV;
 	}
 
-	ret = i2c_smbus_read_block_data(client, PMBUS_IC_DEVICE_ID, buf);
+	ret = i2c_smbus_read_block_data(client, PMBUS_IC_DEVICE_ID,
+					sizeof(buf), buf);
 	if (ret <= 0)
 		return ret < 0 ? ret : -EIO;
 
@@ -176,7 +177,8 @@ static int tps53681_identify(struct i2c_client *client,
 static int tps536xx_read_block(struct i2c_client *client, u8 reg, u8 *buf,
 			       bool retry_without_pec)
 {
-	int ret = i2c_smbus_read_block_data(client, reg, buf);
+	int ret = i2c_smbus_read_block_data(client, reg,
+					    I2C_SMBUS_BLOCK_MAX, buf);
 
 	/*
 	 * Some TPS536C7 samples return an invalid PEC on the device-ID and
@@ -186,7 +188,8 @@ static int tps536xx_read_block(struct i2c_client *client, u8 reg, u8 *buf,
 	if (ret == -EBADMSG && retry_without_pec &&
 	    (client->flags & I2C_CLIENT_PEC)) {
 		client->flags &= ~I2C_CLIENT_PEC;
-		ret = i2c_smbus_read_block_data(client, reg, buf);
+		ret = i2c_smbus_read_block_data(client, reg,
+						I2C_SMBUS_BLOCK_MAX, buf);
 		client->flags |= I2C_CLIENT_PEC;
 	}
 	return ret;

-- 
2.56.0.257.gf7497c7d27-goog


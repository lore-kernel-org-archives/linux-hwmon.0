Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792897583;
	b=rtuuU+OoMLYF1Xt0k6jEGyR55MRLMhuVXdezjLQSrhpwVyWVPmZ2NdpOAk+dLMVVSU6P
	 Thhqb3fdkWP/4b3sSv2QykHxNfjCIvdRKNpnPAG394vJwbMDCICl3r3U4o88sL05FVd11
	 ILbvpmwSITFUS58TOsYQ/95a25iFyxl3lbRslZqJTPDjXHfvozNhSMQyXoQ93F4+24Db9
	 sLvdRoj3OF89gS0rBJC6QiHmvsWNCJOHaWk4ya9ilxL2d7dv790RCz9ibOC3HBhyrH48u
	 OwVgMjLBdKCapdQuhr+rejV8hD45dnuGoG5G6U9vLBHWTJGi48hXkKuii2AgIIlpIuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792897583;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=37YSdRLR2oXjp/puW74AN9pz/JpDSvq4Wpuwvp0oFn0=;
	b=VpHQozPjjdVC54TMgDqEzhfONytInVm0X7XQQifoZWuKasYewSNjZ3/0wbbTNIazGiTo
	 t9CwNnPxGYfrO7EAHTO4xXV21yhw/Cai+vf5ePtGS8fIaz7q+vowhP7KEw/lmhbxOE5KD
	 RENOiWgQpzWzrEb6sI/Lo18ZAuy53WmdaGiB70vvl07Wq4haNd6sc2XEj+18GHA7figOU
	 BkZdHxGxq9uGmD4f9lF8A8V+dBndVLFEnc015DLWAhH32H58bFxgVYKfhc52jGsNbVKjp
	 e6QiLgdurlkeXZutapEWMnnCs5VcMaUoAYWx/VLSzZhqZA7srH5MkF86qvg9dmmlRSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=oAXYFdpz;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6677460A3820
	for <linux-hwmon@vger.kernel.org>; Sun, 25 Oct 2026 03:06:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6677460A3820
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=oAXYFdpz
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-35cd4e8bdbdso3523265eec.1
        for <linux-hwmon@vger.kernel.org>; Sat, 24 Oct 2026 20:06:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792897582; x=1793502382; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=37YSdRLR2oXjp/puW74AN9pz/JpDSvq4Wpuwvp0oFn0=;
        b=oAXYFdpzDzYNtRKiQpo9zjNRCMA0SK7tY4WHGT/jYiAr7jvzW17shWhwHHtcyMBD9e
         JzKQtwNvsnp00ce4tMgqmwpNyCw8/CcbEPT/mFoNRMFzZ0BiNrfKlU4dnouOFf/jxFvm
         9K+HrmIwFF7hR/Gw0Qt4cU8rvqFTXm1wZr0s6I9XxIfrps5PTWL/siCL4pNeB2rWhCKs
         rwmA7czf0NjWLsvl6hTcQSvK8W1Sp857jMOdQ7Kl/qOIc+ObPC9cfp2PpA6xPdVHdNKk
         t5fxdTG5y8U4C/5U6BcQKzi0PSe7riUQiUxHgin/1qP0NWSCZ2rwON7TXczVyHhDF96U
         EnDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792897582; x=1793502382;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=37YSdRLR2oXjp/puW74AN9pz/JpDSvq4Wpuwvp0oFn0=;
        b=ZlyqeRWOFCcn41nDzS13c7etQsajtn0JrXjLOV/JuF2nuoilH8QjU34zTCAIPCGiXW
         jPQg8eRf1W5xn3kGqgU3B224WHjNGJZ1PaHgthtv0G4AF8ZPgAQeFJBpQJN1T0pA1k6S
         b71VqgFz8Ds6/o5EgLsPycAHXwvzBwSv/Xn0hmyG79iLOWZgCREghLKksdN2xrbjbM29
         RjgYKFKZsDt3j3Oo38HWYNWAsjgNcWfVr48VNsXJCxDQTO9WT4SmiN+di2czNBctdsm1
         iOzzpSAQGMKlKUDlUOD112VBVJiD1Zv2+/wOrrKSY7RW2LTI2DdnQzp3Pgw6fYQNUs9P
         yUPA==
X-Gm-Message-State: AFq9FYIEvvs6BSlMtNmuHLAmgCER/kAomURUMW77E6Y0NyY0mAUuB7kj
	ggGRkhxmkUqFNKIs7HDLM/ZgVCjYjaGvd44ZwwnkgI7yZBtdL0WGCkv9
X-Gm-Gg: AYBFou2TU8h1GkH9Vip182KR1jxufybsh5wZjVTTlR7DfxvtjnV8alE7qXIAToQ2+ll
	sbPoNN+jlSq03eAsVkxU2C7prnSfFJxrx1HvNEB/6AtlfhCAUdMBzSLnjdtWjqni2EmgZapWA5z
	LLHw9JA8cy5sT6rEYUrMv7Xrry84rQafmRdLCoSa7ZU7/cYLOxvPSgXiZEbMepZezk09g2C07cb
	jZNuYSRewT5iPNVAWpyaqvtFz+0cKVChvKEP4i9RRXpVkk/ttLJDDi7uToU/dxOs4gXwXpq17YW
	knw9jhWGRXHbvUdK/gHkyfq7TvOA6L6QWZCsg+awWcOsajnRta0ZIDeEKqdb7hpZ31inzC/pq7X
	NiFK3JMr/S5gvlPhfzRHFQQbqRhJsf2X4SehKn2kHFSyLJ8PLulAJgXjWH+OiEfXjvaliRdeLsG
	XRx7huy6XM7O6LNRQkhmMTqEvKsF5LxZlVvdW/PcDYDQFawMsYaplNLtB2XdcnBqbhyCzVAIgUE
	y7W7WaD6yrYjw5z3U9Spvvm8KDAhyuhueam2pmbyDjDY7nMbkev/IXmvK/LdpseedfCagnBGJsm
	CK+bvYt0J5WMp6XUHAdZRYR8FLCQ+kSyDX6rN0xnkaw=
X-Received: by 2002:a05:693c:2d84:b0:358:8f02:e0ca with SMTP id 5a478bee46e88-369e84fc4admr6982566eec.9.1792897582509;
        Sat, 24 Oct 2026 20:06:22 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:8fe4:693:7158:24de])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ec9276sm20245992eec.25.2026.10.24.20.06.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 20:06:21 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Sat, 24 Oct 2026 20:06:13 -0700
Subject: [PATCH 10/31] hwmon: (pmbus/d1u74t) use 4-argument
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
Message-Id: <20261024-hwmon-i2c-smbus-read-block-data-v1-10-e81941ad0cd3@gmail.com>
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

Pass sizeof(buf) - 1 to i2c_smbus_read_block_data() and shrink the
temporary buffer to I2C_SMBUS_BLOCK_MAX + 1 since only a single NUL
terminator byte is needed.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/hwmon/pmbus/d1u74t.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/pmbus/d1u74t.c b/drivers/hwmon/pmbus/d1u74t.c
index 752df3af9c1a..758464a6362d 100644
--- a/drivers/hwmon/pmbus/d1u74t.c
+++ b/drivers/hwmon/pmbus/d1u74t.c
@@ -30,11 +30,12 @@ static struct pmbus_driver_info d1u74t_info = {
 
 static int d1u74t_probe(struct i2c_client *client)
 {
-	char buf[I2C_SMBUS_BLOCK_MAX + 2] = { 0 };
+	char buf[I2C_SMBUS_BLOCK_MAX + 1] = { 0 };
 	struct device *dev = &client->dev;
 	int rc;
 
-	rc = i2c_smbus_read_block_data(client, PMBUS_MFR_ID, buf);
+	rc = i2c_smbus_read_block_data(client, PMBUS_MFR_ID,
+				       sizeof(buf) - 1, buf);
 	if (rc < 0)
 		return dev_err_probe(dev, rc, "Failed to read PMBUS_MFR_ID\n");
 
@@ -45,7 +46,8 @@ static int d1u74t_probe(struct i2c_client *client)
 				     buf);
 	}
 
-	rc = i2c_smbus_read_block_data(client, PMBUS_MFR_MODEL, buf);
+	rc = i2c_smbus_read_block_data(client, PMBUS_MFR_MODEL,
+				       sizeof(buf) - 1, buf);
 	if (rc < 0)
 		return dev_err_probe(dev, rc,
 				     "Failed to read PMBUS_MFR_MODEL\n");

-- 
2.56.0.257.gf7497c7d27-goog


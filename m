Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792897599;
	b=urK2B+142yfMHAqaVLvewjwQNJkZnowM9FbPBKU4MijdIDIfimR1WUIdbTGvyvHQ/1KD
	 j3Z3UJRmudJ+MOhFo9BNGKtyETWPJl1PiEmoCe3BcSrHqTCSiuvewFdyWhWfvwHLFU76p
	 M0A6TwqD4uI7FPGJwFj2VReEKyP4jbjmarye7eQnp83I5bAqzTSQuysbB79ZmAUNlnUha
	 5k19t5erVWaH0wEl16XcJ6wC0OxwrnBqQSOhIa8VrEhGKQ3IJk88r7PgQk7NKo8keM6Js
	 xzjqDzJOMXv1asiDM93gFOWNsv34SKYIMRyJDHckGp0/72Ro05NYMDz/jbbbtbKtvIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792897599;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=SOrZg1ktdK2KM/edar2GDErVdg3LTi45fqJLbqiERsk=;
	b=Xwu2WEoBaY8UM0wddnoTSauh/qsBJNFqnjsvux4BmqOVkYK5DPOzUNDkYHWdeVu1pgrM
	 KFM8t9OPhfkOQPTizOT9DAsvr2BDmPkOGZWsAUuMbOOukbyQ0rDl+QicFYUR2hGeswq2c
	 vLv4v8hsL7svJbhg9tsc1NeiGcrrDvBotNYteRUXV3Wo92hGmtxGhP607yNNX79AnYA/e
	 yeFWSF8NLH20fwfa7aDwpNc6T7Llk7G679mI3NFw3877+aqiZqFoiJhuI5F7Aca0VJuLF
	 0E95JMwCNFlU+RO1D2Vpy5XFmy+r3jT/Z9J+VlWxbxAP+Kn8dV5N8fIk59iTRGP6LBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=q5lwEuct;
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2B26606F5C8
	for <linux-hwmon@vger.kernel.org>; Sun, 25 Oct 2026 03:06:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2B26606F5C8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=q5lwEuct
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1438d9363fbso1468285c88.0
        for <linux-hwmon@vger.kernel.org>; Sat, 24 Oct 2026 20:06:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792897598; x=1793502398; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SOrZg1ktdK2KM/edar2GDErVdg3LTi45fqJLbqiERsk=;
        b=q5lwEuctUP1RfPGmICf0Z269MITZeAMbAdA1BPTs7i+iFAXi2LV2/S9kn3diOOLYLC
         bm2EdSK4WuM5eNPofG7fAePTzaQX6rl9e6mPfIIV7EqiNJQ9Jm4eldA0TOk5loywGfgy
         3KB3T4l42guM/mDWPWPRKzYavD5/exKCQ18WS0648w2dMG9lwYdq3bioWeoqcrvidQox
         lpfiqqofSgrNRXEDKJ+Sl1U8qmX4LIewnjmr3f1PBSXuRx8yLyJVIfSQzZQY+oX0Tj87
         Yja5J1/yNLbrwTm7PC5G+EmV1E4bsrf/kwRPFH6r7+U8agAMJHNP649NNTyRy1Ro8Liw
         nO4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792897598; x=1793502398;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SOrZg1ktdK2KM/edar2GDErVdg3LTi45fqJLbqiERsk=;
        b=jQR6p/LCdqeRbBxhW/nDjwE/+UhwVoWwBBRv4JM50BlXaptDwErHvbg0ltG9eMqCMi
         Tr5kHLJMMQ0vESPgsjd/bB48edoUPHlld7jwgwdD/z4BsaaroQDh+w6PcxCtj+jI77iR
         MQv/EdFkIKP6emTSmf5KL111w2LRJljjREQO6VD9lX3ZUOkOBUhrC2RAzznqRpKx2Z10
         VN7njaXyzHvLdI8L2giBZbgo/Dsx7a9q6/okUPTJlgbGukGllV3mBd/yNE06Qubux8Zs
         ITYj33BEufjUT2HR2HNHQNL+8R3bM46TXivuV/czYRl8gaA8DfGQEae/7aPyacZp288M
         VoPg==
X-Gm-Message-State: AFq9FYIDAJtRLYPj27ICynglIkZtxiMsfZXAl0quiTzaooQcsdJbz8Dp
	BHvGkffCiLYRymdfGlAqQNDDs31qqwQYVfpaneh9xIUQUOlDnvBDPpcB
X-Gm-Gg: AYBFou1tbQAmnaS8CnynPRqZPbpZWXWNS9+2biZ6XNUqM8kNRgJt5A5akgxCvs7+dIn
	BXzTpsGjrEs9ML4BMEXj8hiU9YrP1hOkvNtn1bnFPlfdlhbwLR+YdkODnwU6Y0CIKWL0cc7TwI3
	puGCxSSBm4euQtfeeanO3i5J6cAdKDETIjDEYc0GtWlbE7fsy7fNpJAEd18SYmQd9sYb5UtO3/f
	vPlx8Lg8fXI3oVbczf6N3TX85VZGblUpc79bSzMZxbXg4yY9RVdPx/PtWPv5NaXjQo7MSjImbeI
	5cMFtZRpf6K7H0+EtrVvcoUQBpD1fevKP3rP45X05sHvZpL0dHSoqo3d2WaskIz5mxJa5c2C5X7
	Qa6Iy+Dwyie7jNvQ+quynzbYvO/mwZvRRTDbKyOZNOn96N5rJ7JSvrfz9+doyf2l8+8xO7ra9sT
	7UxBItQR8O64eKwyKeXOd6LDaiO2Fz2+hy/O5EvTdvD0wIyHiy5+/6dQ4zQKej9F99x2UexInaT
	E9AdFWTk/L68i3uW2zYxHG1ZWhiOxpOS4LwZFpoQMuMBzcXdVDDhKfwEi4jaM/eFkPugOYHy10q
	4Cw9HPcf9nRiDw0uDDvxda6xo5mpQIpCcKc3MAmMiewAHaxcRIQz1EuUiFisqfCl
X-Received: by 2002:a05:7022:7f15:b0:199:4d4d:d3c9 with SMTP id a92af1059eb24-1994d5d1754mr4556600c88.25.1792897597889;
        Sat, 24 Oct 2026 20:06:37 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:8fe4:693:7158:24de])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ec9276sm20245992eec.25.2026.10.24.20.06.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 20:06:37 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Sat, 24 Oct 2026 20:06:24 -0700
Subject: [PATCH 21/31] hwmon: (pmbus/max20730) use 4-argument
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
Message-Id: <20261024-hwmon-i2c-smbus-read-block-data-v1-21-e81941ad0cd3@gmail.com>
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

Pass sizeof(buf) - 1 to i2c_smbus_read_block_data() in max20730_probe()
to leave space for the NUL terminator.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/hwmon/pmbus/max20730.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/pmbus/max20730.c b/drivers/hwmon/pmbus/max20730.c
index 4031f894e6ae..b48ae06e3fa0 100644
--- a/drivers/hwmon/pmbus/max20730.c
+++ b/drivers/hwmon/pmbus/max20730.c
@@ -672,7 +672,8 @@ static int max20730_probe(struct i2c_client *client)
 				     I2C_FUNC_SMBUS_BLOCK_DATA))
 		return -ENODEV;
 
-	ret = i2c_smbus_read_block_data(client, PMBUS_MFR_ID, buf);
+	ret = i2c_smbus_read_block_data(client, PMBUS_MFR_ID,
+					sizeof(buf) - 1, buf);
 	if (ret < 0) {
 		dev_err(&client->dev, "Failed to read Manufacturer ID\n");
 		return ret;
@@ -693,7 +694,8 @@ static int max20730_probe(struct i2c_client *client)
 	 * a mismatch. If that doesn't work for all chips, we may have
 	 * to remove this check.
 	 */
-	ret = i2c_smbus_read_block_data(client, PMBUS_MFR_MODEL, buf);
+	ret = i2c_smbus_read_block_data(client, PMBUS_MFR_MODEL,
+					sizeof(buf) - 1, buf);
 	if (ret < 0) {
 		dev_err(dev, "Failed to read Manufacturer Model\n");
 		return ret;
@@ -704,7 +706,8 @@ static int max20730_probe(struct i2c_client *client)
 		return -ENODEV;
 	}
 
-	ret = i2c_smbus_read_block_data(client, PMBUS_MFR_REVISION, buf);
+	ret = i2c_smbus_read_block_data(client, PMBUS_MFR_REVISION,
+					sizeof(buf) - 1, buf);
 	if (ret < 0) {
 		dev_err(dev, "Failed to read Manufacturer Revision\n");
 		return ret;

-- 
2.56.0.257.gf7497c7d27-goog


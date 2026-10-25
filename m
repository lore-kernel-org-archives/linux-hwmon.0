Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792897589;
	b=0nNs7VciTxUWr4l6I3MqPR8ItuyAenvocUmpQC57fcVL+2tBnY8j3MXIRNNPqrXQodXz
	 IJPt/DNb63AZnfIGZD8Me75yt7zckuf6ZEzFiF2tU7jqeRNdrxak57PyWb1MKeEVZyxXr
	 mhdeZOg+tKoeVQhnjmRs+UULmP9vIdkpnUrnSxKMsldycVtqBLnGq16FFcGjNVzKUB5vh
	 u+r4s7cMDJX8vyEjMDRBUYm80g5NZDa0OSZm/J76to20mKu/MREnJJVDpCACRvmAmhYzy
	 c/CRjB0EBsWTIBED+ITrg2og3XVRR0deuWziZOjwYqDF7JKllQBIrhGveYmtuK9OITQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792897589;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=Kk942ICUfydjX9IbYsVm70u5fqIuFk9UTfU2OgRWZS0=;
	b=4lKwjTx/wiKBwG/rQQQ2G2qT2fMyWNYEyaKFxhkqMn8O9QitMTdqSj+kGW8rDASPtlRp
	 fK/24FjRYFh1KcdYXBCSV4FZLRtOjBqSwdPfGGSpINokNKgdhO1TvIhN94/447BywXN4B
	 rMHgSeTq12UHOskntTA9P8mco3et7ALaSBB3j7YLi2XyGpkueiXxcbTFZXdGL5/cXTebV
	 801oLSvloIxyOGdeV4mpcX0yAZ613Z6IVI5ODIiTX34+XKL+gwXuXMzaeC52YF3G2tyvm
	 fSMutKpcj02Hz+NYUdZnlvtwVgiIC4XUC/h3LkjaBHpzTZxeyZ+xYL75EgBtUo0dssA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=euHOQO85;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EF8360A5BD3
	for <linux-hwmon@vger.kernel.org>; Sun, 25 Oct 2026 03:06:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0EF8360A5BD3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=euHOQO85
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-35f036b17easo4796122eec.1
        for <linux-hwmon@vger.kernel.org>; Sat, 24 Oct 2026 20:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792897588; x=1793502388; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Kk942ICUfydjX9IbYsVm70u5fqIuFk9UTfU2OgRWZS0=;
        b=euHOQO85URdvA9d+ch789+wbXxAi2iSPt8F6WBRdehKWalBukl6HT9ouxvFbYHZYcw
         X/KKuyVLoWfqlCM8CiNO1kGiaAjIq5HVV8QH6XCn/O7roqeo1Z7LMmxgHgm/Y2dq+C7f
         /6Gkg8MtJCySrMToS8jYAJDA0fnCxv5OxW3lmOcjOPRN2+A4OxE7XkrAGrXaaogWK6+R
         XuZ5y1oq8ESJYfwsn2bV0jWtDWWGyJe4QIRRi/UqDLRUmIdvjL50nEfiANOHtiqDkGss
         voiEJDRHqwJb/GI7G4HpSzWFw1b4iR22pbbnLgOUURyvz3F0TvBs6LiuUksZoryi0YFs
         FdpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792897588; x=1793502388;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Kk942ICUfydjX9IbYsVm70u5fqIuFk9UTfU2OgRWZS0=;
        b=OZwH0KKIhDMExAxGyZ8nBrMZMC5+19W0d1bAD7V7HMbgIXiQMvZbqGy0IgnWiWc5Lw
         nxg2rNMPrtNqLqZZLC5h15pHez1lR7MzyI0f3Qy8O+auj5OHlhWbtTwiESOMegei2iIL
         lzBNLeULuiYuljAkxye19Oew152dAnGB4uFsGQh54d2oFWBsqHt9JEpqulHFvMvoyuhU
         CZ9ywvGAGRGvpjOZZ/heFGs5+XjYv1zth5t0CjgTlzxdt7rkSPexzEtmKHpeSMIBJV5W
         JY/8cyC1cKKevXJehNJYz20ZtpxJi5nSW6e0rvwCTrrlO0LDTkoisWhqd0rKpFoHJTJ5
         50KA==
X-Gm-Message-State: AFq9FYKUiRosHfiGARh883az27BKRCUw3RYpM2Fu8INrkZasKyWu14H7
	QN8PJuPXCBCiqbMrvmrfWFvtafTTEHo+9Ml9SDCVS6tThx3WchK9ZsEj
X-Gm-Gg: AYBFou00L64sjxfMj9fofgiilvFXUmvob3im3YoGLfIsTSFpF0BtuxGBFXAnofZh/VZ
	LQJ51AjNeQM82/hZA7ZK0ZXdn0FAqEqUQ40ILCMsERiQnov7WSo8cmlU1dZaqOLF/ZihMNU0I2/
	pl2vH4KpIuL/ReQjG21uX3s1H3Mmr+FtX5KlxVtCMp5k9q4COpgD8rAk6+GOWELD0G2EkiNT735
	we/+ccWabi7+DpiMKbavMdC2fv7rrLMl/QwgjhQF7T3EuYXkkzjA6n2IJBj7rHJ5jXaVGWVGlj7
	b913o90yUGL/GWAoRWkO9VYFYBE8m1qphjuKtmWLzuTiHS8bmDyDVVoqG6yYFlO1jE1kX/9AXLN
	0uk1dsdwmYPx7dWMpBJasWdBNQd0JK1aPsvPYTu5DaPF7+A4F03zg+qpC9qEAjsYDNKh06lpp4L
	L+MYAgNB4P9/qePADvHPayoa4aA04oxx/mgKUijvku4SIRa6oOTpwmFrSQt3NrO4G3JdxxayUBy
	E+TzWmwPCy1qLbtxqtX2m7EKsdBzBUZxY7nva2oXIh8twCHF7ZIO929LMpWaSTFoPRS74EuUlMy
	ERocetggFLSCJPfJn/4S+P+rou2qZZXZyV/FUmX+JAmSm/WatIZCea+HG+2ACdD5
X-Received: by 2002:a05:7300:e9db:10b0:361:fd60:3cd2 with SMTP id 5a478bee46e88-369e848286fmr5386880eec.10.1792897588167;
        Sat, 24 Oct 2026 20:06:28 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:8fe4:693:7158:24de])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ec9276sm20245992eec.25.2026.10.24.20.06.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 20:06:27 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Sat, 24 Oct 2026 20:06:17 -0700
Subject: [PATCH 14/31] hwmon: (pmbus/inspur-ipsps) use 4-argument
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
Message-Id: <20261024-hwmon-i2c-smbus-read-block-data-v1-14-e81941ad0cd3@gmail.com>
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
ipsps_string_show() and ipsps_fw_version_show().

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/hwmon/pmbus/inspur-ipsps.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/pmbus/inspur-ipsps.c b/drivers/hwmon/pmbus/inspur-ipsps.c
index 57c0fc16909c..01ff392c71d8 100644
--- a/drivers/hwmon/pmbus/inspur-ipsps.c
+++ b/drivers/hwmon/pmbus/inspur-ipsps.c
@@ -62,7 +62,7 @@ static ssize_t ipsps_string_show(struct device *dev,
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
 
 	reg = ipsps_regs[attr->index];
-	rc = i2c_smbus_read_block_data(client, reg, data);
+	rc = i2c_smbus_read_block_data(client, reg, sizeof(data) - 1, data);
 	if (rc < 0)
 		return rc;
 
@@ -84,7 +84,7 @@ static ssize_t ipsps_fw_version_show(struct device *dev,
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
 
 	reg = ipsps_regs[attr->index];
-	rc = i2c_smbus_read_block_data(client, reg, data);
+	rc = i2c_smbus_read_block_data(client, reg, sizeof(data), data);
 	if (rc < 0)
 		return rc;
 

-- 
2.56.0.257.gf7497c7d27-goog


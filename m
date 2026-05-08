Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBD343644A6;
	Fri,  8 May 2026 23:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778283205; cv=none; b=CF+l1p/nNzKd+kmH74nRvAtX3zDByqxlG3LNoJAhzZe8GiDmkOchZcxap0pz75QYuxsf3kb1oJ5OUKlOwridtl0ChhI9tc7XA0llEXJOVc3Gwb8vw68/zY2Ekxg1B+QUQ0Z4fsSpknSn+64mVNllDw16nCpAAaPsb/n5fwMgaPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778283205; c=relaxed/simple;
	bh=J1t1jn2xzc7sdDgOm5cf7hQ76myxsDTXZJjXDI/vkUc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TbPa/StnBQ3qL9g/a9t2ryNb87PMHPmBjVpaLpCjf1/PTGlFAr2NHgdH9p0/1lov7xL99w58wkOFv1HVdzkUQYVka5q7qfYxWP3XpMt6QArkLlRSETBrli+p/ZtquF+SwgB2LS7HtwRIT+SSernbLQQOQ64vVu2PYHw/Wq+Ad6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nFmfID/F; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nFmfID/F"
Received: by smtp.kernel.org (Postfix) with ESMTPS id B2580C2BCFA;
	Fri,  8 May 2026 23:33:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778283205;
	bh=J1t1jn2xzc7sdDgOm5cf7hQ76myxsDTXZJjXDI/vkUc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=nFmfID/FhnLMia1tZykLnzhkAiULoTEtJrcx4iFNvHw+ZVTbVKSuS6xw/0i9AGqY9
	 JcifTHqV/Pbw2xrxOfUOBdFLsXNhoqzmvnWZUNgH4d+48iRzmJZUFPGdAgCcgsq2e8
	 lCFgbjepOE1xMS0uyrAVhXFPAc9O5GLTbZLhTMfxdxa5wamw9/b5Iz7BX/Z3J+2LML
	 qyrUoxHl1LAONaBK2y411RFKrOZAldX2hGfVyWjI2+yCelbU3x/A5YJ3rbjZd5XvKo
	 Ko6P8imYVSthpE66EVI4WT1DYo8o4jnUcBljPnD33prKTvfbBXJe+MGyhA2gRSp8j5
	 GLhBp6HpYQZPA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABF6BCD37AF;
	Fri,  8 May 2026 23:33:25 +0000 (UTC)
From: Abdurrahman Hussain via B4 Relay <devnull+abdurrahman.nexthop.ai@kernel.org>
Date: Fri, 08 May 2026 16:33:19 -0700
Subject: [PATCH 7/7] hwmon: (pmbus/adm1266) include adapter number in GPIO
 line label
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260508-adm1266-v1-7-ec08bf29e0ce@nexthop.ai>
References: <20260508-adm1266-v1-0-ec08bf29e0ce@nexthop.ai>
In-Reply-To: <20260508-adm1266-v1-0-ec08bf29e0ce@nexthop.ai>
To: Guenter Roeck <linux@roeck-us.net>, 
 Alexandru Tachici <alexandru.tachici@analog.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1311;
 i=abdurrahman@nexthop.ai; h=from:subject:message-id;
 bh=+gb9rQVuX3txw2uuwV5b1v1Re6m0IUjLCe0dbdU21mk=;
 b=owJ4nJvAy8zAJbYltPXv6rsCXxhPqyUxZP4rOpIisG5KOtceX/+PzKf3yb98/M5V7adgQ6TPH
 aloAcH9V1M6SlkYxLgYZMUUWeY88n/T1tEWsSHmkD3MHFYmkCEMXJwCMJEsM4a/cls61kWyZN3Y
 lbm7yP9YgSGDuPdsHlfdnaGrirR3PhI5w/C/8tDCCXubz3z+2Lrn+860H5+6RWdZMC/XKHqf1mp
 2eIMtAwA9C1Bp
X-Developer-Key: i=abdurrahman@nexthop.ai; a=openpgp;
 fpr=9CE24FEC86888658B05CC23FB45585FDABDD10F4
X-Endpoint-Received: by B4 Relay for abdurrahman@nexthop.ai/default with
 auth_id=756
X-Original-From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Reply-To: abdurrahman@nexthop.ai

From: Abdurrahman Hussain <abdurrahman@nexthop.ai>

Platforms that fit more than one ADM1266 on different I2C buses at
the same 7-bit slave address (a common shelf-management pattern,
e.g. one device per power domain) end up with duplicate GPIO line
labels because the existing format only includes the slave address.
Including the adapter number disambiguates them.

The label is purely informational (visible via gpioinfo and the
gpiochip /sys/class/gpio name); no DT or ABI consumer parses it.

Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
 drivers/hwmon/pmbus/adm1266.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/pmbus/adm1266.c b/drivers/hwmon/pmbus/adm1266.c
index 07c20746f083..ec6a2c9167d8 100644
--- a/drivers/hwmon/pmbus/adm1266.c
+++ b/drivers/hwmon/pmbus/adm1266.c
@@ -293,8 +293,9 @@ static int adm1266_config_gpio(struct adm1266_data *data)
 	int i;
 
 	for (i = 0; i < ARRAY_SIZE(data->gpio_names); i++) {
-		gpio_name = devm_kasprintf(&data->client->dev, GFP_KERNEL, "adm1266-%x-%s",
-					   data->client->addr, adm1266_names[i]);
+		gpio_name = devm_kasprintf(&data->client->dev, GFP_KERNEL, "adm1266-%x-%x-%s",
+					   data->client->adapter->nr, data->client->addr,
+					   adm1266_names[i]);
 		if (!gpio_name)
 			return -ENOMEM;
 

-- 
2.53.0



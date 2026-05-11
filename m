Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D6EF3624A3;
	Mon, 11 May 2026 04:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778474918; cv=none; b=F02UBaDc/UdiagOS+E7f0Ogo3CUB803uOt4Gk73L9Z5Pbd5D7XWV3yltThkCWzO4AGsnuTQk1klj5+SCQRNWrlM1UV15kCzkKu56TzeXTdE4XCNUVVsYmIVulgMrU4jUJjDwyA/oDmqxhbAQAvnxBupQyOuwsq+Bf/09P/HFfDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778474918; c=relaxed/simple;
	bh=X++SZUVp4SFmjlGT62fuZ/FmC03jyGdQZkXkLLxkvyw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IPKy29geu9Cn0oexJMQSntW/iukvnaNeXIPvj1moeaZD+DuOQ6Uho2PqjwwQFlAqjBsU29mYZyfltc651aW6Vk6HXESNfZm2D+sjHQVcF4uRCD6/WWIoi/W+ySS6vWRE5ByoABxByo6ncaymp8LJ+F+wOfRHQB/845etxkbsWUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TfuCgJuw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TfuCgJuw"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4CD24C2BCFB;
	Mon, 11 May 2026 04:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778474918;
	bh=X++SZUVp4SFmjlGT62fuZ/FmC03jyGdQZkXkLLxkvyw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=TfuCgJuwwxptCcWASpyWarKPWkmJaagOZIhJC8U5/kY0jQf9vMp/mPvJgy2MALalZ
	 a7yhB5or5si2T+fzhP16efav+B6VTyvY5KBz0ZS657omzU6LDcaiMLQ0AW/xQRFqp6
	 QMICPpQLOBYb/RhEzXDfpPO33T4JmoN/KYVuicmQ1TJMJeLZGZdF69vHzNDLcs8ePj
	 sFXJXxmFfwFnau0Jv/W1I7PxNc1FRIywkt5oozX8h8opObz8co/IenTr7fmGG6PuGf
	 1fHku0OrYZPZgDsnT+Nl79S6gCAO7iay9x3yYfikHzTzreAXZpoZNCzlgJeIOopcrn
	 3uMzqDqZq6DSA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4826DCD37BE;
	Mon, 11 May 2026 04:48:38 +0000 (UTC)
From: Abdurrahman Hussain via B4 Relay <devnull+abdurrahman.nexthop.ai@kernel.org>
Date: Sun, 10 May 2026 21:48:11 -0700
Subject: [PATCH v2 5/5] hwmon: (pmbus/adm1266) include adapter number in
 GPIO line label
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260510-adm1266-v2-5-3a22b903c2f1@nexthop.ai>
References: <20260510-adm1266-v2-0-3a22b903c2f1@nexthop.ai>
In-Reply-To: <20260510-adm1266-v2-0-3a22b903c2f1@nexthop.ai>
To: Guenter Roeck <linux@roeck-us.net>, 
 Alexandru Tachici <alexandru.tachici@analog.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1498;
 i=abdurrahman@nexthop.ai; h=from:subject:message-id;
 bh=XbXHyUmmSPnlINR9vCvpAV0eATuZ1frtfzVXW5r+IYw=;
 b=owJ4nJvAy8zAJbYltPXv6rsCXxhPqyUxZDHGL33a+6og+vNDExPDBc8KP8Va+z+I6Ll7/86xD
 5a51g7C+p87SlkYxLgYZMUUWeY88n/T1tEWsSHmkD3MHFYmkCEMXJwCMBEDA4b/occa9wj9DbkZ
 PvW1tovw810abttnX72gEb35r/SDx2tbkhkZtjzK3KG6vFFo282DFtt1ebJPzw/V8O+bZ1CrfMb
 zx4GLTAD/MFEc
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

The adapter number is formatted as decimal to match the i2c-N
convention used elsewhere in Linux (sysfs paths, dev nodes); the
slave address keeps its conventional hexadecimal form.

The label is purely informational (visible via gpioinfo and the
gpiochip /sys/class/gpio name); no DT or ABI consumer parses it.

Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
 drivers/hwmon/pmbus/adm1266.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/pmbus/adm1266.c b/drivers/hwmon/pmbus/adm1266.c
index 0dfb02db8683..479e768ff87c 100644
--- a/drivers/hwmon/pmbus/adm1266.c
+++ b/drivers/hwmon/pmbus/adm1266.c
@@ -292,8 +292,9 @@ static int adm1266_config_gpio(struct adm1266_data *data)
 	int i;
 
 	for (i = 0; i < ARRAY_SIZE(data->gpio_names); i++) {
-		gpio_name = devm_kasprintf(&data->client->dev, GFP_KERNEL, "adm1266-%x-%s",
-					   data->client->addr, adm1266_names[i]);
+		gpio_name = devm_kasprintf(&data->client->dev, GFP_KERNEL, "adm1266-%d-%x-%s",
+					   data->client->adapter->nr, data->client->addr,
+					   adm1266_names[i]);
 		if (!gpio_name)
 			return -ENOMEM;
 

-- 
2.53.0



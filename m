Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B136A3321DC;
	Tue, 28 Jul 2026 16:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785254560; cv=none; b=TluFxqJc+6/l5ffPZC4UBmNpAoNuKtY779lPrOg2FVuCteJb2kSYvTvP+3UQV4hCEiQUQNeT7Ksk/i12TfQY56MdrNWhxrb0loBfov3JK1wXzn9Vxh+hxlpAeFAO2yjquWfYDo1vFscZgtIRoYzjzqroCMZyXdAPgtsXtGbwQZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785254560; c=relaxed/simple;
	bh=CgH4wSRGfhaffcEEHmsrf3WB1dhSfQV4zxhcJZKJUiM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LzuX0E3xR8BzarlS6gJqlwSFa5uo3WypI6tnAkJirRrkpxgHZKkAhneTRs+3qryIByLDUCfVYxbZIXV/0q2Hi7d+k5Dl+SYfesUAwmXXnrd03WHg8OFyVyac9JVvhUi3DItU/nTdkQHSKmvkXDk8Trp9p7rRNonwz5AwdNLIVqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ts9XPzoB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ts9XPzoB"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5F198C2BCF7;
	Tue, 28 Jul 2026 16:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785254560;
	bh=CgH4wSRGfhaffcEEHmsrf3WB1dhSfQV4zxhcJZKJUiM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Ts9XPzoBNAx2cUtBdKLoMeiSaga/gmTWGC/dCPXNVEvw4SYynIVdHov9U17bSIZeD
	 3xl/RCU2hMjg00c7Iu7P9JtEZJaodLtSQkmsV31qoZ/nMtFo5Bvxf4h9L/g7jnqzS1
	 hBHehbJ21ZK2ET/4WNP93JMlw8ujLjK5c9moZvHOoNRNRKJM8zadbXA4hRFpVjl2lu
	 ijBR4hcUU3vKhh5B6bpE49aDOV3v93l1Eatqwv1LY6oyMFXieapypYrYzY4rn96bwi
	 e2kP8APHufx/p0JjBoEUv64e2uGsIAxZTJtbbNoIp5laiPl34fsS0ZW4/bC+GsoyRk
	 8Q6L3RgD2040Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AA76C53219;
	Tue, 28 Jul 2026 16:02:40 +0000 (UTC)
From: =?utf-8?q?Nuno_S=C3=A1_via_B4_Relay?= <devnull+nuno.sa.analog.com@kernel.org>
Date: Tue, 28 Jul 2026 17:03:48 +0100
Subject: [PATCH 1/5] hwmon: (pmbus/core) fix regulator enable/disable
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260728-hwmon-max20826-support-v1-1-224766e0acd1@analog.com>
References: <20260728-hwmon-max20826-support-v1-0-224766e0acd1@analog.com>
In-Reply-To: <20260728-hwmon-max20826-support-v1-0-224766e0acd1@analog.com>
To: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-doc@vger.kernel.org
Cc: Mark Brown <broonie@kernel.org>, 
 Alan Tull <atull@opensource.altera.com>, Guenter Roeck <linux@roeck-us.net>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785254629; l=1553;
 i=nuno.sa@analog.com; s=20231116; h=from:subject:message-id;
 bh=ZcrZpyTu1G+a3XqNBtj7GJFqxWjd2g2ZSlsiPnCwNoM=;
 b=lxEFSoj5ni7Nfcm6Xf7eH/GKlGXNXmcKWhvXvQ57Mx/c8RnCgf3X6/aHdxnaQo34ircovujFo
 FPmR+Fy1aboCh6zcJkBwJ1vXsF3teG3owOJv79bgL4EDg0vDDlyJZ1W
X-Developer-Key: i=nuno.sa@analog.com; a=ed25519;
 pk=3NQwYA013OUYZsmDFBf8rmyyr5iQlxV/9H4/Df83o1E=
X-Endpoint-Received: by B4 Relay for nuno.sa@analog.com/20231116 with
 auth_id=100
X-Original-From: =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>
Reply-To: nuno.sa@analog.com

From: Nuno Sá <nuno.sa@analog.com>

pmbus_update_byte_data() can return the value of PMBUS_OPERATION which
can be different than 0 and that can mess with the regulator core
given _regulator_disable() explicitly checks for ret == 0 in order to
call _regulator_handle_consumer_disable().

Fixes: ddbb4db4ced1 ("hwmon: (pmbus) Add regulator support")
Signed-off-by: Nuno Sá <nuno.sa@analog.com>
---
 drivers/hwmon/pmbus/pmbus_core.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index 0081f16c3a95..7b58f7198574 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -3100,12 +3100,21 @@ static int _pmbus_regulator_on_off(struct regulator_dev *rdev, bool enable)
 	struct device *dev = rdev_get_dev(rdev);
 	struct i2c_client *client = to_i2c_client(dev->parent);
 	u8 page = rdev_get_id(rdev);
+	int rv;
 
 	guard(pmbus_lock)(client);
+	/*
+	 * pmbus_update_byte_data() can just return the value of
+	 * PMBUS_OPERATION and that's not what we want to return to the
+	 * regulator core.
+	 */
+	rv = pmbus_update_byte_data(client, page, PMBUS_OPERATION,
+				    PB_OPERATION_CONTROL_ON,
+				    enable ? PB_OPERATION_CONTROL_ON : 0);
+	if (rv < 0)
+		return rv;
 
-	return pmbus_update_byte_data(client, page, PMBUS_OPERATION,
-				      PB_OPERATION_CONTROL_ON,
-				      enable ? PB_OPERATION_CONTROL_ON : 0);
+	return 0;
 }
 
 static int pmbus_regulator_enable(struct regulator_dev *rdev)

-- 
2.55.0



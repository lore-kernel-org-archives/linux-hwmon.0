Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C047D2D46D9;
	Wed, 15 Oct 2025 14:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760539907; cv=none; b=bUJYpoLE0bqpc4fpPK1n3dN+1ScHghNnxcJtWUFIW8riZl1oI+mVYSqB41AEQxzHnYeZiwcyJwghaJqb2kydcr5StFQEz8S7CwDkwa0llIcghSd+hRY5MGn1MKKFxk/m1LeuYp/REySwacIy+55m59fS9HSpx3LnNbr/f510+0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760539907; c=relaxed/simple;
	bh=Xofm9tj+wJ3Qu8iS4OZpq/B4hCrDuWOs4+tl4qQIuX8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dJ27BLL5mlnJwP3RkDigtVNI4F/xPy9mQOJ1nUy9kOI8ScF0LEUPzNNiVnDzSBNKpPXIKCRsoczCDK0ZnEVaM8rJB87HsvApnxhUAS49uHobuMZEoZLe+Sj+rzprrg00KLveS7Rcz3wVv6L5X4CVFYt5G7syqtRpjEoow3XG7ks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U5CXtQ3h; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U5CXtQ3h"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 581D8C4CEFB;
	Wed, 15 Oct 2025 14:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760539907;
	bh=Xofm9tj+wJ3Qu8iS4OZpq/B4hCrDuWOs4+tl4qQIuX8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=U5CXtQ3hj5g7waYs0kJd0p3gBkcpSs0SD13n40Rmw9VCaKC2mdRwHdDuk4t51dVsb
	 oAnNqQDZHX+YpB5C5RooIGwK1sYh0yryXHlxD+MRm+5p3Dc827SdRy7QeiIAd8n675
	 Yivr+NqNYOCB0U9xzJev5QP8efVaRcmkco3kFLcgUZOnIXlJIrT6IKWvpZ7LMNRrIP
	 KCDfm4JW7O4NSyna1vvcsSdbXACHMjTNetuacxQAg2YW4B9RgRo+aLl0L+YCep4my2
	 ISzUMgfCWcDqhAkT6BzdZ8prqXglwfVvdhPKN6zRrgO8pekR6Tr1YdqBHSAjSlTKPe
	 x4cCcuVHwcKGg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B8DACCD194;
	Wed, 15 Oct 2025 14:51:47 +0000 (UTC)
From: =?utf-8?q?Nuno_S=C3=A1_via_B4_Relay?= <devnull+nuno.sa.analog.com@kernel.org>
Date: Wed, 15 Oct 2025 15:52:21 +0100
Subject: [PATCH 3/3] hwmon: (adt7410): Support adt7422 chip
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251015-dev-add-adt7422-v1-3-7cf72d3253ad@analog.com>
References: <20251015-dev-add-adt7422-v1-0-7cf72d3253ad@analog.com>
In-Reply-To: <20251015-dev-add-adt7422-v1-0-7cf72d3253ad@analog.com>
To: devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
 Cosmin Tanislav <demonsingur@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760539940; l=2189;
 i=nuno.sa@analog.com; s=20231116; h=from:subject:message-id;
 bh=kRPkAzRSj0YVbwruCoHvC/DO1myQ3X+DgwaNSnHWKAc=;
 b=HGgxTpLGceqpY0VXpBuDmxitaHIc4idapwqTECPU49Nj7R2vD/4fxjRJSBroRvbK8gYezsVOn
 li0H5N8+OvGDzp4S1Wj14Dehk2HDM34S2fxbF4pVtbL/fIQbBhGS58I
X-Developer-Key: i=nuno.sa@analog.com; a=ed25519;
 pk=3NQwYA013OUYZsmDFBf8rmyyr5iQlxV/9H4/Df83o1E=
X-Endpoint-Received: by B4 Relay for nuno.sa@analog.com/20231116 with
 auth_id=100
X-Original-From: =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>
Reply-To: nuno.sa@analog.com

From: Nuno Sá <nuno.sa@analog.com>

Add support for the ADT7422 high accuracy digital temperature sensor. It's
identical to the other chips supported in the driver so we just need to
add it to the ID tables.

Co-developed-by: Cosmin Tanislav <demonsingur@gmail.com>
Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
Signed-off-by: Nuno Sá <nuno.sa@analog.com>
---
 drivers/hwmon/Kconfig   | 6 +++---
 drivers/hwmon/adt7410.c | 2 ++
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 2760feb9f83b..aa783be9b73d 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -175,7 +175,7 @@ config SENSORS_ADT7X10
 	select REGMAP
 	help
 	  This module contains common code shared by the ADT7310/ADT7320 and
-	  ADT7410/ADT7420 temperature monitoring chip drivers.
+	  ADT7410/ADT7420/ADT7422 temperature monitoring chip drivers.
 
 	  If built as a module, the module will be called adt7x10.
 
@@ -191,12 +191,12 @@ config SENSORS_ADT7310
 	  will be called adt7310.
 
 config SENSORS_ADT7410
-	tristate "Analog Devices ADT7410/ADT7420"
+	tristate "Analog Devices ADT7410/ADT7420/ADT7422"
 	depends on I2C
 	select SENSORS_ADT7X10
 	help
 	  If you say yes here you get support for the Analog Devices
-	  ADT7410 and ADT7420 temperature monitoring chips.
+	  ADT7410, ADT7420 and ADT7422 temperature monitoring chips.
 
 	  This driver can also be built as a module. If so, the module
 	  will be called adt7410.
diff --git a/drivers/hwmon/adt7410.c b/drivers/hwmon/adt7410.c
index 79952866a4db..73b196a78f3a 100644
--- a/drivers/hwmon/adt7410.c
+++ b/drivers/hwmon/adt7410.c
@@ -91,6 +91,7 @@ static int adt7410_i2c_probe(struct i2c_client *client)
 static const struct i2c_device_id adt7410_ids[] = {
 	{ "adt7410" },
 	{ "adt7420" },
+	{ "adt7422" },
 	{}
 };
 MODULE_DEVICE_TABLE(i2c, adt7410_ids);
@@ -98,6 +99,7 @@ MODULE_DEVICE_TABLE(i2c, adt7410_ids);
 static const struct of_device_id adt7410_of_match[] = {
 	{ .compatible = "adi,adt7410" },
 	{ .compatible = "adi,adt7420" },
+	{ .compatible = "adi,adt7422" },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, adt7410_of_match);

-- 
2.51.0



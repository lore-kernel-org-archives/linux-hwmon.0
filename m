Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 706132D373E;
	Wed, 15 Oct 2025 14:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760539907; cv=none; b=WEXTpjZhWpiA4rI0HA30cxKu33Khgo/M79KHHJXcSfEOZPye+pnMJMjzh0wnOdrn9jAEzkdXwpJz9+3lEggu8lb/ZTePDc+7J1QSuTRg04Cie+QB44W3CznjsMAvDDwtpHE5l1Q1Cp2Ry1SDygT2wMG7aBIG1ZyMgvGwgreIN6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760539907; c=relaxed/simple;
	bh=GjYOh4qe4KwRuDpcv95zsfIgShOPKvQLT2rhwdhTRwQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rfo1x98HK6Djarjh/pxDfazerzHJF36MndIfjdVJSoH+gTA3hfTFfWO3VJkk5rMRIYIM+vQ3+fi5Bw66WON1Bw/yxqoA+B5/tqSskQmsrLytRQPmHt4ryRxCtnwpnJy/IfDdlBnQgOS+1yIS0V7M231EpmTLtHpApfejh7lEuTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ia7xNA/+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ia7xNA/+"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5141CC113D0;
	Wed, 15 Oct 2025 14:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760539907;
	bh=GjYOh4qe4KwRuDpcv95zsfIgShOPKvQLT2rhwdhTRwQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Ia7xNA/+NL4a/aT1wF6iqG74kCTEVhlXuh+Psw+47lpsHHb6Wnl2afEangjCHMsm0
	 hls5ehEPsDdt4cdlj80qU5OKoQPbqPyDhOgCqrIFyXG64txbfXJctQIInx0UxDpOQj
	 UvsC0c7yU4tbEN8DRi7IyXYc2fHf7k9qYltDRetlbsKyHVtd97UfR6r3UntxQeK5Zg
	 gkPKYk3zWU5JPaydAAZ1XHzfuqowRZqJEzlvFbkwRbOa4ttXxeUU+IvhDG9MMiZams
	 5znT6oZ0CfmTAOx6XcXBgpqDusxW23ld8G+A2y5NrUXBwbticLP/c1uMo3tSSz7F1H
	 SedSj0b4swKYw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D407CCD18E;
	Wed, 15 Oct 2025 14:51:47 +0000 (UTC)
From: =?utf-8?q?Nuno_S=C3=A1_via_B4_Relay?= <devnull+nuno.sa.analog.com@kernel.org>
Date: Wed, 15 Oct 2025 15:52:20 +0100
Subject: [PATCH 2/3] hwmon: (adt7410): Add OF match table
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251015-dev-add-adt7422-v1-2-7cf72d3253ad@analog.com>
References: <20251015-dev-add-adt7422-v1-0-7cf72d3253ad@analog.com>
In-Reply-To: <20251015-dev-add-adt7422-v1-0-7cf72d3253ad@analog.com>
To: devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Guenter Roeck <linux@roeck-us.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760539940; l=1194;
 i=nuno.sa@analog.com; s=20231116; h=from:subject:message-id;
 bh=7sL+98Md+Y1xcPK1N48brv525Wll0lT1p5c+ZrwrMOk=;
 b=vhGach9wi36WGpvVh+StfFdXw29vJvXVWHQXf7NaFggo/RXL2Zbs7XD15dJdZ3EC1+T4AfqNG
 gwifpPXatFxAbudGZvgXRP1oLZ2S/1ApJ8u5HHk/bIjy0kfvQwEpV1G
X-Developer-Key: i=nuno.sa@analog.com; a=ed25519;
 pk=3NQwYA013OUYZsmDFBf8rmyyr5iQlxV/9H4/Df83o1E=
X-Endpoint-Received: by B4 Relay for nuno.sa@analog.com/20231116 with
 auth_id=100
X-Original-From: =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>
Reply-To: nuno.sa@analog.com

From: Nuno Sá <nuno.sa@analog.com>

Add a struct of_device_id match table to the driver.

While at it, make sure to properly include mod_devicetable.h which is
also needed for struct i2c_device_id.

Signed-off-by: Nuno Sá <nuno.sa@analog.com>
---
 drivers/hwmon/adt7410.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/hwmon/adt7410.c b/drivers/hwmon/adt7410.c
index 3bf0e0a0882c..79952866a4db 100644
--- a/drivers/hwmon/adt7410.c
+++ b/drivers/hwmon/adt7410.c
@@ -7,6 +7,7 @@
  */
 
 #include <linux/module.h>
+#include <linux/mod_devicetable.h>
 #include <linux/init.h>
 #include <linux/i2c.h>
 #include <linux/regmap.h>
@@ -94,10 +95,18 @@ static const struct i2c_device_id adt7410_ids[] = {
 };
 MODULE_DEVICE_TABLE(i2c, adt7410_ids);
 
+static const struct of_device_id adt7410_of_match[] = {
+	{ .compatible = "adi,adt7410" },
+	{ .compatible = "adi,adt7420" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, adt7410_of_match);
+
 static struct i2c_driver adt7410_driver = {
 	.driver = {
 		.name	= "adt7410",
 		.pm	= pm_sleep_ptr(&adt7x10_dev_pm_ops),
+		.of_match_table = adt7410_of_match,
 	},
 	.probe		= adt7410_i2c_probe,
 	.id_table	= adt7410_ids,

-- 
2.51.0



Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F54B1E521A
	for <linux-hwmon@vger.kernel.org>; Wed, 11 Jun 2025 16:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749659166; cv=none; b=cZ+fs2hdSxUuASPanqIzU+x4GQvYrmsTIiXhXNmidEPNt6BulVEYEynsVtHINR1tnsPwc45LE7jUIq3wHpySox9KN3K+dmZ+hKseVlZh+KlStRB9/QJBloUliH+AHftth+gDv40NdkYKPQ3woBqpRoqpApP8ASEC4OiZzWDEvfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749659166; c=relaxed/simple;
	bh=5kOuftUJolrWX/7hwIbmFV7hnWoBRvm6URIv1A8hLns=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A+SnTVMQoYx/bE8uKZrVwV5yus0XoITAq/48VOehneuCuNVOhQcObU6IXVlHwCqxCZyIXRouAo2h3no7qsnp8yivRGO7WLI7piQ0j5G65nmsbQV0r5wgdwWpCzPqKQ9LgxLvWr2ptsjOoweAPNcZJtOJ5nIjYSDEZ6MlBn6AngY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HfSWEIYo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HfSWEIYo"
Received: by smtp.kernel.org (Postfix) with ESMTPS id A0125C4CEF0;
	Wed, 11 Jun 2025 16:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749659165;
	bh=5kOuftUJolrWX/7hwIbmFV7hnWoBRvm6URIv1A8hLns=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=HfSWEIYotZjgW/n7NyUVd4T1J0PchQlbb3T5M6TPq5Oq/Qcr5Fksg88r8NguWha+D
	 uQgkTLXFdu9zxrYjQ56Mo5jes7FeJaZb9WULW1z+Eb3acI0lxrQw8h7wjeZhoorsOy
	 +qa0rIXNPrqtJ9UM2L3Ze1E4jKThFXY3C0gWpWolRFZNK6bUL76BfCKYx1v1p9huYl
	 h3bv7cGpAUV579ck01WwioLmPG62B5C7rNF9yjdg7eyweerPFQx0R98+3K8rNksFH+
	 Hwxu8hjM5XPYGZ+erIDFeQZ1xn1LCMSJuImO40jOw7wqSOLsyYQgab5ptn5tSCRgCl
	 gHFOx+qUx/jYw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9787CC71136;
	Wed, 11 Jun 2025 16:26:05 +0000 (UTC)
From: =?utf-8?q?Nuno_S=C3=A1_via_B4_Relay?= <devnull+nuno.sa.analog.com@kernel.org>
Date: Wed, 11 Jun 2025 17:26:13 +0100
Subject: [PATCH 2/2] hwmon: ltc4282: fix copy past on variable name
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250611-fix-ltc4282-repetead-write-v1-2-fe46edd08cf1@analog.com>
References: <20250611-fix-ltc4282-repetead-write-v1-0-fe46edd08cf1@analog.com>
In-Reply-To: <20250611-fix-ltc4282-repetead-write-v1-0-fe46edd08cf1@analog.com>
To: linux-hwmon@vger.kernel.org
Cc: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749659172; l=1114;
 i=nuno.sa@analog.com; s=20231116; h=from:subject:message-id;
 bh=Axt5mflHjtEQ8Pvm+CtnA/aSKL3YMFtBVCFhqgZVWgs=;
 b=5SHjr1sAltP5PP3H5TJQJ69QApXVI0zFIDP66iZcN8Df3c5+rU80FxNTluFj8+yP2X7fmPO7l
 vTWT1Z6Zm6ZBAW5UX7oVVDc8DyRqnifihdGBTrHUgdrsyovmqWNuVUJ
X-Developer-Key: i=nuno.sa@analog.com; a=ed25519;
 pk=3NQwYA013OUYZsmDFBf8rmyyr5iQlxV/9H4/Df83o1E=
X-Endpoint-Received: by B4 Relay for nuno.sa@analog.com/20231116 with
 auth_id=100
X-Original-From: =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>
Reply-To: nuno.sa@analog.com

From: Nuno Sá <nuno.sa@analog.com>

The struct hwmon_chip_info was named ltc2947_chip_info which is
obviously a copy paste leftover. Name it accordingly.

Signed-off-by: Nuno Sá <nuno.sa@analog.com>
---
 drivers/hwmon/ltc4282.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/ltc4282.c b/drivers/hwmon/ltc4282.c
index f607fe8f793702da534902d3c3878581ac2bca1f..424fa9e3a0993f74d7bd1b2e3c98acd954217a98 100644
--- a/drivers/hwmon/ltc4282.c
+++ b/drivers/hwmon/ltc4282.c
@@ -1596,7 +1596,7 @@ static const struct hwmon_ops ltc4282_hwmon_ops = {
 	.read_string = ltc4282_read_labels,
 };
 
-static const struct hwmon_chip_info ltc2947_chip_info = {
+static const struct hwmon_chip_info ltc4282_chip_info = {
 	.ops = &ltc4282_hwmon_ops,
 	.info = ltc4282_info,
 };
@@ -1717,7 +1717,7 @@ static int ltc4282_probe(struct i2c_client *i2c)
 
 	mutex_init(&st->lock);
 	hwmon = devm_hwmon_device_register_with_info(dev, "ltc4282", st,
-						     &ltc2947_chip_info,
+						     &ltc4282_chip_info,
 						     ltc4282_groups);
 	if (IS_ERR(hwmon))
 		return PTR_ERR(hwmon);

-- 
2.49.0



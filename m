Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=178.251.229.89
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794574912;
	b=VL+nv47PB0ZgD9uNZTmveLJnVukpaGB7fMwITPA+7cZx/k4EU3VZS9IxVwhvZ30yn1KP
	 +SwUMN3h1xTxd6HUqBsf6lIbl5wGqUeiGr09DcvYnBc7raE15aY1tYX7SpNi9dFmDtMjz
	 pEafjrjbSgq/vLTCyJIRYxfpEjViztqbuAJuNe48+VJoegzMtm3QYfsraArik+JwYdZrp
	 /JnRyyOI9JPOmjrWTeLUrPKLAFYjuqAdZe4M6btbsv7M96eH0hfyTtTBaGNLRng3X6Vjs
	 uzVhXsjIpAFcDGZCDzpZaH7CiSfScnWb9SZdLWfeg5KN0fy73ldVdGcoz8efkVYl/bg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794574912;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=8K7TWrE0zlzKHFcjeJJ3+hvaQKNRuXY61ndJsd4qRU8=;
	b=IkjNLenD4xH7e3WWoqwTiKdkNvDx2r12ZJY8DvunBA8ohRZLeFRwC8koeo9/4ZXaobgZ
	 u5ISEUQWkJMcn2fv3LJKBvWKpw5ANmopXWb6elsEeIswF1sOCBVsM6ucyaZM2SrFpzWHY
	 EB8OvFQeSLKznoc24GQ7weDrOXfGRP0v9gGUiN7xKAhrO1ocgA1DIlhVKFePlG9wfZBuP
	 OAh4UZIjUSbYRXM+hmZ2bWx54Nwys4hd/1/d/tiLeMhGTsBsNZA1WdQDhlNKTGhKt1Z53
	 UhltesaGM7jkwC4jvPot4tFBrLULkNCNEzGeZbh/bNoC8k/B6Rnw0n9v6iPqZSkGofQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nabladev.com;
	spf=pass smtp.mailfrom=nabladev.com;
	dkim=pass header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=OTNkY+rV;
	arc=none smtp.remote-ip=178.251.229.89
Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D206606A895;
	Fri, 13 Nov 2026 13:01:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D206606A895
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=OTNkY+rV
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F366B10E6DB;
	Fri, 13 Nov 2026 14:01:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1794574906; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=8K7TWrE0zlzKHFcjeJJ3+hvaQKNRuXY61ndJsd4qRU8=;
	b=OTNkY+rVaUb/PDmm30Ju8W9t09BQ1gOXR34ZhLsT8BES9JfAcL4RitM76wpcYz1kj43Z96
	gmwfAuzUfQTliXAZ8EDgVXHmFMnlMki9oQwFoFDv5HFUHi7XOMZYX6qdLkC+EKuPDCXXlu
	ui7WstCBRLe7BftJ+wl+F0216P1CL3U52Sl3bprF2z2vh9Ael5p7Q4OPNe8YNFqpW9LoHD
	NFoyTZ6K30R1Mt0PwB59N4qRJX7VkI3sIjUcUA8NE3+TBhzX08HIZQlebuJPuAQ1ayxAtV
	/cWHdfBZjccSVoJEgwTu9uNSDLXSDR2aMr/ThS5REzSlE+3C8Kyj0DLRrx8huw==
From: Lukasz Majewski <lukma@nabladev.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukasz Majewski <lukma@nabladev.com>
Subject: [PATCH] hwmon: (lm77) Provide of_match_table to allow module auto loading
Date: Fri, 13 Nov 2026 14:01:33 +0100
Message-ID: <20261113130133.4094280-1-lukma@nabladev.com>
X-Mailer: git-send-email 2.47.3
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

When lm77 is built as a module and it is properly described in the
board's DTS file (i.e. with proper compatible) it is required to have
the in-driver compatible definition as well to allow automatic loading
of it.

Up till now the lm77 used I2C discovery fallback routine to bind it with
its name.

Signed-off-by: Lukasz Majewski <lukma@nabladev.com>
---
 drivers/hwmon/lm77.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/hwmon/lm77.c b/drivers/hwmon/lm77.c
index 1f8402be599c..440dd91de39d 100644
--- a/drivers/hwmon/lm77.c
+++ b/drivers/hwmon/lm77.c
@@ -336,6 +336,12 @@ static int lm77_probe(struct i2c_client *client)
 	return PTR_ERR_OR_ZERO(hwmon_dev);
 }
 
+static const struct of_device_id lm77_of_match[] = {
+	{ .compatible = "national,lm77" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, lm77_of_match);
+
 static const struct i2c_device_id lm77_id[] = {
 	{ .name = "lm77" },
 	{ }
@@ -347,6 +353,7 @@ static struct i2c_driver lm77_driver = {
 	.class		= I2C_CLASS_HWMON,
 	.driver = {
 		.name	= "lm77",
+		.of_match_table = lm77_of_match,
 	},
 	.probe		= lm77_probe,
 	.id_table	= lm77_id,
-- 
2.47.3


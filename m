Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 059C5442FB7;
	Thu, 13 Aug 2026 09:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786611917; cv=none; b=YU8TJRc3B5kZVkpVIcdwFv1wz1vt+vnqpz6xvZc+tIPYVlZGEzWHMNLQRyjPdy1BZsRMFSVCoQGTNhRUjC1f7sAWFlz11X1grjcprOHSeZq0HSZolgxKzbI7NuA1+MwJStM/+aGlAdRjl2psNNS2ShSawoTrgUGA92xLOcotuyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786611917; c=relaxed/simple;
	bh=Vaj3OZdk9rbiYChIyKhUtI+yViGYWOFSLcG0SzBwWzs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DuonbdfpPJBSxlCsVZ+RydGGilSCnbtovc2h2Ybu02RUrfxLVFzk8kPKKBM5ndQND5X/Wn4kjIxvu2AznTnQOqjXvxQcNyIV3lb5UaUvdgag6rp4AiQ9k1wy03ymrWZ7go9qg4EACm/j8SlZa2xptpRkrsxe2un0iEeY7PW6Qeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=DcUoh9MS; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="DcUoh9MS"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2D9AA11A88F;
	Thu, 13 Aug 2026 11:05:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1786611908; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=2yfSyig1+Stx6J9lMMKr+kfpNKisNOdQPMRM+gImrrI=;
	b=DcUoh9MSSbgBIxDumKQzPhFHrHeiIR0QU9RSu2woCNCCecd9bgmADOXcU3dgunCCKwfBN8
	n6ZT01b3j3UayNvEoiFUYg9kMnJFHm7Lsy2ye1WcEoar37UlrhSquWdVhKeGcxqIlidUNS
	McUklEj8NATxQIIGPMpk6l3nvnpeWpSHCu4M4xJXkyqGpBqtlxZNdELL7icqMh3TNDRXD1
	mujjpS5wXEPe+pIu6iWS0joOICrEohkVsMdgLEwTxgzKYZ6WX4aWK7y4A0mUVsFmyHj2rq
	8A1tQp46gnsiXgBBKwPxF+ZqJFe+HOe1dukshkBcJqt4vTh9KDsVmQ5dmoE93g==
From: Marek Vasut <marex@nabladev.com>
To: linux-hwmon@vger.kernel.org
Cc: Marek Vasut <marex@nabladev.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Flaviu Nistor <flaviu.nistor@gmail.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] hwmon: (tmp102) Add TMP113 device ID
Date: Thu, 13 Aug 2026 11:04:24 +0200
Message-ID: <20260813090456.70816-2-marex@nabladev.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260813090456.70816-1-marex@nabladev.com>
References: <20260813090456.70816-1-marex@nabladev.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

The TMP113 temperature sensor part is register compatible with TMP102,
add non-DT I2C device ID. Unlike TMP102 and TMP110, the TMP113 does
have additional unique ID registers, those are currently unused.

Signed-off-by: Marek Vasut <marex@nabladev.com>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Flaviu Nistor <flaviu.nistor@gmail.com>
Cc: Guenter Roeck <linux@roeck-us.net>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-hwmon@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/hwmon/tmp102.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hwmon/tmp102.c b/drivers/hwmon/tmp102.c
index 26c461e95175b..50a8b050d8da1 100644
--- a/drivers/hwmon/tmp102.c
+++ b/drivers/hwmon/tmp102.c
@@ -397,6 +397,7 @@ static DEFINE_SIMPLE_DEV_PM_OPS(tmp102_dev_pm_ops, tmp102_suspend, tmp102_resume
 static const struct i2c_device_id tmp102_id[] = {
 	{ .name = "tmp102" },
 	{ .name = "tmp110" },
+	{ .name = "tmp113" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, tmp102_id);
-- 
2.53.0


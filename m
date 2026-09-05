Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 854D421D3F5;
	Sat,  5 Sep 2026 13:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788615442; cv=none; b=Snw9CyAGmcffkL4ijIqHpw/9XxBKFn5qpne9xmez1Dib2Fw84A3rhUPrMlM2uJxzTEai+GMznxZYF9hXns/BwzA0SMYFSpFwi48tmwXGI/8MuRrHSuNum1MC5yHyww+ZNh3NKdIM8RR2oALmsrQrNBG93SH0hkdAWD9CUh6toBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788615442; c=relaxed/simple;
	bh=P1u2fFKgfayW7Sc2o+njrNv5I1uN7OIbekjZfu3Gqes=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fG2dSXGc3Apnc8Ao6eUOVub4mh5vLtxkT4+N0rDdCjm1yQX/gt56AZcOqJRBpy/cPmPXaKvbSDlyCmYQ2ZJZ0AdbixDBm2TOg/50NfI7biKkNmcjz7meAf3E8TJDSJbyCRIdPR/zM8a9uapLEDh7NXdJTlymkjTMNiwHUGEtn6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=Q+k/XXmo; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="Q+k/XXmo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=42
	+naHTRsBt/1Spz8K7iG3SN5r3dSesb/vS94fdRXbM=; b=Q+k/XXmoItzflwC6TM
	9n7xQvNrnc9GAYTjajtmTTPhD41GiceElajZMz8+0XNzyf6sC8gvSd9Vmx7dDwiI
	4dT7jYVMjvw1CI8FF8+7JgVUvFhpYv4Lmyn+OGinAQYpslj9yXmmy78h2sB2/EBH
	yyfTUSDIxR+tiUFLHgSvS/+bI=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wCX6bjtGpxqjUfoAg--.7181S2;
	Sat, 05 Sep 2026 21:36:46 +0800 (CST)
From: "hpp.iscas" <hppiscas@163.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: "hpp.iscas" <hppiscas@163.com>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Naresh Solanki <naresh.solanki@9elements.com>
Subject: [PATCH] hwmon: (max6639) Publish the OF module alias
Date: Sat,  5 Sep 2026 21:36:43 +0800
Message-ID: <20260905133643.65365-1-hppiscas@163.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-CM-TRANSID:_____wCX6bjtGpxqjUfoAg--.7181S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrKFyxWr4DWw1kKw1fAFW3Awb_yoWfWFX_Ca
	1UZrWxWr92kFn5GF1Yvr95Z34UKr4Du3Z7JrySqr9xZ348ZrW5ZrsavrnFqayUGrWUAa4j
	9Fn5Xr4xCanxZjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUU3fH5UUUUU==
X-CM-SenderInfo: 5kssx2xfdvqiywtou0bp/xtbC7g6DTGqcGu5hwwAA3P

The MAX6639 I2C driver matches Device Tree devices through=0D
max6639_of_match, but only publishes its I2C ID table. The I2C core=0D
emits an OF modalias for a Device Tree client, which does not match=0D
the legacy i2c:max6639 alias.=0D
=0D
Publish the existing OF table; retain legacy I2C detection.=0D
=0D
Fixes: f11e27383c12 ("hwmon: (max6639) Add compatible string")=0D
Signed-off-by: hpp.iscas <hppiscas@163.com>=0D
---=0D
 drivers/hwmon/max6639.c | 1 +=0D
 1 file changed, 1 insertion(+)=0D
=0D
diff --git a/drivers/hwmon/max6639.c b/drivers/hwmon/max6639.c=0D
index dd5f4b3..bf92361 100644=0D
--- a/drivers/hwmon/max6639.c=0D
+++ b/drivers/hwmon/max6639.c=0D
@@ -790,6 +790,7 @@ static const struct of_device_id max6639_of_match[] =3D=
 {=0D
 	{ .compatible =3D "maxim,max6639", },=0D
 	{ },=0D
 };=0D
+MODULE_DEVICE_TABLE(of, max6639_of_match);=0D
 =0D
 static struct i2c_driver max6639_driver =3D {=0D
 	.class =3D I2C_CLASS_HWMON,=0D


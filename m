Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74C1E330D4C;
	Sat,  5 Sep 2026 13:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788615506; cv=none; b=eZ+OmCKvA4EAJJgV3hRX8uXh6upJyc2+cDb7HFL+ptE3H02J0Z0sbnXOnsxH2b/OER+s11eh6UEtYZAP+HyI58ePkMa4CYWKBCCGLvxHMnyTj/TqGREqZ7Cs2xFRHeZH35Q5s7IzNtQbcsPZt3XxIOY+822EflCE/IrGLRe0Itg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788615506; c=relaxed/simple;
	bh=XjZN9qwyW/FUFL1VNm9JNjZkf2IKMPMxJ2eRyGcJvUo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CVJ5f6ZI0H49aEM3W7j6PHjoRR9jH/30LPCUsUX3X2uEUML014jBNiOPq7rjz5F1F/YeN1XgAF2NiqbX0UJh5Ru+5Om4ATyTW0ZYLmu0FST4HWAwxbjdZLLRQ7LlNty6rLpbXrGi+RufwJ5iVydiLn3LqqhCsHp73spYtILtlPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=i8HeJIgu; arc=none smtp.client-ip=117.135.210.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="i8HeJIgu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=e1
	aUrh6XcAxcSn80p44qSD2s+VJ1fDi7YxQ58ctkMaQ=; b=i8HeJIgu/ETFXL2JFa
	xfY2bCg4T/XxP3GBG3skHVJIJGJX0OpU+rBEKCK4tPCn31wwfmD8SAuPQ6wWAlNd
	CnWItLqEapF9MrEOyv2P5KAOvsln0vGBl2Eh2OjMiTFlVv38vbDBfTgjrg2ypgxh
	A8wrlGuznhDapUzji791dCyxQ=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id _____wAnT4I7G5xqBlZvAw--.12445S2;
	Sat, 05 Sep 2026 21:38:03 +0800 (CST)
From: "hpp.iscas" <hppiscas@163.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: "hpp.iscas" <hppiscas@163.com>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Peter Yin <peteryin.openbmc@gmail.com>
Subject: [PATCH] hwmon: (xdp710) Publish the OF module alias
Date: Sat,  5 Sep 2026 21:38:00 +0800
Message-ID: <20260905133800.65749-1-hppiscas@163.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-CM-TRANSID:_____wAnT4I7G5xqBlZvAw--.12445S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Xr4DGry8Ww15CF17GFyrtFb_yoWfWrgEkr
	45XFZ7uF40krsYkw1FkFy5u34kt34FgFn3GFsaqan8Z34UXrn8ZFWqv347Xw13CrWUtFnx
	Ga15W3Z5uF47KjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUU3fH5UUUUU==
X-CM-SenderInfo: 5kssx2xfdvqiywtou0bp/xtbCxhuWX2qcGzserAAA3w

The XDP710 driver registers xdp710_of_match, but only exports its I2C=0D
ID table. Device Tree clients emit an OF modalias instead of the=0D
legacy I2C alias.=0D
=0D
Publish the existing OF table to make module selection available for=0D
that enumeration path.=0D
=0D
Fixes: 35fe06d94e39 ("hwmon: (pmbus) Add support for Infineon XDP710")=0D
Signed-off-by: hpp.iscas <hppiscas@163.com>=0D
---=0D
 drivers/hwmon/pmbus/xdp710.c | 1 +=0D
 1 file changed, 1 insertion(+)=0D
=0D
diff --git a/drivers/hwmon/pmbus/xdp710.c b/drivers/hwmon/pmbus/xdp710.c=0D
index 494dbe4..bd062d1 100644=0D
--- a/drivers/hwmon/pmbus/xdp710.c=0D
+++ b/drivers/hwmon/pmbus/xdp710.c=0D
@@ -108,6 +108,7 @@ static const struct of_device_id xdp710_of_match[] =3D =
{=0D
 	{ .compatible =3D "infineon,xdp710" },=0D
 	{}=0D
 };=0D
+MODULE_DEVICE_TABLE(of, xdp710_of_match);=0D
 =0D
 static const struct i2c_device_id xdp710_id[] =3D {=0D
 	{ .name =3D "xdp710" },=0D


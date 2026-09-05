Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B96221D3F5;
	Sat,  5 Sep 2026 13:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788615468; cv=none; b=tKjpgh1Qn0iVW1DddJ++zixu5KEqWjDesrduvV23psd2pg7oRPyixPiOLkoYUV5RKZJBhwVU+c1Bqb9qS9kjpFoK2PQOlPFYndZjjK/+rZ34sebsj6bzrkN2x8QmB5pRFjA0mYu/LgjHRzh3EnLZRtoCAtXmteLRO4u2UF8Be6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788615468; c=relaxed/simple;
	bh=Bo7wnzc06+/h1sc2aD1ibZOARhrPjuqUq2uD3QNdgrc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=u60A0FVq9Jb0RP57qtwG5svMw/Hm/DKgojf/BkI7aNIFQCRPiHEjLNMjrIZevWX6OltdmiorDodj4CQwr1DLbrXoFczA3qNkaCjXEub5DNYq+NGxKgpOZfunP0X6mZ4vyTBzdNDEJxsACcU4ob2CNtgpxbYgOoAtkfy1R/1Jts4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=EKdBwLmF; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="EKdBwLmF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=js
	t5nUyUes4hGh//o57pI8T6Y4K9M31FmEpAUdIqUvU=; b=EKdBwLmFqTMypddDj6
	9xdRdmWiHshFRLk8OcATOA3iMneDOVQv36WxSEEtrS0sI+nOSh7t4PXWXSoeaGGI
	dOjcU2l2HXkO7RvGhDgcPG7Cn26dtjjODJsIlFrk37FpISfTujB7kkeeOnabPJxL
	9YH5EJja5MLW1kvYqCh1iqeRM=
Received: from localhost.localdomain (unknown [])
	by gzsmtp3 (Coremail) with SMTP id PigvCgA3__0TG5xqnMlkRA--.15135S2;
	Sat, 05 Sep 2026 21:37:24 +0800 (CST)
From: "hpp.iscas" <hppiscas@163.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: "hpp.iscas" <hppiscas@163.com>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Peter Yin <peteryin.openbmc@gmail.com>
Subject: [PATCH] hwmon: (mp5990) Publish the OF module aliases
Date: Sat,  5 Sep 2026 21:37:21 +0800
Message-ID: <20260905133721.65588-1-hppiscas@163.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-CM-TRANSID:PigvCgA3__0TG5xqnMlkRA--.15135S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7GF45Cw47Kw48ZrW5Gr1fCrg_yoWfCFX_u3
	9rXrsxXr4fCFs8K3ZYk343uFWqvF45WF1kJF1IqFZ8Zr97Xrn8ur9avr17Awn7WrW8C3Zr
	XFsrWr4vkF429jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUU3fH5UUUUU==
X-CM-SenderInfo: 5kssx2xfdvqiywtou0bp/xtbCxhSNVmqcGxQcpAAA3I

MP5990 and MP5998 Device Tree clients are matched through=0D
mp5990_of_match. Only the I2C ID table is currently published, although=0D
Device Tree clients emit OF modalias events.=0D
=0D
Publish the existing OF table without changing PMBus operations or=0D
per-chip match data.=0D
=0D
Fixes: ce0742404ad7 ("hwmon: (pmbus) Add support for MPS Multi-phase mp5990=
")=0D
Signed-off-by: hpp.iscas <hppiscas@163.com>=0D
---=0D
 drivers/hwmon/pmbus/mp5990.c | 1 +=0D
 1 file changed, 1 insertion(+)=0D
=0D
diff --git a/drivers/hwmon/pmbus/mp5990.c b/drivers/hwmon/pmbus/mp5990.c=0D
index f8a5d1b..d514395 100644=0D
--- a/drivers/hwmon/pmbus/mp5990.c=0D
+++ b/drivers/hwmon/pmbus/mp5990.c=0D
@@ -213,6 +213,7 @@ static const struct of_device_id mp5990_of_match[] =3D =
{=0D
 	{ .compatible =3D "mps,mp5998", .data =3D (void *)mp5998 },=0D
 	{}=0D
 };=0D
+MODULE_DEVICE_TABLE(of, mp5990_of_match);=0D
 =0D
 static struct i2c_driver mp5990_driver =3D {=0D
 	.driver =3D {=0D


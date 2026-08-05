Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B9733043CF;
	Wed,  5 Aug 2026 02:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785895559; cv=none; b=fWPFXgZG8KjJAdGzDcj6hNVo1bvVVr9uL++Lxe0xuhmm4UrtL4UZ4o7UPM2t2lOjy/VuA41+8JVlmlOln4gEcT2pxJ9kCuC9p9kpQh09r3mHAeQRhQfr9elnxA8R5JKuoQBJOrsDVf+kV+tEh54nN6kcR9tr2KugY2nFrJBu654=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785895559; c=relaxed/simple;
	bh=NZuSmd4eyh+yw/nRQXpm9y3lIAFZhYvw6Oe0MKc4ypM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=k6xZrxvbJ044mC0pRAyLiYDFeiVpyG9cBcstwHZI0fN2RkG9IH6jmOF3FvMNdFlZAev13W/HIBL6H+mVD7ZC7WqbD52lRra8MPkdn0CzXb55bdtLstWfho1UOaB4aP/3J7OfLcyuL6+6vq9hTcfib7v0u7nX9ny+oIJufLngB/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=TwqAeKVK; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="TwqAeKVK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=+L
	onZLi2huiBawDam5KLgmJ0teXSn4XMl3CsfYsPxEE=; b=TwqAeKVKwrme6iftNG
	t8KRmFgY6IeV5wwG/lH2gWfTQFnasQ5fLmUbfbyvCO/ZA5vfQgGONyQ5UlficRl7
	2QOmcSKvQpRp3xTUzmR4JtwHb7NJvvfoMdZlwk3BqXolEQz825CNdE6ODtnWdtuJ
	Hc+RSATyI3SnlJqaQr6gqKPcs=
Received: from localhost.localdomain (unknown [])
	by gzsmtp2 (Coremail) with SMTP id PSgvCgD3P_5VmnJqNll1Jw--.15541S2;
	Wed, 05 Aug 2026 10:05:10 +0800 (CST)
From: Qingshuang Fu <fffsqian@163.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Sam Povilus <kernel.development@povil.us>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Qingshuang Fu <fuqingshuang@kylinos.cn>,
	Qingshuang Fu <fffsqian@163.com>
Subject: [PATCH] hwmon: (ads7828) Properly handle -EPROBE_DEFER from devm_regulator_get_optional()
Date: Wed,  5 Aug 2026 10:05:06 +0800
Message-Id: <20260805020506.958722-1-fffsqian@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PSgvCgD3P_5VmnJqNll1Jw--.15541S2
X-Coremail-Antispam: 1Uf129KBjvJXoWrtry7ZryfZw47uFWDKr1rJFb_yoW8Jr15pr
	4kGas09rn8tr47XF48Aa4Fv3WSv3WqyFWfGFW5C3s0gF15Jr93Zry7KFyjgF12y3yfWw12
	qFWkJayUGa47AFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pRvfOOUUUUU=
X-CM-SenderInfo: 5iii21xldqqiywtou0bp/xtbC6hbyvWpymlYToQAA3V

From: Qingshuang Fu <fuqingshuang@kylinos.cn>

When devm_regulator_get_optional() returns -EPROBE_DEFER, the driver
currently ignores the error and incorrectly falls back to internal VREF,
even if an external vref is defined in device tree.

This could lead to conflicting voltage sources on the VREF pin and
inaccurate ADC readings.

Check for -EPROBE_DEFER explicitly and return it to trigger probe deferral.
Treat other errors (such as -ENODEV) as "no external vref" and use internal
reference.

Fixes: a8ddfea09566 ("hwmon: (ads7828) Accept optional parameters from device tree")
Signed-off-by: Qingshuang Fu <fuqingshuang@kylinos.cn>
---
 drivers/hwmon/ads7828.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/hwmon/ads7828.c b/drivers/hwmon/ads7828.c
index 149cfcec78dc..1c4a04cb023c 100644
--- a/drivers/hwmon/ads7828.c
+++ b/drivers/hwmon/ads7828.c
@@ -133,6 +133,8 @@ static int ads7828_probe(struct i2c_client *client)
 			    vref_mv > ADS7828_EXT_VREF_MV_MAX)
 				return -EINVAL;
 			ext_vref = true;
+		} else if (PTR_ERR(reg) == -EPROBE_DEFER) {
+			return PTR_ERR(reg);
 		}
 	}
 

base-commit: c21bb4193868a8de71fc4693fa741e195fdf5d86
-- 
2.25.1


Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D68A2EA732;
	Wed,  5 Aug 2026 03:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785898912; cv=none; b=lR4uYPUigMs3EnOOWeasfuJ+XYI6JTmEzd5JUzwKy13QlyWTWIWxFcKkigP0n0RGxwmpf/+aurLrPrWQCgBvdU/jJFwWyqa0T4HtvPfK5bsqI3+vqaPIH+t2DA2z2Qktb7lzQmxnnZUQPnpir856I46I66jJy3nlEP/Tv6DRvh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785898912; c=relaxed/simple;
	bh=bc4e2mXx7O2CiRRy37KVx1z2OoeIczyJ5G/A70GJU6w=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Ns1uffC47/BLuEKRxmTKStPBlsjrOi+o8bEqig3IMgbSwbr/cPZL96WY7e1hy4M25Vjv3srHPBIC10b5jv67h5a3SFjPU0jV9iPOBp0IvLUFXzfGtlCsk1EYUdMv4hUeoFInrsG3r6pXurSWdqN36xf/pavH0ifr8DmO2hEq0q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=INe7MCV0; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="INe7MCV0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=XT
	sF0zxBXBlXQhVzFyV5qF0EmwL6Q6ttB+WOyUt7TZk=; b=INe7MCV0Z28SpwQl7T
	52LhP4Lh4H+/gB+srlarhsBaETc+QBltyAHKrAjOLiso/rYUtzQrliiFFKBXRgM9
	xh38lBNnQy0qdI0W/g7TdIsN90brjcTessyWwK3ZoJroJ46KoMmRs3xdOYco5HDS
	0Y3aTQQhOYMXB/wl/wVTlxnTs=
Received: from localhost.localdomain (unknown [])
	by gzsmtp2 (Coremail) with SMTP id PSgvCgAHG4xsp3Jq1d57Jw--.16162S2;
	Wed, 05 Aug 2026 11:01:01 +0800 (CST)
From: Qingshuang Fu <fffsqian@163.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Sam Povilus <kernel.development@povil.us>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Qingshuang Fu <fuqingshuang@kylinos.cn>,
	Qingshuang Fu <fffsqian@163.com>
Subject: [PATCH v2] hwmon: (ads7828) Don't ignore errors from devm_regulator_get_optional()
Date: Wed,  5 Aug 2026 11:00:56 +0800
Message-Id: <20260805030056.1082745-1-fffsqian@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PSgvCgAHG4xsp3Jq1d57Jw--.16162S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7uw4xWw4fJw47Wr4rZF1UKFg_yoW8XFy7pr
	WkWFZrur1kJr429F4qyayava4Sv3WDJayrCF48uwn0g3W5JFyxZr98Gry09F17Z395uw12
	qrWkt3WUWa9rZaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pEAhLUUUUUU=
X-CM-SenderInfo: 5iii21xldqqiywtou0bp/xtbC6Q08B2pyp22TGAAA3G

From: Qingshuang Fu <fuqingshuang@kylinos.cn>

The driver currently ignores all errors from devm_regulator_get_optional()
and falls back to using the internal VREF. This is incorrect for errors
other than -ENODEV:

- -EPROBE_DEFER: the external regulator will be available later; retrying
  probe avoids a voltage conflict between internal and external VREF.
- -ENOMEM, -EINVAL, etc.: genuine failures that should be propagated, not
  silently ignored.

Only -ENODEV (no regulator specified in device tree) should trigger the
fallback to internal VREF. Propagate all other errors to the caller.

Fixes: a8ddfea09566 ("hwmon: (ads7828) Accept optional parameters from device tree")
Signed-off-by: Qingshuang Fu <fuqingshuang@kylinos.cn>
---
Changes in v2:
- Broaden the error check to handle all errors except -ENODEV, instead of
  only checking for -EPROBE_DEFER. This addresses the Sashiko AI review
  concern about masking genuine errors like -ENOMEM and -EINVAL.

 drivers/hwmon/ads7828.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/hwmon/ads7828.c b/drivers/hwmon/ads7828.c
index 149cfcec78dc..1c3a8ce8afb5 100644
--- a/drivers/hwmon/ads7828.c
+++ b/drivers/hwmon/ads7828.c
@@ -133,6 +133,8 @@ static int ads7828_probe(struct i2c_client *client)
 			    vref_mv > ADS7828_EXT_VREF_MV_MAX)
 				return -EINVAL;
 			ext_vref = true;
+		} else if (PTR_ERR(reg) != -ENODEV) {
+			return PTR_ERR(reg);
 		}
 	}
 

base-commit: c21bb4193868a8de71fc4693fa741e195fdf5d86
-- 
2.25.1


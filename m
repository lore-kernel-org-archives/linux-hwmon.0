Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1901537F723
	for <linux-hwmon@vger.kernel.org>; Tue,  3 Mar 2026 15:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.202.193.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772551845; cv=none; b=OF0XEXAE+uXEMtrGoEUpInxAc04ek8A7q9EU76zXmsiT2WhDffYwmRSIEw2Jl/iOlqS6KmvjOjMiOLYwQZ/wfXW52wktTp4lZBkuUc9a0SzRyeb136TevSr6FJADTg83aseiyoVsKpBvckt3F9okEk9SmFQE3L9OG9DNVY8o6IY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772551845; c=relaxed/simple;
	bh=TkDPy57JJENHLScxTPp9/JmTdix2S86/yQKqgPoBsVs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Wc15QRDnVSwaEKGhEkmrE71qso1FeGsuql0HQWBQE6XPU7iBh//9aN2DF7/PkWCw5PCRc7qHrHEg9OligKMhSq7UMYk0wgcUdj+PxmQ3/MihakIgBCnVOWkD5ZvJ2KHy4IWkbKVWZ5MpSB9qnjPVNLYz4MwXTIQT0y9e/mFSnDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=turingtested.xyz; spf=pass smtp.mailfrom=turingtested.xyz; dkim=pass (2048-bit key) header.d=turingtested.xyz header.i=@turingtested.xyz header.b=YSqji1Xc; dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b=j2OudEZL; arc=none smtp.client-ip=34.202.193.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=turingtested.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=turingtested.xyz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=turingtested.xyz header.i=@turingtested.xyz header.b="YSqji1Xc";
	dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b="j2OudEZL"
Authentication-Results: purelymail.com; auth=pass
DKIM-Signature: a=rsa-sha256; b=YSqji1XcSDexGsHzhiVIZIAKWmrDYZ6fudDNTxPG2kA2NcxANGT5mq3DP+sOHWnvDiA8LMaMO8wXEVlxgMwFPCvzhWvhIFf3tuqwmCPiaQ80knPIK1sD9RYbt4PKQyzYtfBW5esXJfSA99jLl7CQCrNudplcSui6Yi0NNmEvibD8YDssd6l51mXNKxtOLvCZGrwJvHST8+NXucyz4IJABrH9lAbsyEtZRBNAC/WfS8NFGUikPVrJmFqaQfJO5kQQCkBzdb2v2uLuP8bt8KFLY7mCIj8bCuamD/OtL573Hw1I6JCVaYfTWULFTjsTReg0N5eQ3fuN8ztij1np3TrSAA==; s=purelymail3; d=turingtested.xyz; v=1; bh=TkDPy57JJENHLScxTPp9/JmTdix2S86/yQKqgPoBsVs=; h=Received:From:To:Subject:Date;
DKIM-Signature: a=rsa-sha256; b=j2OudEZLApOJciRqkE1eQxyar7ffJoLg7jlTCi39AfpCpXLOOgMbgaz0hjmujZ4preLE4f6prxxDmnhL1vcIDV27X9+ZhIGvlhyvc3rp/E2c8cJ8GLQwq6yfrP/sfsZ6ksmjm4fjADtdiVPHgK/KgdSmdmar7znws3PRJ3EGHYv0mbIH9GHknbOhKBNyRTHdtwlmQlZXVfRuahoEe55fe/VLaazh1DsiiMZXEv9JzfXjJgJGfzUOiArolwdGJ5pzvintiaK6ST9qlnv6QfX5VLcrwM8rFUG4jkCO8EnSWmQiha/oYR/pLn41dzgpO+uR/grR4MxjIJQVSftv4siexQ==; s=purelymail3; d=purelymail.com; v=1; bh=TkDPy57JJENHLScxTPp9/JmTdix2S86/yQKqgPoBsVs=; h=Feedback-ID:Received:From:To:Subject:Date;
Feedback-ID: 591296:32372:null:purelymail
X-Pm-Original-To: linux-hwmon@vger.kernel.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1527508952;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Tue, 03 Mar 2026 15:30:40 +0000 (UTC)
From: Amay Agarwal <tt@turingtested.xyz>
To: linux-hwmon@vger.kernel.org
Cc: linux@roeck-us.net,
	linux-kernel@vger.kernel.org,
	Amay Agarwal <tt@turingtested.xyz>
Subject: [PATCH v2 4/5] hwmon: (max6650) Replace sprintf() with sysfs_emit()
Date: Tue,  3 Mar 2026 20:54:55 +0530
Message-ID: <20260303152456.35763-5-tt@turingtested.xyz>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260303152456.35763-1-tt@turingtested.xyz>
References: <20260303152456.35763-1-tt@turingtested.xyz>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
Content-Type: text/plain; charset=UTF-8

Replace sprintf() with sysfs_emit() when writing to sysfs buffers.

sysfs_emit() performs proper bounds checking and is the preferred
helper for sysfs output.

No functional change intended.

Signed-off-by: Amay Agarwal <tt@turingtested.xyz>
---
 drivers/hwmon/max6650.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/max6650.c b/drivers/hwmon/max6650.c
index 9649c6611d5f..56b8157885bb 100644
--- a/drivers/hwmon/max6650.c
+++ b/drivers/hwmon/max6650.c
@@ -27,6 +27,7 @@
 #include <linux/hwmon-sysfs.h>
 #include <linux/err.h>
 #include <linux/of.h>
+#include <linux/sysfs.h>
 #include <linux/thermal.h>
=20
 /*
@@ -312,7 +313,7 @@ static ssize_t alarm_show(struct device *dev,
 =09=09mutex_unlock(&data->update_lock);
 =09}
=20
-=09return sprintf(buf, "%d\n", alarm);
+=09return sysfs_emit(buf, "%d\n", alarm);
 }
=20
 static SENSOR_DEVICE_ATTR_RO(gpio1_alarm, alarm, MAX6650_ALRM_GPIO1);
--=20
2.53.0


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.151
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794379853;
	b=0qmOw64dHauJtKA69DFUFZq5UMYguhXJPg0Q51gUZ9vi0khTaUZlescplc9D2e/W3PoU
	 fyhSuLOfh69c4cHyznn2J2AbXt5innPxM74UqwmVMd/MsmEz1HYjuz32Dc1y8PS8QJ2dM
	 zKExul3fO0vD1NCFmxoBvn4QjuCYvAJlBt7RavM7VNYXBX+UVcqKefBjClEQ9forOEarD
	 EBdr04XuaYWUkasxABvf/v5bcSIuIj7aTcnU8g4TGm2J3ePkIAIgWYUktEApWNcMa/jWC
	 P+NULxd961YPm4LFGVXtckix0a73kMys7qFMUo0yAdRzy/px8LsYFKEJsxWqnBFVIhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794379853;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=CfT2Wr6z7AWTb3WOWmEzVVdNhJAIxNjTc4zn+nrJzBM=;
	b=L0eSYzlu3Zna5/kRafFQkzthERj75RkoO0LBVXCLwttFC8wr2OAL0UFlp4yCDFUphIqn
	 UxtyLH2PpV4pF9p7nMYBua2EhWXXbknNPkpP4HLUI5wCr879PXZwUno9JSnt30WedYPld
	 1ybXV76pQnrLEHjWr7RYILba/s6BXY2dXJKYJ+GMOGxav1eZ3nBhTt3MEuFnUIbnfdY90
	 uCYf0V2BFei6fNDrLyFF5Ur4A5fuw03Ibw+Iiv+etuAFThbKVOy0R7aunZ0JdTyOXN57M
	 plbwqjx/q6KbykzsvgR1fkNGXajKN2k7ZfJ2SwjHDsVzshxifyQPFCuo8s+qBnhh+wQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=Vwgn9Dkm;
	arc=none smtp.remote-ip=111.22.67.151
Received: from cmccmta8.chinamobile.com (cmccmta8.chinamobile.com [111.22.67.151])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 899BA606A32A;
	Wed, 11 Nov 2026 06:50:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 899BA606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=Vwgn9Dkm
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=Vwgn9Dkm1+ub8UC9iy8LhK653+F6XTeC60wGhgN0YKlnbdYgLsGiWys6YMjk/O2jyf+y5b8TGoNuI
	 WK4QklQms66bLF4wzK2gpxCYJn8MDoKdh7WyKtIrqpsjNt6uJv664OffMD1LwwgBpb+583pNmyXGxs
	 lkiwLZ/4z530ouF0=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app06-12006 (RichMail) with SMTP id 2ee66af40ffb212-a1e3a;
	Wed, 11 Nov 2026 14:49:31 +0800 (CST)
X-RM-TRANSID:2ee66af40ffb212-a1e3a
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from devin-VMware-Virtual-Platform.localdomain (unknown[10.55.1.72])
	by rmsmtp-syy-appsvr05-12005 (RichMail) with SMTP id 2ee56af40ffaa93-d1ece;
	Wed, 11 Nov 2026 14:49:31 +0800 (CST)
X-RM-TRANSID:2ee56af40ffaa93-d1ece
From: Zhu Jun <zhujun2@cmss.chinamobile.com>
To: ckeepax@opensource.cirrus.com
Cc: rf@opensource.cirrus.com,
	linux@roeck-us.net,
	patches@opensource.cirrus.com,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhu Jun <zhujun2@cmss.chinamobile.com>
Subject: [PATCH] hwmon: (lochnagar) Avoid oversized shifts for zero readings
Date: Wed, 11 Nov 2026 14:49:30 +0800
Message-ID: <20261111064930.17408-1-zhujun2@cmss.chinamobile.com>
X-Mailer: git-send-email 2.51.0
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

A zero IEEE754 reading gives exp = -150 in float_to_long(). Both shifts
in the rounding expression then exceed the width of u64. UBSAN reports a
shift exponent of 149, and the conversion can return a nonzero reading.

Return zero when the required right shift is at least 64 bits. With the
supported precisions, the scaled mantissa is too small to round up in
this case.

Fixes: 4cdb56214746 ("hwmon: lochnagar: Add Lochnagar 2 hardware monitoring driver")
Signed-off-by: Zhu Jun <zhujun2@cmss.chinamobile.com>
---
 drivers/hwmon/lochnagar-hwmon.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/hwmon/lochnagar-hwmon.c b/drivers/hwmon/lochnagar-hwmon.c
index 24a255d4c46b..328589e19917 100644
--- a/drivers/hwmon/lochnagar-hwmon.c
+++ b/drivers/hwmon/lochnagar-hwmon.c
@@ -74,6 +74,8 @@ static long float_to_long(u32 data, u32 precision)
 
 	if (fls64(man) + exp > (int)sizeof(long) * 8 - 1)
 		result = LONG_MAX;
+	else if (exp <= -64)
+		result = 0;
 	else if (exp < 0)
 		result = (man + (1ull << (-exp - 1))) >> -exp;
 	else
-- 
2.51.0



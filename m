Received: from out162-62-58-211.mail.qq.com (out162-62-58-211.mail.qq.com [162.62.58.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16A344071CF;
	Mon,  8 Jun 2026 01:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.58.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780882829; cv=none; b=LXC1RlEyUyvpgIqAohyK/NHZ62FX7K2EZqtuOY20ZKh95Tdnha9Oj/Bpv2y759xal7stb6cApjDW/aZa+nD7VC2d+Cfjz8mCFEWYG0uDVLEeSOlkoxlXuPcQqRYUF99kZf+gx3mR/Xa4n9i4DXxCrJucltUdZdZs73ftEsJPjno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780882829; c=relaxed/simple;
	bh=j9BXYPqzg30V5o/lHUKxSDJSB95390VMq4rMLONhjME=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=bzeMtMAA3d5OwqjSMVFbspOnJiyxL5yqT7DI++S8kx3qe9bxe+O8YLn2xHpxsV7gcdhuj2TZ2rZQambmnT9giPReBZroMwcSALaEGPfSji1DCk+eJZRWBbCxRTDYxOBcHK1s3wiH0iKkwg/OXeF17DuPETgc5TWhkLi2Dw/zx5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com; spf=pass smtp.mailfrom=foxmail.com; dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b=mJJbixDe; arc=none smtp.client-ip=162.62.58.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foxmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b="mJJbixDe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1780882818;
	bh=oiFqpZ4/HmcsJN0lFaNv0NBhds3ekDO3BTswC1n33Rc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=mJJbixDe46TjxixB9pWKoczWNM8514OYMmE09SLTb+uoplfykrZZp1myxDhcNh5HJ
	 8Ah3Mt/gSHzfk6qRYCvJPM+ag/Ew4hz5HVNtT+fpaY79vjSnxW33Pzw/2RxJ2+GcUA
	 V/LeWxs9G7nAFsWoC4FL4FJy3dIOfMVvpsAAn+FY=
Received: from localhost.localdomain ([116.128.244.169])
	by newxmesmtplogicsvrszc43-0.qq.com (NewEsmtp) with SMTP
	id A0E980F7; Mon, 08 Jun 2026 09:40:14 +0800
X-QQ-mid: xmsmtpt1780882816tcmfvizp9
Message-ID: <tencent_BEAA4E485EAFA713FF395F57AC083EEE3507@qq.com>
X-QQ-XMAILINFO: Mg/13mbJq/RuUYAbm62BNCfMoHlSnyOwxQPLsGp2DM5IBWLV+VHoeoV8JEq1mv
	 vTcayGTX/TcMtY477M77I4WciywqZgs7IhCoGQZ7h0iCI3kCH1b9Bv13B4La6xPDRFFXz9L00hpa
	 KwY/PXQPfrDwy+2bpoHZ9AYs7AMqTAhrq203NpJjJN3UHv6hkXwCChtCLdmkoCrZhwkAJscFH493
	 GQz10XdJvPvy6m8uOrVH0ItZhZMrWSPKCRRwtYBKT1swIc/wEY7ym4aYV2n4cLDhMat8kgtpED18
	 qmIjNOoy7QFBQw8R1GrwBRDXZ2z3lRSurhUM3We2p4bLPrcoBvfBclBPeqmICxEPTXO6XrYrwPXC
	 fuJL8VTSFXQPHVQb/h4L/r+igPvJaFpJP0HkstBM12ta5tudSY3hWCGT8JEwjIUPNehZuze6vykr
	 x6iAMePYX+KEPt7tBq8ArFBV2ZgGDs7iA3t03Htg80Jck8U93dVSksXfbsoklifvhg5coK9VfUpt
	 4kpXyhoFAsMw6iHIF8liPPNRrr9XThaju+BndtbOp79Uc4WJaaw35GSBsfTXRAqHEG0AEJZ9iPVO
	 AZPdhEljCqrf/vOvNWEmWn46Tf/6M/822nh6h63CBdqu0i3WNbtJHerqaIjRWI5I8yMGcSjBL/yY
	 miK24xBt5gAePDXyVZspsB6RJHpl+KpatbbNYhu0Mp0IPSYbKa6giwxeBH8tVhZDZzurtq7dy5Ok
	 yTVNB7I02vFDDVSP4QFXoLr0GQS6VX5WydbGdzHXp8JugkEj17oK+qq3ieOT9dADBduzj2LivO95
	 2g2voVOjdEiLEQ5vP/Jmg1BS4ZWQdYBhnf8H/CvtLer8T10H1D6ywthavtvx/9LoHpA5RcHCD7ql
	 brC5V6YGvsPg4x9MnnWe3wpFN4qHEqBAXaWT6n0dXjIo6qRURbhdR0KHg3qTsd50yy4Fu+zlUEsQ
	 tsviTmPovMglbKFn58+mER5mq3MyxeKRT9bOCHJxyPKNRtLxybSnb9zYxuOJ7zOkFjjqbYINLM38
	 IGIeXphW5mcK3m3uUwlhpBuymbff8=
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
From: xiaopeitux@foxmail.com
To: cryolitia@uniontech.com,
	linux@roeck-us.net,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Pei Xiao <xiaopei01@kylinos.cn>
Subject: [PATCH v3 2/4] hwmon: (gpd-fan): Initialize EC before registering hwmon device
Date: Mon,  8 Jun 2026 09:40:11 +0800
X-OQ-MSGID: <747f470a139c765262cfc2116de20e11a940b8a3.1780880972.git.xiaopei01@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1780880972.git.xiaopei01@kylinos.cn>
References: <cover.1780880972.git.xiaopei01@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Pei Xiao <xiaopei01@kylinos.cn>

Move the gpd_init_ec() call to before devm_hwmon_device_register_with_info
in the probe function. With the previous ordering the hwmon device was
registered and exposed to userspace before the EC initialization
completes, creating a window where sysfs reads could return invalid values.

Some buggy firmware won't initialize EC properly on boot. Before its
initialization, reading RPM will always return 0, and writing PWM will have
no effect. So move gpd_init_ec to before hwmon device register.

Fixes: 0ab88e239439 ("hwmon: add GPD devices sensor driver")
Signed-off-by: Pei Xiao <xiaopei01@kylinos.cn>
---
changes in v3:
1.Add v3 tag

changes in v2:
1.gpd_init_ec needed before hwmon registration, as separate bug fix.
---
 drivers/hwmon/gpd-fan.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/hwmon/gpd-fan.c b/drivers/hwmon/gpd-fan.c
index 7284babd4f5c..745b3fb9e3a4 100644
--- a/drivers/hwmon/gpd-fan.c
+++ b/drivers/hwmon/gpd-fan.c
@@ -643,6 +643,7 @@ static int gpd_fan_probe(struct platform_device *pdev)
 
 	dev_set_drvdata(dev, data);
 
+	gpd_init_ec(data);
 	hwdev = devm_hwmon_device_register_with_info(dev,
 						     DRIVER_NAME,
 						     data,
@@ -651,9 +652,6 @@ static int gpd_fan_probe(struct platform_device *pdev)
 	if (IS_ERR(hwdev))
 		return dev_err_probe(dev, PTR_ERR(hwdev),
 				     "Failed to register hwmon device\n");
-
-	gpd_init_ec(data);
-
 	return 0;
 }
 
-- 
2.25.1


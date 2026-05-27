Received: from out162-62-57-87.mail.qq.com (out162-62-57-87.mail.qq.com [162.62.57.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B48683EE1FE;
	Wed, 27 May 2026 10:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779876640; cv=none; b=PYorDo6SH3mLJegBh1lCVeLd4jIn1q62pAZfTfUQoQPrwAFm1xKyuTmuPkrdLel2XTZ+8PgTcfKJ+BmBB+fkC3c77ziulAVL+WhLJSnwMNRkGrIMf5xsff+GqIZ9HO8VHeg99pQl3Nx0GAI1/s5pKzEmIWLVcVbXIFLehQeUus0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779876640; c=relaxed/simple;
	bh=Txfg+Hzix0HWOSwFZ1+cnaaAmWZ5u2eHDWYU3UrmbOc=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=cY7wDAyEm6NpE8vOFoLlZfKsOdgLGbiThKeN0ojvD4UYkicIH90bXU9EfNfh3yPeiOlW7mQafY+8+8UsYdiC4IPzKHw5Yu6qJikLH5d6R+3R3ML26eLvN3TIzrb/YlvuYYFpeLO5ADtlt9bCI2lY/a2Nx3oeZufaJF2KrTlynVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com; spf=pass smtp.mailfrom=foxmail.com; dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b=Jk3PwPUq; arc=none smtp.client-ip=162.62.57.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foxmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b="Jk3PwPUq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1779876627;
	bh=KsgvP/X6BLRZI6bofiK589RwvRWG9YAwf3kih/ggoKA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Jk3PwPUqK6RUk81s+XGUX5ZIfEziVsbo12pPDUacleVKM6EtrHfNQu6p/Wo6/gTa5
	 h0T+8n6ILtYpJMRT2NKez7oEShft6hkdV2l6NV1ThIMtHZ2yb59mm1tx5EQPd2binW
	 zzM1wvRfnCCt4WrRi+EQ+3If2HkQkZvKU8hdy4qM=
Received: from localhost.localdomain ([116.128.244.169])
	by newxmesmtplogicsvrsza73-0.qq.com (NewEsmtp) with SMTP
	id 29704417; Wed, 27 May 2026 18:10:23 +0800
X-QQ-mid: xmsmtpt1779876625tpuan9mi5
Message-ID: <tencent_BE546590D05E58278E73E2AE41117CDC8B08@qq.com>
X-QQ-XMAILINFO: NC/J3CrDtaBbg33Wv5T5KDBh30yJFJI9O4LXS+hj2V4QS/lcjVu+NWR5AU8Jgk
	 T5WvHSrTs5NHht/bht53o2LagcucpFM8uMtFtxMrZcGPFWoENLF1q/gouP7XEqSOF2ZiiXP20yRK
	 mn03Tknd4ZwCwGZy3JVog25ki9ayvlz7Lp3PF/DxsIWbJLEOz5VkTWyUw7v0U6ju1SigKcB5X/BU
	 sa854lnGSciLZYEpN21Nq1n0fP0ula8Vddcd50ESp24zOiKuZ7SR4QYZ5nrvcn9W6RYtwBV6u1c0
	 669YkI4kQTM+yrIWgrvgKvITi8VYu+T7Cp8O9nCNp53rDuk+Snf3Eky53l9OHR3zSYoAmN1qWm43
	 /dbklTv2im4Nsy+CI3B9dq6yx4ypprLGq/pmVyrhEfcSfoHGDvlhrxt7kZ97vDYooBrMRMt+/GNP
	 qKEvAINM7PwtLVgyzNnNBas7xAgZGVIQWjv+Tiw8GrG/fLoEEgio4KEez10tm7bzCDta3SPYZu9r
	 GkLl/hNXf6KuoO00R82BYuikdPdas5Hkk3sY6kV8AiY86La0Od1cpeydQtlscr9brFnqh13MZb+2
	 jxEmh+TViVS2+ru6M8no0vTUymr8XAPsPgCdd+eKXKEIEatjWE+a3kZisTo5jut8AxQlFwQNlOVF
	 sB9T5IOGrxNCPPfgzPwf/RSeuyZtjQDmHCB8cOvRFa69kY/Ld26yLyVS55h/b9s91EvtOpWHOpDY
	 dJs1KxalnBgVaLhMkzm0KnLdE3/LXhGI78x8/2howJg3Zhm6DimlbrpSlCZTijAe+j71gT2/3NJ9
	 kI0LxOuzkek+uN25Y9liE0um4SsWfdQ4TG37cNzSgbgAcD9gD3sAn/gXlUhXmAGWmlCgu8SgUHn4
	 BN7rNwNag3VQdwEyNWo9uSgv8kpL0m4tKKnRWnlid7BHARh4qDCri/JRQlDHgsO3nLDozrV5fF+9
	 zxjXe5P+XT6Wcwd5yhNWtmsOV+TAcBCbHGC7RjGcgvv5YGLnovcjXa2jF4yWCp9yT2njrspW+FbK
	 Qy4qBiBv4cR2aasBzzYSbdRXSBRV1hoGGS4cS/cZibqxcY3ln1WqXt8xFcQ9E=
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
From: xiaopeitux@foxmail.com
To: cryolitia@uniontech.com,
	linux@roeck-us.net,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Pei Xiao <xiaopei01@kylinos.cn>
Subject: [PATCH v2 3/4] hwmon: (gpd-fan): upgrade log level from warn to err for platform device creation failure
Date: Wed, 27 May 2026 18:10:20 +0800
X-OQ-MSGID: <5a8effec924ef3374103d762a0e62564966dd376.1779876412.git.xiaopei01@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1779876412.git.xiaopei01@kylinos.cn>
References: <cover.1779876412.git.xiaopei01@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Pei Xiao <xiaopei01@kylinos.cn>

When platform_create_bundle() fails, the error is fatal and prevents the
driver from loading. Use pr_err() instead of pr_warn() to clearly indicate
a critical failure.

Signed-off-by: Pei Xiao <xiaopei01@kylinos.cn>
---
changes in v2: fix build error
---
 drivers/hwmon/gpd-fan.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/gpd-fan.c b/drivers/hwmon/gpd-fan.c
index 745b3fb9e3a4..1b57a5add934 100644
--- a/drivers/hwmon/gpd-fan.c
+++ b/drivers/hwmon/gpd-fan.c
@@ -712,7 +712,7 @@ static int __init gpd_fan_init(void)
 							 match, sizeof(*match));
 
 	if (IS_ERR(gpd_fan_platform_device)) {
-		pr_warn("Failed to create platform device\n");
+		pr_err("Failed to create platform device\n");
 		return PTR_ERR(gpd_fan_platform_device);
 	}
 
-- 
2.25.1


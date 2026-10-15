Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C4D535DA47
	for <linux-hwmon@vger.kernel.org>; Thu, 15 Oct 2026 03:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792035540; cv=none; b=bsmL7FKjBJnmjYpZLv3f9xNVMExdlaQwHzX8JN00MFbZkaSiAOS4ENLW6U5/izS0tPeLeBeV2MrI60gy6zLIiS117jMQDn0YYNMX7PSMDSi8QhqlL6KPPSGPVgdlZ/7yi5YMZPsw67ovCIeE9zCb7jtHX2atPlvXfScfhxzpJZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792035540; c=relaxed/simple;
	bh=Xk4H1w32FM2iXsEbHrwm7ZAgZdm0OsRsbRpsDhY43Cc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=cg2uN7NAE3Ic7QWXOhBCXO1hbACxMohySgAepHx+eUmepQJAg1YMXNa1LJr1EODoueXmi5iP0SO9NlNDJkauxkptl9sInXs1RY7zJu2C/3Y3imUls8c6ZFtrQIarLMxQCrG19XF5iCHjxSJyzLC0hGAeyR5HQvDJzY1nyYCDrWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TeQETKRi; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TeQETKRi"
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-5e91e422859so2399370e0c.2
        for <linux-hwmon@vger.kernel.org>; Wed, 14 Oct 2026 20:38:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792035536; x=1792640336; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lL3rBmSaHlPTL6GoPLD7XvMOLQUruV33NZ3+k7WKHNY=;
        b=TeQETKRiOeZ0AjKwrTAAy1CZmTjZ+Ix1CyJ0e6r7ptP9WkATt5K8q8J8dkZkzpuxdI
         9RGQiDB8zkmOwYvtpBIzNjYXVPetGH1E+WSBzN4QZf6RXS8Bszx7RqFDJjWrKa2PtkQt
         W+Wkpy0kItDNhwdDeZlnXllxSqzKAokFCrgB5cg/8vjXlivxwRHM9sBiY8AFxNuVjIpz
         RYVhtT/uJqQo7KOrlKGooPmW6FEPaYkv+vgSuqVqZF82NQsielr4oPjqQR9HmYVeTz1f
         CBN9EfUdrMqP0o+3VVDOTDyFhVhmM0GXJi2HoPBaZmlIbtjXX0mzi+PfZUg4byjNexnR
         etDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792035536; x=1792640336;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lL3rBmSaHlPTL6GoPLD7XvMOLQUruV33NZ3+k7WKHNY=;
        b=P++xwbs107iO2BDKGrxTOaXeIr+INniOLkVHOw3bmJefACS6iAbyl130OFK2umJX+n
         k831jmr7dxmCNAvi39+WhI5iE49QNj286jRpKCT7esGBAo3a6lER5RFM07A7pkr3P6rx
         caYoCoZMBp5WUepTNNtaQxBFCvFzyWsVTz0wI+e13rf2Q6f0atG7RVcdKtkqkwOAT+or
         0oARSOOBa5oPOohzLcMt8VN9S3wT4AuB2XdFLVxEeLX+fOU45G1rz8CbRFTEUATyqwIm
         henz5G7vxItfrEwAbgKIjiK2kCk+CFPi8/DvKrbpBp155SGLJHVuKeB2MTs7smcxJN+8
         RqPw==
X-Gm-Message-State: AFq9FYJqxYd2aSAVzz4uU4Gf75tjrOmkr4eqc25dFZGxvsb/5yy2kjvA
	oj7UTQPG19ZD6/O5wB6yMVfKxP1G5N9YRubah/+1k8yHgbrMZGbyrKATz5SFWm8t
X-Gm-Gg: AYBFou2gLJ0W8QPwvvQXApt5stYeFbvHPOhNil+zzg90oo3MQRBQz/+7o73hmg2nD6f
	TUw5Rbn7/Ju27wczGMH9kUUTKQiQqNkofy9XbKAxGHozHsxIb/5dXIMDihBcPx1WfMqjSMSjmw+
	qWpI+TYBUv7NJLwKRrB8ojAlaQYxSwYVzqYgwSvrR4tBGjuH5KuuP1WSJGzo+NLofuSeZajW0Fv
	PfMMYpG7ZDM9YigkXJS0PtAeOnHiXVf5nVExabYArfZ0by6+cYmiFkYVuQuN2RSLM3e1/i4CONQ
	YvZwLO+NbPAjD8dECByAx2WWjZSvo6wgpDqQC/VKp1IzIqh0NfKZ51F8bn74bSETw5iX9t6EHr3
	0J/+Yxb5XmVt8yiJgXjv28jIIEklg6W2gOaM/GsYIDN1jvLiy/M2UPc9nubl20tWKrTjwT+1C7A
	5n+5tBbNqjNTN1c3UC6sQqLkhQtT0e6I4AH3/BRTdmN6bVxlpcQprqwUZKBr1jjwfBpmYbdqep+
	62cllM6PXUH
X-Received: by 2002:a05:6122:4b8c:b0:5d7:2918:c648 with SMTP id 71dfb90a1353d-5e91f46d8ccmr6133267e0c.8.1792035536241;
        Wed, 14 Oct 2026 20:38:56 -0700 (PDT)
Received: from nixos-minipc ([2803:9810:b675:f600:58b2:f893:fc2:ec6b])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5e91cbf7fccsm12099016e0c.15.2026.10.14.20.38.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 20:38:56 -0700 (PDT)
From: =?UTF-8?q?Sebasti=C3=A1n=20Peyrott?= <speyrott@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] hwmon: (minisforum-um780xtx) Avoid overflow when rounding threshold input
Date: Thu, 15 Oct 2026 00:38:41 -0300
Message-ID: <20261015033841.390615-1-speyrott@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The SYS fan threshold store path rounds the user-supplied millidegree value
with DIV_ROUND_CLOSEST() before clamping it. DIV_ROUND_CLOSEST() adds or
subtracts half the divisor first, so inputs within 500 of LONG_MAX or
LONG_MIN overflow and change sign. Writing LONG_MAX then selects the lower
limit instead of the upper one, and LONG_MIN the upper limit instead of the
lower one.

Clamp the input to the representable 0..255000 range before rounding. The
result is unchanged for all other inputs, because the subsequent clamp
already limits the threshold to 0..254 degrees.

Fixes: 9d980da93bbc ("hwmon: Add Minisforum UM780 XTX EC monitoring and fan control")
Reported-by: Sashiko AI review <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/r/sashiko-outbox-171941@kernel.org
Assisted-by: LLM
Signed-off-by: Sebastián Peyrott <speyrott@gmail.com>
---
This applies on top of the GCC 11 build fix:
https://lore.kernel.org/r/20261014214522.243253-1-speyrott@gmail.com

A userspace comparison using the kernel's DIV_ROUND_CLOSEST() with
-fno-strict-overflow shows identical results for every input from -300000
to 300000 across several limit pairs; only inputs near LONG_MAX/LONG_MIN
change, and they now clamp correctly. Builds without warnings with W=1
using GCC 11 (module), GCC 15 (built-in, sparse clean), and GCC 15/16
allmodconfig on x86_64 plus GCC 16 on i386.

Tested on the UM780 XTX: writing LONG_MAX to pwm2_auto_point2_temp sets
51 C with the current driver and 99 C (threshold 3 - 1) with this change;
LONG_MIN sets the lower limit. All other rounding and clamping results are
unchanged, every value was verified against the EC registers, and the
original thresholds were restored.

An LLM-based coding assistant helped analyse the report and prepare this
patch. I reviewed the change and the test results.

 drivers/hwmon/minisforum-um780xtx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/minisforum-um780xtx.c b/drivers/hwmon/minisforum-um780xtx.c
index 962ebf41ffb7..bbd77a0ce25d 100644
--- a/drivers/hwmon/minisforum-um780xtx.c
+++ b/drivers/hwmon/minisforum-um780xtx.c
@@ -205,7 +205,7 @@ static ssize_t um780xtx_sys_point_temp_store(struct device *dev,
 		lo = points[0] + 1;
 		hi = data->sys_point3 - 1;
 	}
-	value = DIV_ROUND_CLOSEST(value, 1000);
+	value = DIV_ROUND_CLOSEST(clamp_val(value, 0, 255000), 1000);
 	points[sattr->index] = clamp_val(value, lo, hi);
 
 	ret = ec_write(um780xtx_sys_point_offsets[sattr->index],

base-commit: 4781ca52761e666cf18b591e6bb0478396c90320
prerequisite-patch-id: 817e6d58067db84010e9c7f4ba73d312275021fb
-- 
2.54.0


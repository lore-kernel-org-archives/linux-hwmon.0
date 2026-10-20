Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792512588;
	b=pzmjlodV1RdI0sToVJAv0GijCMGghQhmbtV1khsy1qGTfFNML+dRenUUmcY6LzaHVKII
	 k+VOpmdgPpOnmihsC4j1T4y3eiTMM8baar4ho42BkUSGbbxCfd4Me+jtlvtDECu4gQQ+V
	 IyOZwZzRg6a8Suk6k+fPteXGh5XAXoeXO8vve7yH6s8CGc9h1ae/3+YgpSR0g8RgMbeIF
	 VZjbukvCykmQrBmfCwCcSA5OPWSL9I7Fd65bHYrYG5PS3xa1wo7//L7Af/B+0Cl5IqRRV
	 cQjbtvNsJQ/uKabU7Q/3UvlWBb+cL/RQDhBj76lTCWgep0x9+EK7EW2lq2K2ow4kkLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792512588;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=DJGF1ENXz7WHGgtPE7LBzn5FS5QXMa/W4WvKNc538zI=;
	b=zQnx4pQP/lmgmzr79aApa/1JNmE6V4/63Q+VNuPdy6La6nRzTFcbvkHQjI2XYVUR4CpV
	 dRrEKi0jD7OkaLwUa4ZYEZSAOa/DikzdrP4JfuvcmqM+DmmCud3bg7rOvbvSO4nnGocc0
	 OuEHgyoBBYl4ra+I37zxPEqRLm9SaEvQweHmJ4v4WplE5pkCZtqEHLDbDVMkfBi6vBtYS
	 rF6qy0a1qG2DvmdPlxZH/s8ij5XuKyMj0Xe2l/DsLDHRI/IUYmuMKgEiLOU0EaxHtN/MK
	 3/dM9wgc3T0EVIGG5W/I8kxvsS3iLCgxMfsaaPJTcD89NCD34WkDniblMSO+bUfSOww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=YzNWUTLE;
	arc=none smtp.remote-ip=209.85.216.49
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1227606A31A
	for <linux-hwmon@vger.kernel.org>; Tue, 20 Oct 2026 16:09:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1227606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=YzNWUTLE
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3ace1f3897cso1981730a91.0
        for <linux-hwmon@vger.kernel.org>; Tue, 20 Oct 2026 09:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792512587; x=1793117387; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DJGF1ENXz7WHGgtPE7LBzn5FS5QXMa/W4WvKNc538zI=;
        b=YzNWUTLEQxZMo6pKMot5ZCJr9/GVVKDE7+0WSB8xM7HnO8wEuipdfWoksR/65/B8rA
         4k06ygSt31Mdr06/c+iE3Cj0+QSat5PaBn0f48+yy4oc3pmmg0qpVyl0wCTNiGWBG6re
         YnT4G7QyP0y5XDuCKAsiUrpKsdFz4fvya1xeR13fpjB5o0yO3R0nXanZT8/VZCSv9sPM
         ICtQzZPqN0dL/ccUTWwHT25QXb7V6hd9Bu2cb2E4qvtasJBDY8TNKaZmQjbF+9wQEe6f
         h9FQmmfdgtoLgfR2rjZLqEJejZ4fHNh7bySHZLaGsEUlrdpcsNh0SIFeaX4MIfh5jBPp
         n+Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792512587; x=1793117387;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DJGF1ENXz7WHGgtPE7LBzn5FS5QXMa/W4WvKNc538zI=;
        b=OhxvluDsaTmqdvgFDOcOAYAdLKDCuslhMHN93ceLwnOSdFSWlbjoLR9zMAHr6cnk8o
         Nf0+Zx272HrQOJbPtS1ipJrYiR6FfCT1HClrUHtMNRihWlwhfKFcf6d4L9ZUX3JRynWm
         LSmeSQ23biC3SX79J1/9ySnd7b5Rt0JKi9gzNb9RKia4mM/fU2AV7x46mi9/Pafd96VA
         ZocbGAXkWTgUFnrATojcCpcFYbn5DztJYVP0wtKD3FbYcP37Sbd9JKwzmWDhXxlrXn/9
         60+asbVECFhje8InZU8sUHjPMNQcM1OE0Wz30gsO9U4rWCsmOFmwFhum5Z0rDWHh+QMb
         IVMw==
X-Gm-Message-State: AFq9FYLtrQzR7CMCpIpAYrA0Zvj2QPq7IlyimRmGEALRZaj/KchRQaKM
	W85DcLK7dTgUAPGItOMAFLNdBbVfv5oaZ6UbyFiYTncHFNyFB4QTgE7G
X-Gm-Gg: AYBFou1u0evqmATHso+otmusKuFwld1TQ8ilywwdcStPVFds4AsIjT33+EvqXGr+3GE
	h50wdZpxFgofd8C/kZ6c3oaAuSpZrAjqUV9G/HxW3wq7RTBpQC0RpETBrvqJVcPtSgyOZ4TOInC
	9GxhM/M0jy4tDVcSuMELnr2PeMBk2VTv/wvtzWGrtpxYLHp9bLYk3RCMQ2S1LpQCBd3jI5Ws3g6
	j/mwr6WkWeFJEDW2dZLLYX4N1Gqili1MOXNiOXUThKm2QuYNWQuCsJDNJsxRXrTwTQJfSU5qtN8
	04vS2oJPZ6r3RvyYaPH1/grxAdZDK1/nIjSPBLn01v5RQMD3qFu02Y5m9/TUYdCfE7lcFlcf3QM
	LUPXOurLS1N2OxjpNclUyUzpoNt3ex698tEKRycz4XfNvo4h34/SlPFZjAiqI3w19Nv+gtrtv//
	HMZzXC02yAldmQvpoo2gzYwMYMoSVTZtmTxl79lswvVp4TVh+igLtSqb1/2TdI/RJu5yH4WeUCD
	FNLD9ldybID9qISw5F/90Hvl1TKkz5iTeYlwzw0uq4jstWMAoVRPObnmQhP105W3zsO30201g==
X-Received: by 2002:a17:90b:2811:b0:3ac:b048:fa13 with SMTP id 98e67ed59e1d1-3acef6681dbmr9749041a91.67.1792512586951;
        Tue, 20 Oct 2026 09:09:46 -0700 (PDT)
Received: from asahi.tail4da9e3.ts.net ([218.48.198.193])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acd403c212sm8456516a91.4.2026.10.20.09.09.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 09:09:45 -0700 (PDT)
From: "Baek Kyu, Kim" <pocj8ur4in@gmail.com>
To: mail@mariuszachmann.de,
	linux@roeck-us.net
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Baek Kyu, Kim" <pocj8ur4in@gmail.com>
Subject: [PATCH] hwmon: (corsair-cpro) Cache fan target only after a successful command
Date: Wed, 21 Oct 2026 01:09:41 +0900
Message-ID: <20261020160941.36787-1-pocj8ur4in@gmail.com>
X-Mailer: git-send-email 2.55.0
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

set_target() updates the cached fan target before sending the command.
If the command fails, subsequent fanN_target reads report the failed
request instead of the previous value. For example, after successfully
setting 1200 RPM, a rejected request for 1800 RPM returns an error but
leaves fanN_target reporting 1800. A failed request also replaces
-ENODATA when no target has been successfully set.

Update the target cache under the existing mutex only after
send_usb_cmd() succeeds, as set_pwm() already does when invalidating
the target. Preserve the previous cached value and return the original
error on failure.

Fixes: 40c3a4454225 ("hwmon: add Corsair Commander Pro driver")
Signed-off-by: Baek Kyu, Kim <pocj8ur4in@gmail.com>
---
Tested under ARM64 QEMU with an emulated HID transport through the
actual corsair-cpro driver and hwmon sysfs. Set fan1_target to 1200,
then reject the next 1800 request with -EIO before applying it.
Before the fix, the write fails but readback returns 1800; with the
fix, readback remains 1200. No physical hardware was tested.

 drivers/hwmon/corsair-cpro.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/corsair-cpro.c b/drivers/hwmon/corsair-cpro.c
index c09645152613..f9e8b7a0d70a 100644
--- a/drivers/hwmon/corsair-cpro.c
+++ b/drivers/hwmon/corsair-cpro.c
@@ -214,10 +214,11 @@ static int set_target(struct ccp_device *ccp, int channel, long val)
 	int ret;
 
 	val = clamp_val(val, 0, 0xFFFF);
-	ccp->target[channel] = val;
 
 	mutex_lock(&ccp->mutex);
 	ret = send_usb_cmd(ccp, CTL_SET_FAN_TARGET, channel, val >> 8, val);
+	if (!ret)
+		ccp->target[channel] = val;
 
 	mutex_unlock(&ccp->mutex);
 	return ret;

base-commit: 58161ead29e50d70a317ea26b472e0c7508e69da
-- 
2.55.0


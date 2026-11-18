Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794974669;
	b=EnVJIz08DW7Jl48oCB5FLs5pHOVSMwdvSfYwjU+paHCjcMa6Hd81YTmkQWaFLNLMTGZO
	 JM5IedtUVv9Rk7z1khCs2Fko9srfHRHfR5hPQPlQd8sQIRWQZBF21ECdHjreLYqfqna/r
	 Wo0D6lUFsafgWjF3c5iBOs+cpCnSErgqdoY/LqjQWANsCzWhN6YlXiF9FNvSLt/eCwMuN
	 ea/R8vZyjS9b5UpgDVMbSXLwAQQzRxwI0GbytUzkFQdYDW8VwaGLtSm73NRu1kFSyK1Xk
	 p4YRVpM59LcrOEbJTEnRUh5VPX/9KQjGxJ1SGx8WVBF0gUYAmcwLLMitIFCsJ35s+Zg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794974669;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=ae9SXixq3KyeLaxooVfUDQ7NlUvqt38wYvr3tZhu284=;
	b=QrhBg7A/sMcHpTjI19Bg5gwjElzpQq3L2fcHGX+AD2eu28nzhk04xOBBHzp6AgZDnr8T
	 U7gUnmc6bbt5zXmkIYaoxbjOknL5kxKHX81cF6h9/RKTTdrxuLRXpiVL88OB9Wypy5Wm2
	 8MJEMPXUZyPzqAORB+/oAzyTsBjvBJbyCIHdQ9nA5q7hTZSXXyw0wr0j9qdUwchNE4m0j
	 x/Aiu5yye3V6Iso5Kj/edUYpeOQ5KhCb9K3PEodYtNrEtZB5sej0JvZkzQVDMWL4K7tEC
	 CVXd6Z6cBPs4JTCs6Aug0A7oAkKOXiYig2eAfmcPp2pB4GiXZjXlWDVNP1FznTGK3rw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bGv9ExPT;
	arc=none smtp.remote-ip=209.85.215.178
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 620E7606A31C
	for <linux-hwmon@vger.kernel.org>; Wed, 18 Nov 2026 04:04:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 620E7606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bGv9ExPT
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cdba1b5ed8dso246954a12.1
        for <linux-hwmon@vger.kernel.org>; Tue, 17 Nov 2026 20:04:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794974669; x=1795579469; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ae9SXixq3KyeLaxooVfUDQ7NlUvqt38wYvr3tZhu284=;
        b=bGv9ExPTNdvyW65ZUolrBCq6FyQ1EvRC2md9+X+lbpal8lZHzsb7BwNtjudC64kOFW
         6R4TwQBrEeyO8mukKktPKsVIS5WRsjsmaGQRI2pEpHPHjdf6HldPB55Y2GZykyhsA0RA
         9FgzyYcs9BXDdv7Fbg6fUjmU39WK3XztiWW8ad0h8sGeiau9x9rflMwOlbVPw1dfT3nr
         nR3veUfJJAehhxoMvmu8Gk8//zECwaKV725iWWwb9tZMaiEXtJs05GPGZ0/JmvoKEQZ8
         /LjSCXPEoVJyttulFlxeOPPBBrLT+2Fe0VtNwoRcJDHmsBUI2iJfRIyx3ios14ut/nN1
         Uk+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794974669; x=1795579469;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ae9SXixq3KyeLaxooVfUDQ7NlUvqt38wYvr3tZhu284=;
        b=wQ7vO58jtToyNwwOGI+iE6LoQ2doaXzgnSM43SZCx9EoLomoKG4MnbL6G13JIuzVjB
         AE3e/O9h7BBtDTMsxZ6naoB37mwF/8LcsJ5eZNT9BUQiHssYCvf/z26PFgH6D6Miwd0s
         1dhd2Q7UI4B7xyI23XDTzW4muB1GVpuIp8L1FneCurhUsgIXbI6T0o9m5gLfpwM7r2tv
         w81dyd9eSknBUTpW2HRFa1gS542gUBmt8VouTgDtqivRgeapT6cm+XzV7sps2hInxQN4
         0u6uqzzphPqnl567hdb3KGP+KtWgdlSUM0GNmR7kNZFheVRdUMpkLvfasB5HOlYbXq9e
         K1Bw==
X-Gm-Message-State: APuU4Z+QwxaSclRpbm0ZWEv93XL9B6hjLn3Rq6siPpH2GKPwzla8s6D5
	HG1etSoEvHZzukNJGWKjblps60VJ/Z/0dlZQOtlWXlngo3eCnXMs9rWGFewYpQ==
X-Gm-Gg: AZFdTZdDR3xwZ2aXEcFIBihRB8y+rldsEdt7YPqAQQ2+KgKUpWewpS3gOrrR9VOcrsx
	hmCe40T8MY5suDKnv15cdQtjBywYki6gyK6HsQW9cFSNSpCB5Hu4KilB7nB5GJ64hdsghgfKm3Y
	sqnhTrtulcN417P8/cw5xyzQb+fVksCUcFKhCoEEbqKppy5uuWBleggemIKD3uGyuive88/8RvS
	w2oouagEsWcyzMK/7JQ4fulYRnh5sjOPxOeAei0iDgfOnaNopSFCC4/cKoS7IjrL4Z+fh32KCTs
	UxjF9IgKo6pTg36mZpReL0VN7Tj1y9rncN/1PR+Tw8v/iQuQr2EWcJo5BrtZZuUPHhhAg82etZN
	2/sY4KOMvXacqNN0boo2hkhgc89DXqQppkNt+/R7PY0XweF9yThOFDGkxMsWWxbSt9bQI81Rr4W
	bbXeqI0knwzPdSSVR6BZSkfK5lCj3TRQAtKqf9Wfs1SExcAV1+5Rlm/kRNw0oBldPIR4ffHna6r
	+XmhKS6v/Jct8MBbn4WTMurVgcaBTebf99t1AjxY+dK3iH/FOlt9d05IbM9mgMASL+OtnYP9BqN
	FJbI5b2VC00yg614xPgVrv68dSjTObhhj7a1GO0VKF5REb7ctwZdWt0kMZmBh0Uds3YbUxxwkbF
	ID/dyi2cecL78yXXJqeyxAo5iniyvLbMpgk4VzlIixGsblRTopC3P7YsOVEi3Lu9PaJwuBbZRUS
	QdLQ==
X-Received: by 2002:a17:90b:5390:b0:3aa:412f:b0a7 with SMTP id 98e67ed59e1d1-3b3d063d5demr1039468a91.5.1794974668584;
        Tue, 17 Nov 2026 20:04:28 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d19b6adasm1905317a91.9.2026.11.17.20.04.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 20:04:28 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arnd Bergmann <arnd@arndb.de>
Cc: linux-hwmon@vger.kernel.org
Subject: [PATCH v2] hwmon: (dell-smm) Reject out-of-range pwm values
Date: Tue, 17 Nov 2026 20:04:17 -0800
Message-ID: <20261118040417.19049-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
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

dell_smm_write() scales the value written to pwmN with

	DIV_ROUND_CLOSEST(val, data->i8k_pwm_mult)

before clamping the result to the valid fan states. The rounding adds
i8k_pwm_mult / 2 to val first, which overflows for values near
LONG_MAX and wraps to a large negative number. That is then clamped to
0, so writing a huge value turns the fan off instead of running it at
the highest speed. With the default fan_max of 2, writing any value
from LONG_MAX - 63 up to LONG_MAX selects fan state 0.

The pwm range is well defined, so return -EINVAL for values outside
0 to 255, as is the convention for pwm attributes.

Fixes: e7f5f275c62a ("i8k: Implement hwmon based fan speed control")
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
Changes in v2:
- Return -EINVAL for values outside 0 to 255 instead of clamping them.
- Patch 2 of v1 was applied, so this is sent alone.
- v1: https://lore.kernel.org/linux-hwmon/3c36959a51788bbc5d08f364fe7d922b5c4d4d87.1794633179.git.rosenp@gmail.com/

Developed with the help of an AI coding assistant (Claude Opus 5.5),
as described in the v1 cover letter. I reviewed the change and I am
responsible for it.

Compile-tested only (W=1). The test machine's BIOS ignores manual pwm
writes, so the change could not be observed at runtime.

 drivers/hwmon/dell-smm-hwmon.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon.c
index 798d2fe9d8b2..301ce2bed6a6 100644
--- a/drivers/hwmon/dell-smm-hwmon.c
+++ b/drivers/hwmon/dell-smm-hwmon.c
@@ -1022,6 +1022,9 @@ static int dell_smm_write(struct device *dev, enum hwmon_sensor_types type, u32
 	case hwmon_pwm:
 		switch (attr) {
 		case hwmon_pwm_input:
+			if (val < 0 || val > 255)
+				return -EINVAL;
+
 			pwm = clamp_val(DIV_ROUND_CLOSEST(val, data->i8k_pwm_mult), 0,
 					data->i8k_fan_max);
 

base-commit: 09560558c9eabd4e85b68a97fcd102f1186b4790
-- 
2.56.1


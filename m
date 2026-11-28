Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795834345;
	b=QQD3RWxClZhn0V63YFzHMfv7DTJ60sRcT9VsdDralCrEyR30Lx8S60CnZwUqkdXsnP6M
	 AGx3kTtwKpG6cbHl8Cy18J9KWX6+f3XSitMYps0SPbolctQXOyaHhTHCxVSLYpB8JKIJ1
	 gzCy5ryoujgYy0aSyOj44SPxLrxYw21P844Rpb3oOk3sMMP3NP90urXxDNhm2NkOVec2U
	 K64AfKmo3qrW/n6KcaSISFiM7Kfik/EjoEHLzBNjiZFfAiGo1GJ7V7m2X/QbGgxfLRfz9
	 HWQRy4TCMR/EgzPcBsFUp1L2DmaFRE0EJuMtsryQR5ebqajU4K0om8nMcnyhZPFVTDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795834345;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=QUXRs2rFzEZWtbL7Rpe84eV4hXNXe3AIwV9zqvmx8Lk=;
	b=Qeoc1S2jrSgySFEiUohMerx4PSoA/EOAxC/8rd1iIMrw3u9aOgquF2ognlz4z1CS9Klb
	 Y0DhlzWZk7hgF0aqJCF4z6RsYl1gsUWP/Qf7NTJNAUzCx/XsRnoxjPpr910/tR4DLdNTj
	 EgZ/VDeqIaK7iitjhJx19JKB/UUqVG58Qt1pSZ/MNarqM1LWt8KIE7tleRjY6l+pcwp33
	 Diw4sNUVUgQz91DUeXr1ScIAu4Gohr8dnD5XFJcQ4UK8mt+jbVciWubtoqVAMn1XenTvW
	 Qit8z2n4rO4WN97aZGdWr3fltZC5AVI1R0ZfnWGs7lqpYXQ893vNm4zJNIvaAIXLaVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=wkennington.com;
	spf=none smtp.mailfrom=wkennington.com;
	dkim=pass header.d=wkennington-com.20260707.gappssmtp.com header.i=@wkennington-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=ZAoy5bUi;
	arc=none smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B753606A31E
	for <linux-hwmon@vger.kernel.org>; Sat, 28 Nov 2026 02:52:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B753606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wkennington.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=wkennington.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wkennington-com.20260707.gappssmtp.com header.i=@wkennington-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=ZAoy5bUi
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3b532dfb874so926245a91.3
        for <linux-hwmon@vger.kernel.org>; Fri, 27 Nov 2026 18:52:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wkennington-com.20260707.gappssmtp.com; s=20260707; t=1795834344; x=1796439144; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QUXRs2rFzEZWtbL7Rpe84eV4hXNXe3AIwV9zqvmx8Lk=;
        b=ZAoy5bUiUZ5j+d+GzgZrQuGl/KtPc9EXIdxpP7LSjIcv2iRa4DnmCe52uD5D3yBDJC
         u7SH1rpE/L4cVjPnu9ax0vvN5EpTbjsAcU2vdUkYXSx07cCX0SfBdKZIzeHej/+weHqV
         jkXJoQM6Asq48gfWX/nFVXTuomL3zq4GHLrqovnn/eFCOylRtom3UNGiQ74aB86hIqf9
         AaW3Z0wycKPNNDSOC6p6sPr2kzexlt4z4ZCe4z3yiUmcmvgqI88dFgoCG2dNfuIhH7TQ
         b1cW606cDXxQ3a81cJKUUa5tnXktKsqOsbaVPIpbXKBFXSArgFz6fHWA12aJVdvhqJ/H
         uifg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795834344; x=1796439144;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QUXRs2rFzEZWtbL7Rpe84eV4hXNXe3AIwV9zqvmx8Lk=;
        b=gAvIfbo71hOtgv9jBOwYNO+Kj6R5+wkQ2CsIXeIkleii3pFIXhhLnRb7/yxMizcIVg
         FlH74v08ws2FmBT2AXTX0PFo13bBAksgLlRRQJVuZlzpya7Yb4Jxq14Cb52+oRAvR6af
         fJm3Fcay50BX+fu8FO/8HGUGhZYRP/6FShJ7gPLvYW+E7O5Er8B1pO/102/oNWqkNY/o
         0TnHaoT1i0JCgcguzJ1dL+lnNlzzMySAJRc/zY9X1MkmD+xHFOBTJLMbD7PfxqBJZJW8
         /16ILbyjfGNcIYZYlgeUY27VFMaHphseT7RtgieHfiurbfNVU39fNFVJsQWf0n4F3Hq9
         yxFg==
X-Forwarded-Encrypted: i=1; AL+hErGz63IQvq4xPF/0T6+Wz9T5kOgPjceHdSA2WcymcGJPeczrCtzzV56w+Xt0KLWZtydCrckMeXvq1sUQwQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z9lc6iEC1x361PiFOYypWtmjpGKc2LFPAcGXtFq2j7mI6Ff82m0
	Fp0682Ut5XBx01tXsMbaIeicF2ipv71QZYqi1ZHeEJo27/ll+dmaj1vJlLx2moOKTGhkk77un/Y
	kHu5LF4Q=
X-Gm-Gg: AZFdTZdwJj4bps2ou729RalGNPoIqmm2fCXWJFB01iabPdrSK9MVqDl7ghgxLjypy75
	6EpmsHbIRxuQ2NcasspAeVhtADQvZMAKzTcETZnR5FpN8gr12Ajm+aT9mJxr5NDqDJLe+IvJcHc
	eqU5+maomlJDlT42eoDXyVZBF3JHnGxzj3i5veTErtN7AX/py9+K3j8pZjOzyQKqSsdvkXQGEKO
	y5laWuaT3fCe3h40O3TRu55kYVxDXOnu7ot2NCHDD7KG6QNTygnjD4rSziw+LoiFQ/yOplJiD4K
	6a1UgJQZdz/57LCTNv8ARDqKGc8simzNLBC2zh0VeHNyWpXt9jtqvDz62+eyVgkvGsFRYi2Q0qy
	YdH6zQU7MiS7O/uYuY3ZpJwNM9BBXdqQXgLccRMhj0CKO+leIvHF0zfsnfnhPt81MiFwNhZN3oj
	C6T1NpOzF5t9B+EGXenRDufQqUTsZSxPTvZ4dt1k0mXPgqrfqWqET7ExlznsYvICDfKOC7zdUzJ
	eD0F9FPtWSLUaPddA8GnwL8+yrfOfNpydhze221TrrENH1vvnK2jWzqvBnJnsjIGkzUKpo5AXUC
	WSHId870m8/E9ZCPybqkjFbUjTPKRXXCHkYPXIbBXjr+2TUljqMyRhoC4Iv9MVgQdiQgWfbWJJH
	3bwuMmsjO+V57SQ==
X-Received: by 2002:a17:90b:3b52:b0:3b3:b9e4:e3f5 with SMTP id 98e67ed59e1d1-3b41c92a524mr25849116a91.30.1795834344527;
        Fri, 27 Nov 2026 18:52:24 -0800 (PST)
Received: from wak.c.googlers.com.com (246.21.127.34.bc.googleusercontent.com. [34.127.21.246])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405ecbd0bsm43734600a91.15.2026.11.27.18.52.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 18:52:24 -0800 (PST)
From: "William A. Kennington III" <william@wkennington.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Andrew Davis <afd@ti.com>,
	Carlos Jones Jr <carlosjr.jones@analog.com>,
	Kees Cook <kees+treewide@kernel.org>,
	linux-hwmon@vger.kernel.org,
	"William A. Kennington III" <william@wkennington.com>
Subject: [PATCH] hwmon: (pmbus/max34440): Do not treat ASCII MFR_REVISION as MAX34451ETNA6+
Date: Sat, 28 Nov 2026 02:52:23 +0000
Message-ID: <20261128025223.2680033-1-william@wkennington.com>
X-Mailer: git-send-email 2.56.0.567.gdb80ae8cd5-goog
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

Per the MAX34451 datasheet, legacy MAX34451 parts return two ISO/IEC
8859-1 characters in MFR_REVISION (0x9b). On an NPCM730 BMC, both
MAX34451 devices (MFR_ID 0x4d, MFR_MODEL 0x59) return 0x3236.

Comparing rv >= MAX34451ETNA6_MFR_REV (0x0012) and rv >=
MAX34451ETNA8_MFR_REV (0x0014) without checking the upper byte
misidentifies these legacy chips as MAX34451ETNA8+. That switches
PSC_VOLTAGE_OUT from 1 mV/LSB to 8 mV/LSB, reporting every voltage
rail 8x too high, and exposes unsupported VIN channels reading -8 mV.

Require rv < 0x0100 before applying the ETNA6+/ETNA8+ quirks. Tested
on that hardware: the voltage rails read 1x again and the bogus VIN
channels disappear.

Fixes: 19932f844f3f ("hwmon: (pmbus/max34440) Fix support for max34451")
Fixes: 596f410c05b1 ("hwmon: (pmbus/max34440): add support for newer version of max34451")
Signed-off-by: William A. Kennington III <william@wkennington.com>
---
 drivers/hwmon/pmbus/max34440.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/pmbus/max34440.c b/drivers/hwmon/pmbus/max34440.c
index b59e9fd42401..390dc32f6f41 100644
--- a/drivers/hwmon/pmbus/max34440.c
+++ b/drivers/hwmon/pmbus/max34440.c
@@ -352,7 +352,14 @@ static int max34451_set_supported_funcs(struct i2c_client *client,
 	if (rv < 0)
 		return rv;
 
-	if (data->id == max34451 && rv >= MAX34451ETNA6_MFR_REV) {
+	/*
+	 * Legacy MAX34451 parts report MFR_REVISION (0x9b) as two ISO/IEC
+	 * 8859-1 characters (e.g. 0x3236), whereas MAX34451ETNA6+ / ETNA8+
+	 * use single-byte binary revisions 0x0012 / 0x0014. Require a zero
+	 * upper byte so legacy parts keep 1 mV/LSB scaling and do not
+	 * expose unsupported VIN/IIN channels.
+	 */
+	if (data->id == max34451 && rv >= MAX34451ETNA6_MFR_REV && rv < 0x0100) {
 		max34451_na6 = true;
 		data->info.format[PSC_VOLTAGE_IN] = direct;
 		data->info.format[PSC_CURRENT_IN] = direct;

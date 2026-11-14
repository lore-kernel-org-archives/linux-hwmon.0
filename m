Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794677993;
	b=raBz3KLYx4syDz9Q/fPGwIhIphR2M2tfL2y09eRh4TITXWd9P77icCyCrVoWzzf6m1XR
	 rsQYScYfHWzImzvz3kwSrCNKNRYpotnwUTTg1Sl03yoDi6LkPXYknquHTjPSIkomEpxj7
	 iwar2IJSXBx/C4QIwTNAUZSHpbk+FwvAphhek4WI2eF61Nasb0TFVKxbT+UwDT6UUSw0Z
	 79xw7CBe9gD2qABzDduz4/fAolYLnIX9XnsPnOXB/fe5AP2+fwAxrkdxgK82KwABNYblK
	 iKsS/+Gj2QR5ZeZ6RW0IiJxL2bimpjGSKd7580skqHRDUXRqn5yt/3R23OpWFZrysaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794677993;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=VxZtbVvnscbmuUMEF/QIImjGr8Jjr0RTY5dyxl7471w=;
	b=l/RY0hkikt/7oTe0MiB9seYskkFhHCGDBHNvDjtHFrdjW0ejRrMay1kVJgejBIzspw8h
	 25FYYAsMVxwTl0uTl1PuI21d5GMP0B0li+c1XfDXPDw/rTBD6oa0W6bcrbShxOfLqo9pa
	 7IyRQ7JA9Y5A373SfphVlgsmPAl4L1a0EHm6GHjn5fLv56p+8xhDriFrzv8EWI963feb7
	 7JtZ1mw/iRS039E9zi2MnwtWHHagYFxWcSEWxon6anxk7w1OjNAKK0plseL+JcrAiKIXC
	 VZmBKLMqHQMlbbV7B/9EK4mZqqJ+/ksWLsbHpSKQ3K8TdFNOhEAoMBUtdZ74XzgNldQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hNgFT9c2;
	arc=none smtp.remote-ip=74.125.224.41
Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AF7B606A337
	for <linux-hwmon@vger.kernel.org>; Sat, 14 Nov 2026 17:39:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4AF7B606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hNgFT9c2
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-677af43eed4so1939857d50.0
        for <linux-hwmon@vger.kernel.org>; Sat, 14 Nov 2026 09:39:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794677992; x=1795282792; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VxZtbVvnscbmuUMEF/QIImjGr8Jjr0RTY5dyxl7471w=;
        b=hNgFT9c2jrdkCXe55vN/stCrCyN+Lw640rnMSlUyfveTcPAERNwY5hXqsDsJ1Cploa
         mdt7EAcxVlt7g2rsjB2Rh9n+n1dhScx0bu7VqwBr501yTwPD360zJP1WmZfpRbhqYXxO
         5o2yA/UOKUK/dVFF459TiKvjZ27ntw3yptNDpLX68xbamI5YeWuyQiU3HOSz9dQDk2VT
         wjLEX0MYiLPIH9ChzzHBrwlWbi2Ae4xmAy1TNymeGDAumaqPIgJeOqc6v7o1PzePMM1+
         gBj+Xo4LhOm0QVTVxSM84IqijNXmWy+89k21MaEkHgwe2VG18EWvkvY5hC9saz5qYqTJ
         yKDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794677992; x=1795282792;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VxZtbVvnscbmuUMEF/QIImjGr8Jjr0RTY5dyxl7471w=;
        b=TtlGY9pgcPcdbzSrJpZ6e3l+25QrJsTlGlbPKw1MV0ysSeqyrNb7shKA3xgK25YHdn
         H8wp7a/QyDLa5ObHidi/6hzfuJgC2m2FClFmHK0RfLML2keS5dTWN/+tFZpqioRdzTXw
         a2qwJjnkohx7u2CuHW4D9buzgrlZU3ohhZnAyVmvVeyy8CFTGyPuEoeHysC6nWsTYQ7r
         idpohIXyU45Z++6vuwwNt/ovKcME5E0NvRMIzCjinsm4sEhrGoLjvpGd1KAOabzR8nqQ
         axm7Re1jRHjyGjabAZ5HtrfIfPa0oN9KNTIqtg8uU/41Bd/VP+MpYx815Wa7VukjMgX1
         0EtA==
X-Forwarded-Encrypted: i=1; AL+hErForCCrjuAVNXiPiWMmmBF9XlsOlhcP1TFAK1bO+uCfuY0mmlNkYiqiyor4ioqXP6RObj4NvB86f2nfYw==@vger.kernel.org
X-Gm-Message-State: APuU4Z8sLJRNxrauJXwRq1Uf1M7dYLIhG9OiCrKNQG5dWuGJ+FQQCNAK
	QRtDD5MWmztj9CwXYBksyDL4se+h5qwLGGqpdWiVwUGstnbJu8D6UsKg
X-Gm-Gg: AYBFou1v2qWbMP7MAk//JWA7qaTJtsCruwzxhdVCF8Yc6FAAH9TibOhqSQWKVGTg/bw
	SzZGVP3uwipmcYugHbTWux9UC0fN/wM+qUybbQipmAtqs6M7c0AcTL/bM9CLaJkg9Mblom8jUnM
	y7gkpvdgWjOSc6zD8H/SdWq75O3ZBymlBWPpUqTfZHFa6IeBb4AbWKWfSfPhGO5RMHcIDfMzjIr
	E72uokuIqKbYYAFd3AivKBWUqQ2IFAcNbVL0bAG0MXJBZAFZYAYttkQ8y20kI2cutvvCfZW6aBM
	sBzLE325/SgLOTGVyOPgQcoKa+5+ba+FYVtgy3ArW7kTS4cO7PifTOZ0LpjhED8PPrIJE5Cl9kP
	NqS6WzLS8+OpJQkxrlh7JKvgyMBwUw6J6H9yYfhkIwGtQbxf+zmZhXAhcmfCiSScA8+LgwRMCiB
	koTk8yOIWB5XhlfOuMwumNf88UbusvGiLB8CwJOIr6YF2zPQcYO/RLo1iL/1s4g/7Grs284sJnF
	zvFTz8FlmWCCjAm4mzmdCwrfwa8A0kOLgmhyp7GsyidG3nZqtyMnF4nbKYtQE56MX4NpvB5Oo/m
	fTnqeu3O3dNfv4/SXFPYtRKzrCE7h3T2XTb09o+ekLVI+3pFrlXgO7W2T+5nWhxRKi99+R6xMgq
	xmhM9HFUglAvc1w78Wcx/WegwCBGitDjCUlWLEYuiAo/Qn8w5WxInBt9M5rbQFA==
X-Received: by 2002:a05:690c:e3ec:b0:8b4:b5e4:e7a4 with SMTP id 00721157ae682-8b4b5e4f2c0mr27973607b3.21.1794677992256;
        Sat, 14 Nov 2026 09:39:52 -0800 (PST)
Received: from localhost (107-220-129-194.lightspeed.chrlnc.sbcglobal.net. [107.220.129.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4aa9d05acsm48540367b3.35.2026.11.14.09.39.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 09:39:51 -0800 (PST)
From: Matt Turner <mattst88@gmail.com>
Date: Sat, 14 Nov 2026 12:39:47 -0500
Subject: [PATCH 1/7] alpha: marvel: report environmental events without
 VERBOSE_MCHECK
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261114-marvel-env-v1-1-890328e4b7e5@gmail.com>
References: <20261114-marvel-env-v1-0-890328e4b7e5@gmail.com>
In-Reply-To: <20261114-marvel-env-v1-0-890328e4b7e5@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>, 
 Magnus Lindholm <linmag7@gmail.com>, Guenter Roeck <linux@roeck-us.net>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, 
 Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1188; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=Y3Z+L3Q1B+1LTrQWdh3AhhyWOlCmGs2mmWLvmmWQrZY=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLJ+zHksxnqmP3lDM0usxYK/0c0pPTY7/r1lnCz6bZp9r
 nSy5Wn/jo8sDGJcDDPFFFni1iuyzGrbsdTntPQvmDmsTCBDpEUaGICAhYEvNzGv1EjHSM9U21DP
 EMjQMYqHyOkxaGQWF5emFummFRQ55OWXJJZk5ucV6+UXpOYVpBfopWWmlWRk5BcVpwKN0MtLLTF
 1dXQzMjQwsXS0MHOycDQ1cXZ2MnRyc3R0dnUysjQ3MXC2dDRxtTRn4OIUgLlG0pDhf+2LB+qXxP
 O2lV9Jygq3cygu3GHev37zmu9d67755yuf2c3wP+39hz4HjcAfYg8vS3Zwb7j3MEFxmegenlsK0
 Uc4sx+6cAAA
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

The service processors report temperature, fan, voltage and power supply
alarms as system event (0x680) logout frames. The frame is already
classified as reportable, but without CONFIG_VERBOSE_MCHECK only the
header line reaches the log, which does not say which sensor or what
happened. Print the subpackets unconditionally.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/kernel/err_marvel.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/alpha/kernel/err_marvel.c b/arch/alpha/kernel/err_marvel.c
index c0c0ccefc467..832567a3ccbb 100644
--- a/arch/alpha/kernel/err_marvel.c
+++ b/arch/alpha/kernel/err_marvel.c
@@ -24,7 +24,6 @@
 static void
 marvel_print_680_frame(struct ev7_lf_subpackets *lf_subpackets)
 {
-#ifdef CONFIG_VERBOSE_MCHECK
 	struct ev7_pal_environmental_subpacket *env;
 	struct { int type; char *name; } ev_packets[] = {
 		{ EL_TYPE__PAL__ENV__AMBIENT_TEMPERATURE,
@@ -62,7 +61,6 @@ marvel_print_680_frame(struct ev7_lf_subpackets *lf_subpackets)
 		       env->unit_id,
 		       env->condition);
 	}
-#endif /* CONFIG_VERBOSE_MCHECK */
 }
 
 static int

-- 
2.56.1


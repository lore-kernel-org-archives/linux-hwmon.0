Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793822018;
	b=lDeTG6mKuC6zu2Jx4NiMfQo/HOltJZV0QfLIeSdSSoj9ueMOXxfdpwSbQaELMsAxiJr1
	 YAUkAxyGbiGL6CKiKHJBYmRNNFFpkGTfPhU75Gt4arlnoHi877wJ3dp3GZhp35TQSSglJ
	 cye9UPTthMXj+RNBw8Sy2MqeO0m9FtDsOQ5urLeJmiW8AkuUwd6siFFlYbfeVLww1f/JN
	 LyRTpnfVBpXomSRqEBtwRhd/Il6a4EWowzzSHmSBKnNuNOSVL0S7+xJa6Pi2CJiwno5Pz
	 1YTuE8unMfK3SFC5t5RgIa10da0bLjugUBZyx4GRAvZGoC4II7JYeiC/DPyBtx8FpYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793822018;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=j77TQJheY9BNkuAUNT0wTTk7+HF7XEvTQj5keMW7u/I=;
	b=238hIq3g9sQyXyNrcba1IVBpkD6TEU7SrcpmIBF/f6eLJoXBKdCjuYwiBkWlSKEbVJpJ
	 Y2vprkQFLxpc15Fj7i/cwOaSwAOW1tGWr+T6FKVtYumqSRnJSsPVZp+coxnNqlFM9mADt
	 xBcFwMXEVvxhgKCktR5j3nwJv7M1REX9FwB54XvaMtOTE4K7OO+BGc+X7lUzlWvht4JtT
	 BrWP6CbEK9F5Z3JqTkG+xM6c1MlmD8BPIL6uvbW4v+WBeozHWROv0DSn32Q/f6dKdIFqK
	 vRPT0bPbwWEBTksJAPiuoKkDHSLRGf3cyMK3c62vC5OBfoCsCBIfaKaJt2jIKSLd6rA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=snwKVTUy;
	arc=none smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C02AA60960A8
	for <linux-hwmon@vger.kernel.org>; Wed,  4 Nov 2026 19:53:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C02AA60960A8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=snwKVTUy
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-15ea896ddc8so1943073c88.0
        for <linux-hwmon@vger.kernel.org>; Wed, 04 Nov 2026 11:53:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793822017; x=1794426817; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j77TQJheY9BNkuAUNT0wTTk7+HF7XEvTQj5keMW7u/I=;
        b=snwKVTUy9LvBIeZYEhCXzEnRQp2wodIFGKY4wUJ7ztWzLVbTd1bI4nr3mGXqrQXFPO
         83/HtfEisb8NH+6TKxRanc+LHldo4EqJ43kuJQJyWdqbEb2qaKJ6REpFD/Jt5EslTB+S
         zscnal0Mvh+NX91kiP+siOH9v7tqEITC6j8TarPFAWvrj5zWcfX48CLTn8neQnUjk0aG
         DdWT6beozrR7hgNmLfQYYUBVHi+K7i2h0gb1c9TLmiQO015gt7sDVMBLhaHB5Rgu8J3E
         vDvOsMZkyxTj1DF9F5rnA3mHVh2Jx0j8rAylzbJGVo40aem9854GCIhJgMsA/lSZgxl8
         K73A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793822017; x=1794426817;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=j77TQJheY9BNkuAUNT0wTTk7+HF7XEvTQj5keMW7u/I=;
        b=0yA7dxJEJ5EaiPGooERIQThCfe13i98sVE2X0d/qhRwYdXeFRKgC+CvCMFscy9HpN3
         YLQkA8U+2bGtwHiS6SiOQOlhxQwQxL9kSn6O69LSTcGqCctM7HZLI04iaxerN1/7xlYn
         bMndz/+/f1VdznA15KIhX+DJ4V2euc02rH4WcUFLntMg6j9pvt+SyCDNG8u8XtJU+fuk
         3c4ay+SNwaUb0NN2HmXM3N1Jj+rjS94d5hplrD9dfiFtcBPxEKtpIrTAuakrt33jG0Jf
         mico2TRnUpqZx4xNFv7MQlDxuRCGt14zaxv+Vf1c/sbFeY1AC2WBA1J1Iuyqxvattx/n
         fyXw==
X-Forwarded-Encrypted: i=1; AKwUvBwpJ4O0R3XBfClXB8rThnj0IWoeKmMzBogXmcQRaDBwArVyAv2B/u8PaZSBZsrPm0u1OmGs9t2g/26DZw==@vger.kernel.org
X-Gm-Message-State: APuU4Z+QIR2K58nH497R4Gs8RHI/Wzt80403eOcaFlg0MPRuPXcfkqXv
	wDOM8eh82P1DyQH5PyydUBO4iBRJGYXshcoJcMHZnphB35Ku6MRwmVk=
X-Gm-Gg: AYBFou1apIZGin+GF7dXjM1TOXMWtEvmlCneYxtGS0Ds9mhnksYiMumJnGLeiYG1DCQ
	GSYk20gW10lgHRiDuIXEei9OL3NfDHdKPcV4HYe0p/P+irCtDO4jayh6hDi7HTrTVf1niuKunLa
	wgM899IrMYF7W7ANYWHxnqwT77pTlztexSmuz+wYAERKHYo1wyQHhI3RNFdbXGmu0burnNDq2jC
	cNPvgDo3FzYMokx57yHw2xKZveP0TmbzX8wmC8PwVtKQn1KB59iohn+/sz0Lwo2vkYhIDbZohz4
	VoBdtkVwihXyRYwLkMoKj57l4idzn/672F5V6wvBHZFeBbmBlgBy0J0VI9ZuD313+0Ri/MC2h2x
	RmBfOM5c3mAoAXZypaac8LGj+CvikNv8viXY0aMnEgUEQJ3lYjDu01zaQ8qNyk2R36sP6VxktnX
	L2ImlHZZFJuvgUbNXQFx1H63/sOSK/b3voyMF1vy/A5UXGWdFcHMrnr5FnJP+h1umwdX42ArnB5
	l3+2K3CpxUauUtae6D57GdimRaXVrVDp0i+GodCvLBFXRXZ2bYI86+VKrLdJyWlptf65Oi2ko2K
	6AjE2bMdmrq7bvvllm5sHxg1RCtLFuRjNK3LF5wf5B6hAoB7f+VNZEfagh/jANbR
X-Received: by 2002:a05:701b:4241:20b0:143:2968:564c with SMTP id a92af1059eb24-1ac5b9cb040mr26455364c88.26.1793822016817;
        Wed, 04 Nov 2026 11:53:36 -0800 (PST)
Received: from at-Standard-PC-Q35-ICH9-2009 ([106.194.66.249])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c2d69asm9239684c88.11.2026.11.04.11.53.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 11:53:36 -0800 (PST)
From: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
To: jic23@kernel.org
Cc: alexandre.belloni@bootlin.com,
	andy@kernel.org,
	asahi@lists.linux.dev,
	atharvatiwarilinuxdev@gmail.com,
	bhelgaas@google.com,
	bp@alien8.de,
	brgl@kernel.org,
	dave.hansen@linux.intel.com,
	dlechner@baylibre.com,
	dmitry.kasatkin@gmail.com,
	eric.snowberg@oracle.com,
	griffin@kroah.com,
	hansg@kernel.org,
	hpa@zytor.com,
	ilpo.jarvinen@linux.intel.com,
	j@jannau.net,
	jarkko@kernel.org,
	jmorris@namei.org,
	keyrings@vger.kernel.org,
	lee@kernel.org,
	lenb@kernel.org,
	linusw@kernel.org,
	linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-integrity@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	linux@roeck-us.net,
	mfd@lists.linux.dev,
	mingo@redhat.com,
	neal@gompa.dev,
	nuno.sa@analog.com,
	paul@paul-moore.com,
	pavel@kernel.org,
	platform-driver-x86@vger.kernel.org,
	rafael@kernel.org,
	roberto.sassu@huawei.com,
	serge@hallyn.com,
	sre@kernel.org,
	sven@kernel.org,
	tglx@kernel.org,
	wim@linux-watchdog.org,
	x86@kernel.org,
	zohar@linux.ibm.com
Subject: [RFC PATCH 14/14] mfd/macsmc: add ioctl to access smc keys
Date: Wed,  4 Nov 2026 14:53:17 -0500
Message-ID: <20261104195317.8284-1-atharvatiwarilinuxdev@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261101013817.22d67ea7@jic23-hlaptop>
References: <20261101013817.22d67ea7@jic23-hlaptop>
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

> If this isn't matching some legacy interface, then we need more
> on what these do.  Maybe they are suited to some other kernel
> interface? In particular they might need the various controls
> on how destructive they are that something like fwctl brings.
> 
> Generally an arbitrary opaque path to firmware isn't a good idea...
> 
> Jonathan

Here its required, if we write CPU/GPU Pstates and PPT to
some keys (MSTS MSPC HE0N), we can reduce the temp by 10C
And We can fix the dreaded PROCHOT signals on macs, Giving
Same temps as macOS.

But you and Sasha are right, that exposing all keys is a
bad idea, so i have restricted writing to some keys only.

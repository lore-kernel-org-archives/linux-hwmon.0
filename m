Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.241.56.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794048006;
	b=pPM3PGXUGoC2NPVSB8+w2U0ViaAXKkKWty3ZaXohhW/UPtDyaEDMoYCSnZb7OVz7ZrOi
	 e+4btc4f4RgTWGFZXwf8zNBSNg6XKnjCrOnRDZ4ForrjN0PBoEQv4b1SFfaXVeghLYXwb
	 ildHeCGlDh5CZ1ilzPKkOyi35kSpjbfVmpDSv12TaYeIz5wxU2zcy323vfsGHpo8S8e1+
	 efpXAol6043rl74JoR5buWbrjFhBGpwEytJRjFIv9erL757lGOzwgoTFfeYSxK9sj5Qx3
	 2NKkaeMPi9rH5hD2G/WbjSflpaBzmzdUnNjr+1rpGmWFNkz5j8zQwmYZDWHs/DqxDOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794048006;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Rspamd-Queue-Id;
	bh=ajPmXPlBn7FnQ6/3HIGkdGOkST7G5FOZwaWFT6iuc8g=;
	b=Gf24kQT3Z3EDuO9KFjuZgQhWJnzMIe5XyN8wQ9znmjeZH7hR6n6h9ysQsfzAXzp1qmIJ
	 7+dUYffh51aX1+QKfG99eqlgiZLevITce1z53C4WxQP0kVlP1Eezy8rsHRmGmkf4QQAgO
	 720wDgiuMSiDf0rI6rfemCTBT4Kq5UTFREEkwMTvz8KI5k8cBdss1um1Rt3ldM1w82WxQ
	 tU1KGiquNiZnxalgHpzkzRWOhwOvPzSt7no4UDGgvE/gtE2K7LVpc3d0NlCP9/VgD1sY0
	 S2mpEgkVy6wkxmri7WNiFdhSuvAIbK+w/hSb3MRWldOp+gM+GvQBsjeZYd1QaxS0cmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bojanowski.me;
	spf=pass smtp.mailfrom=bojanowski.me;
	dkim=pass header.d=bojanowski.me header.i=@bojanowski.me header.a=rsa-sha256 header.s=MBO0001 header.b=094Q2MkN;
	arc=none smtp.remote-ip=80.241.56.171
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80C4E606A32D
	for <linux-hwmon@vger.kernel.org>; Sat,  7 Nov 2026 10:40:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80C4E606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bojanowski.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bojanowski.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bojanowski.me header.i=@bojanowski.me header.a=rsa-sha256 header.s=MBO0001 header.b=094Q2MkN
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4jMCH602XyzMlV1;
	Sat, 07 Nov 2026 11:40:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bojanowski.me;
	s=MBO0001; t=1794048002;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ajPmXPlBn7FnQ6/3HIGkdGOkST7G5FOZwaWFT6iuc8g=;
	b=094Q2MkNlJpBuPNXwRSZVNFduYWbacFGfnrhZg1FisI11s15aVs83R0QIwRXgV51wDLgC7
	18X1lGNuFn2UVyjQaNHtuDV2d4K1RUKpxKrnZgl93z10BN4HbpgHAzjbf5laCQf4IzsASF
	nsPnnuDgOLHD53YZHBjbCQd8P8/8ijLqaFLoBUyFpRLGZD019wqkbi6a9ppR6S/u4djNA8
	zX4fkXrs3RawZV9qbuebqCq0uOn3p2t/EEiwGkDbmPhwmOW5hfXqD6F3B/AsAzF7qoQUDY
	4n9JHaUQHfdeylnTImsw+0MlbgY3qFUSuhqyI54DRqNKTgh5/nR5UqvdhKBB1Q==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of tomasz@bojanowski.me designates 2001:67c:2050:b231:465::2 as permitted sender) smtp.mailfrom=tomasz@bojanowski.me
From: Tomasz Bojanowski <tomasz@bojanowski.me>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	Hamza Mahfooz <someguy@effective-light.com>
Subject: Re: hwmon: (nct6683) in_from_reg() never applies the 32 mV scale
Date: Sat,  7 Nov 2026 11:39:59 +0100
Message-ID: <20261107103959.7879-1-tomasz@bojanowski.me>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <cd150425-262a-4a74-9f78-5ff581e27846@roeck-us.net>
References: <20261106144247.30507-1-tomasz@bojanowski.me> <cd150425-262a-4a74-9f78-5ff581e27846@roeck-us.net>
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
X-Rspamd-Queue-Id: 4jMCH602XyzMlV1

Hi Guenter,

On 11/6/26 08:09, Guenter Roeck wrote:
> The underlying problem is that, according to the datasheets, the basic
> LSB is really 8 mV, not 16mV as the code suggests. 16mV LSB only applies
> to ADC, AVCC, VBAT, 3VSB and 3VCC. There is no 32mV LSB anywhere.
>
> Patch(es) to fix the problem are welcome.

Before writing a patch, I checked this on the MS-7E61 (NCT6687D,
customer ID 0x20d), including a direct read of the EC registers. On
this board the high byte has a 16 mV LSB for every source I could check,
including the VINx inputs. I have no reference values for VTT and VREF.
With 8 mV, VINx would read half of the expected values:

  rail   source  raw  mult  16 mV (now)  8 mV
  +12V   VIN0     63   x12      12.10 V  6.05 V
  +5V    VIN1     62    x5       4.96 V  2.48 V
  DRAM   VIN3     42    x2       1.34 V  0.67 V  (BIOS: 1.352 V)
  Vcore  VIN4     84    x1       1.34 V  0.67 V  (cores at 5.5 GHz)
  +3.3V  VCC     207    x1       3.31 V
  VSB    VSB     209    x1       3.34 V
  VBAT   VBAT    194    x1       3.10 V

The multipliers are the ones the vendor software uses for this board.
With the low byte included (MSB * 16 + (LSB >> 4) mV), DRAM reads
1.352 V, exactly as in the BIOS. The vendor software and
LibreHardwareMonitor use the same 16 mV scale for every source on
NCT6687D (LHM also for NCT6683D and NCT6686D). I have no data from
Intel or ASRock boards.

So I would propose a patch that removes the 32 mV case and the source
argument of in_from_reg(), and documents 16 mV for all sources. Since
the 32 mV case never matched, there is no functional change. A second
patch could read the low byte as well, for 2 mV resolution.

Would that work for you, or do you have data showing 8 mV on other
boards? In that case the scale could depend on the chip or customer
ID. Also, which source does "ADC" in your list refer to?

Thanks,
Tomasz

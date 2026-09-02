Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF14F36F906;
	Wed,  2 Sep 2026 19:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788377491; cv=none; b=eHGP2/hQjq5IcUOcBKGIuiMlfY1Goke9Ss2rlTzfdIEJ5kfKIhdqkkD4L7rPI/widsvexCU18WGQesXI9pI8GMegc13Czio6RgOUatfvNnmZks+o/0fYYPCtQjp1x7BEUpNc+XKWa4hC11h27/MrZqRjcLBik+W79xiuBPAKcFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788377491; c=relaxed/simple;
	bh=imR2slTZJd7lWyerncNHL0tdRM0SpEXiBffVU74h68c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=frrKqIFhF+t41BUlvKg09RPGutnHYpNzNGIKIeHsA6IgfhpQmkMAqKn/Uw5oDpOXSlanrti0vSm5OUg3OBk4I7mZJB1beIsaeLegkHFLPDjltkCPEsdbnxFNtnUeDA6PpRo/m+bxLFCxatvgisAt7V/TXZPbEFnIomq1cpAcNDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=Tz6kPaRe; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="Tz6kPaRe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1788377467; x=1788982267; i=w_armin@gmx.de;
	bh=imR2slTZJd7lWyerncNHL0tdRM0SpEXiBffVU74h68c=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=Tz6kPaRe78p+6Gv909fkaO4RrW5u98NHLmjlAOakvglOoJdhEpNHLLlwwwWbuaJf
	 OXtktyFEGz+kGLs1VnEx4wtO41PmtniPRipnEqR5Lvc00TlVWI12OubpeWzOq1Yx1
	 TkaVQP0/afi0ySUHPkaxA1BcMDt2MHy0103gT5i3OBtQKYQCMiiQ5t1WOMsWPjx20
	 qqvqG5r7r+hkFVhPDsAsEDlmNQyM+yDnC7pV/2Tbynv02ZzfV51KsNP9ctSYoMmwB
	 N4La415fjxCptvr8uCH4KEBGDbn1L2d6LdIx9VF0Rf2Lx+dxoEWvprr1pKtopAaKy
	 zuqGgjprFVXIR1nNgg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MoO6C-1wUvcR2jw8-00dwzx; Wed, 02
 Sep 2026 21:31:07 +0200
Message-ID: <474a37bb-0774-4710-8458-ea28d7c54c89@gmx.de>
Date: Wed, 2 Sep 2026 21:31:07 +0200
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] SPD5118 Intermittent MR11 Corruption During Suspend/Resume
To: Matthew Bettencourt <matthew.bettencourt@gmail.com>,
 Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1a8ea9da-1ac1-4312-a8ca-ea4a9f35093f@gmail.com>
 <3c4e9f59-5272-48cf-a4a0-eeefcba955a9@roeck-us.net>
 <763a8b30-8548-4ff0-a1e9-8e74bbfe9b02@gmail.com>
 <6e8761aa-67ef-4624-834d-4b9d0ce729d6@roeck-us.net>
 <9753ed80-5666-42a6-b04c-99b9ef9326fe@gmail.com>
 <5c17ea39-c479-4f88-adc6-9a86f3dfb96a@roeck-us.net>
 <d80cf68e-a6cb-4b0b-807e-313be29ca8ae@gmail.com>
 <49cafd78-2468-4b43-a376-a8b2e2de2c19@roeck-us.net>
 <11de1daa-702e-419e-912a-db37c9f28e92@gmail.com>
 <67938f6d-d60f-44cf-9b03-fa472c8a8499@roeck-us.net>
 <65336f12-b821-449b-a637-31972807c676@gmail.com>
 <a953dcaa-cfff-40c8-85a9-c12601e49e85@roeck-us.net>
 <9cdf4b63-8f99-4a80-b0be-3f3df69e526e@gmail.com>
 <46191fa9-fa4a-4c16-b618-2c0c6dc09102@gmx.de>
 <531be24a-bad0-40f6-8e30-3d4da565afcb@gmail.com>
 <a2efdc40-c73c-4892-9fea-9470c0f9823b@gmx.de>
 <0388506d-9ddc-4825-bf28-95c8eef219b6@gmail.com>
 <57a05dea-3cce-4ecf-bbe1-ab7464f8c224@gmx.de>
 <a5d32ab5-f545-4e11-bf0b-88d3eaa68890@gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <a5d32ab5-f545-4e11-bf0b-88d3eaa68890@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:2LRlkJM86pezQrUME1A5NVhO8tmhVrIrmvYb8RlRU+Aj0pt/IaO
 NTS8NszytlSlhXBD1aH6Z3aGlWqiUoOUayI1URdMAPyNYMbH1cH0CbyM/9aXGS32mZabEDd
 /0n93XvBLLyvd1rgB8AKfkqSVTxjnb7lUz57Nj7FdogyChk5L6vl6PemitkyL9OSZIxJtI/
 nmyRVV8SIDy8dF1lFJ+0A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:alRieVe9BZU=;Gf5OpYMr6zG2FGycJyOdj1poB67
 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
 pLJLEnUTADOGMug/f9TA=

Am 02.09.26 um 21:25 schrieb Matthew Bettencourt:

> Hello Armin,
>
> Here is the output of /proc/iomem and /proc/ioports. I made sure to=20
> grab each with root privileges.
>
>
> # cat /proc/iomem
> 00000000-00000fff : Reserved
> 00001000-0009ffff : System RAM
> 000a0000-000fffff : Reserved
> =C2=A0 000a0000-000dffff : PCI Bus 0000:00
> =C2=A0 000f0000-000fffff : System ROM
> 00100000-099fefff : System RAM
> 099ff000-09ffffff : Reserved
> 0a000000-0a1fffff : System RAM
> 0a200000-0a21dfff : ACPI Non-volatile Storage
> 0a21e000-0affffff : System RAM
> 0b000000-0b020fff : Reserved
> 0b021000-7c638fff : System RAM
> 7c639000-7c679fff : Reserved
> 7c67a000-7e24bfff : System RAM
> 7e24c000-7e24cfff : Reserved
> 7e24d000-8307efff : System RAM
> 8307f000-911fefff : Reserved
> =C2=A0 911ce000-911d1fff : MSFT0101:00
> =C2=A0=C2=A0=C2=A0 911ce000-911d1fff : MSFT0101:00
> =C2=A0 911d2000-911d5fff : MSFT0101:00
> =C2=A0=C2=A0=C2=A0 911d2000-911d5fff : MSFT0101:00
> 911ff000-931fefff : ACPI Non-volatile Storage
> 931ff000-951fefff : ACPI Tables
> 951ff000-9b014fff : System RAM
> 9b015000-9b016fff : ACPI Non-volatile Storage
> 9b017000-9bff6fff : System RAM
> 9bff7000-9bffbfff : Reserved
> 9bffc000-9bffffff : System RAM
> 9c000000-9dffffff : Reserved
> 9e7f3000-9e7fffff : Reserved
> a0000000-dfffffff : PCI Bus 0000:00
> =C2=A0 ac000000-dc7fffff : PCI Bus 0000:11
> =C2=A0=C2=A0=C2=A0 ac000000-dc7fffff : PCI Bus 0000:12
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ac000000-c3ffffff : PCI Bus 0000:43
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 c4000000-dbffffff : PCI Bus 0000:13
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dc000000-dc3fffff : PCI Bus 0000:74
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dc000000-dc03ffff : 0000:74:0=
0.0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dc000000-dc03ffff=
 : thunderbolt
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dc040000-dc04ffff : 0000:74:0=
0.0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dc400000-dc7fffff : PCI Bus 0000:73
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dc400000-dc407fff : 0000:73:0=
0.0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dc400000-dc407fff=
 : xhci-hcd
> =C2=A0 dd000000-de0fffff : PCI Bus 0000:75
> =C2=A0=C2=A0=C2=A0 dd000000-dd7fffff : 0000:75:00.1
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dd000000-dd7fffff : sfc
> =C2=A0=C2=A0=C2=A0 dd800000-ddffffff : 0000:75:00.0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dd800000-ddffffff : sfc
> =C2=A0=C2=A0=C2=A0 de000000-de03ffff : 0000:75:00.1
> =C2=A0=C2=A0=C2=A0 de040000-de07ffff : 0000:75:00.0
> =C2=A0=C2=A0=C2=A0 de080000-de083fff : 0000:75:00.1
> =C2=A0=C2=A0=C2=A0 de084000-de087fff : 0000:75:00.0
> =C2=A0 de200000-de6fffff : PCI Bus 0000:05
> =C2=A0=C2=A0=C2=A0 de200000-de6fffff : PCI Bus 0000:06
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 de200000-de2fffff : PCI Bus 0000:10
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 de200000-de27ffff : 0000:10:0=
0.0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 de280000-de2803ff : 0000:10:0=
0.0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 de280000-de2803ff=
 : ahci
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 de300000-de3fffff : PCI Bus 0000:0f
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 de300000-de307fff : 0000:0f:0=
0.0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 de300000-de307fff=
 : xhci-hcd
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 de400000-de4fffff : PCI Bus 0000:0e
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 de400000-de403fff : 0000:0e:0=
0.0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 de400000-de403fff=
 : nvme
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 de500000-de5fffff : PCI Bus 0000:0a
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 de500000-de50ffff : 0000:0a:0=
0.0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 de500000-de50ffff=
 : r8169
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 de510000-de513fff : 0000:0a:0=
0.0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 de600000-de6fffff : PCI Bus 0000:09
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 de600000-de6fffff : 0000:09:0=
0.0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 de600000-de6fffff=
 : rtw89_pci
> =C2=A0 de700000-deafffff : PCI Bus 0000:76
> =C2=A0=C2=A0=C2=A0 de700000-de7fffff : 0000:76:00.4
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 de700000-de7fffff : xhci-hcd
> =C2=A0=C2=A0=C2=A0 de800000-de8fffff : 0000:76:00.3
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 de800000-de8fffff : xhci-hcd
> =C2=A0=C2=A0=C2=A0 de900000-de9fffff : 0000:76:00.2
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 de900000-de9fffff : ccp
> =C2=A0=C2=A0=C2=A0 dea00000-dea07fff : 0000:76:00.6
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dea00000-dea07fff : ICH HD audio
> =C2=A0=C2=A0=C2=A0 dea08000-dea09fff : 0000:76:00.2
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dea08000-dea09fff : ccp
> =C2=A0 deb00000-dedfffff : PCI Bus 0000:01
> =C2=A0=C2=A0=C2=A0 deb00000-decfffff : PCI Bus 0000:02
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 deb00000-decfffff : PCI Bus 0000:03
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 deb00000-debfffff : 0000:03:0=
0.0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dec00000-dec1ffff : 0000:03:0=
0.0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dec20000-dec23fff : 0000:03:0=
0.1
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dec20000-dec23fff=
 : ICH HD audio
> =C2=A0=C2=A0=C2=A0 ded00000-ded03fff : 0000:01:00.0
> =C2=A0 dee00000-deefffff : PCI Bus 0000:77
> =C2=A0=C2=A0=C2=A0 dee00000-deefffff : 0000:77:00.0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dee00000-deefffff : xhci-hcd
> =C2=A0 def00000-deffffff : PCI Bus 0000:04
> =C2=A0=C2=A0=C2=A0 def00000-def03fff : 0000:04:00.0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 def00000-def03fff : nvme
> e0000000-efffffff : PCI ECAM 0000 [bus 00-ff]
> =C2=A0 e0000000-efffffff : PNP0C01:00
> f0000000-f1ffffff : PCI Bus 0000:00
> f2000000-f6ffffff : PCI Bus 0000:00
> f7210510-f721053f : MSFT0101:00
> f7600000-f767ffff : amd_iommu
> feb00000-feb00007 : SB800 TCO
> fec00000-fec003ff : IOAPIC 0
> fec01000-fec013ff : IOAPIC 1
> fec10000-fec10fff : PNP0C02:03
> fec40000-fec40fff : AMDIF031:00
> =C2=A0 fec40000-fec40fff : AMDIF031:00 AMDIF031:00
> fed00000-fed003ff : HPET 0
> =C2=A0 fed00000-fed003ff : PNP0103:00
> fed81500-fed818ff : AMDI0030:00
> =C2=A0 fed81500-fed818ff : AMDI0030:00 AMDI0030:00
> fedc0000-fedc0fff : PNP0C02:03
> fedc2000-fedc2fff : AMDI0010:00
> =C2=A0 fedc2000-fedc2fff : AMDI0010:00 AMDI0010:00
> fedc3000-fedc3fff : AMDI0010:01
> =C2=A0 fedc3000-fedc3fff : AMDI0010:01 AMDI0010:01
> fee00000-fee00fff : Reserved
> =C2=A0 fee00000-fee00fff : PNP0C02:03
> ff000000-ffffffff : PNP0C02:03
> 100000000-105de7ffff : System RAM
> =C2=A0 6cc600000-6cd85356f : Kernel code
> =C2=A0 6cda00000-6ce95cfff : Kernel rodata
> =C2=A0 6cea00000-6ced3b23f : Kernel data
> =C2=A0 6cf660000-6cfbfffff : Kernel bss
> 105de80000-105eebffff : RAM buffer
> 105eec0000-105fffffff : Reserved
> 1060000000-fcffffffff : PCI Bus 0000:00
> =C2=A0 b000000000-efffffffff : PCI Bus 0000:11
> =C2=A0=C2=A0=C2=A0 b000000000-efffffffff : PCI Bus 0000:12
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 b000000000-cfffffffff : PCI Bus 0000:43
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 d000000000-efffffffff : PCI Bus 0000:13
> =C2=A0 f000000000-f80fffffff : PCI Bus 0000:01
> =C2=A0=C2=A0=C2=A0 f000000000-f80fffffff : PCI Bus 0000:02
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 f000000000-f80fffffff : PCI Bus 0000:03
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 f000000000-f7ffffffff : 0000:=
03:00.0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 f800000000-f80fffffff : 0000:=
03:00.0
> fd00000000-ffffffffff : Reserved
> 3ffa00000000-3fffffffffff : 0000:03:00.0
> # cat /proc/ioports
> 0000-03af : PCI Bus 0000:00
> =C2=A0 0000-001f : dma1
> =C2=A0 0020-0021 : pic1
> =C2=A0 0040-0043 : timer0
> =C2=A0 0050-0053 : timer1
> =C2=A0 0060-0060 : keyboard
> =C2=A0 0061-0061 : PNP0800:00
> =C2=A0 0064-0064 : keyboard
> =C2=A0 0070-0071 : PNP0B00:00
> =C2=A0=C2=A0=C2=A0 0070-0071 : rtc0
> =C2=A0 0080-008f : dma page reg
> =C2=A0 00a0-00a1 : pic2
> =C2=A0 00b4-00b4 : ACPI PM2_CNT_BLK
> =C2=A0 00c0-00df : dma2
> =C2=A0 00f0-00ff : fpu
> =C2=A0 0280-028f : PNP0C02:02
> =C2=A0 0290-029f : PNP0C02:02
> =C2=A0 02a0-02af : PNP0C02:02
> =C2=A0 02b0-02bf : PNP0C02:02
> 03b0-03df : PCI Bus 0000:00
> 03e0-0cf7 : PCI Bus 0000:00
> =C2=A0 040b-040b : PNP0C02:03
> =C2=A0 04d0-04d1 : PNP0C02:03
> =C2=A0 04d6-04d6 : PNP0C02:03
> =C2=A0 0800-089f : PNP0C02:03
> =C2=A0=C2=A0=C2=A0 0800-0803 : ACPI PM1a_EVT_BLK
> =C2=A0=C2=A0=C2=A0 0804-0805 : ACPI PM1a_CNT_BLK
> =C2=A0=C2=A0=C2=A0 0808-080b : ACPI PM_TMR
> =C2=A0=C2=A0=C2=A0 0820-0827 : ACPI GPE0_BLK
> =C2=A0 0900-090f : PNP0C02:03
> =C2=A0 0910-091f : PNP0C02:03
> =C2=A0 0b00-0b0f : PNP0C02:03
> =C2=A0=C2=A0=C2=A0 0b00-0b08 : piix4_smbus
> =C2=A0 0b20-0b3f : PNP0C02:03
> =C2=A0=C2=A0=C2=A0 0b20-0b28 : piix4_smbus

Bingo, ACPI is telling the OS that those port ranges are reserved by the f=
irmware.
For some reason the check inside the driver does not pick this up.

Does dmesg contain any lines similar to "Resource conflict; ACPI support m=
issing from driver?"?

Thanks,
Armin Wolf

> 0c00-0c01 : PNP0C02:03
> =C2=A0 0c14-0c14 : PNP0C02:03
> =C2=A0 0c50-0c51 : PNP0C02:03
> =C2=A0 0c52-0c52 : PNP0C02:03
> =C2=A0 0c6c-0c6c : PNP0C02:03
> =C2=A0 0c6f-0c6f : PNP0C02:03
> =C2=A0 0cd8-0cdf : PNP0C02:03
> 0cf8-0cff : PCI conf1
> 0d00-ffff : PCI Bus 0000:00
> =C2=A0 6000-bfff : PCI Bus 0000:11
> =C2=A0=C2=A0=C2=A0 6000-bfff : PCI Bus 0000:12
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 6000-8fff : PCI Bus 0000:43
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 9000-bfff : PCI Bus 0000:13
> =C2=A0 c000-dfff : PCI Bus 0000:05
> =C2=A0=C2=A0=C2=A0 c000-dfff : PCI Bus 0000:06
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 c000-cfff : PCI Bus 0000:0a
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 c000-c0ff : 0000:0a:00.0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 d000-dfff : PCI Bus 0000:09
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 d000-d0ff : 0000:09:00.0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 d000-d0ff : rtw89=
_pci
> =C2=A0 e000-efff : PCI Bus 0000:75
> =C2=A0=C2=A0=C2=A0 e000-e0ff : 0000:75:00.1
> =C2=A0=C2=A0=C2=A0 e100-e1ff : 0000:75:00.0
> =C2=A0 f000-ffff : PCI Bus 0000:01
> =C2=A0=C2=A0=C2=A0 f000-ffff : PCI Bus 0000:02
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 f000-ffff : PCI Bus 0000:03
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 f000-f0ff : 0000:03:00.0
>
>
>
>
> On 9/2/26 2:19 PM, Armin Wolf wrote:
>> Am 02.09.26 um 19:28 schrieb Matthew Bettencourt:
>>
>>> Hello Armin,
>>>
>>> Here is the acpi.log file as requested.
>>>
>> Thanks,
>>
>> i suspect that the BIOS tries to use a PNP0C02 device to tell the=20
>> kernel that
>> the SMBus controller is being driven by ACPI. Can you share the=20
>> content of /proc/iomem
>> and /proc/ioports (with root privileges!)?
>>
>> Thanks,
>> Armin Wolf
>>
>>> Thanks,
>>> Matthew
>>>
>>> On 9/2/26 12:22 PM, Armin Wolf wrote:
>>>> Am 02.09.26 um 19:08 schrieb Matthew Bettencourt:
>>>>
>>>>> Hi Armin,
>>>>>
>>>>> Are you want the acpi.log file or are you asking me to print out=20
>>>>> all the .dat files?
>>>>
>>>> Sharing the acpi.log file as an attachment should be fine.
>>>>
>>>> Thanks,
>>>> Armin Wolf
>>>>
>>>>>
>>>>> $ ls -1 | grep -iE ".dat|acpi.log"
>>>>> acpi.log
>>>>> dsdt.dat
>>>>> ssdt10.dat
>>>>> ssdt11.dat
>>>>> ssdt12.dat
>>>>> ssdt13.dat
>>>>> ssdt14.dat
>>>>> ssdt15.dat
>>>>> ssdt16.dat
>>>>> ssdt1.dat
>>>>> ssdt2.dat
>>>>> ssdt3.dat
>>>>> ssdt4.dat
>>>>> ssdt5.dat
>>>>> ssdt6.dat
>>>>> ssdt7.dat
>>>>> ssdt8.dat
>>>>> ssdt9.dat
>>>>>
>>>>> Thanks,
>>>>> Matthew
>

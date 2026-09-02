Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A71149F10D
	for <linux-hwmon@vger.kernel.org>; Wed,  2 Sep 2026 19:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788378040; cv=none; b=Lca/o6jAqwQgwkU3JcszrHv7fYaOsX7d3ULWgeKQylMMzulXjoucHctQ2G6dXFUWZCaiX3L0znKDd6dBmXa+naEsdS2/2kuUlpRkr8q7mW30Oe7GFr6yy32Pgv2MQMYPzVMVyy3ZfqrmpbtrZdvml/XlPz0dMuGOlm1GutZ0Bcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788378040; c=relaxed/simple;
	bh=tZZPvsBPqWOHKc8u97rmFdODDhetarArYMh0pAo/5NM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gr5Zuxt3tXUwL4fw1TaFpM+uN2bZXJ/n6n8TRVO2Dy8t0xnebkesSqRVrTuOoUzwU3naPU5ak1FUv7rpUSKKKWX0oPiQ/iK5Zr9ED3CgBYfdGaE/19RQ4msu2kn38gOzU1MTiz8XPM6HoDXWxdn4O6atdnYa9mWwcJHzzVRAxtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eLDbAt3I; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eLDbAt3I"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cb5b8572b70so1656032a12.2
        for <linux-hwmon@vger.kernel.org>; Wed, 02 Sep 2026 12:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788378018; x=1788982818; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RCzDMuVe7zqlafHrzde8KuDZjh6D1CaezwygsbZ8t7o=;
        b=eLDbAt3IW5xDYPTcfSxXIgZdepratTQ3j8duVAKEN/yGK1cEFT7sZ/+6o+l3+wV7ZL
         /L6laEPqGb/UDarO8wezCSlbiOlju78J7W7DiPknXY+R2wcriJuWr/GuTdr7h8aF6qff
         LCJGE7pizEhFat8rdUW0lV0GLp8g1nnBcc9yVmL1Qo7En1br/LiqYA83gj62ZOn5dKFv
         SQ0menw+rCMeKlPbWjmVWYoGjXCeLwCnryXHy3TmatkPuzfETU8u7EJIuUiFi1F6TBEA
         0dRtaG4uaI7QwpOcEAMmes8D8zPplpNCqtfCctFUAIG1Bq0wZMNmah0w5cXQWJMXEjJe
         RLDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788378018; x=1788982818;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RCzDMuVe7zqlafHrzde8KuDZjh6D1CaezwygsbZ8t7o=;
        b=V9rPMUXoBhXjqkdYLJ8mQVin667Z+452IZv8mccISlRUO0tSkChulpFzobVlZl2XHF
         n1P6OzMJjO2kW6M6JbSG5VmLDJq756dtk4LMiLwQHWo/PlUcB6JE0WC6SLJDj6C4uvNg
         1qu8e8Tfmr6wT7czCHcwjrC+j3MfXDyT77eCSmusn5VqMhLp99qM1aWOXdwOVQewRghA
         S3HIYAzq92Q3w8dqKMBW8DKfquAl/qINFXKoxTON6bnY+FDC5J1ivFZQHuviPycawGfk
         0rIaFXnbZ1L8NlFsiKahrt3VHaP7kiMpTCoeYWwXXj4nlNu703IVzOz5eCI7f/zvR8b+
         6t0g==
X-Gm-Message-State: AFuF++nRWrmPZLak9glqLEnmN2evh3morU1k3jJnONQctsx0xdyB4uNg
	GtHYsOXhm3Jl5v3/zjgQ1Uo0uN315jmZ4c5JiIGsDWA3o9UDJYmtDXwj
X-Gm-Gg: AYBFou0+wCMhq8B5xJ7udr5eiRRWCMAs8OZf3rgDeckkyq2XoAJdYED5OtB2cCNBGCB
	wrcIFY6TuReirhYLCR69y38jwaOF+sj/NOMWwyouNkZ8PRIv1vGDFD4xvCZhb+IFbBikOV+XbKB
	2+xQzTBn3dixfJoIXaozR05tHFN0B1DMbB4NTVn/3fJ0kDkkeybXmv/9npBrSQN/hoDXGNknYUZ
	KAOdmQYNDOrlKu6ns4/OkwtY2RqRNKtErJ9YnWUQa8ZJLvC2CjD9WlVPMuIeuQ5h+T8CKMFVMJC
	VN2ZDSZQaYCJm+iZDNoGdXVCZ9B+4Xp4tBS2+3/Q4O4iwl4kCdcR0UymIvIE6zUKE2JErO+meXx
	AzZZjU0gSqPhTY3qIYbYzKxDoVLqcDTnTMDySzXPK+Xm+OoXRHr+XwZu1PBzaZkq/RQauT0WySp
	t6vqKlaK3dFGT0rGFzu9pX2pTjZXaxeGqYEBEIQaWc3JebEG6Dl+mViPJHZDu7sr7mhWbp0SZFg
	3CIg6yM0rezJb8iysIjh+/rMeWfLmyfzGw8YAYUlBLUXkhATBt6gPyH
X-Received: by 2002:a05:6a21:9102:b0:3d3:b00b:50fc with SMTP id adf61e73a8af0-3d9b0b3b0a4mr12313823637.28.1788378018191;
        Wed, 02 Sep 2026 12:40:18 -0700 (PDT)
Received: from [10.198.0.120] (wnpgmb02ydw-ds01-112-62-45.dynamic.bellmts.net. [204.112.62.45])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc43d41ca7bsm40926a12.21.2026.09.02.12.40.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 12:40:17 -0700 (PDT)
Message-ID: <c81e7caf-d3e4-4212-be9b-ec35d0a04086@gmail.com>
Date: Wed, 2 Sep 2026 14:40:15 -0500
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Linux)
Subject: Re: [BUG] SPD5118 Intermittent MR11 Corruption During Suspend/Resume
To: Armin Wolf <W_Armin@gmx.de>, Guenter Roeck <linux@roeck-us.net>
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
 <474a37bb-0774-4710-8458-ea28d7c54c89@gmx.de>
Content-Language: en-US
From: Matthew Bettencourt <matthew.bettencourt@gmail.com>
In-Reply-To: <474a37bb-0774-4710-8458-ea28d7c54c89@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello Armin,

 > Does dmesg contain any lines similar to "Resource conflict; ACPI support
 > missing from driver?"?


I cannot find any of those lines in the dmesg

# dmesg | grep -iE "resource|conflict|acpi"
[    0.000000] [      T0] BIOS-e820: [mem 
0x000000000a200000-0x000000000a21dfff]  ACPI NVS
[    0.000000] [      T0] BIOS-e820: [mem 
0x00000000911ff000-0x00000000931fefff]  ACPI NVS
[    0.000000] [      T0] BIOS-e820: [mem 
0x00000000931ff000-0x00000000951fefff]  ACPI data
[    0.000000] [      T0] BIOS-e820: [mem 
0x000000009b015000-0x000000009b016fff]  ACPI NVS
[    0.000000] [      T0] efi: ACPI=0x931e4000 ACPI 2.0=0x931e4014 
TPMFinalLog=0x931b1000 SMBIOS=0x8af88000 SMBIOS 3.0=0x8af87000 
MEMATTR=0x7c0bb698 ESRT=0x7e24c218 MOKvar=0x8affc000 INITRD=0x7c0b3f18 
RNG=0x9513e018 TPMEventLog=0x95139018
[    0.003329] [      T0] ACPI: Early table checksum verification disabled
[    0.003331] [      T0] ACPI: RSDP 0x00000000931E4014 000024 (v02 ALASKA)
[    0.003334] [      T0] ACPI: XSDT 0x00000000931E3728 000104 (v01 
ALASKA A M I    00000001 AMI  01000013)
[    0.003337] [      T0] ACPI: FACP 0x00000000951F4000 000114 (v06 
ALASKA A M I    00000001 AMI  00010013)
[    0.003341] [      T0] ACPI: DSDT 0x0000000095179000 0710EA (v02 
ALASKA A M I    00000001 INTL 20230628)
[    0.003342] [      T0] ACPI: FACS 0x00000000931E1000 000040
[    0.003343] [      T0] ACPI: SSDT 0x00000000951F6000 008689 (v02 AMD 
   Splinter 00000002 MSFT 04000000)
[    0.003344] [      T0] ACPI: SSDT 0x00000000951F5000 000221 (v02 
ALASKA CPUSSDT  00000001 AMI  00000001)
[    0.003345] [      T0] ACPI: FIDT 0x00000000951EE000 00009C (v01 
ALASKA A M I    00000001 AMI  00010013)
[    0.003346] [      T0] ACPI: MCFG 0x00000000951ED000 00003C (v01 
ALASKA A M I    00000001 MSFT 00010013)
[    0.003347] [      T0] ACPI: HPET 0x00000000951EC000 000038 (v01 
ALASKA A M I    00000001 AMI  00000005)
[    0.003348] [      T0] ACPI: FPDT 0x00000000951EB000 000044 (v01 
ALASKA A M I    01072009 AMI  01000013)
[    0.003349] [      T0] ACPI: VFCT 0x000000009516A000 00E284 (v01 
ALASKA A M I    00000001 AMD  31504F47)
[    0.003350] [      T0] ACPI: BGRT 0x00000000951F3000 000038 (v01 
ALASKA A M I    00000001 AMI  00010013)
[    0.003351] [      T0] ACPI: TPM2 0x00000000951F2000 00004C (v04 
ALASKA A M I    00000001 AMI  00000000)
[    0.003352] [      T0] ACPI: SSDT 0x0000000095165000 004DEE (v02 AMD 
   AMD CPU  00000001 AMD  00000001)
[    0.003353] [      T0] ACPI: SSDT 0x00000000951F1000 000041 (v02 AMD 
   AppCompD 00000001 INTL 20230628)
[    0.003354] [      T0] ACPI: SSDT 0x0000000095157000 00D2AE (v02 AMD 
   DISCUSB4 00000002 INTL 20230628)
[    0.003355] [      T0] ACPI: SSDT 0x00000000951F0000 0006D4 (v02 AMD 
   CPMWLRC  00000001 INTL 20230628)
[    0.003356] [      T0] ACPI: SSDT 0x00000000951EF000 0008BA (v02 AMD 
   CPMDFDG2 00000001 INTL 20230628)
[    0.003356] [      T0] ACPI: SSDT 0x0000000095156000 000788 (v02 AMD 
   CPMDFIG5 00000001 INTL 20230628)
[    0.003357] [      T0] ACPI: SSDT 0x000000009514C000 009B4F (v02 AMD 
   CPMCMN   00000001 INTL 20230628)
[    0.003358] [      T0] ACPI: SSDT 0x0000000095149000 002A66 (v02 AMD 
   AOD      00000001 INTL 20230628)
[    0.003359] [      T0] ACPI: MHSP 0x0000000095148000 0000C8 (v04 AMD 
   AGESA    20505348 ?    00000001)
[    0.003360] [      T0] ACPI: SSDT 0x0000000095147000 0000E5 (v02 MSFT 
   MHSP     00000004 INTL 20230628)
[    0.003361] [      T0] ACPI: WSMT 0x0000000095146000 000028 (v01 
ALASKA A M I    00000001 AMI  00010013)
[    0.003362] [      T0] ACPI: APIC 0x0000000095145000 00015E (v06 
ALASKA A M I    00000001 AMI  00010013)
[    0.003363] [      T0] ACPI: IVRS 0x0000000095144000 00019E (v02 AMD 
   AmdTable 00000001 AMD  00000001)
[    0.003364] [      T0] ACPI: SSDT 0x0000000095143000 000500 (v02 AMD 
   MEMTOOL0 00000002 INTL 20230628)
[    0.003365] [      T0] ACPI: SSDT 0x0000000095142000 0009D0 (v02 AMD 
   CPMMSOSC 00000001 INTL 20230628)
[    0.003366] [      T0] ACPI: SSDT 0x0000000095141000 00047C (v02 AMD 
   AMDWOV   00000001 INTL 20230628)
[    0.003367] [      T0] ACPI: SSDT 0x0000000095140000 00053E (v02 AMD 
   CPMAPMFD 00000001 INTL 20230628)
[    0.003368] [      T0] ACPI: SSDT 0x000000009513F000 00044E (v02 AMD 
   AmdTable 00000001 INTL 20230628)
[    0.003369] [      T0] ACPI: Reserving FACP table memory at [mem 
0x951f4000-0x951f4113]
[    0.003369] [      T0] ACPI: Reserving DSDT table memory at [mem 
0x95179000-0x951ea0e9]
[    0.003370] [      T0] ACPI: Reserving FACS table memory at [mem 
0x931e1000-0x931e103f]
[    0.003370] [      T0] ACPI: Reserving SSDT table memory at [mem 
0x951f6000-0x951fe688]
[    0.003370] [      T0] ACPI: Reserving SSDT table memory at [mem 
0x951f5000-0x951f5220]
[    0.003370] [      T0] ACPI: Reserving FIDT table memory at [mem 
0x951ee000-0x951ee09b]
[    0.003371] [      T0] ACPI: Reserving MCFG table memory at [mem 
0x951ed000-0x951ed03b]
[    0.003371] [      T0] ACPI: Reserving HPET table memory at [mem 
0x951ec000-0x951ec037]
[    0.003371] [      T0] ACPI: Reserving FPDT table memory at [mem 
0x951eb000-0x951eb043]
[    0.003371] [      T0] ACPI: Reserving VFCT table memory at [mem 
0x9516a000-0x95178283]
[    0.003372] [      T0] ACPI: Reserving BGRT table memory at [mem 
0x951f3000-0x951f3037]
[    0.003372] [      T0] ACPI: Reserving TPM2 table memory at [mem 
0x951f2000-0x951f204b]
[    0.003372] [      T0] ACPI: Reserving SSDT table memory at [mem 
0x95165000-0x95169ded]
[    0.003372] [      T0] ACPI: Reserving SSDT table memory at [mem 
0x951f1000-0x951f1040]
[    0.003373] [      T0] ACPI: Reserving SSDT table memory at [mem 
0x95157000-0x951642ad]
[    0.003373] [      T0] ACPI: Reserving SSDT table memory at [mem 
0x951f0000-0x951f06d3]
[    0.003373] [      T0] ACPI: Reserving SSDT table memory at [mem 
0x951ef000-0x951ef8b9]
[    0.003373] [      T0] ACPI: Reserving SSDT table memory at [mem 
0x95156000-0x95156787]
[    0.003374] [      T0] ACPI: Reserving SSDT table memory at [mem 
0x9514c000-0x95155b4e]
[    0.003374] [      T0] ACPI: Reserving SSDT table memory at [mem 
0x95149000-0x9514ba65]
[    0.003374] [      T0] ACPI: Reserving MHSP table memory at [mem 
0x95148000-0x951480c7]
[    0.003374] [      T0] ACPI: Reserving SSDT table memory at [mem 
0x95147000-0x951470e4]
[    0.003375] [      T0] ACPI: Reserving WSMT table memory at [mem 
0x95146000-0x95146027]
[    0.003375] [      T0] ACPI: Reserving APIC table memory at [mem 
0x95145000-0x9514515d]
[    0.003375] [      T0] ACPI: Reserving IVRS table memory at [mem 
0x95144000-0x9514419d]
[    0.003375] [      T0] ACPI: Reserving SSDT table memory at [mem 
0x95143000-0x951434ff]
[    0.003375] [      T0] ACPI: Reserving SSDT table memory at [mem 
0x95142000-0x951429cf]
[    0.003376] [      T0] ACPI: Reserving SSDT table memory at [mem 
0x95141000-0x9514147b]
[    0.003376] [      T0] ACPI: Reserving SSDT table memory at [mem 
0x95140000-0x9514053d]
[    0.003376] [      T0] ACPI: Reserving SSDT table memory at [mem 
0x9513f000-0x9513f44d]
[    0.004132] [      T0] ACPI: PM-Timer IO Port: 0x808
[    0.004137] [      T0] ACPI: LAPIC_NMI (acpi_id[0xff] high edge 
lint[0x1])
[    0.004150] [      T0] ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 
2 dfl dfl)
[    0.004152] [      T0] ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 
9 low level)
[    0.004154] [      T0] ACPI: Using ACPI (MADT) for SMP configuration 
information
[    0.004154] [      T0] ACPI: HPET id: 0x10228201 base: 0xfed00000
[    0.030331] [      T0] ACPI: Core revision 20260408
[    0.196042] [      T1] ACPI: PM: Registering ACPI NVS region [mem 
0x0a200000-0x0a21dfff] (122880 bytes)
[    0.196042] [      T1] ACPI: PM: Registering ACPI NVS region [mem 
0x911ff000-0x931fefff] (33554432 bytes)
[    0.196042] [      T1] ACPI: PM: Registering ACPI NVS region [mem 
0x9b015000-0x9b016fff] (8192 bytes)
[    0.205167] [      T1] acpiphp: ACPI Hot Plug PCI Controller Driver 
version: 0.5
[    0.205845] [      T1] ACPI: Added _OSI(Module Device)
[    0.205846] [      T1] ACPI: Added _OSI(Processor Device)
[    0.205846] [      T1] ACPI: Added _OSI(Processor Aggregator Device)
[    0.212142] [      T1] ACPI: 17 ACPI AML tables successfully acquired 
and loaded
[    0.237892] [      T1] ACPI: \_SB_: platform _OSC: OS support mask 
[006e7eff]
[    0.239494] [      T1] ACPI: \_SB_: platform _OSC: OS control mask 
[006e7eff]
[    0.239578] [      T1] ACPI: USB4 _OSC: OS supports USB3+ 
DisplayPort+ PCIe+ XDomain+
[    0.239579] [      T1] ACPI: USB4 _OSC: OS controls USB3+ 
DisplayPort+ PCIe+ XDomain+
[    0.239906] [      T1] ACPI: Interpreter enabled
[    0.239916] [      T1] ACPI: PM: (supports S0 S3 S4 S5)
[    0.239916] [      T1] ACPI: Using IOAPIC for interrupt routing
[    0.272403] [      T1] PCI: Using host bridge windows from ACPI; if 
necessary, use "pci=nocrs" and report a bug
[    0.272544] [      T1] ACPI: Enabled 8 GPEs in block 00 to 1F
[    0.273425] [      T1] ACPI: \_SB_.PCI0.GP17.XHC0.P0U0: New power 
resource
[    0.273941] [      T1] ACPI: \_SB_.PCI0.GP17.XHC1.P0U1: New power 
resource
[    0.274789] [      T1] ACPI: \_SB_.PCI0.GP19.XHC2.P0U2: New power 
resource
[    0.275014] [      T1] ACPI: \_SB_.PCI0.GPP0.M237: New power resource
[    0.275032] [      T1] ACPI: \_SB_.PCI0.GPP0.SWUS.M237: New power 
resource
[    0.275053] [      T1] ACPI: \_SB_.PCI0.GPP0.SWUS.SWDS.M237: New 
power resource
[    0.275143] [      T1] ACPI: \_SB_.PCI0.GPP1.P0NV: New power resource
[    0.275454] [      T1] ACPI: \_SB_.PCI0.GPP7.PWRS: New power resource
[    0.275560] [      T1] ACPI: \_SB_.PCI0.GPP7.UP00.PWRS: New power 
resource
[    0.275661] [      T1] ACPI: \_SB_.PCI0.GPP7.UP00.DP00.PWRS: New 
power resource
[    0.275858] [      T1] ACPI: \_SB_.PCI0.GPP7.UP00.DP08.PWRS: New 
power resource
[    0.276000] [      T1] ACPI: \_SB_.PCI0.GPP7.UP00.DP08.EP00.PWRS: New 
power resource
[    0.276087] [      T1] ACPI: \_SB_.PCI0.GPP7.UP00.DP10.PWRS: New 
power resource
[    0.276187] [      T1] ACPI: \_SB_.PCI0.GPP7.UP00.DP10.WN00.PWRS: New 
power resource
[    0.276288] [      T1] ACPI: \_SB_.PCI0.GPP7.UP00.DP18.PWRS: New 
power resource
[    0.276387] [      T1] ACPI: \_SB_.PCI0.GPP7.UP00.DP18.LN00.PWRS: New 
power resource
[    0.276489] [      T1] ACPI: \_SB_.PCI0.GPP7.UP00.DP20.PWRS: New 
power resource
[    0.276718] [      T1] ACPI: \_SB_.PCI0.GPP7.UP00.DP28.PWRS: New 
power resource
[    0.276860] [      T1] ACPI: \_SB_.PCI0.GPP7.UP00.DP28.EP00.PWRS: New 
power resource
[    0.276947] [      T1] ACPI: \_SB_.PCI0.GPP7.UP00.DP30.PWRS: New 
power resource
[    0.277088] [      T1] ACPI: \_SB_.PCI0.GPP7.UP00.DP30.EP00.PWRS: New 
power resource
[    0.277176] [      T1] ACPI: \_SB_.PCI0.GPP7.UP00.DP38.PWRS: New 
power resource
[    0.277243] [      T1] ACPI: \_SB_.PCI0.GPP7.UP00.DP38.EP00.PWRS: New 
power resource
[    0.277324] [      T1] ACPI: \_SB_.PCI0.GPP7.UP00.DP40.PWRS: New 
power resource
[    0.277423] [      T1] ACPI: \_SB_.PCI0.GPP7.UP00.DP40.EP00.PWRS: New 
power resource
[    0.277523] [      T1] ACPI: \_SB_.PCI0.GPP7.UP00.DP48.PWRS: New 
power resource
[    0.277591] [      T1] ACPI: \_SB_.PCI0.GPP7.UP00.DP48.EP00.PWRS: New 
power resource
[    0.277669] [      T1] ACPI: \_SB_.PCI0.GPP7.UP00.DP50.PWRS: New 
power resource
[    0.277737] [      T1] ACPI: \_SB_.PCI0.GPP7.UP00.DP50.EP00.PWRS: New 
power resource
[    0.277815] [      T1] ACPI: \_SB_.PCI0.GPP7.UP00.DP58.PWRS: New 
power resource
[    0.277882] [      T1] ACPI: \_SB_.PCI0.GPP7.UP00.DP58.EP00.PWRS: New 
power resource
[    0.277961] [      T1] ACPI: \_SB_.PCI0.GPP7.UP00.DP60.PWRS: New 
power resource
[    0.278061] [      T1] ACPI: \_SB_.PCI0.GPP7.UP00.DP60.XH00.PWRS: New 
power resource
[    0.279355] [      T1] ACPI: \_SB_.PCI0.GPP7.UP00.DP68.PWRS: New 
power resource
[    0.279475] [      T1] ACPI: \_SB_.PCI0.GPP7.UP00.DP68.SA00.PWRS: New 
power resource
[    0.279778] [      T1] ACPI: \_SB_.PCI0.GPP8.PWRS: New power resource
[    0.284003] [      T1] ACPI: \_SB_.PCI0.GPP8.U4UP.PWRS: New power 
resource
[    0.287479] [      T1] ACPI: \_SB_.PCI0.GPP8.U4UP.U4P0.PWRS: New 
power resource
[    0.289892] [      T1] ACPI: \_SB_.PCI0.GPP8.U4UP.U4P0.UP0D.PWRS: New 
power resource
[    0.290165] [      T1] ACPI: \_SB_.PCI0.GPP8.U4UP.U4P1.PWRS: New 
power resource
[    0.293587] [      T1] ACPI: \_SB_.PCI0.GPP8.U4UP.U4P1.UP1D.PWRS: New 
power resource
[    0.293777] [      T1] ACPI: \_SB_.PCI0.GPP8.U4UP.U4P2.PWRS: New 
power resource
[    0.296122] [      T1] ACPI: \_SB_.PCI0.GPP8.U4UP.U4P2.UXHC.PWRS: New 
power resource
[    0.298840] [      T1] ACPI: \_SB_.PCI0.GPP8.U4UP.U4P3.PWRS: New 
power resource
[    0.301222] [      T1] ACPI: \_SB_.PCI0.GPP8.U4UP.U4P3.UHI0.PWRS: New 
power resource
[    0.304956] [      T1] ACPI: \_SB_.PRWL: New power resource
[    0.304967] [      T1] ACPI: \_SB_.PRWB: New power resource
[    0.305249] [      T1] ACPI: PCI Root Bridge [PCI0] (domain 0000 [bus 
00-ff])
[    0.305253] [      T1] acpi PNP0A08:00: _OSC: OS supports 
[ExtendedConfig ASPM ClockPM Segments MSI EDR HPX-Type3]
[    0.305298] [      T1] acpi PNP0A08:00: _OSC: OS now controls 
[PCIeHotplug SHPCHotplug PME AER PCIeCapability LTR DPC]
[    0.305570] [      T1] pci_bus 0000:00: root bus resource [io 
0x0000-0x03af window]
[    0.305571] [      T1] pci_bus 0000:00: root bus resource [io 
0x03e0-0x0cf7 window]
[    0.305572] [      T1] pci_bus 0000:00: root bus resource [io 
0x03b0-0x03df window]
[    0.305572] [      T1] pci_bus 0000:00: root bus resource [io 
0x0d00-0xffff window]
[    0.305573] [      T1] pci_bus 0000:00: root bus resource [mem 
0x000a0000-0x000dffff window]
[    0.305573] [      T1] pci_bus 0000:00: root bus resource [mem 
0xf2000000-0xf6ffffff window]
[    0.305574] [      T1] pci_bus 0000:00: root bus resource [mem 
0xf0000000-0xf1ffffff window]
[    0.305574] [      T1] pci_bus 0000:00: root bus resource [mem 
0xa0000000-0xdfffffff window]
[    0.305575] [      T1] pci_bus 0000:00: root bus resource [mem 
0x1060000000-0xfcffffffff window]
[    0.305575] [      T1] pci_bus 0000:00: root bus resource [bus 00-ff]
[    0.340759] [      T1] ACPI: PCI: Interrupt link LNKA configured for 
IRQ 0
[    0.340778] [      T1] ACPI: PCI: Interrupt link LNKB configured for 
IRQ 0
[    0.340793] [      T1] ACPI: PCI: Interrupt link LNKC configured for 
IRQ 0
[    0.340813] [      T1] ACPI: PCI: Interrupt link LNKD configured for 
IRQ 0
[    0.340830] [      T1] ACPI: PCI: Interrupt link LNKE configured for 
IRQ 0
[    0.340845] [      T1] ACPI: PCI: Interrupt link LNKF configured for 
IRQ 0
[    0.340860] [      T1] ACPI: PCI: Interrupt link LNKG configured for 
IRQ 0
[    0.340874] [      T1] ACPI: PCI: Interrupt link LNKH configured for 
IRQ 0
[    0.348579] [      T1] PCI: Using ACPI for IRQ routing
[    0.354012] [      T1] e820: register RAM buffer resource [mem 
0x099ff000-0x0bffffff]
[    0.354013] [      T1] e820: register RAM buffer resource [mem 
0x0a200000-0x0bffffff]
[    0.354014] [      T1] e820: register RAM buffer resource [mem 
0x0b000000-0x0bffffff]
[    0.354014] [      T1] e820: register RAM buffer resource [mem 
0x7c639000-0x7fffffff]
[    0.354015] [      T1] e820: register RAM buffer resource [mem 
0x7e24c000-0x7fffffff]
[    0.354015] [      T1] e820: register RAM buffer resource [mem 
0x8307f000-0x83ffffff]
[    0.354015] [      T1] e820: register RAM buffer resource [mem 
0x9b015000-0x9bffffff]
[    0.354016] [      T1] e820: register RAM buffer resource [mem 
0x9bff7000-0x9bffffff]
[    0.354016] [      T1] e820: register RAM buffer resource [mem 
0x105de80000-0x105fffffff]
[    0.356685] [      T1] acpi PNP0C01:00: Reserved [mem 
0xe0000000-0xefffffff]
[    0.356705] [      T1] acpi PNP0C02:00: Could not reserve [mem 
0xf7600000-0xf767ffff]
[    0.356714] [      T1] acpi PNP0C02:01: Could not reserve [mem 
0x1000000000000 window]
[    0.356767] [      T1] acpi PNP0C02:02: Reserved [io  0x0280-0x028f]
[    0.356767] [      T1] acpi PNP0C02:02: Reserved [io  0x0290-0x029f]
[    0.356768] [      T1] acpi PNP0C02:02: Reserved [io  0x02a0-0x02af]
[    0.356768] [      T1] acpi PNP0C02:02: Reserved [io  0x02b0-0x02bf]
[    0.356808] [      T1] acpi PNP0C02:03: Skipped [io  0x0010-0x001f]
[    0.356809] [      T1] acpi PNP0C02:03: Skipped [io  0x0022-0x003f]
[    0.356809] [      T1] acpi PNP0C02:03: Skipped [io  0x0063]
[    0.356810] [      T1] acpi PNP0C02:03: Skipped [io  0x0065]
[    0.356810] [      T1] acpi PNP0C02:03: Skipped [io  0x0067-0x006f]
[    0.356810] [      T1] acpi PNP0C02:03: Skipped [io  0x0072-0x007f]
[    0.356811] [      T1] acpi PNP0C02:03: Skipped [io  0x0080]
[    0.356811] [      T1] acpi PNP0C02:03: Skipped [io  0x0084-0x0086]
[    0.356811] [      T1] acpi PNP0C02:03: Skipped [io  0x0088]
[    0.356812] [      T1] acpi PNP0C02:03: Skipped [io  0x008c-0x008e]
[    0.356812] [      T1] acpi PNP0C02:03: Skipped [io  0x0090-0x009f]
[    0.356812] [      T1] acpi PNP0C02:03: Skipped [io  0x00a2-0x00bf]
[    0.356813] [      T1] acpi PNP0C02:03: Skipped [io  0x00b1]
[    0.356813] [      T1] acpi PNP0C02:03: Skipped [io  0x00e0-0x00ef]
[    0.356813] [      T1] acpi PNP0C02:03: Reserved [io  0x04d0-0x04d1]
[    0.356814] [      T1] acpi PNP0C02:03: Reserved [io  0x040b]
[    0.356814] [      T1] acpi PNP0C02:03: Reserved [io  0x04d6]
[    0.356815] [      T1] acpi PNP0C02:03: Reserved [io  0x0c00-0x0c01]
[    0.356815] [      T1] acpi PNP0C02:03: Reserved [io  0x0c14]
[    0.356816] [      T1] acpi PNP0C02:03: Reserved [io  0x0c50-0x0c51]
[    0.356816] [      T1] acpi PNP0C02:03: Reserved [io  0x0c52]
[    0.356817] [      T1] acpi PNP0C02:03: Reserved [io  0x0c6c]
[    0.356817] [      T1] acpi PNP0C02:03: Reserved [io  0x0c6f]
[    0.356817] [      T1] acpi PNP0C02:03: Reserved [io  0x0cd8-0x0cdf]
[    0.356818] [      T1] acpi PNP0C02:03: Reserved [io  0x0800-0x089f]
[    0.356818] [      T1] acpi PNP0C02:03: Reserved [io  0x0b00-0x0b0f]
[    0.356819] [      T1] acpi PNP0C02:03: Reserved [io  0x0b20-0x0b3f]
[    0.356819] [      T1] acpi PNP0C02:03: Reserved [io  0x0900-0x090f]
[    0.356819] [      T1] acpi PNP0C02:03: Reserved [io  0x0910-0x091f]
[    0.356820] [      T1] acpi PNP0C02:03: Reserved [mem 
0xfedc0000-0xfedc0fff]
[    0.356821] [      T1] acpi PNP0C02:03: Reserved [mem 
0xfee00000-0xfee00fff]
[    0.356822] [      T1] acpi PNP0C02:03: Reserved [mem 
0xfec10000-0xfec10fff]
[    0.356822] [      T1] acpi PNP0C02:03: Reserved [mem 
0xff000000-0xffffffff]
[    0.356838] [      T1] pnp: PnP ACPI init
[    0.358796] [      T1] pnp: PnP ACPI: found 0 devices
[    0.363888] [      T1] clocksource: acpi_pm: mask: 0xffffff 
max_cycles: 0xffffff, max_idle_ns: 2085701024 ns
[    0.365766] [      T1] pci_bus 0000:00: resource 4 [io  0x0000-0x03af 
window]
[    0.365766] [      T1] pci_bus 0000:00: resource 5 [io  0x03e0-0x0cf7 
window]
[    0.365767] [      T1] pci_bus 0000:00: resource 6 [io  0x03b0-0x03df 
window]
[    0.365767] [      T1] pci_bus 0000:00: resource 7 [io  0x0d00-0xffff 
window]
[    0.365768] [      T1] pci_bus 0000:00: resource 8 [mem 
0x000a0000-0x000dffff window]
[    0.365768] [      T1] pci_bus 0000:00: resource 9 [mem 
0xf2000000-0xf6ffffff window]
[    0.365768] [      T1] pci_bus 0000:00: resource 10 [mem 
0xf0000000-0xf1ffffff window]
[    0.365769] [      T1] pci_bus 0000:00: resource 11 [mem 
0xa0000000-0xdfffffff window]
[    0.365769] [      T1] pci_bus 0000:00: resource 12 [mem 
0x1060000000-0xfcffffffff window]
[    0.365770] [      T1] pci_bus 0000:01: resource 0 [io  0xf000-0xffff]
[    0.365770] [      T1] pci_bus 0000:01: resource 1 [mem 
0xdeb00000-0xdedfffff]
[    0.365771] [      T1] pci_bus 0000:01: resource 2 [mem 
0xf000000000-0xf80fffffff 64bit pref]
[    0.365771] [      T1] pci_bus 0000:02: resource 0 [io  0xf000-0xffff]
[    0.365772] [      T1] pci_bus 0000:02: resource 1 [mem 
0xdeb00000-0xdecfffff]
[    0.365772] [      T1] pci_bus 0000:02: resource 2 [mem 
0xf000000000-0xf80fffffff 64bit pref]
[    0.365772] [      T1] pci_bus 0000:03: resource 0 [io  0xf000-0xffff]
[    0.365773] [      T1] pci_bus 0000:03: resource 1 [mem 
0xdeb00000-0xdecfffff]
[    0.365773] [      T1] pci_bus 0000:03: resource 2 [mem 
0xf000000000-0xf80fffffff 64bit pref]
[    0.365774] [      T1] pci_bus 0000:04: resource 1 [mem 
0xdef00000-0xdeffffff]
[    0.365774] [      T1] pci_bus 0000:05: resource 0 [io  0xc000-0xdfff]
[    0.365774] [      T1] pci_bus 0000:05: resource 1 [mem 
0xde200000-0xde6fffff]
[    0.365775] [      T1] pci_bus 0000:06: resource 0 [io  0xc000-0xdfff]
[    0.365775] [      T1] pci_bus 0000:06: resource 1 [mem 
0xde200000-0xde6fffff]
[    0.365776] [      T1] pci_bus 0000:09: resource 0 [io  0xd000-0xdfff]
[    0.365776] [      T1] pci_bus 0000:09: resource 1 [mem 
0xde600000-0xde6fffff]
[    0.365776] [      T1] pci_bus 0000:0a: resource 0 [io  0xc000-0xcfff]
[    0.365777] [      T1] pci_bus 0000:0a: resource 1 [mem 
0xde500000-0xde5fffff]
[    0.365777] [      T1] pci_bus 0000:0e: resource 1 [mem 
0xde400000-0xde4fffff]
[    0.365778] [      T1] pci_bus 0000:0f: resource 1 [mem 
0xde300000-0xde3fffff]
[    0.365778] [      T1] pci_bus 0000:10: resource 1 [mem 
0xde200000-0xde2fffff]
[    0.365778] [      T1] pci_bus 0000:11: resource 0 [io  0x6000-0xbfff]
[    0.365779] [      T1] pci_bus 0000:11: resource 1 [mem 
0xac000000-0xdc7fffff]
[    0.365779] [      T1] pci_bus 0000:11: resource 2 [mem 
0xb000000000-0xefffffffff 64bit pref]
[    0.365780] [      T1] pci_bus 0000:12: resource 0 [io  0x6000-0xbfff]
[    0.365780] [      T1] pci_bus 0000:12: resource 1 [mem 
0xac000000-0xdc7fffff]
[    0.365780] [      T1] pci_bus 0000:12: resource 2 [mem 
0xb000000000-0xefffffffff 64bit pref]
[    0.365781] [      T1] pci_bus 0000:13: resource 0 [io  0x9000-0xbfff]
[    0.365781] [      T1] pci_bus 0000:13: resource 1 [mem 
0xc4000000-0xdbffffff]
[    0.365782] [      T1] pci_bus 0000:13: resource 2 [mem 
0xd000000000-0xefffffffff 64bit pref]
[    0.365782] [      T1] pci_bus 0000:43: resource 0 [io  0x6000-0x8fff]
[    0.365782] [      T1] pci_bus 0000:43: resource 1 [mem 
0xac000000-0xc3ffffff]
[    0.365783] [      T1] pci_bus 0000:43: resource 2 [mem 
0xb000000000-0xcfffffffff 64bit pref]
[    0.365783] [      T1] pci_bus 0000:73: resource 1 [mem 
0xdc400000-0xdc7fffff]
[    0.365784] [      T1] pci_bus 0000:74: resource 1 [mem 
0xdc000000-0xdc3fffff]
[    0.365784] [      T1] pci_bus 0000:75: resource 0 [io  0xe000-0xefff]
[    0.365784] [      T1] pci_bus 0000:75: resource 1 [mem 
0xdd000000-0xde0fffff]
[    0.365785] [      T1] pci_bus 0000:76: resource 1 [mem 
0xde700000-0xdeafffff]
[    0.365785] [      T1] pci_bus 0000:77: resource 1 [mem 
0xdee00000-0xdeefffff]
[    1.326301] [      T1] tpm_crb_acpi MSFT0101:00: Disabling hwrng
[    1.326411] [      T1] ACPI: bus type drm_connector registered
[    2.224322] [    T411] ACPI: bus type USB registered
[    2.224438] [    T445] ACPI: video: Video Device [VGA] (multi-head: 
yes  rom: no  post: no)
[    2.224679] [    T445] input: Video Bus as 
/devices/pci0000:00/0000:00:08.1/acpi.video_bus.0/input/input0
[    2.228112] [    T444] ACPI: bus type thunderbolt registered
[   18.641366] [    T740] ACPI: button: Power Button [PWRB]
[   18.641684] [    T740] ACPI: button: Power Button [PWRF]



Thanks,
Matthew
On 9/2/26 2:31 PM, Armin Wolf wrote:
> Am 02.09.26 um 21:25 schrieb Matthew Bettencourt:
> 
>> Hello Armin,
>>
>> Here is the output of /proc/iomem and /proc/ioports. I made sure to 
>> grab each with root privileges.
>>
>>
>> # cat /proc/iomem
>> 00000000-00000fff : Reserved
>> 00001000-0009ffff : System RAM
>> 000a0000-000fffff : Reserved
>>   000a0000-000dffff : PCI Bus 0000:00
>>   000f0000-000fffff : System ROM
>> 00100000-099fefff : System RAM
>> 099ff000-09ffffff : Reserved
>> 0a000000-0a1fffff : System RAM
>> 0a200000-0a21dfff : ACPI Non-volatile Storage
>> 0a21e000-0affffff : System RAM
>> 0b000000-0b020fff : Reserved
>> 0b021000-7c638fff : System RAM
>> 7c639000-7c679fff : Reserved
>> 7c67a000-7e24bfff : System RAM
>> 7e24c000-7e24cfff : Reserved
>> 7e24d000-8307efff : System RAM
>> 8307f000-911fefff : Reserved
>>   911ce000-911d1fff : MSFT0101:00
>>     911ce000-911d1fff : MSFT0101:00
>>   911d2000-911d5fff : MSFT0101:00
>>     911d2000-911d5fff : MSFT0101:00
>> 911ff000-931fefff : ACPI Non-volatile Storage
>> 931ff000-951fefff : ACPI Tables
>> 951ff000-9b014fff : System RAM
>> 9b015000-9b016fff : ACPI Non-volatile Storage
>> 9b017000-9bff6fff : System RAM
>> 9bff7000-9bffbfff : Reserved
>> 9bffc000-9bffffff : System RAM
>> 9c000000-9dffffff : Reserved
>> 9e7f3000-9e7fffff : Reserved
>> a0000000-dfffffff : PCI Bus 0000:00
>>   ac000000-dc7fffff : PCI Bus 0000:11
>>     ac000000-dc7fffff : PCI Bus 0000:12
>>       ac000000-c3ffffff : PCI Bus 0000:43
>>       c4000000-dbffffff : PCI Bus 0000:13
>>       dc000000-dc3fffff : PCI Bus 0000:74
>>         dc000000-dc03ffff : 0000:74:00.0
>>           dc000000-dc03ffff : thunderbolt
>>         dc040000-dc04ffff : 0000:74:00.0
>>       dc400000-dc7fffff : PCI Bus 0000:73
>>         dc400000-dc407fff : 0000:73:00.0
>>           dc400000-dc407fff : xhci-hcd
>>   dd000000-de0fffff : PCI Bus 0000:75
>>     dd000000-dd7fffff : 0000:75:00.1
>>       dd000000-dd7fffff : sfc
>>     dd800000-ddffffff : 0000:75:00.0
>>       dd800000-ddffffff : sfc
>>     de000000-de03ffff : 0000:75:00.1
>>     de040000-de07ffff : 0000:75:00.0
>>     de080000-de083fff : 0000:75:00.1
>>     de084000-de087fff : 0000:75:00.0
>>   de200000-de6fffff : PCI Bus 0000:05
>>     de200000-de6fffff : PCI Bus 0000:06
>>       de200000-de2fffff : PCI Bus 0000:10
>>         de200000-de27ffff : 0000:10:00.0
>>         de280000-de2803ff : 0000:10:00.0
>>           de280000-de2803ff : ahci
>>       de300000-de3fffff : PCI Bus 0000:0f
>>         de300000-de307fff : 0000:0f:00.0
>>           de300000-de307fff : xhci-hcd
>>       de400000-de4fffff : PCI Bus 0000:0e
>>         de400000-de403fff : 0000:0e:00.0
>>           de400000-de403fff : nvme
>>       de500000-de5fffff : PCI Bus 0000:0a
>>         de500000-de50ffff : 0000:0a:00.0
>>           de500000-de50ffff : r8169
>>         de510000-de513fff : 0000:0a:00.0
>>       de600000-de6fffff : PCI Bus 0000:09
>>         de600000-de6fffff : 0000:09:00.0
>>           de600000-de6fffff : rtw89_pci
>>   de700000-deafffff : PCI Bus 0000:76
>>     de700000-de7fffff : 0000:76:00.4
>>       de700000-de7fffff : xhci-hcd
>>     de800000-de8fffff : 0000:76:00.3
>>       de800000-de8fffff : xhci-hcd
>>     de900000-de9fffff : 0000:76:00.2
>>       de900000-de9fffff : ccp
>>     dea00000-dea07fff : 0000:76:00.6
>>       dea00000-dea07fff : ICH HD audio
>>     dea08000-dea09fff : 0000:76:00.2
>>       dea08000-dea09fff : ccp
>>   deb00000-dedfffff : PCI Bus 0000:01
>>     deb00000-decfffff : PCI Bus 0000:02
>>       deb00000-decfffff : PCI Bus 0000:03
>>         deb00000-debfffff : 0000:03:00.0
>>         dec00000-dec1ffff : 0000:03:00.0
>>         dec20000-dec23fff : 0000:03:00.1
>>           dec20000-dec23fff : ICH HD audio
>>     ded00000-ded03fff : 0000:01:00.0
>>   dee00000-deefffff : PCI Bus 0000:77
>>     dee00000-deefffff : 0000:77:00.0
>>       dee00000-deefffff : xhci-hcd
>>   def00000-deffffff : PCI Bus 0000:04
>>     def00000-def03fff : 0000:04:00.0
>>       def00000-def03fff : nvme
>> e0000000-efffffff : PCI ECAM 0000 [bus 00-ff]
>>   e0000000-efffffff : PNP0C01:00
>> f0000000-f1ffffff : PCI Bus 0000:00
>> f2000000-f6ffffff : PCI Bus 0000:00
>> f7210510-f721053f : MSFT0101:00
>> f7600000-f767ffff : amd_iommu
>> feb00000-feb00007 : SB800 TCO
>> fec00000-fec003ff : IOAPIC 0
>> fec01000-fec013ff : IOAPIC 1
>> fec10000-fec10fff : PNP0C02:03
>> fec40000-fec40fff : AMDIF031:00
>>   fec40000-fec40fff : AMDIF031:00 AMDIF031:00
>> fed00000-fed003ff : HPET 0
>>   fed00000-fed003ff : PNP0103:00
>> fed81500-fed818ff : AMDI0030:00
>>   fed81500-fed818ff : AMDI0030:00 AMDI0030:00
>> fedc0000-fedc0fff : PNP0C02:03
>> fedc2000-fedc2fff : AMDI0010:00
>>   fedc2000-fedc2fff : AMDI0010:00 AMDI0010:00
>> fedc3000-fedc3fff : AMDI0010:01
>>   fedc3000-fedc3fff : AMDI0010:01 AMDI0010:01
>> fee00000-fee00fff : Reserved
>>   fee00000-fee00fff : PNP0C02:03
>> ff000000-ffffffff : PNP0C02:03
>> 100000000-105de7ffff : System RAM
>>   6cc600000-6cd85356f : Kernel code
>>   6cda00000-6ce95cfff : Kernel rodata
>>   6cea00000-6ced3b23f : Kernel data
>>   6cf660000-6cfbfffff : Kernel bss
>> 105de80000-105eebffff : RAM buffer
>> 105eec0000-105fffffff : Reserved
>> 1060000000-fcffffffff : PCI Bus 0000:00
>>   b000000000-efffffffff : PCI Bus 0000:11
>>     b000000000-efffffffff : PCI Bus 0000:12
>>       b000000000-cfffffffff : PCI Bus 0000:43
>>       d000000000-efffffffff : PCI Bus 0000:13
>>   f000000000-f80fffffff : PCI Bus 0000:01
>>     f000000000-f80fffffff : PCI Bus 0000:02
>>       f000000000-f80fffffff : PCI Bus 0000:03
>>         f000000000-f7ffffffff : 0000:03:00.0
>>         f800000000-f80fffffff : 0000:03:00.0
>> fd00000000-ffffffffff : Reserved
>> 3ffa00000000-3fffffffffff : 0000:03:00.0
>> # cat /proc/ioports
>> 0000-03af : PCI Bus 0000:00
>>   0000-001f : dma1
>>   0020-0021 : pic1
>>   0040-0043 : timer0
>>   0050-0053 : timer1
>>   0060-0060 : keyboard
>>   0061-0061 : PNP0800:00
>>   0064-0064 : keyboard
>>   0070-0071 : PNP0B00:00
>>     0070-0071 : rtc0
>>   0080-008f : dma page reg
>>   00a0-00a1 : pic2
>>   00b4-00b4 : ACPI PM2_CNT_BLK
>>   00c0-00df : dma2
>>   00f0-00ff : fpu
>>   0280-028f : PNP0C02:02
>>   0290-029f : PNP0C02:02
>>   02a0-02af : PNP0C02:02
>>   02b0-02bf : PNP0C02:02
>> 03b0-03df : PCI Bus 0000:00
>> 03e0-0cf7 : PCI Bus 0000:00
>>   040b-040b : PNP0C02:03
>>   04d0-04d1 : PNP0C02:03
>>   04d6-04d6 : PNP0C02:03
>>   0800-089f : PNP0C02:03
>>     0800-0803 : ACPI PM1a_EVT_BLK
>>     0804-0805 : ACPI PM1a_CNT_BLK
>>     0808-080b : ACPI PM_TMR
>>     0820-0827 : ACPI GPE0_BLK
>>   0900-090f : PNP0C02:03
>>   0910-091f : PNP0C02:03
>>   0b00-0b0f : PNP0C02:03
>>     0b00-0b08 : piix4_smbus
>>   0b20-0b3f : PNP0C02:03
>>     0b20-0b28 : piix4_smbus
> 
> Bingo, ACPI is telling the OS that those port ranges are reserved by the 
> firmware.
> For some reason the check inside the driver does not pick this up.
> 
> Does dmesg contain any lines similar to "Resource conflict; ACPI support 
> missing from driver?"?
> 
> Thanks,
> Armin Wolf
> 
>> 0c00-0c01 : PNP0C02:03
>>   0c14-0c14 : PNP0C02:03
>>   0c50-0c51 : PNP0C02:03
>>   0c52-0c52 : PNP0C02:03
>>   0c6c-0c6c : PNP0C02:03
>>   0c6f-0c6f : PNP0C02:03
>>   0cd8-0cdf : PNP0C02:03
>> 0cf8-0cff : PCI conf1
>> 0d00-ffff : PCI Bus 0000:00
>>   6000-bfff : PCI Bus 0000:11
>>     6000-bfff : PCI Bus 0000:12
>>       6000-8fff : PCI Bus 0000:43
>>       9000-bfff : PCI Bus 0000:13
>>   c000-dfff : PCI Bus 0000:05
>>     c000-dfff : PCI Bus 0000:06
>>       c000-cfff : PCI Bus 0000:0a
>>         c000-c0ff : 0000:0a:00.0
>>       d000-dfff : PCI Bus 0000:09
>>         d000-d0ff : 0000:09:00.0
>>           d000-d0ff : rtw89_pci
>>   e000-efff : PCI Bus 0000:75
>>     e000-e0ff : 0000:75:00.1
>>     e100-e1ff : 0000:75:00.0
>>   f000-ffff : PCI Bus 0000:01
>>     f000-ffff : PCI Bus 0000:02
>>       f000-ffff : PCI Bus 0000:03
>>         f000-f0ff : 0000:03:00.0
>>
>>
>>
>>

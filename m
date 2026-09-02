Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D201737F307
	for <linux-hwmon@vger.kernel.org>; Wed,  2 Sep 2026 19:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788377167; cv=none; b=K/HY+W+Jx3X5WXD7z3g2JovW0JNjDQ6KXsOGWshWTg8gPK9XOxWqGm8fqew414tPA9XWo0Wtv2K4xJ9qEav8Ez7FSLN0Oj6VzZnv8iDrDhGE0fJ5UwStKmPxTPrKRA4RDl54ZWeh6hu8LxRH6t0SgaS0CKXeJFRJB+6rJjecXSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788377167; c=relaxed/simple;
	bh=h+0VFpbVz6qrdQh9qftUIOyC0c7qD6/zUW5DkVN0vS8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sFKqSz0mZsP4jRuKGhSxC+rvDqiFkbvRvsLQFSrFUbPRsvj1ARm00LdSBV8j/PSvB7Hgl9m49BF54pkeuC/Zn4MCRJwhGwgcTOIQJN+ApKdVQI/BazR6pEw2yZ+7ugIseEXrYAqaGLm8zgM75mrplRhb4SX+BiCVAPxdD3PgrjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VhJTH1Zh; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VhJTH1Zh"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-ca7c1176317so1234470a12.1
        for <linux-hwmon@vger.kernel.org>; Wed, 02 Sep 2026 12:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788377158; x=1788981958; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MaoAH6aWpCkkq+LuRV2ufLYzVkiNBbNgrCNANSwUg9c=;
        b=VhJTH1ZhLO3Yp4vFu9djVw0VD/uVrbO1lncNvbDMPyAahTVdrENVOEQ1HHIsiTVGLh
         YYQG4fGSfQr6ZYRVwLV6+DB7FkDSI/b77tHiDcQQ0GzI1XACNj62+S51HX7f0gk07PHR
         ZlUaClG3F3haVu+1a/PqQ7xA/BYffQKzBV3DLgpsSTEMHxS5lcXHiWVg2T+EAJOdw3KK
         IzNKpO+d3f9HgqYld/M1iiZVHuZfXGTVWedH07TiIGAcbTzDvj/RN3/wXKvoHxnSN1A4
         BLdn2l7PSQWk2tKLvtXAX62BbRoU7BXBwomoDs4Y3RqgXnVPSfXssJEw8MqFo0Dzhwcx
         ItMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788377158; x=1788981958;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MaoAH6aWpCkkq+LuRV2ufLYzVkiNBbNgrCNANSwUg9c=;
        b=nntY08bQSxBNoGuK/srjk+xZ17VpzVYRC1NmDV7vPCm2eXyxiC5tX5ukVz2oao1pzB
         E2ky3keb3fFiIkJqd+TzCHKQYv1jK7t+Hgwd+UVufdEXF6U6JVluowhYBhN4e4D+v+MO
         aj39WxI83shr42E8v2vpfkkBTn8IbOhNIn6PbMJSvE/tnSfkWxOPSR1AQN6wuLhUdJLS
         XOl3NBsHW+Ny6jbX+xBewtTGbIbFuhrKM3YUq3B91N3YbG8UxqtLdVBHYdXE4VN4VlaG
         hlj6hVTvVERKTaSgZ0fEfzFDFtMxI1P0ga1n1rbUFlBSjMRyoIxeLlA0MXDYDmRcANFK
         9O3A==
X-Gm-Message-State: AFuF++l9g4YhHYwv59MGgyEUwUWTjqBJpTl5CFoFKyfdQdg6U6GrZKJS
	MkU/NHBe/JVoCxZdnp5Nonn2vp1pP7mWCRX1z8esp5aISehFfhrw/FUc
X-Gm-Gg: AYBFou3EpQVFlCpK14BjsjyCX9wVR/6Fss0nniqCI4S1sZ83/knL/cqlQEIA276vRul
	Vi6yi64qTaf57NyDLRNDMCgJ0iQ0s2NYgPY9of+UnMG0Hsxut4iroNEVLQLJ2UP6rB1zb9dj1oa
	Q/WiwOUOpLYRwY+nzSde/LFIqE7zssBP1c9yPVTrt3sx4zak2dhU/o8pIppWfEMl+FSWniko6Z0
	5s5OGQFQ4L6AZkx31hPRNRsSU0+VGxmreenZxajYiVdLcIhGNrUTkir29zaLaEE29P5+HOI+eCn
	jlVTNHG3Ny9JlljIOKgKG5NA2SJi155ufCTsXnprJCcMlpZ9gE9PcHWkZsjw8qJQzxYjwDBPJF6
	n8QLTzotKYUTflqtnSY1osS0bw5C/vlhonCsiK0r2ge1i7Ep1S/nVLC6a5e28KveQVIGDlFrizN
	+ZrtIpuK0sUQBQ+XxgFrY2H2UxQgbk1LWuCke2EnjjmJblgqcjJpZ2ZuyxSOT0dUJER43d1EmhV
	jEHAdnSQWljQCUSTs12PYg4rzrtchjQzEUwbfgpr5oDG7tIGVGNsRU4
X-Received: by 2002:a17:90b:520f:b0:398:9c00:29e9 with SMTP id 98e67ed59e1d1-39aee1b72e5mr11383343a91.17.1788377157524;
        Wed, 02 Sep 2026 12:25:57 -0700 (PDT)
Received: from [10.198.0.120] (wnpgmb02ydw-ds01-112-62-45.dynamic.bellmts.net. [204.112.62.45])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08ca63b3sm808246a91.11.2026.09.02.12.25.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 12:25:57 -0700 (PDT)
Message-ID: <a5d32ab5-f545-4e11-bf0b-88d3eaa68890@gmail.com>
Date: Wed, 2 Sep 2026 14:25:54 -0500
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
 <37132c40-aa82-4df1-b5ce-337601f3c085@gmail.com>
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
Content-Language: en-US
From: Matthew Bettencourt <matthew.bettencourt@gmail.com>
In-Reply-To: <57a05dea-3cce-4ecf-bbe1-ab7464f8c224@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello Armin,

Here is the output of /proc/iomem and /proc/ioports. I made sure to grab 
each with root privileges.


# cat /proc/iomem
00000000-00000fff : Reserved
00001000-0009ffff : System RAM
000a0000-000fffff : Reserved
   000a0000-000dffff : PCI Bus 0000:00
   000f0000-000fffff : System ROM
00100000-099fefff : System RAM
099ff000-09ffffff : Reserved
0a000000-0a1fffff : System RAM
0a200000-0a21dfff : ACPI Non-volatile Storage
0a21e000-0affffff : System RAM
0b000000-0b020fff : Reserved
0b021000-7c638fff : System RAM
7c639000-7c679fff : Reserved
7c67a000-7e24bfff : System RAM
7e24c000-7e24cfff : Reserved
7e24d000-8307efff : System RAM
8307f000-911fefff : Reserved
   911ce000-911d1fff : MSFT0101:00
     911ce000-911d1fff : MSFT0101:00
   911d2000-911d5fff : MSFT0101:00
     911d2000-911d5fff : MSFT0101:00
911ff000-931fefff : ACPI Non-volatile Storage
931ff000-951fefff : ACPI Tables
951ff000-9b014fff : System RAM
9b015000-9b016fff : ACPI Non-volatile Storage
9b017000-9bff6fff : System RAM
9bff7000-9bffbfff : Reserved
9bffc000-9bffffff : System RAM
9c000000-9dffffff : Reserved
9e7f3000-9e7fffff : Reserved
a0000000-dfffffff : PCI Bus 0000:00
   ac000000-dc7fffff : PCI Bus 0000:11
     ac000000-dc7fffff : PCI Bus 0000:12
       ac000000-c3ffffff : PCI Bus 0000:43
       c4000000-dbffffff : PCI Bus 0000:13
       dc000000-dc3fffff : PCI Bus 0000:74
         dc000000-dc03ffff : 0000:74:00.0
           dc000000-dc03ffff : thunderbolt
         dc040000-dc04ffff : 0000:74:00.0
       dc400000-dc7fffff : PCI Bus 0000:73
         dc400000-dc407fff : 0000:73:00.0
           dc400000-dc407fff : xhci-hcd
   dd000000-de0fffff : PCI Bus 0000:75
     dd000000-dd7fffff : 0000:75:00.1
       dd000000-dd7fffff : sfc
     dd800000-ddffffff : 0000:75:00.0
       dd800000-ddffffff : sfc
     de000000-de03ffff : 0000:75:00.1
     de040000-de07ffff : 0000:75:00.0
     de080000-de083fff : 0000:75:00.1
     de084000-de087fff : 0000:75:00.0
   de200000-de6fffff : PCI Bus 0000:05
     de200000-de6fffff : PCI Bus 0000:06
       de200000-de2fffff : PCI Bus 0000:10
         de200000-de27ffff : 0000:10:00.0
         de280000-de2803ff : 0000:10:00.0
           de280000-de2803ff : ahci
       de300000-de3fffff : PCI Bus 0000:0f
         de300000-de307fff : 0000:0f:00.0
           de300000-de307fff : xhci-hcd
       de400000-de4fffff : PCI Bus 0000:0e
         de400000-de403fff : 0000:0e:00.0
           de400000-de403fff : nvme
       de500000-de5fffff : PCI Bus 0000:0a
         de500000-de50ffff : 0000:0a:00.0
           de500000-de50ffff : r8169
         de510000-de513fff : 0000:0a:00.0
       de600000-de6fffff : PCI Bus 0000:09
         de600000-de6fffff : 0000:09:00.0
           de600000-de6fffff : rtw89_pci
   de700000-deafffff : PCI Bus 0000:76
     de700000-de7fffff : 0000:76:00.4
       de700000-de7fffff : xhci-hcd
     de800000-de8fffff : 0000:76:00.3
       de800000-de8fffff : xhci-hcd
     de900000-de9fffff : 0000:76:00.2
       de900000-de9fffff : ccp
     dea00000-dea07fff : 0000:76:00.6
       dea00000-dea07fff : ICH HD audio
     dea08000-dea09fff : 0000:76:00.2
       dea08000-dea09fff : ccp
   deb00000-dedfffff : PCI Bus 0000:01
     deb00000-decfffff : PCI Bus 0000:02
       deb00000-decfffff : PCI Bus 0000:03
         deb00000-debfffff : 0000:03:00.0
         dec00000-dec1ffff : 0000:03:00.0
         dec20000-dec23fff : 0000:03:00.1
           dec20000-dec23fff : ICH HD audio
     ded00000-ded03fff : 0000:01:00.0
   dee00000-deefffff : PCI Bus 0000:77
     dee00000-deefffff : 0000:77:00.0
       dee00000-deefffff : xhci-hcd
   def00000-deffffff : PCI Bus 0000:04
     def00000-def03fff : 0000:04:00.0
       def00000-def03fff : nvme
e0000000-efffffff : PCI ECAM 0000 [bus 00-ff]
   e0000000-efffffff : PNP0C01:00
f0000000-f1ffffff : PCI Bus 0000:00
f2000000-f6ffffff : PCI Bus 0000:00
f7210510-f721053f : MSFT0101:00
f7600000-f767ffff : amd_iommu
feb00000-feb00007 : SB800 TCO
fec00000-fec003ff : IOAPIC 0
fec01000-fec013ff : IOAPIC 1
fec10000-fec10fff : PNP0C02:03
fec40000-fec40fff : AMDIF031:00
   fec40000-fec40fff : AMDIF031:00 AMDIF031:00
fed00000-fed003ff : HPET 0
   fed00000-fed003ff : PNP0103:00
fed81500-fed818ff : AMDI0030:00
   fed81500-fed818ff : AMDI0030:00 AMDI0030:00
fedc0000-fedc0fff : PNP0C02:03
fedc2000-fedc2fff : AMDI0010:00
   fedc2000-fedc2fff : AMDI0010:00 AMDI0010:00
fedc3000-fedc3fff : AMDI0010:01
   fedc3000-fedc3fff : AMDI0010:01 AMDI0010:01
fee00000-fee00fff : Reserved
   fee00000-fee00fff : PNP0C02:03
ff000000-ffffffff : PNP0C02:03
100000000-105de7ffff : System RAM
   6cc600000-6cd85356f : Kernel code
   6cda00000-6ce95cfff : Kernel rodata
   6cea00000-6ced3b23f : Kernel data
   6cf660000-6cfbfffff : Kernel bss
105de80000-105eebffff : RAM buffer
105eec0000-105fffffff : Reserved
1060000000-fcffffffff : PCI Bus 0000:00
   b000000000-efffffffff : PCI Bus 0000:11
     b000000000-efffffffff : PCI Bus 0000:12
       b000000000-cfffffffff : PCI Bus 0000:43
       d000000000-efffffffff : PCI Bus 0000:13
   f000000000-f80fffffff : PCI Bus 0000:01
     f000000000-f80fffffff : PCI Bus 0000:02
       f000000000-f80fffffff : PCI Bus 0000:03
         f000000000-f7ffffffff : 0000:03:00.0
         f800000000-f80fffffff : 0000:03:00.0
fd00000000-ffffffffff : Reserved
3ffa00000000-3fffffffffff : 0000:03:00.0
# cat /proc/ioports
0000-03af : PCI Bus 0000:00
   0000-001f : dma1
   0020-0021 : pic1
   0040-0043 : timer0
   0050-0053 : timer1
   0060-0060 : keyboard
   0061-0061 : PNP0800:00
   0064-0064 : keyboard
   0070-0071 : PNP0B00:00
     0070-0071 : rtc0
   0080-008f : dma page reg
   00a0-00a1 : pic2
   00b4-00b4 : ACPI PM2_CNT_BLK
   00c0-00df : dma2
   00f0-00ff : fpu
   0280-028f : PNP0C02:02
   0290-029f : PNP0C02:02
   02a0-02af : PNP0C02:02
   02b0-02bf : PNP0C02:02
03b0-03df : PCI Bus 0000:00
03e0-0cf7 : PCI Bus 0000:00
   040b-040b : PNP0C02:03
   04d0-04d1 : PNP0C02:03
   04d6-04d6 : PNP0C02:03
   0800-089f : PNP0C02:03
     0800-0803 : ACPI PM1a_EVT_BLK
     0804-0805 : ACPI PM1a_CNT_BLK
     0808-080b : ACPI PM_TMR
     0820-0827 : ACPI GPE0_BLK
   0900-090f : PNP0C02:03
   0910-091f : PNP0C02:03
   0b00-0b0f : PNP0C02:03
     0b00-0b08 : piix4_smbus
   0b20-0b3f : PNP0C02:03
     0b20-0b28 : piix4_smbus
   0c00-0c01 : PNP0C02:03
   0c14-0c14 : PNP0C02:03
   0c50-0c51 : PNP0C02:03
   0c52-0c52 : PNP0C02:03
   0c6c-0c6c : PNP0C02:03
   0c6f-0c6f : PNP0C02:03
   0cd8-0cdf : PNP0C02:03
0cf8-0cff : PCI conf1
0d00-ffff : PCI Bus 0000:00
   6000-bfff : PCI Bus 0000:11
     6000-bfff : PCI Bus 0000:12
       6000-8fff : PCI Bus 0000:43
       9000-bfff : PCI Bus 0000:13
   c000-dfff : PCI Bus 0000:05
     c000-dfff : PCI Bus 0000:06
       c000-cfff : PCI Bus 0000:0a
         c000-c0ff : 0000:0a:00.0
       d000-dfff : PCI Bus 0000:09
         d000-d0ff : 0000:09:00.0
           d000-d0ff : rtw89_pci
   e000-efff : PCI Bus 0000:75
     e000-e0ff : 0000:75:00.1
     e100-e1ff : 0000:75:00.0
   f000-ffff : PCI Bus 0000:01
     f000-ffff : PCI Bus 0000:02
       f000-ffff : PCI Bus 0000:03
         f000-f0ff : 0000:03:00.0




On 9/2/26 2:19 PM, Armin Wolf wrote:
> Am 02.09.26 um 19:28 schrieb Matthew Bettencourt:
> 
>> Hello Armin,
>>
>> Here is the acpi.log file as requested.
>>
> Thanks,
> 
> i suspect that the BIOS tries to use a PNP0C02 device to tell the kernel 
> that
> the SMBus controller is being driven by ACPI. Can you share the content 
> of /proc/iomem
> and /proc/ioports (with root privileges!)?
> 
> Thanks,
> Armin Wolf
> 
>> Thanks,
>> Matthew
>>
>> On 9/2/26 12:22 PM, Armin Wolf wrote:
>>> Am 02.09.26 um 19:08 schrieb Matthew Bettencourt:
>>>
>>>> Hi Armin,
>>>>
>>>> Are you want the acpi.log file or are you asking me to print out all 
>>>> the .dat files?
>>>
>>> Sharing the acpi.log file as an attachment should be fine.
>>>
>>> Thanks,
>>> Armin Wolf
>>>
>>>>
>>>> $ ls -1 | grep -iE ".dat|acpi.log"
>>>> acpi.log
>>>> dsdt.dat
>>>> ssdt10.dat
>>>> ssdt11.dat
>>>> ssdt12.dat
>>>> ssdt13.dat
>>>> ssdt14.dat
>>>> ssdt15.dat
>>>> ssdt16.dat
>>>> ssdt1.dat
>>>> ssdt2.dat
>>>> ssdt3.dat
>>>> ssdt4.dat
>>>> ssdt5.dat
>>>> ssdt6.dat
>>>> ssdt7.dat
>>>> ssdt8.dat
>>>> ssdt9.dat
>>>>
>>>> Thanks,
>>>> Matthew


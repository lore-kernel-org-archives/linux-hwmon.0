Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.202.169.39
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794062798;
	b=5SOj2GF2j0SVQAFL5xueFzdALCg492QzrIGPUhlN2X0v2DZCTe4ow1sPZ7ShX8ivkC/m
	 Qt/BJMc8hvK72mhxAEs3kDKXaeTDLGXLwgvppzhisnpqBebtZsBVj6V51FeLgzbTK6bUy
	 KCMnCZgFNFaI3QXPDWwo2cZsVsrNpzDynI6uYTnoWsW3+tJ66lOxDQE8zEU5sJ45jiPz0
	 o0DY2FJf7tWSlh0EOTIiK8V/jRgG4zOyO/UTXMOoiuL0ZeBj/PXugfKRN0Dcgr3tOvRJ4
	 QQnlOjBcxKFE3zEwqxc7zGiq+w+qdpX0xYh4JJBPQAH/O/CN/ET8GEbOTLtnBhoUp4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794062798;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:X-Source-L:X-Exim-ID:
	 X-Source:X-Source-Args:X-Source-Dir:X-Source-Sender:X-Source-Auth:
	 X-Email-Count:X-Org:X-Source-Cap:X-Local-Domain:X-CMAE-Envelope;
	bh=IoB9bq4NGVx3XVdhHveDkKj6a1MXw17zZzhzMKTeVJ4=;
	b=HjDifJ3ClPcU3wZG0jCFVC9bYrvO1EIc7KROCnfFoAL/pBjICdXgmsbdb64xnqQsmuSu
	 ABzJ0mqdE9aW/BNMGxCgcNWbrTckmu4L3riNSJos8rLDdvXThpV2zfKPqdR4LfeALpbX5
	 SPzGcxzZqW5UwhqVeyKjAVg6ZGnnPo7ElKovv0FsEXnVTvJ9diZVaDvzBKgQqizS/34EK
	 nIar/plIaN1/nFgvW69FgO57uISr+6votoG+QtWe9Kt+QwFrIGYdrZtAoBUj5BDvUM46G
	 HojJIf55A29ur3xxy8l72fzRIBKflDMQ4e0HKoRx9HNIh3IjIuNo2IKIlzuSvLMqcig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=qHYWQyGU;
	arc=none smtp.remote-ip=44.202.169.39
Received: from omta040.useast.a.cloudfilter.net (omta040.useast.a.cloudfilter.net [44.202.169.39])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C61C1606D80A
	for <linux-hwmon@vger.kernel.org>; Sat,  7 Nov 2026 14:46:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C61C1606D80A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=qHYWQyGU
Received: from eig-obgw-6007b.ext.cloudfilter.net ([10.0.30.166])
	by cmsmtp with ESMTPS
	id PNVpxumdVOOJnPhgixrOXD; Sat, 07 Nov 2026 14:46:36 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id PhghxUHI53nNNPhgixryiH; Sat, 07 Nov 2026 14:46:36 +0000
X-Authority-Analysis: v=2.4 cv=TuLmhCXh c=1 sm=1 tr=0 ts=6aef39cc
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10
 a=asFnanmtrhShgoyyQk4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=IoB9bq4NGVx3XVdhHveDkKj6a1MXw17zZzhzMKTeVJ4=; b=qHYWQyGUx07A
	qxO8tGhD2ixTFv/gTO45tjHOYo0m0KLNT5UA4ASA/KoDKDTJQ4cPsrKYW9Zb3ZhycTtOmFo1/ePp4
	BZKbOt8ZvUQBL9EevLctYxlYJc/J9BUe32+1iL3Fpi2zR/pheyqWyclpZM8jf/EYZ6JIPuXpAomps
	9tiGqNCr8HpoIcpxTHdm+9cpaU6po+GMKQ1DKy+sxtwtw8OaIDn/YgNT6LKRkBxwlpZTZxcjdYskU
	Rr7VHUCnBKiKTEzera45g8oiU2Iw15mej+6BHgcw8MYv9WNd7Y+m5w0CyRr3E2cAeTgF+XsmLAWCT
	pGTwjEsxnB4zpkVGzr1COQ==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:48028)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xPhgh-00000003VX5-2OTk;
	Sat, 07 Nov 2026 20:16:35 +0530
Message-ID: <4394d6d4-ea95-455c-a52e-a1d021afc2d4@roeck-us.net>
Date: Sat, 7 Nov 2026 06:46:34 -0800
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: hwmon: (nct6683) in_from_reg() never applies the 32 mV scale
To: Tomasz Bojanowski <tomasz@bojanowski.me>
Cc: linux-hwmon@vger.kernel.org, Hamza Mahfooz <someguy@effective-light.com>
References: <20261106144247.30507-1-tomasz@bojanowski.me>
 <cd150425-262a-4a74-9f78-5ff581e27846@roeck-us.net>
 <20261107103959.7879-1-tomasz@bojanowski.me>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20261107103959.7879-1-tomasz@bojanowski.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xPhgh-00000003VX5-2OTk
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net [108.223.40.66]:48028
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 4
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfLbTz1Od/8Swf9Boz+KiY7OfLAJ0jPkjySPRIUJhGwUl8BAgn/Cf4v2Vpbmjd2UrJgZ7hfYC0CbHW7iX8Ki03rv0qs/mzDVYjqv5ZAYOmEaZ84LqPIqD
 uhitS/rhSrv8mb9H8DMl1L6tvaMDi6Y/jOIo9Vwo3Fz2FbyegermAxu6fHaQqAX5nXW5lCFktoJX4hPC1lck3u0qeH0HZxRStnkNsXLz2pke1CBwlVqIwdPd

On 11/7/26 02:39, Tomasz Bojanowski wrote:
> Hi Guenter,
> 
> On 11/6/26 08:09, Guenter Roeck wrote:
>> The underlying problem is that, according to the datasheets, the basic
>> LSB is really 8 mV, not 16mV as the code suggests. 16mV LSB only applies
>> to ADC, AVCC, VBAT, 3VSB and 3VCC. There is no 32mV LSB anywhere.
>>
>> Patch(es) to fix the problem are welcome.
> 
> Before writing a patch, I checked this on the MS-7E61 (NCT6687D,
> customer ID 0x20d), including a direct read of the EC registers. On
> this board the high byte has a 16 mV LSB for every source I could check,
> including the VINx inputs. I have no reference values for VTT and VREF.
> With 8 mV, VINx would read half of the expected values:
> 
>    rail   source  raw  mult  16 mV (now)  8 mV
>    +12V   VIN0     63   x12      12.10 V  6.05 V
>    +5V    VIN1     62    x5       4.96 V  2.48 V
>    DRAM   VIN3     42    x2       1.34 V  0.67 V  (BIOS: 1.352 V)
>    Vcore  VIN4     84    x1       1.34 V  0.67 V  (cores at 5.5 GHz)
>    +3.3V  VCC     207    x1       3.31 V
>    VSB    VSB     209    x1       3.34 V
>    VBAT   VBAT    194    x1       3.10 V
> 
> The multipliers are the ones the vendor software uses for this board.
> With the low byte included (MSB * 16 + (LSB >> 4) mV), DRAM reads
> 1.352 V, exactly as in the BIOS. The vendor software and
> LibreHardwareMonitor use the same 16 mV scale for every source on
> NCT6687D (LHM also for NCT6683D and NCT6686D). I have no data from
> Intel or ASRock boards.
> 
> So I would propose a patch that removes the 32 mV case and the source
> argument of in_from_reg(), and documents 16 mV for all sources. Since
> the 32 mV case never matched, there is no functional change. A second
> patch could read the low byte as well, for 2 mV resolution.
> 
> Would that work for you, or do you have data showing 8 mV on other
> boards? In that case the scale could depend on the chip or customer
> ID. Also, which source does "ADC" in your list refer to?
> 

Yes, that is ok. "ADC" is from the datasheet. It says:

The nine analog inputs of the hardware monitor block connect to an 8-bit Analog to Digital Converter (ADC) and
consist of 4 general-purpose inputs connected to external device pins (VIN0 – VIN2) and five internal signals
connected to the power supplies (CPUVCORE, AVCC, VBAT, 3VSB and 3VCC). All inputs are limited to a
maximum voltage of 2.048V due to an internal setting of 8mV LSB (256 steps x 8mV = 2.048V). All inputs to the
ADC must limit the maximum voltage by using a voltage divider. The power supplies have internal resistors, while
the external pins require outside limiting resistors as described below.
...
All the internal inputs of the ADC, AVCC, VBAT, 3VSB and 3VCC utilize an integrated voltage divider with both
resistors equal to 34KΩ, yielding a voltage one half of the power supply.
...
The CPUVCORE pin feeds directly into the ADC with no voltage divider since the nominal voltage on this pin is only
1.2V.

So maybe it is all 16 mV except for CPUVCORE which is 8 mV ? I honestly can't say.

Thanks,
Guenter


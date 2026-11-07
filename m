Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.202.169.37
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794080461;
	b=LNRnd8uUK7QoHum5sfzYDYmLuHWuRQ1yRj8qJnLe58vWilM+p6ZgKJ32iU3+wilUE1jF
	 u7l2JN2qttp1oLO9RZq2TScgUShtkyP8eHijU4cp/D2WM2VOpiRq2nL0iWIxBGoYpjKj2
	 VX1Pog4mF37QQKxm3PM3riN3P8VsA4aSf1qRhwRUKr+IDUPcd/6cu760m0ZXgPitIZpb8
	 Rc8SPfwMmRZhhiq/sgCXGK/pDxoEA0i+lFhWJzqP46hWOCI74K6oGw/DK4/SOALJz/6ot
	 qePvGt6TWG0naljEtxDmLa5Q43cSCVKXYv7P4Ytt85+JmXnr8nQTHPlHLrCha8WeVpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794080461;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:X-Source-L:X-Exim-ID:
	 X-Source:X-Source-Args:X-Source-Dir:X-Source-Sender:X-Source-Auth:
	 X-Email-Count:X-Org:X-Source-Cap:X-Local-Domain:X-CMAE-Envelope;
	bh=bXzTwWLn0IE/6Sl+Ryk14mZHKGFkRdt/OR15MwQe5UE=;
	b=fTuNJO4xNsP3fVeinKpEshl7v87W7Od5mjLX/Ju6Nx0oAUVFIQiYlI7nPC/ekKFDu5Qi
	 ZKIdVlRqrDk/ZTL3hE6lefTT9crbsfT45N+UhlUQ1akN9/h3+MmYGDVbvI/O1aD3lW2CO
	 A7oEi90kRo4g1gncefeYdQQzfoQSOEvMldSUfCkETkj7uwohcM0Ti8Vsjn+qO33BjQrl9
	 DX/ABBPTv37fqp2UZBwfzOV9VUTIp7oqAI93qXeoNWdC6BtYxjsy32jPemYBJIr7wuFWk
	 SJZoG49Z8NgvdaypckPTsuPs+nvffie9D1LKUBEWa5Pa7pHZAbxUtlc0aXBruy9nQCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=SYseYT+4;
	arc=none smtp.remote-ip=44.202.169.37
Received: from omta038.useast.a.cloudfilter.net (omta038.useast.a.cloudfilter.net [44.202.169.37])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DFDB606A326
	for <linux-hwmon@vger.kernel.org>; Sat,  7 Nov 2026 19:41:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0DFDB606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=SYseYT+4
Received: from eig-obgw-6007b.ext.cloudfilter.net ([10.0.30.166])
	by cmsmtp with ESMTPS
	id POENxN1PwJFmFPmHcxtR1D; Sat, 07 Nov 2026 19:41:00 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id PmHbxcOlK3nNNPmHbxxxWc; Sat, 07 Nov 2026 19:40:59 +0000
X-Authority-Analysis: v=2.4 cv=TuLmhCXh c=1 sm=1 tr=0 ts=6aef7ecb
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=NEAV23lmAAAA:8
 a=H5YNcs6kZIdi0saECM8A:9 a=QEXdDO2ut3YA:10 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=bXzTwWLn0IE/6Sl+Ryk14mZHKGFkRdt/OR15MwQe5UE=; b=SYseYT+4mqbd
	Chm+/r18/Nnd1vvmw3Oov2XbSh2vS4bLP/Rsa3X1yRS5axDmeUlV9X9uiu7KG0PVYr04SHW6LGWFJ
	5P4HMmLpzjkoo7ubqnRfx1WAhyBuu5lDuIdJEe51TgPo0y+HDyKXy3qv0skkI8dx4wCTTbW5Q0Cc5
	o/rd95BRegEETc7OZ4sZvWKWRVQWVQB1RX0BRHjaAYMNtZ+a14GXDUqF0Dm9HFg4gHAO7/y3UWAz1
	M2WCDcr3Tcp/e5vClR7ePHjAqKK45/AMAsryX7kihH4eZkn9/cVPHeLRCK9NNrWpyQqE/Ez/W1mSC
	fbAIepCEtpwhRl9YcVk8CA==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:35394)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xPmHa-00000001qz0-3eAU;
	Sun, 08 Nov 2026 01:10:58 +0530
Message-ID: <e79d3e26-4ca5-4ca4-9159-427a5a6f1129@roeck-us.net>
Date: Sat, 7 Nov 2026 11:40:57 -0800
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
Subject: Re: [PATCH v2] hwmon: Add driver for MSI Mystic Light controller
 voltage sensors
To: Tomasz Bojanowski <tomasz@bojanowski.me>
Cc: linux-hwmon@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap
 <rdunlap@infradead.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261107082821.8257-1-tomasz@bojanowski.me>
 <812ee6c0-82ac-41f6-9eca-1f17c6ef715d@roeck-us.net>
 <20261107161249.336512-1-tomasz@bojanowski.me>
 <5e99fd86-d934-49c1-a867-02cc61ab1ecf@roeck-us.net>
 <20261107181518.385136-1-tomasz@bojanowski.me>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20261107181518.385136-1-tomasz@bojanowski.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xPmHa-00000001qz0-3eAU
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net [108.223.40.66]:35394
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 6
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfI6+S0K5RSVXd6rNsP7PRSIo1/dsz3u6s1rPkSodPeEWxUKivC4FUfF62Wyf3aEBo3raBcWwCsS63Ao9CkZ8Cci/6uFh/FOq6qSvg8ZjPSHmHgoKhqxf
 AdAyFCwbiGP7nWviLEDz9m+/RYJu8l5PoBV3wviCGtKiQTXSUk1Cx8SP29BhFgUHvMBoKu/E9YdIc4KZLCMSz87rZedbLzxsxeKSIBY4CmwIeWXr+Um1JZjG

Hi Tomasz,

On 11/7/26 10:15, Tomasz Bojanowski wrote:
> Hi Guenter,
> 
> On 11/7/26 10:02, Guenter Roeck wrote:
>> What am I missing ?
> 
> Sorry, my earlier description was not clear about how the request is
> sent. From the vendor software, it looks like this:
> 
> - The request goes out as an output report with report ID 0xfa, not
>    as a feature report. If I read usbhid_set_raw_report() correctly,
>    it puts reportnum into buf[0], so with MSI_ML_SENSOR_REPORT_ID the
>    controller would have received a feature report 0xf0 instead.
> - The reply seems to come back as an input report on the interrupt
>    endpoint, not through GET_REPORT. As long as the driver calls
>    hid_hw_open(), it should show up in .raw_event().
> 
> Roughly like this (untested, I have none of these boards):
> 
>          buf[0] = 0xfa;
>          buf[1] = 0xa0;
>          buf[9] = 0x01;
>          buf[10] = 0xfc;
>          reinit_completion(&priv->done);
>          ret = hid_hw_output_report(hdev, buf, 64);
>          if (ret == -ENOSYS)
>                  ret = hid_hw_raw_request(hdev, 0xfa, buf, 64,
>                                           HID_OUTPUT_REPORT,
>                                           HID_REQ_SET_REPORT);
>          ...
>          wait_for_completion_timeout(&priv->done, msecs_to_jiffies(500));
> 
> In .raw_event(), the reply could be accepted when data[0] == 0xfa,
> data[2] == 0x01 and size == 64, followed by complete().
> 
> The report ID should stay a constant 0xfa: with 0x01, the same buffer
> would be the bootloader command.
> 
Great, that works. I published a repository at
https://github.com/groeck/mystic_light.git
to make working on the code easier. The first two patches on top
of yours rearrange the code to simplify adding support for new boards,
and the last one adds support for the boards I own.

Here is what I get:

MAG B550M MORTAR MAX WIFI (MS-7C94):

     msi_mystic_light-hid-3-4
     Adapter: HID adapter
     CPU VDDP:    1000.00 uV         <-- looks wrong
     PROM Core:     1.04 V

MAG B650 TOMAHAWK WIFI (MS-7D75):

     msi_mystic_light-hid-3-5
     Adapter: HID adapter
     CPU 1P8:       1.81 V
     CHIP Core:     1.06 V
     VDD MISC:      1.10 V

MAG B650M MORTAR WIFI (MS-7D76):

     msi_mystic_light-hid-3-5
     Adapter: HID adapter
     CPU 1P8:       1.80 V
     CHIP Core:     1.04 V
     VDD MISC:      1.10 V

7D75 and 7D76 seem ok, but 7C94 looks wrong. A raw dump of 7C94 report data shows:

fa a0 01 00 00 00 00 00 00 01 fc 02 00 0e 04 f3 04 00 00 7d 7d 7d 00 00 00 00 00 00 00 00 00 00
                                  ^^^^^ ^^^^^
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00

Offset 11 does not seem to show a valid voltage. On the other side, offset 15
would reflect a value that at least makes sense.

Please let me know if the code still works for you.

Thanks,
Guenter


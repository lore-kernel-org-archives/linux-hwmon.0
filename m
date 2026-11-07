Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.202.169.35
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794074551;
	b=EsAVuybmjAaO7xPblW0THlqfgGcem2WBD6I6jlDA9ufc93lwvfy8W6pSNu46NEgc+OtG
	 hQGGboZFzG3s3p/JxEHw4Lnphh9hMy45Zl23hNQFbOqu3B2nqqd0cS5uKQcK+VTp2DgEG
	 36W+Ijo56xPyfHUheSQdvas1+1fPXrOelLIp+8rfXYG7VjVL/RFJ1QxrC0f4CUfy4SdFE
	 OVUXUSUc1uTZJMqbje0foZnHZ+97T3T4CZ8hP7+1qaxt0I6mOAvCTfI3o2tiOvb7g7n4a
	 rq2KZMrQjDaaWNfCJ1FUl4n/qfQT5uiNX5H+4yAP2K+MBPLK4ndxE81B8PDN30pa4gA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794074551;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:X-Source-L:X-Exim-ID:
	 X-Source:X-Source-Args:X-Source-Dir:X-Source-Sender:X-Source-Auth:
	 X-Email-Count:X-Org:X-Source-Cap:X-Local-Domain:X-CMAE-Envelope;
	bh=1Nf+OPebwm6X3dj4aei3b2ZNXNy9T9sjvikM5fQGB8E=;
	b=4lc2/Vpu/a9v9D/U4Tsz63cqp2J/onUxn0WdjGH1XsLIJf9vfhUX3YVt9OjFJSoJXeX2
	 /VJJXEncLDRTTS6fbTOBKz/aGBe1OegD/8VdD7lxMniJ3GGz46HMPvArtmlIum9+zQ6HP
	 kzlxxUOk4QBMuCCezvmzI9BmcoNc8Ua8Y9Vo85yKPaHM5tcvGFXvIMyzuYnexVi5Pt3SP
	 BhG3beRtFOhJvDPHcoJ3ZL2ITzz1cNiSguERnVFlx9S7N89FZzwJgOb8jsDOa7MCDoJ4Y
	 fZtplzScio3a+6ykZu1f4NHsfRC61WkruHuoaFYkxg9HYRg3VBoUBwyIwmDs/Uh/X7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=EuRYJu6q;
	arc=none smtp.remote-ip=44.202.169.35
Received: from omta036.useast.a.cloudfilter.net (omta036.useast.a.cloudfilter.net [44.202.169.35])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24273606A32D
	for <linux-hwmon@vger.kernel.org>; Sat,  7 Nov 2026 18:02:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24273606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=EuRYJu6q
Received: from eig-obgw-5006b.ext.cloudfilter.net ([10.0.29.217])
	by cmsmtp with ESMTPS
	id POHDxg5Hd4vCDPkkIxxIHY; Sat, 07 Nov 2026 18:02:30 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id PkkHxWGi2SeuLPkkIx0iNI; Sat, 07 Nov 2026 18:02:30 +0000
X-Authority-Analysis: v=2.4 cv=NYvm13D4 c=1 sm=1 tr=0 ts=6aef67b6
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10
 a=ks9ROmfTdQJEav4eS38A:9 a=QEXdDO2ut3YA:10 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=1Nf+OPebwm6X3dj4aei3b2ZNXNy9T9sjvikM5fQGB8E=; b=EuRYJu6qqDuT
	gRN5zqFnKSsRVfjnoucQ+/JWtrqnXz6V5Ro/+pEYq8L6hNfc1iH/qfxuZIX6v7CIiTTZD06db+4WW
	C6L2XdN2rMYR8Vp0bji/SUG10RtUZnXQ60r2WvAk+HSKwpjPZQ/A3w4nfhjhEW9Eb85pgeLvdNK9T
	0KoekVJOhBIQ/JptuU4JRHSQJXY6Zl/8kt341tMR7IMXLCpcCSAXwCWqG6Wet7uwiAyTLQ8kzaYOt
	AZFl9YKKjFZp2C+WyemqakyA01uJP/ldFEXRv4lGlC9ueTEo0cZOfCX/kTTbQc1J1pW3uIq5mVD19
	Hd6yAOT7u/ssowpQRrX9Tw==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:33604)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xPkkH-00000000xCs-2GcZ;
	Sat, 07 Nov 2026 23:32:29 +0530
Message-ID: <5e99fd86-d934-49c1-a867-02cc61ab1ecf@roeck-us.net>
Date: Sat, 7 Nov 2026 10:02:28 -0800
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
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20261107161249.336512-1-tomasz@bojanowski.me>
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
X-Exim-ID: 1xPkkH-00000000xCs-2GcZ
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net [108.223.40.66]:33604
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 6
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfJmTN7Oy2HOI/Ig8w1rWbO6hNpi5MYvJUo8SeUeFc0av1t9ayMTbuz57qjfrCKpeR7KOvla6BcLE8Lgid28NmdAAp+hUh1U6SmJAvqoKyUDzPNATnIio
 +rZ+r3l+bvlJbia5QXc70KK0G0mvfWT6KUwnPnH+PRg4ZB+knfnpIwTMnjbfKgeNPZknRui6Cn02v/EUknDTx5jHkrmL8I6sp9wLg+SxMBq9SLk/RKQog8/v

Hi,

On 11/7/26 08:12, Tomasz Bojanowski wrote:
> On 11/7/26 07:56, Guenter Roeck wrote:
>> Alternatively, I might give adding support to older boards a try if
>> you can provide information how to access the sensors on those boards.
> 
> Thanks for applying it. It would be great if you could take this on,
> since you have the hardware. I described how the vendor software
> reads the sensors on these boards in my reply to v1 [1]. Two more
> details:
> 
> - The vendor software reads up to 10 input reports and only checks
>    that byte 2 is 0x01. On 0db0:0076, the response echoes bytes 0-1
>    (FA A0) and 9-10 (01 FC), but I could not confirm that for these
>    controllers.
> - Besides the bootloader command, output report 0x01 with byte 1 set
>    to 0xD0 resets the controller, and feature report 0x52 with byte
>    184 set to 1 writes the RGB settings to flash.
> 
> If any change touches the 0db0:0076 path, I can retest it on the
> MS-7E61.
> 
I tried, but I guess I don't know enough about HID to get it to work.

Your existing code calls

        ret = hid_hw_raw_request(priv->hdev, MSI_ML_SENSOR_REPORT_ID, buf,
                                  MSI_ML_SENSOR_REPORT_SIZE, HID_FEATURE_REPORT,
                                  HID_REQ_GET_REPORT);

I tried to write

         memset(buf, 0, MSI_ML_SENSOR_REPORT_SIZE);
         buf[0] = 0xfa;
         buf[1] = 0xa0;
         buf[9] = 0x01;
         buf[10] = 0xfc;

         ret = hid_hw_raw_request(hdev, MSI_ML_SENSOR_REPORT_ID, buf, MSI_ML_SENSOR_REPORT_SIZE,
                                  HID_FEATURE_REPORT, HID_REQ_SET_REPORT);

While that succeeds (or at least it doesn't return an error),
the subsequent HID_REQ_GET_REPORT still reports 0 bytes.

What am I missing ?

Thanks,
Guenter


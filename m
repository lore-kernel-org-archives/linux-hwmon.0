Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.202.169.35
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795638524;
	b=21Th5exqBEWUNs3DD1Y8MmHC5lbtPRP4p2KAL7tuyg/A+OToF43zwROBhrPiuKtV0AkI
	 kTatwzo582j2bDUzFPGZ+dD3895S6ihPf5XiJjfHi75HHNb9Aqj952qz8sh7+kSaUptNW
	 SNKxi+s3gyb436Z0uI4ebdswIH9DMEANWBk3wLX8Hx3mMmbmWifwtkDewJqOIndZIDiBg
	 Bs8v9jhYVnnUTzWj23+C07uoh7mEiNLL8MhXiLLorW4tEATFBcmL2+xBtqlYeY5p/71Wa
	 v5m0wwHoUqI3/PaS8s7ssC9gTPxK+NqTbFv++IpfvhWFXChazKTOnn+smwlBTmr0W1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795638524;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:X-Source-L:X-Exim-ID:
	 X-Source:X-Source-Args:X-Source-Dir:X-Source-Sender:X-Source-Auth:
	 X-Email-Count:X-Org:X-Source-Cap:X-Local-Domain:X-CMAE-Envelope;
	bh=o/4Kw0hVdKhHsWDnKlzuS79CL309pvCOCNbsvIIHjL0=;
	b=HQtYt3cMaxIisjy+OllrNfnkOlF/BvqQjXksaVD5aiggGr9Toc2BIck5darabL70TUD6
	 ycaeVDn4gCf4cOvTLaY/1+w63Dm+nMr/iJOW0HOo/fnu6MHJdfQSZNG3bUzalinYlG0To
	 BR147QE2oQN+lzOnlxpy1xc7CfqFdSa3TeF5dwD5E5nPog8o79txpsPTz+9wLONhCrXQP
	 MnfXQfWH3VYh5P+CiiQig3wYR5hrBPYWJCADZfEkGwPA38hOGgcU9k1B2cdB6RWJCyIZ+
	 F310ST4gSvmRkaep1kaeymAuAJ2Crl4NxRVNVE3MwciDRbZcq+C7+gqQazK6zNhxIGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=kLtQrhgY;
	arc=none smtp.remote-ip=44.202.169.35
Received: from omta036.useast.a.cloudfilter.net (omta036.useast.a.cloudfilter.net [44.202.169.35])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92F79606A323
	for <linux-hwmon@vger.kernel.org>; Wed, 25 Nov 2026 20:28:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92F79606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=kLtQrhgY
Received: from eig-obgw-5005b.ext.cloudfilter.net ([10.0.29.189])
	by cmsmtp with ESMTPS
	id WHxFx70424vCDWJbfxYUZZ; Wed, 25 Nov 2026 20:28:43 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id WJbdx0cAPYskhWJbexZT7X; Wed, 25 Nov 2026 20:28:42 +0000
X-Authority-Analysis: v=2.4 cv=CKMqXQrD c=1 sm=1 tr=0 ts=6b0744fa
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=VwQbUJbxAAAA:8
 a=P3qOQgCt6vrQHFSYsfwA:9 a=QEXdDO2ut3YA:10 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=o/4Kw0hVdKhHsWDnKlzuS79CL309pvCOCNbsvIIHjL0=; b=kLtQrhgYcTIv
	uZMzpnu0rYGzzGa8NDNlZT55qp+gtf3HfKp0jbd8q2aAadq/LyShIuAgpozbSv3QbKqBp3Y22JDKg
	52tUfLjNQjvJfG527eLLWwMZca0G+P8g1Ic7eXW4nMJDntH64oD1t6eF6pHahWAJpeVPKzDxnw4qS
	E0R0NxHP+PnBRtC6j66rQ70n5EfqNjq5ev/hD2QKMaVZW0S9txjTcIWwkzBYgOr00oPm/2ltfjLSs
	maCDXm+0W5P+s4vdCa+rrDh9Ye/02UkXuolleTXrVRjCBGHiVPuaBt4lLpsRLVMusI7wCNZQ0FFNK
	86UN9qjnUyRrH7aVtENPxA==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:41250)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xWJbd-00000001T2u-2P6l;
	Thu, 26 Nov 2026 01:58:41 +0530
Message-ID: <0bfd1c00-0fc3-472d-9c98-976838f8906d@roeck-us.net>
Date: Wed, 25 Nov 2026 12:28:40 -0800
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
Subject: Re: [PATCH] hwmon: (pmbus) Fall back to CLEAR_FAULTS when STATUS_CML
 is read-only
To: Arthur Korn <akorn@google.com>
Cc: sashiko-reviews@lists.linux.dev, linux-hwmon@vger.kernel.org
References: <20261125053711.3098007-1-akorn@google.com>
 <sashiko-outbox-232631@kernel.org>
 <b5910c74-7e29-4138-9dd4-030c95c78ec3@roeck-us.net>
 <20261125181605.3299785-1-akorn@google.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20261125181605.3299785-1-akorn@google.com>
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
X-Exim-ID: 1xWJbd-00000001T2u-2P6l
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net [108.223.40.66]:41250
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 1
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfEWkNCMdPRwU4i6+QHpdBMjKsD7fw/derp98LXG5i3uEoaY9WVI4dB+OJKDZuKbg54bnpEAD75I8sK73uO3SWb/rRRIA5ovq6hjUeY9WBsKUexOlXoNU
 sE7yBJbuMaI0yyNh8SC8GyVkUsx60JWmJejnKWLq0K7LT5MbMS8vdZG8+K254g28BDbpH0MHtM9XFVsqKmhPuhzcV1INB20y7a1iww0yLPt9H5BeevQqpk1w

On 11/25/26 10:15, Arthur Korn wrote:
> On 11/25/26 07:53, Guenter Roeck wrote:
>> On 11/24/26 21:49, sashiko-bot@kernel.org wrote:
>>> [Severity: Medium]
>>> Does clearing data->has_status_cml on any negative return value from
>>> _pmbus_write_byte_data() disable STATUS_CML write-1-to-clear across the
>>> whole device when a driver exposes a read-only virtual page?
> ...
>> Seems real. Arthur, what do you think ?
>>
>> [ PMBus is really annoying :-( ]
> 
> Confirmed -- Sashiko's finding is real.
> 
> I tested on a system with 30x MAX16600B.04 VRs driven by max16601 (which
> sets PMBUS_PAGE_VIRTUAL on all 3 pages because the chip NACKs PMBUS_PAGE
> 0x00 and latches INVALID_COMMAND):
> 
>    - Page 0 (VCORE at addr) and Page 2 (VSA dummy client at addr + 1)
>      both implement writable STATUS_CML (0x7e): writing 0xc0 clears
>      latched INVALID_COMMAND | INVALID_DATA cleanly to 0x00 on both I2C
>      addresses while preserving other STATUS_CML bits.
>    - Page 1 is a software-only virtual page exposing vendor registers
>      0xf1/0xf2 (IIN_SENSOR / TOTAL_INPUT_POWER); max16601_write_byte_data()
>      and max16601_write_byte() both return -EOPNOTSUPP for page == 1.
> 
> With v1, pmbus_clear_cml_faults() hit -EOPNOTSUPP on page 1 and set
> data->has_status_cml = false for the whole device, causing page 2 and
> subsequent register checks on page 0 to fall back to CLEAR_FAULTS.
> 
> In v2, I moved data->has_status_cml = false inside the readback check so
> it is only cleared when _pmbus_write_byte_data() succeeds and the readback
> still shows PB_CML_FAULT_CLEAR_MASK set (the read-only STATUS_CML case).
> When _pmbus_write_byte_data() returns an error (such as -EOPNOTSUPP on a
> virtual page), only that call falls back to pmbus_clear_fault_page(),
> preserving the existing behavior from d9d30e1cb9ca.
> 
> (Side note noticed on the live MAX16600B.04 system: untouched devices boot
> with status2 = 0x0002 / status2_cml = 0x80 latched on VSA because
> pmbus_check_register() and pmbus_check_status_register() pass page = -1 to
> pmbus_clear_cml_fault() / pmbus_check_status_cml(), which targets the
> primary client 0x69 instead of data->vsa 0x6a when probing page 2. Happy
> to look at that separately if useful.)
> Sure, that would be great.

Thanks,
Guenter


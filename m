Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.202.169.37
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794672304;
	b=BVKjoXSJDSIATMYV5FLUTo8MCGe7JmiD39FjsSJjCYcE7RQWOP3h3F/TlRZQXNxL9ayY
	 OYDWAEDjogOPcEU4iPM0HzFfll1iY055leRX69u7iqEs2dbL7QUq6nQSyd15eViqVNL7o
	 31yagdc3jDEP9xc7EnTn88oWpzhSmZSCejd0gs2gXPvpyaMxRF1gg1Kulp5930bWIFNSS
	 mHTvAllioidXXvfq4BY53HODxjSG6JH0fwOkSthEuqNF1aOICpSodPbjDOeJj2q+HwPih
	 s8ep0sPTdNwKYTKvjKJtqI2O/ns6rYhtmAwqGNV+dgdy2qu4pPopnif9oC6eztGM6pQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794672304;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:X-Source-L:X-Exim-ID:
	 X-Source:X-Source-Args:X-Source-Dir:X-Source-Sender:X-Source-Auth:
	 X-Email-Count:X-Org:X-Source-Cap:X-Local-Domain:X-CMAE-Envelope;
	bh=xrc6f4LwHmqJ2Y6wJf6uweYofy/WQ8vGfzG/Wo42pjs=;
	b=k8yMrkcM1KShPN+7+Yv2EyhJfVrJOd2mC/+BIVkzBmO7nblT059MUvopQf58zVoh1cIG
	 CfPCNdbxdAthckyhu3lMl5JqqT6/PQiOGwlJa+RqBU8o1G0ylnvlEzahE/esS9quVlJVd
	 f/RBxwvyPZYrUacnc/whbh4i/CEzfzxzMaMluudZyJU3ivrVJ0QDkEGDjIDfF7dnhELei
	 79RTYhv+sfgtIFh1MAPxTy3jNTJ3qjtqNYMt1bZIkkrbNMr6er0njy4ITLgFWkFv+nxTU
	 aGLm6AemSsXFX2Qw30kqBvBv7s7cYULB2Ciibhf6qdNivdDSf5mtIwA0A2PWL2GzkVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=Ylw0FlNf;
	arc=none smtp.remote-ip=44.202.169.37
Received: from omta038.useast.a.cloudfilter.net (omta038.useast.a.cloudfilter.net [44.202.169.37])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 841BF606A330
	for <linux-hwmon@vger.kernel.org>; Sat, 14 Nov 2026 16:05:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 841BF606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=Ylw0FlNf
Received: from eig-obgw-6002b.ext.cloudfilter.net ([10.0.30.203])
	by cmsmtp with ESMTPS
	id SDMRxzHnaJFmFSGFSxyVsZ; Sat, 14 Nov 2026 16:05:02 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id SGFSxOO888cn4SGFSxxUcZ; Sat, 14 Nov 2026 16:05:02 +0000
X-Authority-Analysis: v=2.4 cv=Qrde3Uyd c=1 sm=1 tr=0 ts=6af886ae
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=VwQbUJbxAAAA:8
 a=gAnH3GRIAAAA:8 a=HNovrmC_vDOIJ51eOUYA:9 a=QEXdDO2ut3YA:10
 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=xrc6f4LwHmqJ2Y6wJf6uweYofy/WQ8vGfzG/Wo42pjs=; b=Ylw0FlNf819d
	2tTLi2/PJhLPcR/T75nW2gX47/iyPAtpyKtbXtzy6xruR6LGcpe1LVgJxB/LAA6zPAX2tDNAaxhCu
	IaIBP4jrOVJH5stgTPptscw7tbNwaHRUqQwpbLmNHF/ZinHNOE195tO7l/6WmH44Vefz2PZVTHCb9
	EhkLj0P4Oo9Vr+iNMTQD0yyiqfYN3cyAG+oXnmQAfso/LP59JDO+ruFu5ORt/13fLjCowzoR8ZDdn
	HwSDpSm+qMYzhVZP8ixHywIuYRAqXcw97SD5rWeREHJizr6GPaDtGZ19a07riNvlXxnkdgapeMIRu
	VMR2u3GycKnng1AsmAynQA==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:58038)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xSGFR-0000000021x-3Aqn;
	Sat, 14 Nov 2026 21:35:01 +0530
Message-ID: <73c31a61-9176-49ac-84c6-90f9e17a02e2@roeck-us.net>
Date: Sat, 14 Nov 2026 08:05:00 -0800
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
Subject: Re: [PATCH v2 2/4] hwmon: (pmbus/ltc2978) Add support for LT7175 and
 LT7176P
To: sashiko-reviews@lists.linux.dev,
 Christopher de Guzman <christopher.deguzman@analog.com>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org,
 conor+dt@kernel.org
References: <20261110-upstream-lt7175-lt7176p-v2-0-dd60d28383bf@analog.com>
 <20261110-upstream-lt7175-lt7176p-v2-2-dd60d28383bf@analog.com>
 <sashiko-outbox-206843@kernel.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <sashiko-outbox-206843@kernel.org>
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
X-Exim-ID: 1xSGFR-0000000021x-3Aqn
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net [108.223.40.66]:58038
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 20
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfLAk5YQGw02DfQJP6annlv9z6rddboERI+CK4ih0hUyzdK0kwOXrkpKL3ZRXKtDHSFS/1bJUihy6e8bNcSezNur6H2zU+x7IZihfiMQXyH2DtydXXqQG
 4jHRVmhECAsSJhaeWpBqiOkpRxhtbPtFiXipxkjXoVGa/IoKfs0hqzUozvZiXD8AhEtNxz0SM/P05BfR9cPn4rTLxPxy5Xr1v/g6tQf95S2LlS9aaFEz+Yg+

On 11/10/26 02:14, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] hwmon: (pmbus/ltc2978) IEEE-754 peaks compared as LINEAR11 in
>    ltc_get_max()
> --
> 
> commit 201c09e7f06ead2d62e423cba00a536dde067159
> Author: Christopher de Guzman <christopher.deguzman@analog.com>
> 
> hwmon: (pmbus/ltc2978) Add support for LT7175 and LT7176P
> 
> This commit adds support for the LT7175 and LT7176P PMBus buck regulators
> and matches PMBUS_IC_DEVICE_ID strings against ltc2978_id[] for the LT7170
> family.
> 
>> diff --git a/drivers/hwmon/pmbus/ltc2978.c b/drivers/hwmon/pmbus/ltc2978.c
>> index aea7b6c93e74b..888db3213a01e 100644
>> --- a/drivers/hwmon/pmbus/ltc2978.c
>> +++ b/drivers/hwmon/pmbus/ltc2978.c
> [ ... ]
>> @@ -762,6 +763,8 @@ static int ltc2978_probe(struct i2c_client *client)
>>   	switch (data->id) {
>>   	case lt7170:
>>   	case lt7171:
>> +	case lt7175:
>> +	case lt7176p:
>>   		data->features |= FEAT_CLEAR_PEAKS | FEAT_NEEDS_POLLING;
>>   		info->read_word_data = ltc3883_read_word_data;
>>   		info->pages = LTC3883_NUM_PAGES;
> 
> [Severity: Medium]
> Does routing lt7175 and lt7176p (along with lt7170 and lt7171) through
> ltc3883_read_word_data() corrupt peak readings when the data format is
> ieee754?
> 
> ltc3883_read_word_data() -> ltc3880_read_word_data() ->
> ltc2978_read_word_data_common() reads PMBUS_VIRT_READ_IOUT_MAX,
> PMBUS_VIRT_READ_VIN_MAX, and PMBUS_VIRT_READ_TEMP_MAX via ltc_get_max():
> 
> drivers/hwmon/pmbus/ltc2978.c:ltc_get_max() {
>      ...
> 	ret = ltc_read_word_data(client, page, 0xff, reg);
> 	if (ret >= 0) {
> 		if (lin11_to_val(ret) > lin11_to_val(*pmax))
> 			*pmax = ret;
> 		ret = *pmax;
> 	}
>      ...
> }
> 
> lin11_to_val() treats bit 10 as the two's-complement mantissa sign bit.
> In IEEE-754 binary16, bit 10 is the least-significant bit of the biased
> exponent, so positive values with an odd biased exponent (such as
> temperatures in [64, 128) C or voltages in [16, 32) V) decode as negative
> and are discarded in favor of smaller readings with an even biased
> exponent.
> 

I have not heard back from the author. Without looking into details myself,
I assume that the problem is real and will need to be addressed.

Thanks,
Guenter


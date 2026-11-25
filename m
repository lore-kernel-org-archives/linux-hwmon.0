Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.37
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795622019;
	b=kf9l8RdDutUTOpOFnp+abGqHtU3eMavs2qXSxMhoxBQfXQDufoagGNFK+Q5AfTn9TUch
	 X/rvYD9pZx904cHxbBECgQSeB4L+YuyiU2A5AsKm0+RYXeeVmY0vEV47HtQ+LP0cUN8zj
	 J60wNo0STkDUd2Gok03NaHhrGREXOHpZpL+BHaanmAIm9IbvKbSXZ+szizqFn+dgFWqJZ
	 aYHDVduHOF6sZL/GBT7Nr6bTwfUlE894qBP9klmDsMMEUHbMpLIt1rwZcjS3FsyqpXIv6
	 bKcKtyH2NQVhcVV6xvKJM7LN52TvuYfvKo0kdeWzhaHdTl+ZE+NpKaEqytCKmIoTZVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795622019;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:X-Source-L:X-Exim-ID:
	 X-Source:X-Source-Args:X-Source-Dir:X-Source-Sender:X-Source-Auth:
	 X-Email-Count:X-Org:X-Source-Cap:X-Local-Domain:X-CMAE-Envelope;
	bh=ofjZuNiDg7ilWnJJWScuyrFmHX53hQiX68aQ47o3Xlo=;
	b=dGusUaBaGL5EwFCPPOSFQXAb47H6ZbX2F173qrGUom6eGagaPVGkW9QAgGwr+Dj7JJk/
	 lvBdOEuSGqoTmg4HhByKtZlK3rQ/POhdT7a10fApg1xc0gdqrp9YxeL+N1x+oAp3HdpvS
	 cbL0L7BeAmUDV0z5tULHvwtsHwj7e/El6lK/vzuW7lWn7Ok4hswNLlsUP5PxBEDs+jEPa
	 9dPBivIxoefPizVdxj54rsQ7WFwAn3D1ZbWAl77VbZWOUgk+5a/K8o8XsAyn0MLsbphGa
	 8vuSjWJ7L0n6R9//TUq6JXhccZCsv+z0d1ucfdnlaXeecUzf4bEmzrIcqp0icnLDnsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=smlvMA8J;
	arc=none smtp.remote-ip=35.89.44.37
Received: from omta38.uswest2.a.cloudfilter.net (omta38.uswest2.a.cloudfilter.net [35.89.44.37])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66983606A327
	for <linux-hwmon@vger.kernel.org>; Wed, 25 Nov 2026 15:53:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66983606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=smlvMA8J
Received: from eig-obgw-6007b.ext.cloudfilter.net ([10.0.30.166])
	by cmsmtp with ESMTPS
	id WDcYx8I84VK9UWFJNxHgN6; Wed, 25 Nov 2026 15:53:33 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id WFJNxmZgj3nNNWFJNxZzzk; Wed, 25 Nov 2026 15:53:33 +0000
X-Authority-Analysis: v=2.4 cv=TuLmhCXh c=1 sm=1 tr=0 ts=6b07047d
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=VwQbUJbxAAAA:8
 a=1XWaLZrsAAAA:8 a=JOhP0RYFjyS_x4KktD4A:9 a=QEXdDO2ut3YA:10
 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=ofjZuNiDg7ilWnJJWScuyrFmHX53hQiX68aQ47o3Xlo=; b=smlvMA8JkyqX
	tNKKmQH00I1aKOjVLxS4XURyfaSeecngyr3fhnL6mrsy8mAe0aBp/BEr9Z/tWB29h8bWquTsQbkFo
	BU7dk81TbKyUM2RmXVSGJiWfdzubfrujVR6Xh2VFQ3oqoWKjCmD0BxBehEYwRN1u0/a3D3lmxlgtw
	rnWtglbLPhEuesznnL98Tkm9LK/IzVPjUG5r35YPhAR6PrB8+l4VOIOs0lBPK9ddY8b5jSL5SouSz
	MKFwxI9rCTAbu7sKHnHLUs6iR82tDc2oF564/gD8tJyg9sfgVBYe9ubwoxeq9CcnCISCdGvShTJda
	C5CvQfbzdst3NDX0n9vOBw==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:45574)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xWFJM-00000003nVg-42wd;
	Wed, 25 Nov 2026 21:23:33 +0530
Message-ID: <b5910c74-7e29-4138-9dd4-030c95c78ec3@roeck-us.net>
Date: Wed, 25 Nov 2026 07:53:32 -0800
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
To: sashiko-reviews@lists.linux.dev, Arthur Korn <akorn@google.com>
Cc: linux-hwmon@vger.kernel.org
References: <20261125053711.3098007-1-akorn@google.com>
 <sashiko-outbox-232631@kernel.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <sashiko-outbox-232631@kernel.org>
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
X-Exim-ID: 1xWFJM-00000003nVg-42wd
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net [108.223.40.66]:45574
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 11
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfMZXSq0GE2IFpFq5xmqIGhDiae8uJD66eRVRfaeJyf2cyi49i/vXO6ub6iSdcrizE8Dh6TNL3Ao3DVhFV8aPaUURIPA2bdAAqGJ3LVxRaRKYiToRlLwl
 ZyKFypFOZWGNwvb4kco7DZOi/4wEnl/v/Ku+f7F4NZQ5LAwLZHu0Izk9O4Ikt/Aa56hq4XT8flbvfvS1DtE3YP0DptnbdgUBdqOZHjDgqnytOhxZ3ZkQ8UKZ

On 11/24/26 21:49, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] hwmon: (pmbus) pmbus_clear_cml_fault() disables W1C on
>    virtual pages
> --
> 
> commit 55aa274a3350ffb5857e7b698b066e9435f264ba
> Author: Arthur Korn <akorn@google.com>
> 
> hwmon: (pmbus) Fall back to CLEAR_FAULTS when STATUS_CML is read-only
> 
> This commit reads back PMBUS_STATUS_CML after attempting to clear CML
> faults on non-write-protected devices, disabling STATUS_CML write-1-to-clear
> and falling back to CLEAR_FAULTS if the fault bits remain set.
> 
>> diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
>> index db5c5f533eb97..af8f589b328df 100644
>> --- a/drivers/hwmon/pmbus/pmbus_core.c
>> +++ b/drivers/hwmon/pmbus/pmbus_core.c
>> @@ -728,15 +728,31 @@ void pmbus_clear_faults(struct i2c_client *client)
>>   }
>>   EXPORT_SYMBOL_NS_GPL(pmbus_clear_faults, "PMBUS");
>>   
>> -static void pmbus_clear_cml_fault(struct i2c_client *client, int page)
>> +#define PB_CML_FAULT_CLEAR_MASK	(PB_CML_FAULT_INVALID_COMMAND | \
>> +				 PB_CML_FAULT_INVALID_DATA)
>> +
>> +static void pmbus_clear_cml_fault(struct i2c_client *client, int page,
>> +				  bool verify)
>>   {
>>   	struct pmbus_data *data = i2c_get_clientdata(client);
>> +	int ret;
>> +
>> +	if (data->has_status_cml) {
>> +		ret = _pmbus_write_byte_data(client, page, PMBUS_STATUS_CML,
>> +					     PB_CML_FAULT_CLEAR_MASK);
>> +		if (ret >= 0 && verify &&
>> +		    !(data->flags & PMBUS_WRITE_PROTECTED)) {
>> +			ret = _pmbus_read_byte_data(client, page,
>> +						    PMBUS_STATUS_CML);
>> +			if (ret >= 0 && (ret & PB_CML_FAULT_CLEAR_MASK))
>> +				ret = -EIO;
>> +		}
>> +		if (ret >= 0)
>> +			return;
>> +		data->has_status_cml = false;
>> +	}
>>   
>> -	if (!data->has_status_cml ||
>> -	    _pmbus_write_byte_data(client, page, PMBUS_STATUS_CML,
>> -				   PB_CML_FAULT_INVALID_COMMAND |
>> -				   PB_CML_FAULT_INVALID_DATA) < 0)
>> -		pmbus_clear_fault_page(client, page);
>> +	pmbus_clear_fault_page(client, page);
>>   }
> 
> [Severity: Medium]
> Does clearing data->has_status_cml on any negative return value from
> _pmbus_write_byte_data() disable STATUS_CML write-1-to-clear across the
> whole device when a driver exposes a read-only virtual page?
> 
> During pmbus_init_common(), pmbus_clear_cml_faults() iterates over all
> pages.  On multi-page devices such as max16601, virtual page 1 is
> read-only while pages 0 (VCORE) and 2 (VSA) support byte writes:
> 
> drivers/hwmon/pmbus/max16601.c:max16601_write_byte_data() {
> 	...
> 	if (page > 0) {
> 		if (page == 2)	/* VSA */
> 			return i2c_smbus_write_byte_data(data->vsa, reg, value);
> 		return -EOPNOTSUPP;
> 	}
> 	return -ENODATA;
> }
> 
> When pmbus_clear_cml_faults() reaches page 1, _pmbus_write_byte_data()
> returns -EOPNOTSUPP and sets data->has_status_cml = false.  Unlike before,
> where only page 1 fell back to pmbus_clear_fault_page(), this regression
> disables STATUS_CML write-1-to-clear for page 2 and for all subsequent
> register probes on page 0, sending PMBUS_CLEAR_FAULTS and wiping latched
> faults on both rails.
> 

Seems real. Arthur, what do you think ?

[ PMBus is really annoying :-( ]

Guenter


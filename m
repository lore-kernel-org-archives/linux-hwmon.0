Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.202.169.35
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795055351;
	b=qmsMzKfK5KPHszdPJ1t3FdXRB884/n/IVxmi0YDKHVfuYYX0Ow0BAaDZfOu96A0xRJM3
	 lceGsJZpiv6kHEh8z7ZjGm/MASK6ttWWKFO0eUvsul8LbRAgS2WkJiZUL6lo75RzGBN2V
	 TaMM32gdPv5Kcmp4PfsXvBg5SGw9HgbZX4zmxtvTszxmP6/xJLwkRPeHlng32+3SnlUOH
	 Qi58naA7dOzMg5wpzIEt8ncIpLiMoe9Mh91o64FYyKfctreZcQ19Gx4P8Y7woQpRypdnQ
	 vc8zkU/fMWixrLfx55L+IuXj7LpN0L0cbkmhnajMdo1vUk9AlT+DHniN0yy3q9iIl0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795055351;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:X-Source-L:X-Exim-ID:
	 X-Source:X-Source-Args:X-Source-Dir:X-Source-Sender:X-Source-Auth:
	 X-Email-Count:X-Org:X-Source-Cap:X-Local-Domain:X-CMAE-Envelope;
	bh=3+ZyLfB9DIP574e87+sGx0gXKXhJ54eTZPOLWu3xo5c=;
	b=gMuU/vismEF/BiWRiV4YcUOsofwBW+jbTGVb0scp2TK+AiRCITp0PQX5KrHbNevliW5A
	 8JdcKmrdruuHaC7ba2FHBgsZ3ysiJDzeOAznXTZfIXFEIj5lmRycOUeLThm30FrgOr91C
	 wZbqI1sOXkJEK21SO5pYnPnHCE8qZ1YdQ8BQgywJ/XwDmXZatR8QotqR4h/kkMrFC4rzi
	 jUDiVYneUXjqNxY/1uD4n9Ng8Vsxpkq5EWXcpCIuoX3u24AZm3wBDZB+4OJwRb7CO6taY
	 JVTcfxdNGhAzm+MUxC9Khi2+9w501yFAgWTsWp/3xsSGzox/MNLOD460/O2kmZTDtSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=v7ydsBi6;
	arc=none smtp.remote-ip=44.202.169.35
Received: from omta036.useast.a.cloudfilter.net (omta036.useast.a.cloudfilter.net [44.202.169.35])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 123B8606A334
	for <linux-hwmon@vger.kernel.org>; Thu, 19 Nov 2026 02:29:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 123B8606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=v7ydsBi6
Received: from eig-obgw-5006b.ext.cloudfilter.net ([10.0.29.217])
	by cmsmtp with ESMTPS
	id ToWyxb4km4vCDTrtcxd9SX; Thu, 19 Nov 2026 02:29:08 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id Trtbx8pkCSeuLTrtbxqnoe; Thu, 19 Nov 2026 02:29:08 +0000
X-Authority-Analysis: v=2.4 cv=NYvm13D4 c=1 sm=1 tr=0 ts=6afe5ef4
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=VwQbUJbxAAAA:8
 a=1XWaLZrsAAAA:8 a=ekWx80A8-VE8Rzb6bgoA:9 a=QEXdDO2ut3YA:10
 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=3+ZyLfB9DIP574e87+sGx0gXKXhJ54eTZPOLWu3xo5c=; b=v7ydsBi6HvlT
	K3PAgeqj2AneQAYzKwAXtYfM5ro2jJzaywLJI56qzLhmX5EUP27Ar3SZUcFhYymZSydVMQebLi8oY
	83qp6EoWlgRFX05K/LiS/DwdXz1FtcXie7LxVBYLio07dOPjosU1Z/1/yF4KjEsIb4qPZGoii199f
	QVCgwTEZPQkTsWCupIaIW4ULLrYlfF1VcrGXjHPUSh//5wfQNnQ+KdGlZUC1OwgvdR7FligM0iBm7
	5cwnZ2dXF6IzOE0LaE0st7l4l4URNDeleQZboHuAqkojEbnwAlexsR2OvN2PSqdWZltaQQKrDtl96
	YI3n/p7Z5d57ImVStsKAqQ==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:42334)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xTrtb-00000001D5K-1H6p;
	Thu, 19 Nov 2026 07:59:07 +0530
Message-ID: <39f4b33b-cd74-493c-95b6-d1bd94cb769c@roeck-us.net>
Date: Wed, 18 Nov 2026 18:29:06 -0800
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
Subject: Re: [PATCH v2] hwmon: (pmbus) Clear only CML invalid command fault
 during probe
To: sashiko-reviews@lists.linux.dev, Arthur Korn <akorn@google.com>
Cc: linux-hwmon@vger.kernel.org
References: <20261119013208.4089480-1-akorn@google.com>
 <sashiko-outbox-222316@kernel.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <sashiko-outbox-222316@kernel.org>
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
X-Exim-ID: 1xTrtb-00000001D5K-1H6p
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net [108.223.40.66]:42334
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 1
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfA7Q2tBw9cLliXhPtZzIbb4rgGinpUjgZCJqjSQbSAKFJGytvmyL9ZSKueX/IWw6A+SBPvsMEdPmxRef0dR7T/k7xGP1t0TlrWijQgbiwmwxJBVsn8Xd
 3EFKR1+Op7t7ZbA8NEVqsd5sXZN0pXSMfXM5n5mCf672jMv6MV3AqmsgSyTZCBOUrAYF/lIImmObLC1GWrFgLec77oDnaCzKYwLMPaXH56yOoYkPTln6N6zY

Hi Arthur,

On 11/18/26 18:08, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential
> issues to consider:
> - [Medium] hwmon: (pmbus) pmbus_write_smbalert_mask() clears all faults
>    on probe
> - [Medium] hwmon: (pmbus) pmbus_clear_cml_fault() leaves INVALID_DATA
>    fault latched
> - [Medium] hwmon: (pmbus) pmbus_clear_cml_fault() bypasses driver
>    write_byte() hooks
> --
> 

Looks like Sashiko has a point, including the write_byte hook problem.
I think Google uses MAX16601, and that is a PMBus 1.2 chip, so it may
be affected.

On a side note, it should be possible to run Sashiko locally on your
system, or I can run it before you submit the next version if you
have trouble setting it up. This might avoid a couple of revisions
if/when Sashiko finds new problems.

Thanks
Guenter

> commit 94d47b10140ba57df41cbee449647587f625d5f3
> Author: Arthur Korn <akorn@google.com>
> 
> hwmon: (pmbus) Clear only CML invalid command fault during probe
> 
> This commit introduces pmbus_clear_cml_fault() and pmbus_clear_cml_faults()
> to clear only PB_CML_FAULT_INVALID_COMMAND in PMBUS_STATUS_CML during probe
> on PMBus 1.2+ devices instead of sending PMBUS_CLEAR_FAULTS.
> 
>> diff --git a/drivers/hwmon/pmbus/pmbus.c b/drivers/hwmon/pmbus/pmbus.c
>> index 28889fb743b3e..e2e49fdd54841 100644
>> --- a/drivers/hwmon/pmbus/pmbus.c
>> +++ b/drivers/hwmon/pmbus/pmbus.c
>> @@ -113,7 +113,7 @@ static int pmbus_identify(struct i2c_client *client,
>>   			info->pages = 1;
>>   		}
>>   
>> -		pmbus_clear_faults(client);
>> +		pmbus_clear_cml_faults(client);
>>   	}
>>   
>>   	if (pmbus_check_byte_register(client, 0, PMBUS_VOUT_MODE)) {
> 
> [Severity: Medium]
> Does pmbus_clear_cml_faults() leave PB_CML_FAULT_INVALID_DATA latched
> after page auto-detection?
> 
> When PMBUS_PAGE is supported, the loop right above probes page numbers
> with pmbus_set_page() until writing an out-of-range page index to the
> valid PMBUS_PAGE command fails, which latches PB_CML_FAULT_INVALID_DATA
> in PMBUS_STATUS_CML.  Because pmbus_clear_cml_fault() only writes
> PB_CML_FAULT_INVALID_COMMAND, PB_CML_FAULT_INVALID_DATA and PB_STATUS_CML
> remain latched after probe.
> 
>> diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
>> index 82dac2c6c579f..74fc8d7481689 100644
>> --- a/drivers/hwmon/pmbus/pmbus_core.c
>> +++ b/drivers/hwmon/pmbus/pmbus_core.c
>> @@ -713,6 +713,26 @@ void pmbus_clear_faults(struct i2c_client *client)
>>   }
>>   EXPORT_SYMBOL_NS_GPL(pmbus_clear_faults, "PMBUS");
>>   
>> +static void pmbus_clear_cml_fault(struct i2c_client *client, int page)
>> +{
>> +	struct pmbus_data *data = i2c_get_clientdata(client);
>> +
>> +	if (data->revision < PMBUS_REV_12 ||
>> +	    _pmbus_write_byte_data(client, page, PMBUS_STATUS_CML,
>> +				   PB_CML_FAULT_INVALID_COMMAND) < 0)
>> +		pmbus_clear_fault_page(client, page);
>> +}
> 
> [Severity: Medium]
> Does calling _pmbus_write_byte_data() here bypass driver info->write_byte
> callbacks that intercept or block fault clearing?
> 
> Previously, probe-time fault clearing always went through
> pmbus_clear_fault_page() -> _pmbus_write_byte(client, page,
> PMBUS_CLEAR_FAULTS).  Several drivers hook write_byte without
> implementing write_byte_data: for example, max16601_write_byte() routes
> page 2 (PMBUS_PAGE_VIRTUAL) PMBUS_CLEAR_FAULTS to a separate I2C client
> (data->vsa), so _pmbus_write_byte_data() writes PMBUS_STATUS_CML to
> client (page 0) instead and leaves CML faults on data->vsa uncleared.
> Similarly, delta-ahe50dc-fan and max31785 block fault-clearing writes in
> write_byte(), and mpq8646 blocks unsupported PMBUS_STATUS_CML reads in
> read_byte_data(), none of which implement write_byte_data().
> 
>> +
>> +void pmbus_clear_cml_faults(struct i2c_client *client)
>> +{
>> +	struct pmbus_data *data = i2c_get_clientdata(client);
>> +	int i;
>> +
>> +	for (i = 0; i < data->info->pages; i++)
>> +		pmbus_clear_cml_fault(client, i);
>> +}
>> +EXPORT_SYMBOL_NS_GPL(pmbus_clear_cml_faults, "PMBUS");
>> +
>>   static int pmbus_check_status_cml(struct i2c_client *client)
>>   {
>>   	struct pmbus_data *data = i2c_get_clientdata(client);
> 
> [ ... ]
> 
>> @@ -2978,9 +2998,9 @@ static int pmbus_init_common(struct i2c_client *client, struct pmbus_data *data,
>>   	}
>>   
>>   	if (data->info->pages)
>> -		pmbus_clear_faults(client);
>> +		pmbus_clear_cml_faults(client);
>>   	else
>> -		pmbus_clear_fault_page(client, -1);
>> +		pmbus_clear_cml_fault(client, -1);
> 
> [Severity: Medium]
> Should pmbus_write_smbalert_mask() also use pmbus_clear_cml_fault()
> instead of pmbus_clear_fault_page()?
> 
> When client->irq is set, pmbus_do_probe() -> pmbus_irq_setup() calls
> pmbus_write_smbalert_mask() across every page:
> 
> drivers/hwmon/pmbus/pmbus_core.c:pmbus_write_smbalert_mask() {
>      ...
> 	ret = _pmbus_write_word_data(client, page, PMBUS_SMBALERT_MASK,
> 				     reg | (val << 8));
> 	/*
> 	 * Clear fault systematically in case writing PMBUS_SMBALERT_MASK
> 	 * is not supported by the chip.
> 	 */
> 	pmbus_clear_fault_page(client, page);
> 
> 	return ret;
> }
> 
> On any IRQ-enabled PMBus device, this still sends PMBUS_CLEAR_FAULTS on
> all pages during probe and erases the latched fault registers that this
> patch aims to preserve.
> 


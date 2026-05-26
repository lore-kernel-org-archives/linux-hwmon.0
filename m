Received: from canpmsgout04.his.huawei.com (canpmsgout04.his.huawei.com [113.46.200.219])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D70BC2848A1;
	Tue, 26 May 2026 03:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.219
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779767628; cv=none; b=cvHBPQYEYCEiwkqiWzaaRsGjntDr8WF6RxxDaBsxT0Q8shKF7XFIbzs1op8I5KWMRo+bFcGzKSpjvx5cE0TfdJ+Tvp9/2fX4zVn4yqb5v0CHWhHjX/gDnGP3FrQy+ZIU5q45i6J5OcXa29XjgV9Ky2/E8yGuLNcGHJ5bzeC/SuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779767628; c=relaxed/simple;
	bh=str7OA3cTjqRfX8pdISN5PwHUlL5UU4pfJPlF2uNtbw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=UgW5lTlPYA3AfzeElsHFGMpX+N2lzA3ZgOgOpNvfA9NQurb3StV21UN6ZM2xuludorDI5u1jrFAhVjcBJH19HPHtUEptpjZE6AvAs6SJH/dE1/SvoIUBVhHdIZQv40JUxY2FWv8QPGL2kQEWsOvIH2H7UrtL1G3aqpe0q9w/gjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=h-partners.com; dkim=pass (1024-bit key) header.d=h-partners.com header.i=@h-partners.com header.b=eQewTXbw; arc=none smtp.client-ip=113.46.200.219
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=h-partners.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=h-partners.com header.i=@h-partners.com header.b="eQewTXbw"
dkim-signature: v=1; a=rsa-sha256; d=h-partners.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=jRuBa9GPV5B0/DtoG5ORWUM4QWLF++QXqRVYfWRRVHQ=;
	b=eQewTXbwoZGGjeSSQwLDapaXWMM/WW1oxH5dQWqqmvYIh+0He8R531zqJrluJCR/vziaA9/lD
	trV4lXS+InmPPV1ej3b4MdnrIbeAhIUvu9Lc1tcB3QsXSI8kiXlugUEh16PqmILkhfpZdW5qI09
	JiVB36BJ30/iwAcsWfj+FP4=
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4gPdvQ4GL3z1prN9;
	Tue, 26 May 2026 11:45:54 +0800 (CST)
Received: from dggemv705-chm.china.huawei.com (unknown [10.3.19.32])
	by mail.maildlp.com (Postfix) with ESMTPS id 07BF64056D;
	Tue, 26 May 2026 11:53:42 +0800 (CST)
Received: from kwepemn100009.china.huawei.com (7.202.194.112) by
 dggemv705-chm.china.huawei.com (10.3.19.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 26 May 2026 11:53:41 +0800
Received: from [10.67.121.59] (10.67.121.59) by kwepemn100009.china.huawei.com
 (7.202.194.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Tue, 26 May
 2026 11:53:41 +0800
Message-ID: <d5b4b256-f929-4511-8fdb-2d94f2c43148@huawei.com>
Date: Tue, 26 May 2026 11:53:40 +0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v02] mailbox: pcc: report errors for PCC clients
To: Adam Young <admiyo@amperemail.onmicrosoft.com>, Sudeep Holla
	<sudeep.holla@kernel.org>
CC: Adam Young <admiyo@os.amperecomputing.com>, Jassi Brar
	<jassisinghbrar@gmail.com>, <linux-kernel@vger.kernel.org>,
	<linux-hwmon@vger.kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>, "Len
 Brown" <lenb@kernel.org>, <linux-acpi@vger.kernel.org>, Andi Shyti
	<andi.shyti@kernel.org>, Guenter Roeck <linux@roeck-us.net>, MyungJoo Ham
	<myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>, <linux-arm-kernel@lists.infradead.org>,
	<lihuisong@huawei.com>
References: <20260518193006.27425-1-admiyo@os.amperecomputing.com>
 <881ec4ba-44ce-498d-b0c4-8c1d51b13cc3@huawei.com>
 <20260519-outgoing-rough-fox-04daab@sudeepholla>
 <d719462f-3430-47c1-9b9d-1068b3c4e429@huawei.com>
 <20260520-optimal-nightingale-of-champagne-0bbdfe@sudeepholla>
 <68f838b9-f3ae-41e4-96a4-667361bdc65e@amperemail.onmicrosoft.com>
From: "lihuisong (C)" <lihuisong@huawei.com>
In-Reply-To: <68f838b9-f3ae-41e4-96a4-667361bdc65e@amperemail.onmicrosoft.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemn100009.china.huawei.com (7.202.194.112)


On 5/23/2026 12:52 AM, Adam Young wrote:
> I am not getting li hui song's messages, only your (Sudeep's) responses.
>
> On 5/20/26 09:32, Sudeep Holla wrote:
>> On Wed, May 20, 2026 at 07:53:45PM +0800, lihuisong (C) wrote:
>>> On 5/20/2026 12:25 AM, Sudeep Holla wrote:
>>>> On Tue, May 19, 2026 at 09:54:47PM +0800, lihuisong (C) wrote:
>> [...]
>>
>>>>> @Sudeep, I have always had doubts about the addition of this line 
>>>>> of code in
>>>>> the
>>>>>    commit 9c753f7c953c (mailbox: pcc: Mark Tx as complete in PCC 
>>>>> IRQ handler).
>>>>> The patch seems to avoid the timeouts in the mailbox core 
>>>>> according to its
>>>>> commit log.
>>>>> Regardless of whether the command succeeds or fails, each mbox client
>>>>> driver, like cppc_acpi/acpi_pcc，kunpeng_hccs and so on, is 
>>>>> responsible to
>>>>> call mbox_chan_txdone() to tell mailbox core.
>>>> Few controller drivers do have mbox_chan_txdone(), so Tx complete 
>>>> is detected
>>> Which controller driver?
>> git grep mbox_chan_txdone drivers/mailbox/
>
>
> These are the only drivers that have a callback defined so far. IN all 
> cases, they are only doing error reporting, but no change of behavior.
>
>
>     drivers/acpi/cppc_acpi.c
>     drivers/i2c/busses/i2c-xgene-slimpro.c
>     drivers/hwmon/xgene-hwmon.c
>     drivers/soc/hisilicon/kunpeng_hccs.c
>     drivers/devfreq/hisi_uncore_freq.c
>
Need to cleanup for these driver without introducing other issues.
>
>>
>>>> by PCC, so not sure why you think this is not the right place to 
>>>> do. The irq
>>> Because many mbox client drivers call mbox_chan_txdone() after running
>>> rx_callback() in mbox_chan_received_data().
>> OK, but why can't the controller hide that for the clients ? What am 
>> I missing?
>>
>>> These drivers doesn't set chan->cl->tx_block to true.
>>> It seems that the client driver having tx_block need to set
>>> chan->tx_complete in tx_tick().
>>> Do you add this code for them?
>> I don't quite follow you.
>>
>>>> is to indicate the completion. I am confused as why you think 
>>>> otherwise.
>>>> It is defined in include/linux/mailbox_controller.h for the same 
>>>> reason.
>>>>
>>>> The client drivers can you mbox_client_txdone() if they wish to as 
>>>> defined
>>>> in include/linux/mailbox_client.h
>>> mbox_client_txdone() is used in the case that txdone_method is
>>> MBOX_TXDONE_BY_ACK.
>> Yes and agreed.
>
> I could make this path conditional on that being set.  Something like:
>
> rc = pcc_mbox_error_check_and_clear(pchan);
>
>       if (rc  &&   chan->txdone_method & MBOX_TXDONE_BY_POLL)
> -               return IRQ_NONE;
>
> Which lets the ACK and IRQ paths continue.
Client using POLL doesn't reach this code.
>
>
>
>
>>
>>> And mbox clinte driver using IRQ method need to use mbox_chan_txdone().
>> Client doesn't handle IRQ its always controller driver and client 
>> must have
>> no business to do that IMO.
>
> IN the PCC case, an error in handling a packet (PCC message) is 
> returned in the error register and read during the IRQ response. That 
> error message needs to propagate to the MCTP network driver so it can 
> free up the SKB and not leak memory. We cannot free it before that 
> point as it is still in the rbuf/active_request pointer.
The direction you said should be Tx, right?
I understand that your driver needs to wait for this message to be 
processed.
If the driver does not wait for the message, driver will receive timeout 
and can instruct to release the SKB.
>
>>
>>> It seems that all the current client drivers are used in this way.
>>> These interface internal would verify chan->txdone_method.
>>>
>> Yes, sounds wrong to me.
>>
>> drivers/acpi/acpi_pcc.c
>> drivers/acpi/cppc_acpi.c
>> drivers/hwmon/xgene-hwmon.c
>> drivers/i2c/busses/i2c-xgene-slimpro.c
>> drivers/soc/hisilicon/kunpeng_hccs.c
>>
>> It is very clear from the code in mailbox.c, mbox_client_txdone() is for
>> the client drivers and mbox_chan_txdone() is for the controller. We need
>> to fix the above list but I need to check if there is anything I am 
>> missing
>> to understand first. Please let me know.
>>
>>> In addition, I find that you also modify the txdone_irq/poll in the 
>>> commit
>>> 3349f800609e (mailbox: pcc: Set txdone_irq/txdone_poll based on PCCT 
>>> flags).
>>> The txdone_method will change from MBOX_TXDONE_BY_ACK to 
>>> MBOX_TXDONE_BY_POLL
>>> on the platform using poll mode.
>>> This may lead to the original mbox client driver printing exceptions in
>>> mbox_client_txdone.
>>> I haven't observed it based on the latest code yet, it's just code 
>>> analysis.
>> Right, I do remember seeing something and wonder if I moved to
>> mbox_chan_txdone() in drivers/acpi/acpi_pcc.c for that reason. But if 
>> the
>> expectations I have mentioned are correct, then we need to fix the 
>> framework
>> to avoid throwing that warnings.
>>
>

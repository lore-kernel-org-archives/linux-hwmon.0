Received: from canpmsgout10.his.huawei.com (canpmsgout10.his.huawei.com [113.46.200.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03E5A253B58;
	Thu, 21 May 2026 12:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779366418; cv=none; b=p/kJGw6MYKAP/vffHROuslHwU86bBSMbjQe1aciB94bNQB+mVOc5HFrVrx6GOZrFZ67EMe3qlzwPIXDUkp9jDZucdyM2mwyCMD2TAFOvT68IY2K9qXlWmAUZ0YB1xLUcXlatJL0v7Ly+CvUA43ldYxlUavIxLNdmxBR43U+EbLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779366418; c=relaxed/simple;
	bh=1zhHD8CEzG224p06va1HFfePxL4kIY/zaWK0ArSoI64=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=gLXnhyhvMMu6hKVxvN7j5sRZTV9aTM6wKH1aoRAf9kGkcMLRiv9iwVQWu8n5Q+HjdMf3uYJesPol8YsWLYgdRZdQMYfaG9OcCsmu1j6xXQTfDZ5yxVO9DpuodxfdvfDY+xzYf3nou37MIsyh9mPOOu9k4JJbT7z9nmHwzEAIBYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=h-partners.com; dkim=pass (1024-bit key) header.d=h-partners.com header.i=@h-partners.com header.b=m3qHm8hX; arc=none smtp.client-ip=113.46.200.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=h-partners.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=h-partners.com header.i=@h-partners.com header.b="m3qHm8hX"
dkim-signature: v=1; a=rsa-sha256; d=h-partners.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=QKERNb/1FEYc0xDL9VQVwE6H1oVLPZS5L+kPq3cagjc=;
	b=m3qHm8hXl/pJT/hpA/XjXR08PRnsmfsipG6I8L3xnkYhWkIjgbj6XuBvAEl5WPrEmA3ryQan2
	BYbqoEBbLbu4BiysZOq6yFUqUc6KES5WBxrZR6Ax7xfzTFNj7VdH3ySBQz3SPVldmeF9vJdobRV
	xJQuStX+gHBmrvBvxRd1Jjk=
Received: from mail.maildlp.com (unknown [172.19.163.214])
	by canpmsgout10.his.huawei.com (SkyGuard) with ESMTPS id 4gLnWs223Nz1K983;
	Thu, 21 May 2026 20:19:05 +0800 (CST)
Received: from dggemv706-chm.china.huawei.com (unknown [10.3.19.33])
	by mail.maildlp.com (Postfix) with ESMTPS id 09DE740561;
	Thu, 21 May 2026 20:26:46 +0800 (CST)
Received: from kwepemn100009.china.huawei.com (7.202.194.112) by
 dggemv706-chm.china.huawei.com (10.3.19.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 21 May 2026 20:26:45 +0800
Received: from [10.67.121.59] (10.67.121.59) by kwepemn100009.china.huawei.com
 (7.202.194.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Thu, 21 May
 2026 20:26:45 +0800
Message-ID: <9f7ab2db-d3cd-4ec0-97a1-38cf85696438@huawei.com>
Date: Thu, 21 May 2026 20:26:44 +0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v02] mailbox: pcc: report errors for PCC clients
To: Sudeep Holla <sudeep.holla@kernel.org>
CC: Adam Young <admiyo@os.amperecomputing.com>, Jassi Brar
	<jassisinghbrar@gmail.com>, <linux-kernel@vger.kernel.org>,
	<linux-hwmon@vger.kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>, "Len
 Brown" <lenb@kernel.org>, <linux-acpi@vger.kernel.org>, Andi Shyti
	<andi.shyti@kernel.org>, Guenter Roeck <linux@roeck-us.net>, MyungJoo Ham
	<myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>, <linux-arm-kernel@lists.infradead.org>
References: <20260518193006.27425-1-admiyo@os.amperecomputing.com>
 <881ec4ba-44ce-498d-b0c4-8c1d51b13cc3@huawei.com>
 <20260519-outgoing-rough-fox-04daab@sudeepholla>
 <d719462f-3430-47c1-9b9d-1068b3c4e429@huawei.com>
 <20260520-optimal-nightingale-of-champagne-0bbdfe@sudeepholla>
From: "lihuisong (C)" <lihuisong@huawei.com>
In-Reply-To: <20260520-optimal-nightingale-of-champagne-0bbdfe@sudeepholla>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemn100009.china.huawei.com (7.202.194.112)


On 5/20/2026 9:32 PM, Sudeep Holla wrote:
> On Wed, May 20, 2026 at 07:53:45PM +0800, lihuisong (C) wrote:
>> On 5/20/2026 12:25 AM, Sudeep Holla wrote:
>>> On Tue, May 19, 2026 at 09:54:47PM +0800, lihuisong (C) wrote:
> [...]
>
>>>> @Sudeep, I have always had doubts about the addition of this line of code in
>>>> the
>>>>    commit 9c753f7c953c (mailbox: pcc: Mark Tx as complete in PCC IRQ handler).
>>>> The patch seems to avoid the timeouts in the mailbox core according to its
>>>> commit log.
>>>> Regardless of whether the command succeeds or fails, each mbox client
>>>> driver, like cppc_acpi/acpi_pcc，kunpeng_hccs and so on, is responsible to
>>>> call mbox_chan_txdone() to tell mailbox core.
>>> Few controller drivers do have mbox_chan_txdone(), so Tx complete is detected
>> Which controller driver?
> git grep mbox_chan_txdone drivers/mailbox/
Ok
>
>>> by PCC, so not sure why you think this is not the right place to do. The irq
>> Because many mbox client drivers call mbox_chan_txdone() after running
>> rx_callback() in mbox_chan_received_data().
> OK, but why can't the controller hide that for the clients ? What am I missing?
Now I know what you want to do.
It's ok for me to do that in controller on irq scene.
But we also need to fix the mbox_chan_txdone() code in all client drivers.
>
>> These drivers doesn't set chan->cl->tx_block to true.
>> It seems that the client driver having tx_block need to set
>> chan->tx_complete in tx_tick().
>> Do you add this code for them?
> I don't quite follow you.
please ship this.
>
>>> is to indicate the completion. I am confused as why you think otherwise.
>>> It is defined in include/linux/mailbox_controller.h for the same reason.
>>>
>>> The client drivers can you mbox_client_txdone() if they wish to as defined
>>> in include/linux/mailbox_client.h
>> mbox_client_txdone() is used in the case that txdone_method is
>> MBOX_TXDONE_BY_ACK.
> Yes and agreed.
>
>> And mbox clinte driver using IRQ method need to use mbox_chan_txdone().
> Client doesn't handle IRQ its always controller driver and client must have
> no business to do that IMO.
Ack
mbox_chan_txdone should be used by controller as this function comment 
said.
>
>> It seems that all the current client drivers are used in this way.
>> These interface internal would verify chan->txdone_method.
>>
> Yes, sounds wrong to me.
>
> drivers/acpi/acpi_pcc.c
> drivers/acpi/cppc_acpi.c
> drivers/hwmon/xgene-hwmon.c
> drivers/i2c/busses/i2c-xgene-slimpro.c
> drivers/soc/hisilicon/kunpeng_hccs.c
>
> It is very clear from the code in mailbox.c, mbox_client_txdone() is for
> the client drivers and mbox_chan_txdone() is for the controller. We need
> to fix the above list but I need to check if there is anything I am missing
> to understand first. Please let me know.
Agreed.
>
>> In addition, I find that you also modify the txdone_irq/poll in the commit
>> 3349f800609e (mailbox: pcc: Set txdone_irq/txdone_poll based on PCCT flags).
>> The txdone_method will change from MBOX_TXDONE_BY_ACK to MBOX_TXDONE_BY_POLL
>> on the platform using poll mode.
>> This may lead to the original mbox client driver printing exceptions in
>> mbox_client_txdone.
>> I haven't observed it based on the latest code yet, it's just code analysis.
> Right, I do remember seeing something and wonder if I moved to
> mbox_chan_txdone() in drivers/acpi/acpi_pcc.c for that reason. But if the
> expectations I have mentioned are correct, then we need to fix the framework
> to avoid throwing that warnings.
Yeah, we also need to do something for your another commit
3349f800609e (mailbox: pcc: Set txdone_irq/txdone_poll based on PCCT 
flags).
>

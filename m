Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3A9C2DA768;
	Mon, 31 Aug 2026 01:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788140694; cv=none; b=O8072wgF63iQkq5nxsxBnR/Oola8lWuHIxcPanWI43BrBXzwOP0EVQ0Ih45oa6uwpoIgFzqxvX5/RRVPDhN+vjc0VpP0W8NeHusD5x4wjE3Y3P6YeBqR3852lu2UNnh+9f333SsFlpgkK/2SEcN2Ch1WwANx1166ZRHiraEcZqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788140694; c=relaxed/simple;
	bh=kEyYRMma8so8XgxuHIaArzPbwpldnZdaTyyu2t1yj3s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Qu6qFJBx+9Rtf/mCOUUARMMYnI18y+adSwrQKWOHLpFL7btzhmMJLrqsK5ReanJV/J3ptDWHIFkbfSjrO3nESeecxNH0xGEd2NoYEhaTnNFA8dVeDVAteSQw4hhkXjakewO6irW7gOgzUQq3RmfMhaZdbtI2a61XfbHAGXp0qeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 8bbb7a5aa4dd11f19a56ed5b684f684d-20260831
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:5b6c5a6a-ddd6-4eb8-98c6-402e07818142,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:7db8b62,CLOUDID:0190d0dac5645a78ce01c6c7d9bc87f6,BulkI
	D:nil,BulkQuantity:0,SF:80|81|82|83|102|865|898|915,TC:nil,Content:0|15|52
	,EDM:-3,IP:nil,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:
	0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 8bbb7a5aa4dd11f19a56ed5b684f684d-20260831
X-User: lilinmao@kylinos.cn
Received: from [10.0.2.15] [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <lilinmao@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_128_GCM_SHA256 128/128)
	with ESMTP id 1457762410; Mon, 31 Aug 2026 09:44:46 +0800
Message-ID: <b4a802af-223d-4f0a-98a7-fb35f0b97fc6@kylinos.cn>
Date: Mon, 31 Aug 2026 09:44:42 +0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: (corsair-cpro) Remove debugfs entries when probe
 fails
To: Guenter Roeck <linux@roeck-us.net>,
 Marius Zachmann <mail@mariuszachmann.de>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
 Sashiko <sashiko-bot@kernel.org>
References: <20260828061949.3151191-1-lilinmao@kylinos.cn>
 <fcb78e74-df8b-47f0-831b-3a1d62238792@roeck-us.net>
From: Linmao Li <lilinmao@kylinos.cn>
In-Reply-To: <fcb78e74-df8b-47f0-831b-3a1d62238792@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


在 2026/8/28 21:14, Guenter Roeck 写道:
> On 8/27/26 23:19, Linmao Li wrote:
>> ccp_debugfs_init() registers debugfs files whose private data is the 
>> devm
>> allocated ccp.  If hwmon_device_register_with_info() fails right 
>> after it,
>> ccp_probe() returns without removing them: the HID core then frees ccp,
>> and ccp_remove() is not called for a failed probe, so the files stay
>> behind.  Reading one of them dereferences the freed pointer.
>>
>> Remove the debugfs entries on that error path. 
>> debugfs_remove_recursive()
>> waits for readers already inside the show callbacks, so ccp is no longer
>> reachable through debugfs by the time probe returns.
>>
>> Reported-by: Sashiko <sashiko-bot@kernel.org>
>> Closes: 
>> https://lore.kernel.org/linux-hwmon/20260708031612.BD7E61F000E9@smtp.kernel.org/
>> Fixes: 5997eb60f896 ("hwmon: (corsair-cpro) Add firmware and 
>> bootloader information")
>> Signed-off-by: Linmao Li <lilinmao@kylinos.cn>
>> ---
>>   drivers/hwmon/corsair-cpro.c | 4 +++-
>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/hwmon/corsair-cpro.c b/drivers/hwmon/corsair-cpro.c
>> index 8354a002f4c5..30fe5d8e724c 100644
>> --- a/drivers/hwmon/corsair-cpro.c
>> +++ b/drivers/hwmon/corsair-cpro.c
>> @@ -638,11 +638,13 @@ static int ccp_probe(struct hid_device *hdev, 
>> const struct hid_device_id *id)
>>                                ccp, &ccp_chip_info, NULL);
>>       if (IS_ERR(ccp->hwmon_dev)) {
>>           ret = PTR_ERR(ccp->hwmon_dev);
>> -        goto out_hw_close;
>> +        goto out_debugfs_remove;
>>       }
>
> Any reason to not move the call to ccp_debugfs_init() instead ?
ccp_debugfs_init() also calls get_fw_version() and get_bl_version(), which
send USB commands without taking ccp->mutex. That is fine where the call
sits now, because nothing else calls send_usb_cmd() until the hwmon device
is registered. Moving it unchanged past the registration would let the
hwmon callbacks race with those two reads on ccp->cmd_buffer, ccp->buffer
and wait_input_report.

I will split the version queries from the debugfs creation in v2: the
queries stay where they are, and the debugfs entries are created only
after hwmon_device_register_with_info() has succeeded, which removes the
error path altogether.

Thanks,
Linmao
>
> Thanks,
> Guenter
>
>>       return 0;
>>   +out_debugfs_remove:
>> +    debugfs_remove_recursive(ccp->debugfs);
>>   out_hw_close:
>>       hid_hw_close(hdev);
>>       hid_device_io_stop(hdev);
>>
>> base-commit: 8d3ae59288f1e7d58d76558a6ee96d533bc5019f

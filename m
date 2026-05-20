Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D7422FD1B3;
	Wed, 20 May 2026 02:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779244193; cv=none; b=UCVRtkn9eTjMkq5r4SI2ZcE6Mc6xDsj7VEBmTgb7njT5vdqS/eZuEXthHDlPNg6/fnPgH+JyVBltDPBAH9MRVqQ0QmAE/tKFtT8yvbVc0cSC64j9kGt4+c3YozfAGf09ZwZ4EyazDEa8MI8W182VPlJOwFV0aSX3hyKN6gmc/jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779244193; c=relaxed/simple;
	bh=qKdP8gwbFrZCu+rkDA2VPIxHVZvAwIavEfUrS4mdvJI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Kqnu1Zj9gBbWBEa4E5UbVKLop2kio4g9yqm6kWowpDAdxr0v3vVi6/nVWQk1GLs6KoUIwmiJxZqwCt5PjJ+654nFw8n8LTpkhmzOJ62c2b7KDr1kbS+h2Rws3me/znkuik4y7lvNxNugVETIi3o0W0+op1WhuFRzilQGCVQ8PT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: c34dc11653f311f1aa26b74ffac11d73-20260520
X-CID-CACHE: Type:Local,Time:202605201015+08,HitQuantity:1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:e089502b-a961-44a4-9ae0-26776ac77df4,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:1b5cdee170193ef0d64151a4d1e62d24,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|865|898,TC:0,Content:0|1
	4|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI
	:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: c34dc11653f311f1aa26b74ffac11d73-20260520
X-User: jindongyang@kylinos.cn
Received: from [172.25.120.11] [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <jindongyang@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_128_GCM_SHA256 128/128)
	with ESMTP id 1238087666; Wed, 20 May 2026 10:29:44 +0800
Message-ID: <9d36e57d-5949-4af0-9f3a-0742ff18a3e7@kylinos.cn>
Date: Wed, 20 May 2026 10:29:41 +0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: (coretemp) Replace sprintf() with sysfs_emit() for
 sysfs show functions
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260519065220.2348524-1-jindongyang@kylinos.cn>
 <d4ac610a-b34c-44aa-8e7e-b27092390c63@roeck-us.net>
Content-Language: en-US
From: Dongyang Jin <jindongyang@kylinos.cn>
In-Reply-To: <d4ac610a-b34c-44aa-8e7e-b27092390c63@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

You are absolutely right, and I apologize for the noise.

I misunderstood the scope of acceptable cleanups for legacy drivers. I 
will stop sending such patches and focus only on functional fixes or 
updates for drivers that specifically require them.
Thank you for your time.

Best regards,
Dongyang Jin

On 2026/5/19 23:16, Guenter Roeck wrote:
> On 5/18/26 23:52, Dongyang Jin wrote:
>> Replace sprintf() with sysfs_emit() in sysfs show functions.  
>> sysfs_emit()
>> is preferred for formatting sysfs output because it provides safer 
>> bounds
>> checking.  No functional changes.
>>
>> Signed-off-by: Dongyang Jin <jindongyang@kylinos.cn>
>
> I consider this a nuisance patch. Nothing is gained from it.
> Can people please stop sending such patches ? It gets annoying,
> and I don't have an endless amount of time to review it all.
>
> If you make a functional change or fix bugs, cleanups are welcome.
> Otherwise, I'll barely accept bare cleanup patches for drivers
> using the with_info API. Otherwise please leave old drivers alone.
>
> Thanks,
> Guenter

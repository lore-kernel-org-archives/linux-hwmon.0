Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC7B61C69D;
	Mon,  8 Jun 2026 01:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780880667; cv=none; b=GU8XV0wxjYZYIOnO/SFFYCt7rV02GLxxREt9XadMLb7ykFX03RWwSNdK2hXAe0Ocy/BgJg+/GAskCYnjKSL9yYCVRrIUKyXdpHBaXNgC+OJU+pSB1UGmDwyCo1U6F4Bl1cuqwKAZIunUgghyaH+SFXe60gPwCn3ywJ3OF902bVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780880667; c=relaxed/simple;
	bh=0u/rt3ymCiUBjo9MPRKud3l8RDb2/MC7Ck7jko9UwG8=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=clbKeEaBlIiArlxeLRdvg7rutywicf0+a3GbKDxbcYTRXLYDlxgfXXLL/XgXCxNDXhYdgzAVw309KM0hxjbwLKo3amiWZqdKJ7E0Ob0UVhODhBihjp5P4pkc0oz7hKU3E+HRwaaMcoKR2lzdI+8xP0Lj+ozcS/6KYXnp1c0snJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: f580073e62d511f1aa26b74ffac11d73-20260608
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:e5ee876a-52f7-406d-8c07-57468338a0bf,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:26888b0e56718beed330195f79d3620c,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|865|898,TC:nil,Content:0
	|15|52,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,O
	SI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: f580073e62d511f1aa26b74ffac11d73-20260608
X-User: xiaopei01@kylinos.cn
Received: from [10.42.12.251] [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <xiaopei01@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_128_GCM_SHA256 128/128)
	with ESMTP id 897829675; Mon, 08 Jun 2026 09:04:11 +0800
Message-ID: <36224533-d9b1-4bc0-8a6d-9af791259448@kylinos.cn>
Date: Mon, 8 Jun 2026 09:04:08 +0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] some cleanup and fix in gpd-fan
To: Guenter Roeck <linux@roeck-us.net>, xiaopeitux@foxmail.com,
 cryolitia@uniontech.com, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <tencent_D01DBC324E22E6A05DA32244B807A89A2109@qq.com>
 <ea749740-6f19-4e34-ac88-c0f985e087c6@roeck-us.net>
From: Pei Xiao <xiaopei01@kylinos.cn>
In-Reply-To: <ea749740-6f19-4e34-ac88-c0f985e087c6@roeck-us.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



在 2026/6/8 07:49, Guenter Roeck 写道:
> On 5/27/26 03:10, xiaopeitux@foxmail.com wrote:
>> From: Pei Xiao <xiaopei01@kylinos.cn>
>>
>> some cleanup and fix in gpd-fan
>>
>> Pei Xiao (4):
>>    hwmon: (gpd-fan): drop global driver data and use per-device
>>      allocation
>>    hwmon: (gpd-fan): Initialize EC before registering hwmon device
>>    hwmon: (gpd-fan): upgrade log level from warn to err for platform
>>      device creation failure
>>    hwmon: (gpd-fan): fix race condition between device removal and sysfs
>>      access
>>
>>   drivers/hwmon/gpd-fan.c | 226 ++++++++++++++++++++++------------------
>>   1 file changed, 125 insertions(+), 101 deletions(-)
>>
>
> This patch series is a mess.
>
> I received a v2 of this series before this summary, the series sent after
> v2 has a mix of "v2" and no versioning tags, and it includes four instead
> of the three patches from the original v2.
>
> If you want this series applied, please send v3 with all patches tagged
> as v3 and a complete version change log. I will not even try to figure
> out which patches to apply from which series. 
>

 Thank you for your reply. I will send the third version.

Pei
> Guenter


Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FAC53EB808;
	Wed, 27 May 2026 09:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779873980; cv=none; b=qntYD7hp4EEKXJmVLcsxym1bkuF/sUx4xyQi93CI2Y+XYRTDFH3YAQtwKkN5mI1mWkZqeFkvoiVqkRr5W7CaoNEd3SNPa59OE9ObMgSp3aGBm89JL2wPU63Si2Rt7U7npMeuDm3Gkbti8bVUCI1mw67SYFhrWEOIZ++++KKCWDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779873980; c=relaxed/simple;
	bh=nBSBsCfw9vHaTm6R3z1GEGK40MnnkOdjlGqUNOAAvWg=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=GriGJYyjn0J2PHu7zTnwiZCuGxCcgsW/FIlWFRMdz7XUwQUL+hLMmgF5T/h7cKt+Jw/ZrOFolaI+ay5HlDVd8rwyEmv7QPZpe1oNvvPpL/SRkeINx2hraEZQ8AOH2lZ6v8f/IeUFO0i+D7hNUBUaXYx6YPJ59aGJUAxU5R5SEGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 18cd33f059ae11f1aa26b74ffac11d73-20260527
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:0d464c2c-d00c-4098-8aaf-2176b7c0b81f,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:653a52a3dbad053798300a858f30db36,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|865|898,TC:nil,Content:0
	|15|52,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,O
	SI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 18cd33f059ae11f1aa26b74ffac11d73-20260527
X-User: xiaopei01@kylinos.cn
Received: from [10.42.12.251] [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <xiaopei01@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_128_GCM_SHA256 128/128)
	with ESMTP id 354273085; Wed, 27 May 2026 17:26:10 +0800
Message-ID: <04821106-37be-4d04-84f2-b480570b2854@kylinos.cn>
Date: Wed, 27 May 2026 17:26:07 +0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] hwmon: (gpd-fan): upgrade log level from warn to
 err for platform device creation failure
To: xiaopeitux@foxmail.com, cryolitia@uniontech.com, linux@roeck-us.net,
 linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
References: <cover.1779868768.git.xiaopei01@kylinos.cn>
 <tencent_F6CCA9B9DA441472AB5119417E7B619DB40A@qq.com>
From: Pei Xiao <xiaopei01@kylinos.cn>
In-Reply-To: <tencent_F6CCA9B9DA441472AB5119417E7B619DB40A@qq.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



在 2026/5/27 16:10, xiaopeitux@foxmail.com 写道:
> From: Pei Xiao <xiaopei01@kylinos.cn>
>
> When platform_create_bundle() fails, the error is fatal and prevents the
> driver from loading. Use pr_err() instead of pr_warn() to clearly indicate
> a critical failure.
>
> Signed-off-by: Pei Xiao <xiaopei01@kylinos.cn>
> ---
>  drivers/hwmon/gpd-fan.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/hwmon/gpd-fan.c b/drivers/hwmon/gpd-fan.c
> index 745b3fb9e3a4..b18725f4d108 100644
> --- a/drivers/hwmon/gpd-fan.c
> +++ b/drivers/hwmon/gpd-fan.c
> @@ -712,7 +712,7 @@ static int __init gpd_fan_init(void)
>  							 match, sizeof(*match));
>  
>  	if (IS_ERR(gpd_fan_platform_device)) {
> -		pr_warn("Failed to create platform device\n");
> +		pr_error("Failed to create platform device\n");
V1 not have  have this build errro ! But V2 have ! oh my god!
We will send a new thread!
>  		return PTR_ERR(gpd_fan_platform_device);
>  	}
>  


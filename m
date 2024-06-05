Received: from mail.gtsys.com.hk (web.xit.com.hk [111.91.236.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBFEA225D9
	for <linux-hwmon@vger.kernel.org>; Wed,  5 Jun 2024 06:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=111.91.236.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717567660; cv=none; b=ZNw1ZhPL124Xy1JWzhD/doEGm0BucDaoUm69uVth5C6zwOHmWyzO6IYqi+S7MrLEZhcopvFis6FqhJkoawf3Vx3aAPzbn2PJpus2bEhkooc+nOUSrHIP5lmMckAO0dD4u/NW0SYw3bpfOx1tDIKG2ypBzYeCnwM5gwC1sehVZT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717567660; c=relaxed/simple;
	bh=1nSULNYTPn2630+e8sfTtann/4DHD4LOpU6ZFUJwuZw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pgTrDr41+Ta8nhU8uAijXznr8Lpbf7rsKq32ThRly36Vxt/HXlRxGgJYhTfmCy7TE9cJ85mVehj+1hegA01FTsU+LJ2fXPaGOQxhENdpnCB1CBQvlhHpJVvBksa4eaGIekGCbuO2w1tRd38R+PaL7SE6EcRn/YNQ3QS+DGJOzQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtsys.com.hk; spf=pass smtp.mailfrom=gtsys.com.hk; arc=none smtp.client-ip=111.91.236.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtsys.com.hk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gtsys.com.hk
Received: from localhost (localhost [127.0.0.1])
	by mail.gtsys.com.hk (Postfix) with ESMTP id 88BF814DA;
	Wed,  5 Jun 2024 14:02:11 +0800 (HKT)
X-Virus-Scanned: Debian amavis at gtsys.com.hk
Received: from mail.gtsys.com.hk ([127.0.0.1])
 by localhost (mail.gtsys.com.hk [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RPQyUOry_PFQ; Wed,  5 Jun 2024 14:02:10 +0800 (HKT)
Received: from gtsnode.virtual.gtsys.com.hk (gtsnode.virtual.gtsys.com.hk [10.128.4.2])
	by mail.gtsys.com.hk (Postfix) with ESMTP id E773BFC7;
	Wed,  5 Jun 2024 14:02:10 +0800 (HKT)
Received: from [10.128.1.32] (unknown [203.145.94.17])
	by gtsnode.virtual.gtsys.com.hk (Postfix) with ESMTPSA id AD7C1201E0;
	Wed,  5 Jun 2024 14:02:10 +0800 (HKT)
Message-ID: <b9342b78-2ffa-4ce1-9ffa-bfb125e9d38f@gtsys.com.hk>
Date: Wed, 5 Jun 2024 14:02:09 +0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: (shtc1) Fix property misspelling
To: Guenter Roeck <linux@roeck-us.net>,
 Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>
References: <20240530152311.3765049-1-linux@roeck-us.net>
Content-Language: en-US
From: Chris Ruehl <chris.ruehl@gtsys.com.hk>
In-Reply-To: <20240530152311.3765049-1-linux@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 30/5/2024 23:23, Guenter Roeck wrote:
> The property name is "sensirion,low-precision", not
> "sensicon,low-precision".
> 
> Cc: Chris Ruehl <chris.ruehl@gtsys.com.hk>
> Fixes: be7373b60df5 ("hwmon: shtc1: add support for device tree bindings")
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
>   drivers/hwmon/shtc1.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/shtc1.c b/drivers/hwmon/shtc1.c
> index 1f96e94967ee..439dd3dba5fc 100644
> --- a/drivers/hwmon/shtc1.c
> +++ b/drivers/hwmon/shtc1.c
> @@ -238,7 +238,7 @@ static int shtc1_probe(struct i2c_client *client)
>   
>   	if (np) {
>   		data->setup.blocking_io = of_property_read_bool(np, "sensirion,blocking-io");
> -		data->setup.high_precision = !of_property_read_bool(np, "sensicon,low-precision");
> +		data->setup.high_precision = !of_property_read_bool(np, "sensirion,low-precision");
>   	} else {
>   		if (client->dev.platform_data)
>   			data->setup = *(struct shtc1_platform_data *)dev->platform_data;

Strange how that can happen!
Thank you catch this misspelled property.

Reviewed-by: Chris Ruehl <chris.ruehl@gtsys.com.hk>


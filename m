Received: from smtp.smtpout.orange.fr (smtp-27.smtpout.orange.fr [80.12.242.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C83E81DA313;
	Wed,  3 Jul 2024 18:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.27
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720031886; cv=none; b=Y76fCydlrMuqvuykNf3Mo0VjK9AzPrL1ffHvYfeOTi6FCh2D3A9qE1csrrWbx+6CzHb4Fx18GEQ9zQyFMVoc1c9SNnR6MY0rAqwmTM9573riI+V2jINuoEp97p678OUfr5J52y0d5m0+axMGBoUvDMGZUXCSwH8jMD+xXXXHNm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720031886; c=relaxed/simple;
	bh=8Lne1udkT5NX6PNL40NpmXTSd4gVIkdYfFL+CPZdwl8=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=asofwVnXpq4EXk4bVjmZoB44x5k5fCIqi/E9Pzpg8CEFSMn9ORRa2tKp62jdrBExsKe5O7X9WSg7ec8Hffs/EUU5h+Iq8CJOlggtCe/8myAZbRfdujeRb2qZ7xz+XoxAbyr6KxWFBAl1pmWEb0uYcqVlWb5F7GuEegpwKj+6tW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=CGya/PGl; arc=none smtp.client-ip=80.12.242.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="CGya/PGl"
Received: from [192.168.1.37] ([86.243.222.230])
	by smtp.orange.fr with ESMTPA
	id P4K3s5TbXTXauP4K3sPmmb; Wed, 03 Jul 2024 20:03:17 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1720029797;
	bh=2MHnS0IiHJ4+AvNji5eWBJMBgkSeDdgvbhm6goBNfYA=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=CGya/PGlgemllVrEqnFYBW7d46qRAquHqIiFuPhYj/zLjrJxFGiyICLlUQwCEmBQm
	 BcD3DgsNWLvOS3o+CMOd77Nmq0OOKvWGJOaTpkC/ffeAlK5/RRDGfy1WdbLO9DUuH4
	 JYZQohlkWEfNJfRMNU37rp+IGK1yVhFvmPI9Acortu+I1eF/bsmwUiIjnfO3MzXzGx
	 R8YJr19ETwbWGDGgFWMxe8yxg+Js3oOJj9tuK4GvZ24ncw31e5YQlyU3ZZ66uovK/B
	 T0yRyz1uyGnJe4fJndFx5jOu4UU7OHEKBSHXAtnxMeXF6rsLPrXEsMI7cJjJwUUJTm
	 Qi8q7kXwYfkgw==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Wed, 03 Jul 2024 20:03:17 +0200
X-ME-IP: 86.243.222.230
Message-ID: <f0944d58-c53c-4d31-98f3-dbe21d27d285@wanadoo.fr>
Date: Wed, 3 Jul 2024 20:03:15 +0200
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: (dell-smm) Simplify with cleanup.h
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>,
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240703083129.95955-1-krzysztof.kozlowski@linaro.org>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20240703083129.95955-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 03/07/2024 à 10:31, Krzysztof Kozlowski a écrit :
> Allocate memory, which is being freed at end of the scope, to make the
> code a bit simpler.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   drivers/hwmon/dell-smm-hwmon.c | 7 +++----
>   1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon.c
> index 0362a13f6525..e72e26db6e10 100644
> --- a/drivers/hwmon/dell-smm-hwmon.c
> +++ b/drivers/hwmon/dell-smm-hwmon.c
> @@ -14,6 +14,7 @@
>   
>   #include <linux/acpi.h>
>   #include <linux/capability.h>
> +#include <linux/cleanup.h>
>   #include <linux/cpu.h>
>   #include <linux/ctype.h>
>   #include <linux/delay.h>
> @@ -1095,9 +1096,9 @@ static int dell_smm_init_cdev(struct device *dev, u8 fan_num)
>   	struct thermal_cooling_device *cdev;
>   	struct dell_smm_cooling_data *cdata;
>   	int ret = 0;
> -	char *name;
>   
> -	name = kasprintf(GFP_KERNEL, "dell-smm-fan%u", fan_num + 1);
> +	char *name __free(kfree) = kasprintf(GFP_KERNEL, "dell-smm-fan%u",
> +					     fan_num + 1);
>   	if (!name)
>   		return -ENOMEM;
>   
> @@ -1115,8 +1116,6 @@ static int dell_smm_init_cdev(struct device *dev, u8 fan_num)
>   		ret = -ENOMEM;
>   	}
>   
> -	kfree(name);
> -
>   	return ret;
>   }
>   

Hi,

going one step further, this could even be:

	cdata = devm_kmalloc(dev, sizeof(*cdata), GFP_KERNEL);
	if (!cdata)
		return -ENOMEM;

	cdata->fan_num = fan_num;
	cdata->data = data;
	cdev = devm_thermal_of_cooling_device_register(dev, NULL, name, cdata, 
&dell_smm_cooling_ops);
	if (IS_ERR(cdev)) {
		devm_kfree(dev, cdata);
		return PTR_ERR(cdev);
	}

	return 0;


This reduces indentation and is slightly more common when testing after 
devm_kmalloc()


Just my 2c,

CJ

Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB9861FC7FB
	for <linux-hwmon@vger.kernel.org>; Thu,  5 Mar 2026 01:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772673734; cv=none; b=Fl9CzllenfqMrp4pxC6mdOgjHRc+u2k2tEdJ7H+/Kk0vpW0HABCiyMh7deI1GpdG8UP922n2FzVwUjDQV3Sla3WsuIx8edpEJxH57paBzF+viST96b1YKyCNWWvRpstjIvt2rvhC4/mhFgvVUISQSRN1uefUyaVFqf2Sx7GeNc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772673734; c=relaxed/simple;
	bh=Nmhg+r+jQmk+JKM2u+BHfkLJTgalKKIAmQE1LNudc8I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BJyvUGh7aGtHNO7EWfJ5gkQEuuyRUVNdYK5NVv263rBJSnbIIKREFqW2jjHftY18WeZra37hH6k+lWFzMNeMCijvt8eUuFxGuAaajkc6hQcCOqbGkiy7gDC2eQ/DrFr9X3Kve+WLdaXKYdXjnnxX4fgBn7S7zXDBjmZVBh/8znk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iQI4wQSV; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iQI4wQSV"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3598581ed7bso1619884a91.2
        for <linux-hwmon@vger.kernel.org>; Wed, 04 Mar 2026 17:22:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772673733; x=1773278533; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=huHR0LQZVqodSu33LVLAl1zLvi0W/qpmCk4qa2PGbMM=;
        b=iQI4wQSVVSUjVIkq/hVSIzx59k2PJwednk4Kz9SZw6gtZ7C69vnB9lO44uM6GSv6Np
         ZHSmPorcQM3YZj14zdUR12f1EpnJIdEmHBZTT8zC8k6OqaIRG/zaXOGEyeXs/5GF8NH4
         H68oKTStYuUtuaJoYmwgKwzYF/SJ47t6cuY+DP1HikaAR+F9XNVatq/ZtQFma4tDOWuv
         GrITPFL7IA2Pwmo+HoIIekfCjqsiPF02PeFwIYb4S2YkV7VTQSDmirNCzmH7aLLe6cog
         dkXo4VOIbC5zoLsm1TOxKQOoACdfcDt4mGRMMXXbdJ+T42rUtKfLffkg4kWgQXqnPtwv
         WHXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772673733; x=1773278533;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=huHR0LQZVqodSu33LVLAl1zLvi0W/qpmCk4qa2PGbMM=;
        b=QnkTCoBXR+FhiLt+364GMjHXMSn246PU3uIVkJR0rwKK8D8h22wt+a+ms8ckf2IcoF
         3OnBY4lApzehyEQM0CCZryJRGnpaUGVcNiU+kkictV4DiDDp9Qh5SjUr1zmRVCnhY/hx
         TrWCk8+l5gXDbRcsy0p/IkWwAgvPnOkOsBzzPN6F0iRCPXrqlZL9axOlSNChLjxaodpt
         QbltK0G/477kGmKZGeABQ0pkLDXc013Y8TxiQkeET1YoxEsDTJ7uDei00y9Hph/gIRHf
         aASccuCDDirWb2ng7wkqDz4nVD08ZJGGo0IgmGWiIW8dRpM2fDb5DpA1fj4UMcthQ2be
         1Ziw==
X-Gm-Message-State: AOJu0YwRZFaSUprYrtp7dAduwWaRG9twykwGrmK/9YbhhAXDZYQ+kh2U
	wFBJsRscyrYMrqa63xqVv5HcSztprXPJTajw25OpmLE0/0liI9x2A6y1
X-Gm-Gg: ATEYQzy56h5hN0mzGsolFNnXrhyq03XMOb0TEoBEaqEcdCnDWmEx6hVYWnP9V58VsGF
	9kWX3S8Be2r+ctlO8wkVvNEnfv8coobD0FmVHiwa5tLQBJ6C+8G0v5amF7YnNAshMTFOw/z6ryf
	rqz18JnrBmqtwz2ceVr1yKuTUSZeUahqeTee9Cit6CIhEiXsAJRMGQr3grspQ2N/414eCgddad0
	oZUeVfsRCRCY61QQzddVlElgaNS8XVytYHJDF3RViSgVH0qs8/J0Ft+YhvkBdyK6Q2Bk3qLp2tp
	wQkjibzADwGKQuo2Mt3r8hlZrTpVbim2no8aqC9Socv//fY4SNS7mq3JWp7LZDLH0aLbq3IAPY2
	UuKqbPmNUtVEgBh3IDGZlQqgyYbOl/rryYF73HTvfNzfzTtCn0xx15gfPDAwU6rQ/hTpfI+/1Le
	/+7TleReYmQfDl+1wOyGUI1oj+nIUyRngij5at5IafiIv7HjJ4olOJwBEMP0MeEJWPKednGmSy
X-Received: by 2002:a17:90b:184d:b0:359:7906:d998 with SMTP id 98e67ed59e1d1-359a6a4f88bmr3488178a91.18.1772673732875;
        Wed, 04 Mar 2026 17:22:12 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82739db1d6dsm17906763b3a.26.2026.03.04.17.22.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Mar 2026 17:22:10 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <ac78d67f-29d7-4c7f-b307-c49f5d89d341@roeck-us.net>
Date: Wed, 4 Mar 2026 17:22:09 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] hwmon: gigabyte_waterforce: Allocate buffer with the
 driver data.
To: =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
 Aleksa Savic <savicaleksa83@gmail.com>
Cc: linux-hwmon@vger.kernel.org
References: <c7a3a0b6c1658a8ce4cc5962de18c5b2cdbcdb8f.1772661800.git.mirq-linux@rere.qmqm.pl>
 <5939119b783a9b71b51593fe19a2fa53b06c069d.1772661800.git.mirq-linux@rere.qmqm.pl>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <5939119b783a9b71b51593fe19a2fa53b06c069d.1772661800.git.mirq-linux@rere.qmqm.pl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 3/4/26 14:05, Michał Mirosław wrote:
> Avoid an extra allocation for a constant-sized USB buffer: include it at
> the end of the driver data.
> 
> Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
> ---
>   drivers/hwmon/gigabyte_waterforce.c | 9 ++-------
>   1 file changed, 2 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/hwmon/gigabyte_waterforce.c b/drivers/hwmon/gigabyte_waterforce.c
> index 06eae143bc4e..ef27c1ff8fd8 100644
> --- a/drivers/hwmon/gigabyte_waterforce.c
> +++ b/drivers/hwmon/gigabyte_waterforce.c
> @@ -64,9 +64,10 @@ struct waterforce_data {
>   	u16 speed_input[2];	/* Fan and pump speed in RPM */
>   	u8 duty_input[2];	/* Fan and pump duty in 0-100% */
>   
> -	u8 *buffer;
>   	int firmware_version;
>   	unsigned long updated;	/* jiffies */
> +
> +	u8 buffer[MAX_REPORT_LENGTH];

That needs confirmation that the buffer does not have to be cache line
aligned. I never know if that is the case for usb transactions.

Thanks,
Guenter

>   };
>   
>   static umode_t waterforce_is_visible(const void *data,
> @@ -348,12 +349,6 @@ static int waterforce_probe(struct hid_device *hdev, const struct hid_device_id
>   		goto fail_and_stop;
>   	}
>   
> -	priv->buffer = devm_kzalloc(&hdev->dev, MAX_REPORT_LENGTH, GFP_KERNEL);
> -	if (!priv->buffer) {
> -		ret = -ENOMEM;
> -		goto fail_and_close;
> -	}
> -
>   	mutex_init(&priv->status_report_request_mutex);
>   	mutex_init(&priv->buffer_lock);
>   	spin_lock_init(&priv->status_report_request_lock);


Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BE0D70809
	for <linux-hwmon@vger.kernel.org>; Thu,  5 Mar 2026 01:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772673343; cv=none; b=rE3u6QAFQTh8xJ5ynJdSsX5ktRvZY1FZPT9f1BED1MD1UegqJaY3dCl/j5Bu1homRjj8F+VpPiXv5fLedV7IDIZ2aKtMrORslr4Oq3y+vrzv0wcx5GY7UyDywFrOKIvDqhDFZyPpRezLNdl/IdfYfYhFEQgbsqRQdAVrdIGF7Ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772673343; c=relaxed/simple;
	bh=oG++sigbjxPxKxE2MTUNiDzih/Fn6U8dMNbYksVTBik=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bkzZuNWZWpMD2c3vK4thEHVLdSu6sqFbCVRHbgUSivAoYvJyhar8C9M7QJNverBujfw0wvX789ZteFMajS0pSrHWAPch7U5EEdFEmy/ZPigN0B9ZIdTionMUWIUoRNNa5UsMOgr3biiVm+Nmk8ukZhVUzj+XkNyJX0u3g8HVXM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Thd+/1wk; arc=none smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Thd+/1wk"
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-12732165d1eso8129857c88.1
        for <linux-hwmon@vger.kernel.org>; Wed, 04 Mar 2026 17:15:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772673341; x=1773278141; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=k2x6grAm6XCNjpYH3XedJyUsLArTqKYC+OcC70fmM9E=;
        b=Thd+/1wkAkGHBg2VHmWdPMpta+M+VRJFSLnwlKrwFmw42e7y9aEuIIG23enPXmTgZK
         MkYDvn7CCU5Da0IgZcXJ2WtNr3yxWH2xPUEG6dlGa7n2TzLUnatnbqsTphwoe66/cGzB
         HOiFf0xh9eCtQ3g3xszQro8QF770/gruhdUsmYqWe8Ne3biT80ThwEsZ3kmiZEPHBoFF
         mMoiVwvuBOIuB4YgPb+9ulhT+10TJSahoazeQYHBVVRa9zpf/AeeJF8hqG1faMK5rsOZ
         aSHJ4JlRtVeSPkBV/h6xwV4zTOah99jGx2L+/9Bny/quSGikPtRNch4VxPomP/ClA/nw
         gcVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772673341; x=1773278141;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k2x6grAm6XCNjpYH3XedJyUsLArTqKYC+OcC70fmM9E=;
        b=T0Opaf1Qt2DlzkdX9MDLS7yenTS+XvYhvMmWkU6MbBqXqnA2A6hHAr4Dc35KfHu3ug
         0oWA7nLRr8TpeVmUIM5byn0boLX5qao3kW+lpStEbbbzfuiBmOROtMOjp8dp/QRNSjO0
         6BkAu5e1aDJQhq0pqjJAo+Ccey2maRiyckSvBoua0HF5iCJGa73qy5pNMktBOUf/8HHu
         u3gd0QbDHJ2cabrLHhI5LYNWgJ2E/EKPZBMxZz8YLFJMduzo8eCvT2rF20FHZaWqyBef
         s29FXNoEBPNpL9XdwcwHf54Q/UpmhvRyTuwfLZfh4PFBjJQam7A6wo5P6broEPROureB
         tG7w==
X-Gm-Message-State: AOJu0YwZ6Jj3DZhHEARyxOrvHqIbxsTDy92T2txUDx2Zys47Oxibe5kC
	UOzpGVZwl6L7tlhRbF+elF7bw47nvyhZfq6TBWaBarcJTUsvPXoQNs5G
X-Gm-Gg: ATEYQzyFZRoPoqLnAztw4oSp2KeItLEvGllvDrOGbzbGa2Ulxw3mAjehGa0Ha8BvHle
	U1LEhg/o0i8VVvtoh0xYQmARpVs1J/9V4sKbu0zv6KZ4F4adVd2xhHhEVVyRx7gbn+hn68M2m+E
	nEhLN8CAB9RDSuaAoUWPf+WdH7xR/hmS3IFVVXv4XfN1nevBP4N/OkhGYObun2Ar+bQzhQsqNFi
	isqIugbX320IRxSRWYqHTlD/kSdP9btZNatzK1MbyiVJ1yxO9eAURDyQmXlyjpLUBmHXv0XMpTj
	ZgRoq3TpslNAnwwVQySCbgm+HICLSREvJYq4dZZ3HempFAlJxcLwaN41Hy5U4Ace+wQBTzjLnBr
	3pkSBTu4qIAzU/ZSiHG2naynEiEfdVWZQKbiGLc9MsvxVkafJgIr/qavh1MKVa/RysFLCRez6my
	EmcBryS4I3sAQeqKwv1uhIGOiLmxicR8PrSUOZWlhB3tfmp7ddU2t6LHv7vHMEnvmIoQrfA8cU
X-Received: by 2002:a05:7022:60d:b0:11f:3483:bbaa with SMTP id a92af1059eb24-128b70b21b5mr1610831c88.19.1772673341291;
        Wed, 04 Mar 2026 17:15:41 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-127899eab46sm19700446c88.8.2026.03.04.17.15.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Mar 2026 17:15:40 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <89da2caf-6980-4050-893b-fe1407a0ea17@roeck-us.net>
Date: Wed, 4 Mar 2026 17:15:34 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] hwmon: gigabyte_waterforce: fix PWM duty cycle
 calculation
To: =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
 Aleksa Savic <savicaleksa83@gmail.com>
Cc: linux-hwmon@vger.kernel.org
References: <c7a3a0b6c1658a8ce4cc5962de18c5b2cdbcdb8f.1772661800.git.mirq-linux@rere.qmqm.pl>
 <9fb8ec21293205786e5a732f1ef0f3646227d1d0.1772661800.git.mirq-linux@rere.qmqm.pl>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <9fb8ec21293205786e5a732f1ef0f3646227d1d0.1772661800.git.mirq-linux@rere.qmqm.pl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 3/4/26 14:05, Michał Mirosław wrote:
> HW reports duty as 0-255 and sysfs expects the same. There is no need
> for scaling - remove it to avoid > bogus 100% duty cycle reports.
> 
> This fixes `sensors` output for PWMs on my board with Waterforce II.
> 

We'll need someone to confirm that older versions don't report the
value as %.

Thanks,
Guenter

> Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
> ---
>   drivers/hwmon/gigabyte_waterforce.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/gigabyte_waterforce.c b/drivers/hwmon/gigabyte_waterforce.c
> index ecefac756a19..06eae143bc4e 100644
> --- a/drivers/hwmon/gigabyte_waterforce.c
> +++ b/drivers/hwmon/gigabyte_waterforce.c
> @@ -179,7 +179,7 @@ static int waterforce_read(struct device *dev, enum hwmon_sensor_types type,
>   	case hwmon_pwm:
>   		switch (attr) {
>   		case hwmon_pwm_input:
> -			*val = DIV_ROUND_CLOSEST(priv->duty_input[channel] * 255, 100);
> +			*val = priv->duty_input[channel];
>   			break;
>   		default:
>   			return -EOPNOTSUPP;


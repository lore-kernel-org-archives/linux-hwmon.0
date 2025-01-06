Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 258D715747D
	for <linux-hwmon@vger.kernel.org>; Mon,  6 Jan 2025 16:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736181117; cv=none; b=fa3ZEsxIJ1d9p0L+yTwG9M7LTKCe9WR+3fsK0VSI0QZ4/wUsYn2C9xqrWRufVQVeomVeIXhb01fVTynGxrAa/o3E93VsaRFk+CsW51vBRw6g3OrlkwTcPslWT/ibO2hKbss9M970C/bpqJ5sfYrOUh/006/ZkbSGxwyCUeLzNWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736181117; c=relaxed/simple;
	bh=D2gIqmZswOtR9NoqFI6krMeBaV+frIMy3jV163Qe8fI=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=kEjpa14h3xpdXP/jd2whPOwEEaqyJ8LHOvnASKhOuyEvPh973JrAE9jMD1l5uM27eVW8MFgstFGGab+XyRJQGrp3AMPz8ZrJCPMt2iV3FEZEn0FgeEs5D4cAxjrkr/nHB42oW2nEKRok6QzQrLiGlku5cCO2AyQofmhgKz955FY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EcvjwS6N; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EcvjwS6N"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2164b662090so184767925ad.1
        for <linux-hwmon@vger.kernel.org>; Mon, 06 Jan 2025 08:31:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736181112; x=1736785912; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=NXI1cP6gyIIIzSTgzh4NHgadsDv0LnBNH5VbecGFLWk=;
        b=EcvjwS6NvcQYlXKie8df0raoAK1SjqXVihzv6DEjom3K51C+6XD+7D54ACGWRqVXQO
         G/K0nADEPJ3U9+VKSqToQaRMc2nkc7iwAD/yyBH6fFH+alJUQah4prspBXwW1SE46ywX
         sBAjae5k1uBjgFA4H/kgZI5X1KVvMFGulWIVUE0fGDqpf01FyvhV76qvD2hIoa6L56SZ
         AJGkmHnin+bbqSm7WeTZbrtS/whlnJsy7WLnK8CBiNyD3jBdjegSQydmnQcZuapyLVic
         BoEhBE2qUtba1Jsppdtlx1S/WUYLCZza4Z01nAqxFYYGCJlgUYiOzLNTwuYB5VnfR4nN
         WOdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736181112; x=1736785912;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NXI1cP6gyIIIzSTgzh4NHgadsDv0LnBNH5VbecGFLWk=;
        b=E5+fjiSVXXma6kDLHTtFkl04Z2M2eZdGWF/M5L2t5RZZcXsvzEfBb2LZfOUBPXkPU5
         1cAb0lgs0M3NoXSC9Vuwhf6b445aDcBb1WHt4e7YzavNxL1vL3Ws+oQs2BBD41ibQAM3
         SFwqX4OsmkMjrP6rYrHCJGCxz/RnNJs8A2+G46dfgbeOwiU2x/LBKlk5+QVu9o8Qr52R
         4wwVp5wGeyBYA7kNZALMTW2FLTW9ldevKQ6LN1tl1LO8kiXiotCf0eSlcfLH77vOFNKX
         Pohn2pKhXC8CG71DTfP8fnjHsMup4z6gfzWk0eO+p73I6vkqx5kUOF7VZ+QiqQ0OAoJ1
         IO2g==
X-Forwarded-Encrypted: i=1; AJvYcCVvhZDpFVp2a5X6hOjGYsHMZB4WFio+GX6KY822cFkPqEChsiEBjO4JtmF8k/nCdAuYSKcnE6Ty9yf0Dg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwZSN158Pwl4yhYp32nRz3ZWktpV2yxfDzXIOiioPfZ5/SdRrli
	8xEl+6gUHF5ecWnm7KRSIYBSxZC/ShHiDSOgFb/N+7603/fwpwYZ
X-Gm-Gg: ASbGnctZSJzXzumhXDaB/VWbFkhpga9FIfquVDV5lf9qV2LV0tjZpc6OjbdWpQwr1nT
	+C1FOBQlx4EAg1qp90TEQDwuwEpjnmy3GWvUOdh4J8TGEWT/HYulvbTSwzMOAOSydFhW15xAPNt
	qQGyju3am6+aXqwjKjuT9Y1ysVBKZmLGxsFtsKbR5WdQwluNp95zm6bB99lqVjbRlZRp6iLiFqF
	mpI/axq1BkM/IYg2jq400H6kQfN8zZJan22WMBqIBHx3b3e/lfQPyfxwHPUx1PY6s9du0b9RweT
	042XlXBUdoG8iYa2ySaR7YYUEBmKHg==
X-Google-Smtp-Source: AGHT+IEPQ0OnN4HnW2Jp0ML6cKFzGpnlq9jo6AOgD7c0MRnPmKiiLD3bN8k6jNSKNrwDOnG0LeLjmg==
X-Received: by 2002:a17:902:c411:b0:215:6cb2:7877 with SMTP id d9443c01a7336-219e6e8c4f2mr772134865ad.4.1736181112218;
        Mon, 06 Jan 2025 08:31:52 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc9f5195sm292738745ad.194.2025.01.06.08.31.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jan 2025 08:31:51 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <f0c389a7-f826-422f-8210-e0d015e15fe6@roeck-us.net>
Date: Mon, 6 Jan 2025 08:31:50 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] modify adm1266 blackbox access flow
To: =?UTF-8?B?Q2hpYW5nQnJpYW4g5rGf5rOz57e7IFRBTw==?=
 <chiang.brian@inventec.com>, linux-hwmon@vger.kernel.org
References: <CAJCfHmVSG3c=E6dMkBgdF9EU0sxP8if2g-=xhkSU5t=vEsRbEw@mail.gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <CAJCfHmVSG3c=E6dMkBgdF9EU0sxP8if2g-=xhkSU5t=vEsRbEw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 12/25/24 01:51, ChiangBrian 江泳緻 TAO wrote:
> From: Brian Chiang<chiang.brian@inventec.com>
> 
> Modify adm1266 blackbox access flow  by only accessing the latest index of data
> to speed up the access
> 
> Signed-off-by: Brian Chiang<chiang.brian@inventec.com>

This patch is not acceptable. There must be any "#if 0" in upstream
code. Yes, I know, there are already 1,419 instances of it, but that doesn't
make it better.

On top of that, changing driver functionality like this is not
acceptable either. Add a new nvmem file if there is a desire to only
read the last entry, and rework the code to avoid duplication.
Alternatively, if the blackbox contents do not change, you could cache
its contents locally in the driver to avoid having to read it each time
the file is accessed.

Either case, your patch is corrupt. Please run it through checkpatch and you'll
see what I mean.

Guenter

> ---
>   drivers/hwmon/pmbus/adm1266.c | 12 ++++++++++--
>   1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hwmon/pmbus/adm1266.c b/drivers/hwmon/pmbus/adm1266.c
> index ec5f932fc6f0..d79b2208de86 100644
> --- a/drivers/hwmon/pmbus/adm1266.c
> +++ b/drivers/hwmon/pmbus/adm1266.c
> @@ -352,6 +352,7 @@ static int adm1266_nvmem_read_blackbox(struct
> adm1266_data *data, u8 *read_buff)
>      char index;
>      u8 buf[5];
>      int ret;
> +    char latest_index = 0;
> 
>      ret = i2c_smbus_read_block_data(data->client, ADM1266_BLACKBOX_INFO, buf);
>      if (ret < 0)
> @@ -359,10 +360,16 @@ static int adm1266_nvmem_read_blackbox(struct
> adm1266_data *data, u8 *read_buff)
> 
>      if (ret != 4)
>          return -EIO;
> -
> +   latest_index = buf[2];
>      record_count = buf[3];
> 
> -   for (index = 0; index < record_count; index++) {
> +    /*get latest index of blackbox data*/
> +    ret = adm1266_pmbus_block_xfer(data, ADM1266_READ_BLACKBOX, 1,
> &latest_index, read_buff);
> +    if (ret < 0)
> +        return ret;
> +    return 0;
> +#if 0 /*comment out the original one , this dump all the blackboxes ,
> very time-consuming*/
> +    for (index = 0; index < record_count; index++) {
>          ret = adm1266_pmbus_block_xfer(data, ADM1266_READ_BLACKBOX, 1,
> &index, read_buff);
>          if (ret < 0)
>              return ret;
> @@ -374,6 +381,7 @@ static int adm1266_nvmem_read_blackbox(struct
> adm1266_data *data, u8 *read_buff)
>      }
> 
>      return 0;
> +#endif
>   }
> 
>   static int adm1266_nvmem_read(void *priv, unsigned int offset, void
> *val, size_t bytes)


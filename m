Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53D2C28DBD
	for <linux-hwmon@vger.kernel.org>; Sat, 27 Jan 2024 15:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706368254; cv=none; b=sdIHyfBLNvONW3di8DmGM7WUGZvPjEgSFkxdTYLZkIF8QptyvYjLLUXSD9KjVnYYL3kCoB//h2LnigPzOH4J5Zf8czqTNic4nnwwk/fdD/5I7HuhxE2ezLae6NB87LbwCqzGyWFw1Q0r7CYR2E7r5B1wMUws0NLUf0Rp+abtp2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706368254; c=relaxed/simple;
	bh=2GMIsStzzbIWeIx2AnGh2uSRzSGXKlemKsHozOfk9HM=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=fPwxRqKfhmoTxoDD2GwQQrNJ0VcxmFdhKFOTA07cOqeQ55se0BhI0Zky6bVzzkVoxtNlkDWn61HN1cwJG1zCiedEQJxUrrI3znAVxBVTfduqW5BfQLOFVkm8fndmxk9WtCxM3u2wAEIS4pGjlnpXHEe+d8wy37K7uS8aAQRCthw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aT9jMNb5; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aT9jMNb5"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-40ed3101ce3so27250875e9.2
        for <linux-hwmon@vger.kernel.org>; Sat, 27 Jan 2024 07:10:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706368250; x=1706973050; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=eiUWZSVxQiM6JbrWyfBQueyPnz5k5LwPmclZrnHrYpA=;
        b=aT9jMNb52vY9AR/GPkpRfiV6blFemm9gTnL1MXQ+AwjNqpeUNpfwwtd3uDOwTGrRwg
         XeL1P7yaxJ880jqqu7Oo/6AoOVqRR2jvzQQJDHuX2ySiYHJRQLSnMHz3MjATTl5mcexd
         KKGY2TQSVHMIagCF/SNQLLEGuCBZQU/hhZC6q7Jf8RILnhUFSXB1k3DGqZInY1n0ZVEa
         alPrGme1NnoF4pfE+oOuKrHAmhnm1E3wweEzXBLG1bMc8ssqx6glgnIIYsrQAq5xWcmi
         yXP/Jnripicnz9jbiIm2PIiQMDg2lGYGjCLrxzP3HUxZtFOMVizXx97JZKl2ojx7L1JG
         wKSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706368250; x=1706973050;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eiUWZSVxQiM6JbrWyfBQueyPnz5k5LwPmclZrnHrYpA=;
        b=eeO3wkDGcjbams7u3kqNaM9/aLDhG1h8W7GhfA457g8lvnnZutBUfNaarkdRu6y5Xb
         rOREyZshz5lvEci38TYd5s2afOcXcSQX6ABmI0NCb9fjji415COrfZlQtYyBJCHyt3Ma
         zKAkr+OlqqL5PxQIjRQti0OsUMEjw/599Zcpl1jEIKmVYBTLGxTsSGMSNeHO5kkNzcFc
         1wK9U+fFqgq5dUivnkziyGkvcANMbnpPuBedvksmcgVBjMWGyMiDhF6rc61XB1x1GYQT
         I/43gNdfcVbSuUGoZ9K+MQ/BmESb8D9PPvlcy2oDIq0n69zfgdR2VkimEY6NixUKaQV2
         WjhQ==
X-Gm-Message-State: AOJu0YwH04XasVkuq44kl1WfNE3q4waAMnmC+/yJ4+RiCPrAOepuWbum
	k2t438u9ykwJP6F19zfDVhqfwv7vHXSWbsndZUSbCuB7JU7uV84Zcz/Ll42h
X-Google-Smtp-Source: AGHT+IESwG/9kklkclF/9AkHg0J9dMt7CAAfWxWCDHYuziDMJE6q09cBsWhgNy/P00jI/YmIuXmCJQ==
X-Received: by 2002:a05:600c:3ca7:b0:40e:b0fd:3c09 with SMTP id bg39-20020a05600c3ca700b0040eb0fd3c09mr1098291wmb.9.1706368250160;
        Sat, 27 Jan 2024 07:10:50 -0800 (PST)
Received: from ?IPV6:2a01:c23:b938:5400:11ba:857c:4df8:38b0? (dynamic-2a01-0c23-b938-5400-11ba-857c-4df8-38b0.c23.pool.telefonica.de. [2a01:c23:b938:5400:11ba:857c:4df8:38b0])
        by smtp.googlemail.com with ESMTPSA id h4-20020a05600c350400b0040e50d82af5sm4966568wmq.32.2024.01.27.07.10.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 27 Jan 2024 07:10:49 -0800 (PST)
Message-ID: <60283451-7e83-48da-9f70-b4bb327ae8cf@gmail.com>
Date: Sat, 27 Jan 2024 16:10:49 +0100
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: Remove I2C_CLASS_HWMON from drivers w/o detect()
 and address_list
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Michael Hennerich <Michael.Hennerich@analog.com>,
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
References: <75747c6a-d414-4b07-8f66-5a5cdddc3c36@gmail.com>
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <75747c6a-d414-4b07-8f66-5a5cdddc3c36@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27.01.2024 16:02, Heiner Kallweit wrote:
> Class-based I2C probing requires detect() and address_list to be
> set in the I2C client driver, see checks in i2c_detect().
> It's misleading to declare I2C_CLASS_HWMON support if this
> precondition isn't met.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
>  drivers/hwmon/adm1177.c       | 1 -
>  drivers/hwmon/ds1621.c        | 1 -
>  drivers/hwmon/ds620.c         | 1 -
>  drivers/hwmon/ina209.c        | 1 -
>  drivers/hwmon/ina238.c        | 1 -
>  drivers/hwmon/max127.c        | 1 -
>  drivers/hwmon/max31760.c      | 1 -
>  drivers/hwmon/max31790.c      | 1 -
>  drivers/hwmon/max31827.c      | 1 -
>  drivers/hwmon/max6621.c       | 1 -
>  drivers/hwmon/max6697.c       | 1 -
>  drivers/hwmon/occ/p8_i2c.c    | 1 -
>  drivers/hwmon/pmbus/ir36021.c | 1 -
>  drivers/hwmon/powr1220.c      | 1 -
>  drivers/hwmon/sbrmi.c         | 1 -
>  drivers/hwmon/sbtsi_temp.c    | 1 -
>  drivers/hwmon/w83773g.c       | 1 -
>  17 files changed, 17 deletions(-)
> 

It seems MAINTAINERS needs to be updated.

Daniel Matyas (daniel.matyas@analog.com)
The email address you entered couldn't be found. Please check the recipient's email address and try to resend the message. If the problem continues, please contact your email admin.

Ibrahim Tilki (Ibrahim.Tilki@analog.com)
The email address you entered couldn't be found. Please check the recipient's email address and try to resend the message. If the problem continues, please contact your email admin.


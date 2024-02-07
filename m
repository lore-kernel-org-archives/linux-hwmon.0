Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E55A223775
	for <linux-hwmon@vger.kernel.org>; Wed,  7 Feb 2024 10:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707300503; cv=none; b=iVX9wSIuItZGSzSt9IZNhVV96nffCrWtl/XHyxlj0AdtGqrhIc9aWNKkuktH2c+YtV+6oGsMU0oCBp78mQJhAUoeLahp/5tvRvVoQzh2C7qquX28qKY34j/yIDMKj9UV+SNhb6rH4Hd3JwCg7Q7VtDWDSGKp6ShlntcIuxQzlk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707300503; c=relaxed/simple;
	bh=4PLbSpB3yxiNu2P2UZfBy4iA7TAt9tV8JeTJ/1KsdPI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iokeOmS8tLq0J7HIxXzamzDdV8ffcFz17dQ7NdGEknZMQCsYQ8sL2FyKccoYbmc/Tk/dfPrqf3zbuKDaHNZMyxodaK09lVOxCXyIRRUVjAeCr27bVatEoxYOHrdI6UEAaBOy9w88ERaq1MeDjapIOYhsfmPNpe/bZ57x7AyQses=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l+G/ttjP; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l+G/ttjP"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2d09faadba5so5119781fa.1
        for <linux-hwmon@vger.kernel.org>; Wed, 07 Feb 2024 02:08:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707300500; x=1707905300; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gCi9hlvMXlqJmzofvENRx4oyFwYZqRbXRlJSB5Lv2N4=;
        b=l+G/ttjPLmL6alwqzQZ4Zl4aN2eYgI0/9mXGVkUNwba/KoQJ+73wTwQYzrZ31VzRFS
         2toDVpBEHnFUGHuqYRk1RNW4/K96ZU2GqTaqRIH8t5CZ2d4sUDnL7Mj+Ux7FO3z+vfsy
         nkzlBOqOfte1xeReiiAWUyHKhV2DDN7PGwP3gCGoVAbBmZuhNddpJRgbSK8I0hUpO2BV
         KBOJxAjyb0VFtiN9A8Pp52jG+rpDlxTg/mGkG9q6qTPXNY0jqQmvOEGOJhRXdq6cbtvB
         eNrJGCdCETpnEc86KFyu53MsXmlazfGtIKp7Su7elTxfYbPfVENdvByFX4HXUxfLjAJ2
         XZwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707300500; x=1707905300;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gCi9hlvMXlqJmzofvENRx4oyFwYZqRbXRlJSB5Lv2N4=;
        b=M8kKcG5tG6F19nwO2xIs0z2cPkoVjKGlecTRe5smaHSII5NnALHI6olAPFr8A26ZbK
         iYgMFD1begAX85WGMhJgzKA9aTsxa/8OI883JSGrSXj8S0IUefBExQD9cLPUlmAmJDQL
         sWW/GAU75RI6G4SWU2pP4D0p/ABOJ5H07rUlvXYzZw+bnnCtF2TY3gCOuKpM3AnJkjtb
         f4J76OHYccODYWbcXME/KhDxM7qZ6nWhGrOPUl0P9Rz2ZyyBwqahoINt0/48c+PxTUe4
         TgzX0q9MjmJHExofBfeB1PzYa+ds6G7XoqiZe0faE5Ls/f1B5pcNzmqHdjhYwRDNA+60
         u2GQ==
X-Gm-Message-State: AOJu0YyoIPkOFM/azFjvtqWwT9bKjVD3SHGT70cgMUmjW7D40Xh58xIl
	Ec+LSHwuRbFBjozQKt4ZccxW43jlwktCnjyCkvKpQm6iYRIsDACU
X-Google-Smtp-Source: AGHT+IH2/UipYP69Axnc10nnri4l+JWruKdW3bofzLNL/ebKw/T4nJTChmxSovSiy/g3jmy/RVECag==
X-Received: by 2002:a2e:9b14:0:b0:2d0:a4f7:11aa with SMTP id u20-20020a2e9b14000000b002d0a4f711aamr4016246lji.41.1707300499649;
        Wed, 07 Feb 2024 02:08:19 -0800 (PST)
Received: from [192.168.100.74] (91-118-163-37.static.upcbusiness.at. [91.118.163.37])
        by smtp.gmail.com with ESMTPSA id gl1-20020a170906e0c100b00a386196f65csm584219ejb.4.2024.02.07.02.08.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Feb 2024 02:08:19 -0800 (PST)
Message-ID: <ca9be823-8b43-4f51-9bc0-8ee5de7df4a2@gmail.com>
Date: Wed, 7 Feb 2024 11:08:18 +0100
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [bug report] hwmon: Add support for Amphenol ChipCap 2
Content-Language: en-US
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: linux-hwmon@vger.kernel.org
References: <c61a90ff-7f63-4181-96fd-ca5a5029386d@moroto.mountain>
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
In-Reply-To: <c61a90ff-7f63-4181-96fd-ca5a5029386d@moroto.mountain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hello Dan,

On 07.02.24 10:51, Dan Carpenter wrote:
> Hello Javier Carrasco,
> 
> The patch 33c41faa98f3: "hwmon: Add support for Amphenol ChipCap 2"
> from Jan 30, 2024 (linux-next), leads to the following Smatch static
> checker warning:
> 
> drivers/hwmon/chipcap2.c:327 cc2_get_reg_val() error: uninitialized symbol 'reg_val'.
> drivers/hwmon/chipcap2.c:695 cc2_request_alarm_irqs() error: uninitialized symbol 'ret'.
> 
> drivers/hwmon/chipcap2.c
>     669 static int cc2_request_alarm_irqs(struct cc2_data *data, struct device *dev)
>     670 {
>     671         int ret;
> 
> Set this to ret = -ENODEV?
> 
>     672 
>     673         data->irq_low = fwnode_irq_get_byname(dev_fwnode(dev), "low");
>     674         if (data->irq_low > 0) {
>     675                 ret = devm_request_threaded_irq(dev, data->irq_low, NULL,
>     676                                                 cc2_low_interrupt,
>     677                                                 IRQF_ONESHOT |
>     678                                                 IRQF_TRIGGER_RISING,
>     679                                                 dev_name(dev), data);
>     680                 if (!ret)
>     681                         data->rh_alarm.low_alarm_visible = true;
>     682         }
>     683 
>     684         data->irq_high = fwnode_irq_get_byname(dev_fwnode(dev), "high");
>     685         if (data->irq_high > 0) {
>     686                 ret = devm_request_threaded_irq(dev, data->irq_high, NULL,
>     687                                                 cc2_high_interrupt,
>     688                                                 IRQF_ONESHOT |
>     689                                                 IRQF_TRIGGER_RISING,
>     690                                                 dev_name(dev), data);
>     691                 if (!ret)
>     692                         data->rh_alarm.high_alarm_visible = true;
>     693         }
>     694 
> --> 695         return ret;
>     696 }
> 
> regards,
> dan carpenter

The ret variable should be initialized to 0 because if no irqs are
defined, the function should not fail i.e. the driver supports that case.
That is probably the reason why I did not notice in my tests.

The reg_val symbol might stay unassigned if the function that assigns
its value fails, and the check of the error return value is missing.


I will fix both issues asap.

Thanks a lot for your feedback and best regards,
Javier Carrasco

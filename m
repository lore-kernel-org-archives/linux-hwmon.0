Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ADEE7E765
	for <linux-hwmon@vger.kernel.org>; Wed,  7 Feb 2024 14:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707316728; cv=none; b=hd2IX21g0UKFutyJ2z5J1kg/nB5nw2PC0UcjdLy1n9Cu0r+4vKoWz/N2sPqZhaQFrBGZ+HM71B2D7RM5uR0xiq5zdpDTHq7SX01PNutWRNpS0oj5d5pTxn+7ai8jIZhAyeOaZ9jgFlKklhSYyBP5+tPDTi2XgyeqCeePxoSSrvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707316728; c=relaxed/simple;
	bh=bAuGxysecP/phraZhidrctZIhJKh+hvCTZPYayhpwus=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qCWuleADGQx7AmTlHjL7WnYVqeHgspaikE956fJxr2SJAObEr4Wtf7WxIX/VaE5YhFlhNaQ/Xh5Fvm5WmGnzHUp17ci+Wrf21noRhVcIhj7lrvTBFHdKBf2tikMmXRLCGWma0Es5RJinUDChohlS8I/BuiYo2nKcqbyzVvXSz7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MzA1INMe; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MzA1INMe"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a28a6cef709so103195466b.1
        for <linux-hwmon@vger.kernel.org>; Wed, 07 Feb 2024 06:38:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707316725; x=1707921525; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nmSV8kPb5jkE3Rc/L/hI2ZcW5Uipq1RaWrLC8NiqmDI=;
        b=MzA1INMeGub9tw6ROVhDBJh1w7JXrnxu9i5Nn33xYeNhjIrY0mY3Fi4ZmVdS9DmIXk
         rV6wgPyYDyfX/VcuCaC8iCef9CqfQPo+Dvvjms/y6xAWBob9FNusGqPcOrDrBRXjfaEs
         +ndTCqC5rMNlTiRFleYs9nNQlJe1+tNzhOsXs8qxbEFPQE4nvWq6AuNfKvEKaJgqhWrD
         kdAql9IVgKhUE4xnzRHuIdVhcTNHByO8JEaNGAwziwgB1k70T8wb2KnahP7G1jWw0N3t
         doTT1viQgEOM/JuP1cONMotiSnXb+VjrOrXbKpfRIxI7+4l+sFURcNkeuNUOvrr4Buj3
         xh6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707316725; x=1707921525;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nmSV8kPb5jkE3Rc/L/hI2ZcW5Uipq1RaWrLC8NiqmDI=;
        b=RGKD9RGix7DzSkv8fa/0fjYoRrnYM7tFhLtzKTf0YrNtBbCzMoQnssa3OTR7YZQZN9
         /LXXwBoZXTlzf7paZCMh+NtrlojUFxvu+ctpAULmhQvx4xYauulMUFGiVgKrKXQecKGq
         jFaYCEdXMZ9EkHw8m6ddTAs/ThhC2gyKpVQOWpaCzLtlZqn08kyiEcpm9cK8CUmYxzCK
         Ucb4ThwAodUARx/zzQ4h91qp/vxIeZC+29JQSBl6cZF4ayVPjTEgFpKCTsPON+xv4f6t
         ABhiLfN9Fm0IDHLjsO7SnwEsld+be2O7Me/TsVGAa33lFrvtaVVUPfssYTwdQGA48bmv
         47hA==
X-Gm-Message-State: AOJu0YwAlJIHe/71jQM56mcysg1w8l+dDUIjtM0R8jr9KG+9sZDHhm/B
	dcRCtiekJhj/a9HSN1fFtUUpdKnLAJVO9VMQMIQIqWpSfUfNBTRgkA6wd+p+8AU=
X-Google-Smtp-Source: AGHT+IHWE/XaSPGBPjOCXclHtqa+zvEnDDgTyg9EGlcgq7Qior3QrjaRJJc17RS5XnRjbgcCnNsKvQ==
X-Received: by 2002:a17:906:32c3:b0:a38:4770:491d with SMTP id k3-20020a17090632c300b00a384770491dmr2870396ejk.60.1707316725023;
        Wed, 07 Feb 2024 06:38:45 -0800 (PST)
Received: from [192.168.100.74] (91-118-163-37.static.upcbusiness.at. [91.118.163.37])
        by smtp.gmail.com with ESMTPSA id ss28-20020a170907c01c00b00a36c499c935sm833488ejc.43.2024.02.07.06.38.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Feb 2024 06:38:44 -0800 (PST)
Message-ID: <0fda84bf-66f9-4edb-b282-388d47c2594c@gmail.com>
Date: Wed, 7 Feb 2024 15:38:43 +0100
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

Hello again Dan,

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

may I ask you what Smatch configuration/arguments you used to find the
first warning? I tried kchecker without arguments (with --sparse nothing
was found), and only the second warning is reported:

~/smatch/smatch_scripts/kchecker drivers/hwmon/chipcap2.c

CHECK   scripts/mod/empty.c
  CALL    scripts/checksyscalls.sh
  CC      drivers/hwmon/chipcap2.o
  CHECK   drivers/hwmon/chipcap2.c
drivers/hwmon/chipcap2.c:695 cc2_request_alarm_irqs() error:
uninitialized symbol 'ret'.

I have checked out the current status of the master branch:

7162b9ec99f71 double_fget: warn about re-using file descriptors

And of course, the first bug was not removed from the code.

Thanks and best regards,
Javier Carrasco

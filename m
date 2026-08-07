Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C27E282F26
	for <linux-hwmon@vger.kernel.org>; Fri,  7 Aug 2026 17:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786124649; cv=none; b=UDenb8zuE5/I43H8tnNeFggeCLcqV3i+TojlO/f8bLqyu4ID1NJBDldVEq/2RJg7EQ2Jc3EmdIxx9aQ6t7HCquO6lYE+REZvTdt8rQtDdaTYJS/rk5CZy8e6u5FSZKRypCZsYJLXloGDPlkDa53hDXxgZTvK7UkYDyt9LvaQSyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786124649; c=relaxed/simple;
	bh=ErYDprYrZMoC4T+S5IzFRb0c+WHs3edN7QUuUl1+DIc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MpWXyeVgD6m6415H9UPEroiPPb14uzMndQ40rKwmTg5yk0mSOiqg2FhKVA+0McBP6iQ5xRdsOjgNHQMnnc4KFu7ESZIc9MXoQE7a3S4nNltokSmrxR8mo77FNWPbixF7VRbEIn6SNmauZzPrHUim8Zf32yTpBiYJoKpbMezihHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vcm8OO72; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vcm8OO72"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-383cb94f742so3603203a91.3
        for <linux-hwmon@vger.kernel.org>; Fri, 07 Aug 2026 10:44:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786124647; x=1786729447; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Nulo/vNQSdEgzwaEzkpheY6PfFfNvlrO2wzzTDXM5tg=;
        b=Vcm8OO72XXoFOnHSNTgOO5nnzdTzKRlHbkloEXla4GDTXYT1wRipgviTluPcVHRbJy
         f2EsdKpbvoerzgXUIvVljq1qoYTOHGgL9lwgzy/AtyPkmPPBuaQZRU0yG/SV3hid8ige
         7mXTYmmVY6VFN69J2fI3W5Chcm/NhwkJLPKucxhx75ctdQ91T6n9a0yTJMU6dpbrnoim
         DPa3TxeKVpXBkHbPehI3Wh0vUHgM1VXsblP8o4q6ylU+f7G+eORY0jlQXbETacwYW6Lg
         FKvL5IFh6xGV1NMfYIOLdKcHSqUZJamgaxK29K9Bd3mSjJXvsnecoop5smSlxwEwBJV6
         98Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786124647; x=1786729447;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Nulo/vNQSdEgzwaEzkpheY6PfFfNvlrO2wzzTDXM5tg=;
        b=pyemvzwmZ/MYV8lKMuwCOYOg/sC7gWtkcuiAaeq6GhsZaYfA3KGJ5sVt9REMVKVG6C
         HgrjvtjUSPkwZGRPZCkhWxdlpYDWKdLuWrunLZC/91IU6/ScqwNZgafH6olGRE2qya+y
         y+Kv44J+IGHx8ur5U+Q7xbpsOsegOUfh6rg0qXik58Oi/0GSF5UBAjdkUpwGLuvPzSgM
         0JqTQPn6r95ifA2y4/Luaj2apa2/sPjurKBB17NpS43G1BSzTr5cTA7dw/fxU2gSbsCr
         OQcTnRuaXM9lpXwWGqtIOepSWib4zm8qbc6TRJPDIf2qV6vfilAydNiXJc8A76J/jMy7
         pJ/Q==
X-Gm-Message-State: AOJu0YyxhGqs1214sSDwFk1SkZQLVbRnb7+bubS1kyBiNx37+wOzr8kK
	KkNDaoO5OOgAyP72olbvq0NSCPQuu2DUvEcVDVWl2+zcXUTWwNGuflgx
X-Gm-Gg: AR+sD13IYo67ha0DeUDthPyXcZTn62yjGFX+XxjWI1ibnWqx+TY0kGfkDtgGkDDubK/
	3H4J1NIl8KQD3kIsQdAZlVA356zZaceyAIkPjnILYJvsHVcX5zjN7PtSacMQJ9K75eHcYz4nUMb
	sHo7SvwGz27AGMs5fxoAIjOz6ZtObHgj6babapAjFCucm0w35YMT3qMsee0d3YvCi7UfYSzB3Ks
	pClNseC2lj+L86fP52vA7yHK4Kpr3PZU9lFO1sz9XvPA31w0ZH4sgebazIB9ymkxwaqkP29Nmil
	lcKUbNoS/NjHKquVbNWRz515nF5Wefab3yOMjIokrd6HFdamsEPGmw7v7tPjhSPNNUk3qKWTlEl
	wx+OF1qpnU2+qMT6IvTXnrLStsub5LJJHp/youNyhnyK+X8U6m5B/mUR2zOyqlwJ0yQyEklF/Wd
	cnXktyW8etIoZ7yNSyUQXnOGp1izhRp7XAPTiBv/pzPVrpnPdgHAidlbb3hCBqlyhKZUX+NBpa1
	ZSfY2Zot0j5V2mezx1r4PDq27Ypxrh7E2p1CQ==
X-Received: by 2002:a17:90b:1d4f:b0:38f:7f60:ba35 with SMTP id 98e67ed59e1d1-3903c5381d6mr24165098a91.5.1786124646512;
        Fri, 07 Aug 2026 10:44:06 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141019c2ddasm9421846c88.7.2026.08.07.10.44.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Aug 2026 10:44:05 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <da245e33-a441-418c-9942-9847dc2696da@roeck-us.net>
Date: Fri, 7 Aug 2026 10:44:04 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Question] Upstreaming hwmon driver for Nuvoton NCT5584D (NDA /
 licensing inquiry)
To: huangjia2hi@163.com
Cc: linux-hwmon@vger.kernel.org
References: <20260807162256.10456-1-huangjia2hi@163.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260807162256.10456-1-huangjia2hi@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 8/7/26 09:22, huangjia2hi@163.com wrote:
> Hi Roeck,
> 
> First, I would like to express my deep respect for your immense contributions to the Linux kernel, especially your extensive maintenance work on the hwmon subsystem and Nuvoton chip drivers.
> 
> I am currently interning at Colorful in Shenzhen, working on BIOS/UEFI development. I have prior experience in open-source development (mainly Neovim plugins), and I am now eager to contribute to the Linux kernel.
> 
> Recently, I have been working with the Nuvoton NCT5584D Super I/O chip and have experimentally written a working driver for hardware monitoring on our boards. However, because the hardware documentation is under NDA, I want to ensure I follow the strict legal and community guidelines before attempting to upstream any code.
> 
> Since I cannot directly share or reference non-public datasheets, I would greatly appreciate your guidance on the best way forward:
> 
> 1. Is it generally acceptable to upstream a clean-room driver for NCT5584D that only contains the minimal necessary register definitions (for temperature, voltage, fan monitoring/PWM) without attaching/referencing public datasheets?
> 2. Alternatively, should I attempt to contact Nuvoton directly to request permission/public datasheet release for upstreaming, or look into extending the existing nct6775 driver framework if the register layout allows?
> 
> My goal is to strictly abide by both community standards and NDA boundaries while contributing functional hardware support back to the Linux community.
> 
> Thank you for your time and advice. I look forward to hearing from you.
> 

 From what I can see online, it appears that NCT5584D is detected as NCT6799 by the
NCT6775 driver, meaning it is likely a shrink-down version of that chip. Given that,
and if the information is correct, a stand-alone driver is a no-go.

Have you tested if the nct6775 driver just works ?

As for the NDA and the rest of your questions, that is something you'll have to discuss
with Nuvoton. In general they are (or at least used to be) quite open to making their
datasheets available for purposes such as developing a Linux kernel driver. However,
there is one exception: If there is a two-way NDA that prevents them from doing that,
they obviously can not share the datasheet with third parties, making it all but
impossible to develop an open source driver. Either case, this is a legal question,
and I can not give legal advice.

Thanks,
Guenter


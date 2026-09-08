Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3A7B491583
	for <linux-hwmon@vger.kernel.org>; Tue,  8 Sep 2026 19:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788895680; cv=none; b=sPkVTLZ502/nhgfhSmYGTy/u5OpxpSpQhSlOQkH9821Yx22OZk9awux7z5bkJBJk22xY8jMvsptPwm9EMW5juZ0N3vz+sBy3GkUE7Zrviq5qNBLMDrn7SqDUUCfpXJQql43f7a6cWIX48Be/VFjxvB7EPERDcxZ0b15HrgO6uRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788895680; c=relaxed/simple;
	bh=5h8KiJRiazv+A5U2D2I0iqD/eAremAYeCZYJI0BhpVY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p/Hm8Y/oY9U7sZRPem8OWu1yMB3nbYOPAK6jP/BOfIuhSpXNYmWigC1NPfsGnSEaDCWJ5VQpwWrKKASw0hRD7SrxEc4nkFMViWiR2jMkRn33EgaByJ3mnSR8/yHKAzHD79HiGkoCioYSrZGlOt8gK4RgkFPhNnrzuWbQwZdoAKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d3UieXY6; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d3UieXY6"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2d91ded8174so40064775ad.1
        for <linux-hwmon@vger.kernel.org>; Tue, 08 Sep 2026 12:27:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788895678; x=1789500478; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7vlvzTdo6hc/Hb1ALKMfVG8dR36XZikTOJ3AgufLTsc=;
        b=d3UieXY6IbtRvqclqbKT22fTfD+CYW1aDsPVz0qyKb0rXBM/ZYzLr4Jw34knbNquvT
         Uc1XyOCU5Amk+iJQ8FS2UqUZRFtqkaJH5nvqY9BJdU5LhfNSimvviVmQJW+84mcszCb8
         HBIl4QvFy1Ic2xULeioz3Hmj85n69md0SfVW5ZXOnIodpacqS0hMRcUSYo8ge4Dq7z1X
         f5ljxbsTIwDhM8vmdDVWpFkhf8YL6QKL7Q360bbfsahspX5QhLaPn7Hb5r3FXfPYRCYf
         KV1Wvrz2b9UkCqeMU4LGDvRwkjsKqy+bqRxtoEdKt6X22mCV7l6FAju3y61hV7Cfm6mU
         scGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788895678; x=1789500478;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7vlvzTdo6hc/Hb1ALKMfVG8dR36XZikTOJ3AgufLTsc=;
        b=FyDimd5vfzAA5EPJkVz1b7Nuh+Dhkvmj/Jc9WnAqK1xIVy0zcdX3Un2LqvZu2ID0oN
         pLbBHUOR+BLjHlApeb6V/8TXRMluMksSjO95SLfozLER7Eagzu3qTc8UHWfwXfPc3g6y
         2dLT/uTpGfJjpXduE+Fc6Xuf5Fg4ourh6W8/P2mCewHaeenNN/fzvfCjBMlfw2ISrbO7
         ajOPBq2MrIQ/rQhocODOZ/RFQmSwt25B5CN5fWW2yVW0qf5rJS4LzBNK+0UeYh2Z/QZZ
         MFbT/Z9eIRobjj93spmvDDxL6MlGZMf85wbf7esksea3t6VBtpsNJQh3egZEEumZa26F
         oprQ==
X-Gm-Message-State: AFuF++n6r8X8U1ZozUNPU+nwM8fQzD/88p4sgYvf9DORlCtXX35vp7I4
	WuBgLzCxpnRTodGOkSRa5IHDB0T94qc8JpG/Z2e4DerSMAZcTqkZjLdO
X-Gm-Gg: AYBFou1reeC8H6Z3n1IFVfo6WkMW5wv4BqzjXnVypAjl2NtLAZWTKTX+sOOsRFLLS61
	Ps0vFnro/QzzK4kS7UWmWifL+Ey41/KmC9r+r0WX+1CDzk23J7Tahcg73hWSagx4oAJWVFvHDVG
	6pktUikh8wYOTuB/+WK7tJZbGtuKZDhkLC1NkfjCaegGL2NxyVuCSZPn/vEhlJom7+lHvdFNWHm
	URjwPHafiQa2jpB39raW28AUdJMMDCMiaNIjuT/7lnRt7v/pFDO9jVmcKC6olSX4BJvueArtbDh
	1NEMAGodK8HkcRJ8hcjDfUlOaBwB9ARr4cDVXU+bMlSLqhncl1JBCuqvPrq3/ya5965Gvg1ESBy
	5Sc3M6WLq0WETCPPqR7X5oIzytIJRcUHFXk5N5OZ2IV8avzoiusm9NigGHPxfBpUXWtOC8OVoCW
	y5NA7n186/QS3ZoP7bLc8wPhvn3j+7/Erqxw/XvoCqKalWaMWVMK9hA3K84/LT+wdXyvBf7lyLd
	rKEN3EUq+yXomsPROLYRBVJU0tdl2hrxlLwQw==
X-Received: by 2002:a17:90b:1643:b0:380:21b7:e727 with SMTP id 98e67ed59e1d1-39b26272f04mr44563242a91.14.1788895678110;
        Tue, 08 Sep 2026 12:27:58 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b260fe843sm27565947a91.10.2026.09.08.12.27.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 12:27:57 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <83e0d080-9b58-4f48-94c6-f7ddf4d2b531@roeck-us.net>
Date: Tue, 8 Sep 2026 12:27:56 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] hwmon: (yogafan) Update reference database and
 contributors for new models
To: Sergio Melas <sergiomelas@gmail.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
References: <32638fb3-4f3f-4798-a166-3cf1efe0c424@roeck-us.net>
 <20260908184813.2353047-1-sergiomelas@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260908184813.2353047-1-sergiomelas@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/8/26 11:48, Sergio Melas wrote:
> Hi Guenter,
> 
> Understood. My apologies, I misinterpreted your feedback and split the
> documentation thinking you wanted it strictly isolated from the driver changes.
> 
No, separation is per logical change, and the documentation should be updated
together with the code. In the original patch you also implemented functional
changes. I wanted those separated.

> Since the driver patch is already in, please either apply this documentation
> update as-is to keep things in sync, or let me know if I should drop it
> and bundle it with the next patch set.
> 

It looks like it has some formatting issues. Please fix and resubmit
just this patch, and I can squash it with the driver change. Alternatively,
submit both the driver and documentation update as single patch but, again,
_only_ add the new models with that patch. In that case I'll just replace
the applied patch with the new one.

Thanks,
Guenter


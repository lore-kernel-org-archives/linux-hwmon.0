Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B671235358
	for <linux-hwmon@vger.kernel.org>; Sun, 12 Jul 2026 18:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783880234; cv=none; b=MXssyf25m0Hn23eMJ9sOh77j9H69w89LO1pcVJBefn+v5hZEPlf8cnFPRDX81mS3GZ0B87fn2NRW00reKxodY6RhjkAnXu/W0w23msZiaEFyEvHF8CRMhREHwwKCub9zPGb4W0i6FlFy7AKKPWzM/X6p234QDqN9DLs3nm5zHfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783880234; c=relaxed/simple;
	bh=vdDhbxuwB9+vB3epBXYqHHPlfqb4p9t1IssuKuIyke4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cnVTver3qmjpowHtfY7V5fBqg6J9Jdc9ylQ5uFsiZ1i8PmH4ZpTij2kBA3NVMw9HhAj4A+TpL3TPR9SIWRb0sVIIErpc+nVkxUxTFp9at6Q9bKVInFWlbbGV6oRLFF0UgkV+rLnH+rZgWHTz599DBlvemCY7l7S/2eFJaYbAJAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BLUKYsBM; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BLUKYsBM"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2cca24023edso28852565ad.1
        for <linux-hwmon@vger.kernel.org>; Sun, 12 Jul 2026 11:17:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783880232; x=1784485032; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DgiFGHFRLw5HJRkWEkwabqE6ct/uJCnrviKbkn9Vl3s=;
        b=BLUKYsBMgqceIVkS1yoyHAktLYRc2Ue4f9LZZmJ6uz+A8E+QF0OFXUJtJv5dZ4FJeN
         I9eDf+PUI8UvfXuon3WrrqoOwCDLCwMZiEW5/VWZL9PqQKc4k9trc+ZZPydXi2V5PIMA
         w/0vjRP8v3AAwJvXE8AjuDWxQQ1PGHy+at99+nTgFxAbWj3JzhFwleuk0s/z0dNnaVXl
         OL4D/fLY+Ha8rCwOVI+O24cVLv3xKn6/fToQ67qiMF1kbJYELo5WifWpiZfiOb790a3u
         WBPAHPjEu7S/9IobbhSOLz89iZ0DYGNlDH4XczsdN0jb/DvtAG0Z20fCOI9KOVHOemk/
         a+zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783880232; x=1784485032;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DgiFGHFRLw5HJRkWEkwabqE6ct/uJCnrviKbkn9Vl3s=;
        b=h0XE4npjV29htU5YAMVGuEvZSOUPL/jwcXcX41D/wuVDrROcwwKOoKYHT2KWSV47Fi
         2GpLIfvl+2ZFQEVjspUwZPIfki6RpPBYzEAJPRVlOCptc/kV4wYrW5ftxj/lyVkprcKe
         pOtUzANL/4pPVnjmPvo0+FL6gRNXpo0qX0COARRV1hW+CuL1ys+081Dvv7s3BblDVPt/
         Sj+cOiCNMECPO+RVNqFTHmLmcjZBCuGncnjLBd4zxMhBdeiagSuyKg0slIZxw/5cWk6M
         cjlFIwCP5NXNfME3NKlw7RKGVvJ4YEaFSawTFrBu1W8SdounPLPBsC0jYXu4x7RAqg0N
         M6xg==
X-Gm-Message-State: AOJu0YyHSnseZTeDarQl7J0lgnti50FvZjB+ENt/XMSCPuDD6QfjVEyV
	RcS16EfqYKghJAAuhfW40w9lmQ14e66KXU56ZFfYmTu0E0ZFllTeH/Bw
X-Gm-Gg: AfdE7clWKx5glIuLA6sUx32V1EK/yBWDNy/iOrpK8Nt9kHJhIRu5VJE+vi1DtwAgGov
	S5OD8Y+nuTSzI1hCAqzosfPyMULiPbNVGhB8w5BnXFaHMJvB9Kl5PPft2Zv5r4dB+XBJrihnvqt
	ozr/MLXXJqHG9w6cDt+7pFi9E3kVXcaugPax6OZoUh/L/XGbBvny+w9F1tb6JLKGdElOKauTjFY
	0nwjKEN6ctYfD4Pz9oJ2bqx/j3EDiyStJNln3Sn8IXki/3hRtRIOtM0/r8hsdg250mT39sBn1FC
	R7TyjQ6kn3CYhQhc06xB7hWXF/dhkmfDBpBuHLqSrrULPaWmNeJFp4UhpbufUAV5+I1Z6GcAsus
	Vj4KILt3dUDk1Gw7aVRrAELnwIjsbPwdPlsneyXJ2lfqTTq5ggBG3vF3pFEdyaNP2a+m3XhpTwy
	wtDjnrJ2ArIvGm4plzNhXWfhEczJPsXY4+QY7qNKKfUdH+xHzgNX3KJygnBCPjx+bv07Ihxqxt
X-Received: by 2002:a17:903:240c:b0:2ce:9b49:d4a0 with SMTP id d9443c01a7336-2ce9f15cabbmr59718565ad.35.1783880232404;
        Sun, 12 Jul 2026 11:17:12 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9c25fc0sm87537305ad.36.2026.07.12.11.17.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Jul 2026 11:17:11 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <fceb5317-8dca-4aeb-bd01-e7e1c9a65ab1@roeck-us.net>
Date: Sun, 12 Jul 2026 11:17:10 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: (dme1737) Replace ternary operators with
 str_yes_no()
To: Joshua Crofts <joshua.crofts1@gmail.com>,
 Juerg Haefliger <juergh@proton.me>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260712-add-string-choices-dme1737-v1-1-9c2b1f31db28@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260712-add-string-choices-dme1737-v1-1-9c2b1f31db28@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/12/26 10:58, Joshua Crofts wrote:
> Remove the ternary operators and use str_yes_no() from string_choices.h
> instead.
> 
> No functional change.
> 
> Signed-off-by: Joshua Crofts <joshua.crofts1@gmail.com>

This is an extremely old driver which does not support the latest
hardware monitoring API.

Please refrain from making non-functional changes in such drivers.

NACK

Thanks,
Guenter


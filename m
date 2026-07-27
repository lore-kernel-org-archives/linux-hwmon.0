Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B426D386C25
	for <linux-hwmon@vger.kernel.org>; Mon, 27 Jul 2026 14:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785162837; cv=none; b=P+2Cc5toDtD2NNni0Edy8iJsYOUEeIQi4hs/wsPusu8efAFWXGZbxpc1Sw4fiFoTbCdhaEsfFowLkFh30eRtpETnlpH129sMi7YR5EA3ciopHvJD5BM0XEs+IsaHKGgCZaV1ePkfsdF570tZq1tS94Amu1CpTnWnHtv9rsTBvyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785162837; c=relaxed/simple;
	bh=UrLIdABYPdYGYX1yExbLhvWC3pFpD70B1jUXF5UmSu0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T8PtcVnYulflY7V4YSYnZnlN9vSLu2ZC1pL1Yzmabs7TlAkjceogl2Ig2wherLUdGSGClmVRl5+N1qdwO+gzEe+rRFjvAQd151DWCCtPooKNL1ph7R/7VbwD7kvy54kpGTgeF/d6sAFJzqNaoWwjmOSmK2euYq4mnd409GcmTew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KCH+ncr6; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KCH+ncr6"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-c9aea40d799so1399398a12.0
        for <linux-hwmon@vger.kernel.org>; Mon, 27 Jul 2026 07:33:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785162836; x=1785767636; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2Ar6/Pk37K33HueKrWt/CNgQr4LrOWuJWIOIraN8mIw=;
        b=KCH+ncr65GLjT0uDn4aAPelD1t0DwKyzyel57X1WhJ63eiS9vjOTPmAsWXDHoV+8T0
         CQP3RORhR/SxFTXS3oeMzSW5AVSmA767n3dtOzbwW6/FfXQuXWlCFoULcIzu/tQfmMrn
         J54UbhZBf4Qyl1/CDtMkk5UHXDAG5+kp+cvW4SO96ALoDKNPihK3c+9dnhLi+ggkb1fT
         crFWcChSUDYE5VkzHJ+XiB5BmJ7RabOtzxikxF4sNz4xKl5eUrg75+QtL3dBxaqGmll5
         nvQLjBkavDLA8QVHHX50m6TJQLwC64S4U0MUrFv52GeA7YktFeE0CsBsUp01bQCOAFbh
         UkGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785162836; x=1785767636;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2Ar6/Pk37K33HueKrWt/CNgQr4LrOWuJWIOIraN8mIw=;
        b=qbdg1ToIeL9YW9MHT2G2Ll6pN6VTRKmtKKCtZhW+9vJWuyWv+CzE5VUJbEKRnpUiSy
         81/w0FdmCM28N58Gvw8Jla9NlnFYffLhpybKyp4vf7LKNSV8uidEUWa0ceLKlfAm3CRY
         XVW0Wz4EoerDDhO8TNDepQIsT8MJBg17LCdorBj7JCXVeqf8exbWHhSaimxtgLsaAROC
         A7FbMGkr4J6nuzDMOdJskN/mBcklGTSBy5TWKSlt/BlEjG4elwqNUZ4lVIm3zgraP1UD
         Tv0ncHJQPmrCJ1FNJJ1JtR4cnyimTW1La9b4WC2ygOWgObKvlJm46dN2bOHfpJ+5z9gM
         LmGw==
X-Gm-Message-State: AOJu0Yw89KhF35nSjPetB4vthfBzMzYlYW5Sf3VEcOiVDSisblHpE9kg
	ayvqJf7n/W2bKxmuJDfWZ7L5Y1a1YnhXiQDgLhCh7Xilfo4ef+c80jkQo9d4kA==
X-Gm-Gg: AR+sD12g1Kg3uS1Y6uuEeb1ARtmcLmK0MS13TlCj9U+rqQ8p2lPogyV5ilH8FUhTkWv
	BkIOn0d5AhhB7twx9aN7F2G3ZuYUWux01gKqGRRVBguQfChkUEnzfE9hrDGPXzrMVgMeUdl/Ve3
	eHnJlNnWkftVXJgyhcPogOVA3NOk0Uq8Ho2YhJ0bzjaLfPfbkArD5iosoIHPncoSSjPxPc4wtVB
	A17ntRUw2e8dcQP3u0RRvInjGglLtePKmq2I8sfFXc0OCIIWLn/BAvExTJ1Y1jkvDXMU7H009CA
	nrH6dhPjdEDbwTSLudUAfWM0Jl4GkENdAnmWm01Ygbbnt5wALB9dmhSILvX8dWsOuVquwGIbusd
	f0FXJD7ugcoQI3F3rjxY8/G/ujtd81ymH7q/U6UySDCPdg4/Qoxw6cgpx6d4EH+Hp+G2O8apqEx
	6BMwbfJMoDmEHS2nDYldMMOBu9EjKSP4WJqikp0mOJSlfbxvn+G3s=
X-Received: by 2002:a05:6a20:430d:b0:3bf:6c07:b2f7 with SMTP id adf61e73a8af0-3c67dff2ef8mr8064887637.58.1785162835783;
        Mon, 27 Jul 2026 07:33:55 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc548efesm34307500eec.14.2026.07.27.07.33.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2026 07:33:55 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <0b19f912-03d7-4f3c-a5d5-10ff794820c3@roeck-us.net>
Date: Mon, 27 Jul 2026 07:33:54 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [hwmon PATCH v3 0/6] hwmon: (adt7470): Multiple fixes
To: Luiz Angelo Daros de Luca <luizluca@gmail.com>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 Andrew Morton <akpm@linux-foundation.org>,
 "Darrick J. Wong" <djwong@us.ibm.com>,
 "Mark M. Hoffman" <mhoffman@lightlink.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
 sashiko-bot@kernel.org
References: <20260727-adt7470_thermalzone-v3-0-21424d550c3d@gmail.com>
 <CAJq09z4TmoD2ZHsm7vENBqW8SCV9sGGCf4K1fE_xHz4FqHGGsQ@mail.gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <CAJq09z4TmoD2ZHsm7vENBqW8SCV9sGGCf4K1fE_xHz4FqHGGsQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/26/26 20:44, Luiz Angelo Daros de Luca wrote:
> Hello,
> 
> The b4 tool mixes the versions with the previous submission from which
> these patches originated:
> https://patch.msgid.link/20260717-adt7470_thermalzone-v2-0-a55147958fad@gmail.com
> 
> Therefore, this is actually v1. Sorry for the noise.
> 
No worries. Thanks for letting me know.

Guenter


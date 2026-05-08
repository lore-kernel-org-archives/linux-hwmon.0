Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2FD82F99BD
	for <linux-hwmon@vger.kernel.org>; Fri,  8 May 2026 16:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778257645; cv=none; b=TbP0U4J5TQXBIgJ4sveJZrQPhBAAwPczC21zqszDbnVNa1CG6jw5xPFj6sFvNmdd9mvRtS6zmjJV7edGHv24uBHEGvEGbyNTEBbXuDpkqvH4cJhhhtAqhO1hY5+mdLAw9w9ntkEMb973WI2QRI7I7CrOtjBvNr3aCEQdOmfncVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778257645; c=relaxed/simple;
	bh=6KxY9Roi8N8d4WWwIr2x6TbvGnckQnG05iuZrFnZ2Gk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dEgEK5C2McAtJRtKPWeeDHTiT4ziugyqjelUQLIMqjy2NW+TSeVrPefRPzD6MVQNNptP9Ck/AY8PvxxOqqdlYh4TQ7mJVLtlOsjDUx0FvV8hlNXf/KY9dHa6NhGGjlaWhTncshjOs7srP/nuINFjdkS2UAflWj15KpFlyR41k7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dDIuZn8x; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dDIuZn8x"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2ad9f316d68so10885295ad.2
        for <linux-hwmon@vger.kernel.org>; Fri, 08 May 2026 09:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778257644; x=1778862444; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=3S7UqGfQlbSNMAblK1AF7WjzWItdK4mDnUlHoxWt7Tk=;
        b=dDIuZn8xJIP4rPpd8h3xaz99u35NPa2AxjrWfHw1OpAZBxQv+l7ybf6MmPDYaczEQs
         LyMoHsLnPmTC4pBULwhHn/KhquLZPnzsFDYz+Ry5y7QkL+1H1lQUCVjWPw/AckyCffNo
         PouoC5zsb6WmRrCeBD0LrYNm0nbDt2b9BmdxxQtrCAiuB1xH4csqkLXXEZPru+E9dOOP
         AHkHlfSUkWkjVhXpTBNZ4qWDRgAJavSkAsLWSeq6JK2Q7VUag1oCTfDPWSsnPTxqzgbo
         fVjI/h828wwNsqJ2uhg8Q1unQp/XjOTiHhbeH3ppJJlebMFWoo8ZPv8njwkZbAHWJ1+P
         lPcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778257644; x=1778862444;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3S7UqGfQlbSNMAblK1AF7WjzWItdK4mDnUlHoxWt7Tk=;
        b=WjJGbUm/KlCOr9EwRjvLHLXXyMLFKOi/Vo5GSpe8cf4Up1SLRnn438vdkNkgw7hDVy
         z4N3C6g/wVqAcIAKrNiLltq1yoVSC+EOy00Hu1KuPz3jRcNm4cTA+3aaCKrESpogTyoI
         J5UOZiBSQTxgsqrve3YdtFyNEq6NAhLqrlIMUhePk8mfE0VtvksahNrLpVrDt54JpxRP
         32jH8642D/hIOwgT5s96ZSKZ9RftWD1qLeOK+pre68cLEwWswiMt7GY6A+ZS1dpBwzki
         +af7Czr6rKb+eMfPmyqUTYfbxKUBuAa1mYgqVAeSwHB/9v9g6JlNz5kgC9jYvbyKeakL
         zB9w==
X-Gm-Message-State: AOJu0Yxv3N8vY7VwE5NPfTK2mNGZwUZ61TW09jcPLo0ECTg9VeJgpuTm
	XaQglSvzjYO/iZIXvwf7S7ITzqxF7IM9FlnUaIhWfuHY6OuCUzSDVJY5Vf4TYQ==
X-Gm-Gg: Acq92OFUq8V2Odb1ljPV6r7xp6JNbTrKV91o9HgMdh60CvEMS7Y9nJUJgvl61PNy5M5
	R+Ac/kMUWVBDKUzZPTjZfkw5DmLRjqPf0nHZF/VOutpG77mJLW90Ux/t/7JCUXEyQkpnLKiAFKF
	pGcaBky1+s6riIIdLyIcPqspyXvmJa2BzmvC3BPU6m5gKh35pfXSOppwbpZG5LUX/FrblbjoXYd
	74H6eTtQY/gAAJfh1ScewRHFzuet+qxDwMGNH9LJ17eep5hygHbeKq3hSE5HUaldSDBNKZGRJiZ
	TR4fVJCRdBZsmuCKVePHdlbkboj7ecJSpL7VTG23AcVEMEsshKtk7qPQv/L94UWq/33oSAvWlpG
	VKbCVS8SLlHZbnQBUd2/fjetLVsPASW3kHryDsZyovjvGXgRMMkBl2sd9fzdFDA+K9/NYLZ2TCp
	QTaKbndRWzJrv1IlTQIyENrq8QcF6+ROFVfFVqZduAN5T9a5ziODwkfhh5K24DTipIAk2BzTnX
X-Received: by 2002:a17:903:1a24:b0:2b4:63bf:5535 with SMTP id d9443c01a7336-2ba79be13f6mr131726645ad.41.1778257644123;
        Fri, 08 May 2026 09:27:24 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1ead90asm25973485ad.72.2026.05.08.09.27.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 May 2026 09:27:23 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <b6ed50e1-c095-4400-b538-b51ea7b26e0b@roeck-us.net>
Date: Fri, 8 May 2026 09:27:22 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] hwmon: lm93: clean up coding style issues
To: Ninad Naik <ninadnaik07@gmail.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
 skhan@linuxfoundation.org, me@brighamcampbell.com,
 linux-kernel-mentees@lists.linux.dev
References: <20260507101143.559475-1-ninadnaik07@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260507101143.559475-1-ninadnaik07@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/7/26 03:11, Ninad Naik wrote:
> This patch series includes code style changes for lm93 driver to fix
> several checkpatch.pl warnings. No functional changes are made. I tested
> the changes by compiling the file.
> 
> Changes include:
> - Add blank lines after variable declarations
> - Change 'unsigned' to 'unsigned int'
> - Remove else blocks after break or return statements
> 
> Ninad Naik (3):
>    hwmon: lm93: Add missing blank lines after declarations
>    hwmon: lm93: Change unsigned to unsigned int for clarity
>    hwmon: lm93: Remove else blocks after break or return for consistency
> 
>   drivers/hwmon/lm93.c | 87 ++++++++++++++++++++++++++++----------------
>   1 file changed, 56 insertions(+), 31 deletions(-)
> 

Please refrain from submitting such cleanups into the hwnon subsystem.
As you can see from Sashiko's feedback, the driver has functional problems.
On top of that, it uses a deprecated API.

Fixing actual bugs and backporting them is only made more difficult by
cosmetic changes. I don't mind if cosmetic changes are made as part of
a functional series, in this case for example when porting the driver
to use the with_info hwmon API. On their own they have no value.

Thanks,
Guenter


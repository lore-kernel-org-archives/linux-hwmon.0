Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C63522339
	for <linux-hwmon@vger.kernel.org>; Thu,  9 Apr 2026 00:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775694166; cv=none; b=Fci8KOgLemhNCjGhvNbHHxpjtVrcicGmIM5cv4fxZ7QrwR2t/Do1r9eNJl62Psk1Wgjm67+pfhEqE4ISUviwEfD1EOUJ+vHIeglbrpCJlqXpu+kpHHreHy4kOzA6/0kmJDABv6pHMetdjelakn+Sj2UFBkRpPK4ly1CobmQ8aOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775694166; c=relaxed/simple;
	bh=Oh3Wy25Ci9iwS+CmRCp0SXSAvLweKitDigW8KhTbPYg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RZ7Vr5JwiZsutimoSh6YOs1V2OGXNqtwWpP5Dp6C1iTDai2CP1KPM3FLDNmNDRkoLMuTV8ZMWxv/5bugJ9qi7LRY+OKzhBu3tpA6hT4r5cjHQhALtiKTf5KyoMktPl5hz2ovYtj6VwILmkHyMxGiswPvu4LHXXkMkDhM4g9sWtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cFb0lc3Y; arc=none smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cFb0lc3Y"
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-12713e56abdso106807c88.1
        for <linux-hwmon@vger.kernel.org>; Wed, 08 Apr 2026 17:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775694163; x=1776298963; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=cIPYLFjCk6d3pX83L6YT4AToisesvCAoEHJYf4HDzzg=;
        b=cFb0lc3YUESiC/rng1a0M+/irPHW0II9tMAdC2N7PE8HOG7+tWnFb8HkYx7kdTs0o7
         ASF2/KPhZ8ayX1MJG4gXDwymaz1wkDTyWnLS1PZJOj7iYm4UsAi7hCvqr9Uce5KUmKEy
         DogrqqggNP+hHzNSdeE1IHZP0mxaTeYN49ymr8yfzTqIc8iC6+6xbhKET/4pbCdPrzGy
         7PsirDbqZR9RFauYr3sxA9oxLFjWDJB+jLTjFPpBZ4uIWg6szwz0RyDEUaSK40VoYfJD
         EBxeJh0IFfvZqRh2wUCzy6NCslfsNGbRIZc3+svXROF3bXi6oNa4LiK/eH9mf4/MmN3E
         9auw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775694163; x=1776298963;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cIPYLFjCk6d3pX83L6YT4AToisesvCAoEHJYf4HDzzg=;
        b=nqaG9vSXz21MIVIkggvLMqRCDYItLk2GEpkIfCuBDFlpLM/krQrAyN8cJBShZU5EDc
         7yfKfdGAm/LuRzj+251ZeSWssBZWIg84v5zt6qp1qIvkmWSg7ZDHJ0Wy6pZqGAJOObox
         Qh7L3zO3An+5rfGZUADY1oS68bKsIUFobORmP9ASf25bi3TltE04aJCJeyGxHXsVpiCp
         DgmGJKvQ5aORB+l3Ra40twmJnmMXm6yw4D+eN3746O/1ar60uKxVZ5uynn/4uTjgme/Y
         k7rXTo70ZnC+MRJQI5HV7gY4ef9Pob80NXOtHmAm/+Lv1OeuA3zWmTzBInxpSjdfM/WV
         +jog==
X-Gm-Message-State: AOJu0Yw+wL9loVdppJ4ZsQKHGdwcBAw28YqL9DppUKiv5BIZaqryMhkG
	+qEf5xKYbDwnmjqzO3gufveAlZrFeJFVdsPpRbdvkH0mdXg/s6vSShkz
X-Gm-Gg: AeBDievKU6NlYrOy9FRDL4NlK2nsepOuc/Zj4vVQOAFBG6obXCb0Nz86Y99jm+5uzFw
	OLZ4oWgj85Jm7Hkcv9zvLespAJUL+dvh6lCo1Ux0zjCZm3AH47CRp6VJMRqX7LRnjOQE1l4kZPn
	ZWs2NxOaSUJEfs34i2HIdle083WEPRsczzmUh5mMdzYCDFhPQbpoOMCKh88O5ZH5FxQEtNQse1b
	bp09BrxUYdTLuyL7KXsSWkOuLF85mKXp1VMF4elurFTLmlbtAsla89NLpoAjz6SE1SGAsEFsWhj
	rKndr4lKC6L6YGRPoxsroxG+9RqN1bW9DS2aqMUlmpQRhqcaRHOAic1PItvDcvOFznj4EnidVUL
	p34wBLWQvkjRTJ+1ItIJEa9yGEfWhhEFBO21kD04MzC5Sy68lo4fgi07PhuVLd+gDRnL5tr9z+T
	rSF5LJjQRsTMdikHthLPXXJkWw+eTqtlxw5D79sYJchLk2rac2ixOd+El3TocwVbyWJXyuncIN
X-Received: by 2002:a05:7022:439f:b0:12c:d3b:f0eb with SMTP id a92af1059eb24-12c28bff23bmr674930c88.8.1775694163419;
        Wed, 08 Apr 2026 17:22:43 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d2d5409fd1sm5652034eec.13.2026.04.08.17.22.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2026 17:22:42 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <edf81d94-d6bd-4c1a-a804-b6fd8baa23cd@roeck-us.net>
Date: Wed, 8 Apr 2026 17:22:41 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: asus-ec-sensors: Add ASUS TUF Gaming F17 FX706LI
To: Saravanan M <saravananchatgptonly@gmail.com>, eugene.shalygin@gmail.com
Cc: linux-hwmon@vger.kernel.org
References: <CANNcQFEFFBt7rBuaV8gwqWnbsU+fDGHaLJORq4YkkfZ9jhzAOQ@mail.gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <CANNcQFEFFBt7rBuaV8gwqWnbsU+fDGHaLJORq4YkkfZ9jhzAOQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/8/26 16:57, Saravanan M wrote:
> Board: ASUS TUF Gaming F17 FX706LI_FX766LI (DMI: FX706LI)
> Kernel: 6.17.0-20-generic
> Issue: asus_ec_sensors fails with "No such device"
> EC register 0x46 confirmed as fan tachometer via ec_probe monitor
> WMI fan_curve_get_factory_default returns -19 (ENODEV)


Please consider reading and following the guidance in
	Documentation/process/submitting-patches.rst
when submitting patches for the Linux kernel.

Guenter


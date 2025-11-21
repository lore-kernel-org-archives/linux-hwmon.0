Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50CC326E14C
	for <linux-hwmon@vger.kernel.org>; Fri, 21 Nov 2025 15:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763740235; cv=none; b=SG56LWArYjO0iEGzFAD/Ij/43sA6uBXCSUPhuNNQFuXFdqCaD8bxRGPqTNdzaGk86AvhBJng7KtS7pXz4O26sNSddxvPFnQiauJuHMTOdweDsfM+mwkeEpMCmffMwiRhn7uLvQjpDIGtVoJCefOeYTK3fGOVwsO67C4BgqKvPlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763740235; c=relaxed/simple;
	bh=4i3X/OCJXTmh+1M2IfDmIZ75Sl7aUvTCnxuEmAjeoG0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a3DMb/s1P6WQRJ0YWIja4fIgkpPlURmK5ar22gjM1FhKZnn/iZc6kcEq3A0ClYgAS9LexfL++AmnnIe+niH8hY3TuoThSxUlDSW8Zq2jkwOGFt0UpAhQqQP5VTRbqo1kicv5zSwQf5zGa1ubzQG46rXsnbpUPGQXVw9IluckjYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jkqbww40; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jkqbww40"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-297f35be2ffso33262385ad.2
        for <linux-hwmon@vger.kernel.org>; Fri, 21 Nov 2025 07:50:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763740233; x=1764345033; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lW5lXIt/CZeUQ4dXVL5FmacDKUMrztihLOUWLxEXWaI=;
        b=jkqbww40aPw1tGsc2U3jR/IFpCxmWzJvIgQilZtmSidXPIqM7IQ7l7DCwh4G2Awvjr
         wLp4/NYYKqKorydB7lQ95+AdGTClKS1zBXJ7Ssr/Hu7ZfSIgAXNcrnzbVIlI3Kw/4mAR
         k1yZTlgO+Xl2YEwoMa7qlQ0rX2cbvSq09WdpW+2St2Grbsv4KVD5b06lsPEuIYrRxo5u
         avv8utY53bYSLH9Uhlsb9b16UXp4htecGw9w8L8IoGllnq6zleZBJar5647+lGo6gHC3
         /WMRM4ZpcceJJI+I0XAmUd/TWSdh0ahAEPgZgB4h9WzXLiQ1eHKFH6muZS2DHkNURzHs
         Kt0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763740233; x=1764345033;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lW5lXIt/CZeUQ4dXVL5FmacDKUMrztihLOUWLxEXWaI=;
        b=WKhobVBMhXjLIy1xZITl39qm545kM6wN03DcgMBhlDyZDbSYMvqRWN9rentoF65IZE
         VGOqAuqdXWxszycMXogkH6Sm0g/WT3Ma0PYAOB3tqzSEwmCTmtw2JOqkTp+kDbVrreqF
         fWKzAwEA+nXMwQHQM4l00+TLebkIY0nrlP8u5OJWUTZgWyTLQQxNok2depmfDnPXL4RE
         NiYElM3ms81qPogjQ27AuoL2qDhIs6kKYxuEGbE7OdkqqFF3kEbPKnoBRaeVRdKZkp3P
         lpFbrMK3ybUCrWy2FHRe8ZXC5sYvTXV5wPLLCdh0RSLg/vGa/irKGU+TMMIdWZjkttJK
         JHAA==
X-Forwarded-Encrypted: i=1; AJvYcCVpozFYkdvuUIiIOL52leZC2Sv5ViamLoaK2EostGHDLc0SBcNEgMiHyLpMER6DUQ8EEPiTtSC84rTWKw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxl9RY7vjtTfbPRx8he+XqL1mT7PzgYA5KgLYVOWrDo1SnxjlAA
	jVC4m0lOuZcxYL81Ink8Fa8AfN6e3paBxMfvRIMfbW3+WyVw4ayFnLWV
X-Gm-Gg: ASbGncsQIC7i/82gHYcS1tHX7CTaj0RFGfn1bgT03F4MAA23w1JowsBRpHugBCp4qMj
	uJlnnPYed0i8iXnuNscha6qQt3vchTofJzPF+a3WeRVXOtm8HZPoRg2khMx3n6TjfiscTqRHKde
	GXPVnMZm1dARTu6h+dB8oFjHyYdeVYm/2C6zWrWA5Ec3oCoHDBFR7df9I/yApNScdalnmtQrwq4
	h/LWlNkFImLFqWu1NqENLlElysx9Ws4uLaV9IjDLr4pH53rWb3CPpiFWCivndc8tgyN/45J30HK
	q91KOxdqxtR2fRlz7/SYj6D3Yrt0X5AdZlVcjfKjzbxBdESjvxe6NifyDw+SxSXu0InvzjVvA03
	+d8HBnrb/ETB1T5R8ZW5VQUpqJPk2W1X0JrXkLGosHHK7jfjZ5cx0d1Y8vfCligQUClmopRvmT+
	ize2wyDzAErGXPDf29UBihsxU=
X-Google-Smtp-Source: AGHT+IFGAVfMguY3irLBdPFgatYV5J/rG2XF23gXi7wkGig+85rnvjmjfKaMXO2h3mkQxAiIveeiGw==
X-Received: by 2002:a05:7022:1182:b0:11a:3b88:f756 with SMTP id a92af1059eb24-11c9d7126b6mr514728c88.19.1763740233406;
        Fri, 21 Nov 2025 07:50:33 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11c93cd457dsm26918913c88.0.2025.11.21.07.50.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 07:50:32 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 21 Nov 2025 07:50:31 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Gui-Dong Han <hanguidong02@gmail.com>
Cc: juergh@proton.me, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, baijiaju1990@gmail.com
Subject: Re: [PATCH] hwmon: (vt1211) Convert macros to functions to avoid
 TOCTOU
Message-ID: <9c9b5eb5-ed5f-4b94-a44d-eec829faf22f@roeck-us.net>
References: <20251120041331.1917570-1-hanguidong02@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251120041331.1917570-1-hanguidong02@gmail.com>

On Thu, Nov 20, 2025 at 12:13:31PM +0800, Gui-Dong Han wrote:
> The macros IN_FROM_REG, TEMP_FROM_REG, and RPM_FROM_REG evaluate their
> arguments multiple times. These macros are used in lockless show functions
> involving shared driver data, leading to Time-of-Check to Time-of-Use race
> conditions.
> 
> For example, RPM_FROM_REG checks if a value is 0 or 255, and then uses it
> in a division. If the value is modified by another thread to 0 after the
> check but before the division, it causes a divide-by-zero error.
> 
> Convert these macros to static functions. This guarantees that arguments
> are evaluated only once (pass-by-value), fixing the race conditions.
> Adhere to the principle of minimal changes by only converting the specific
> macros involved in these lockless contexts.
> 
> Link: https://lore.kernel.org/all/CALbr=LYJ_ehtp53HXEVkSpYoub+XYSTU8Rg=o1xxMJ8=5z8B-g@mail.gmail.com/
> Signed-off-by: Gui-Dong Han <hanguidong02@gmail.com>
> ---

Applied.

Thanks,
Guenter

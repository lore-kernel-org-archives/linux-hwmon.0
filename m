Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5293B1A0BD0
	for <linux-hwmon@vger.kernel.org>; Fri,  5 Dec 2025 04:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764907379; cv=none; b=po2shA7LGVl5soD11W6evw89Rv429RHG9zYyrwiQVH47eB2d+E5XdqZSfqgviDOaGkjT/FEQxAsXT20u/ISxivta+78lo8j+SxKFg0rzXnfQ6SbGMIiP5a3KB4ohaT6m5xXgOYUx4rindqySDc6kI2nRgB/ybeP1zwGXBdy9kyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764907379; c=relaxed/simple;
	bh=v2f72S6WC3OgKeDBLfDdT93apuWtvOkHlHqzmDzoFNk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hPnZ42456+PndzuCYsOUIOyWIiu/DD18e794r1idMoHwr9DH0jjQsVtnuS/bUpnJMsh/oFJKZOBW6KYBg3od1z6H+Wn6krzQDAR0f5c0BgEmd3lz3J7dkb9e61ddt2hh83jdp9RjN3ZRApwlAl/mHDdAbJS521EzagoNFU5tpIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dT5KEUWm; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dT5KEUWm"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-7b9215e55e6so1177447b3a.2
        for <linux-hwmon@vger.kernel.org>; Thu, 04 Dec 2025 20:02:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764907378; x=1765512178; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b4YLFHYaO1RuaqL4oQw18x4A8MtrlyjgwaPdq7ZKVVI=;
        b=dT5KEUWm/tAcwROe18z4NJpi0ML8xkVQCXLkZLaqhpV/nvWwcngx3MDirivE1o/b8s
         K/qokgvl6GmzSuZ9lAHzr35Tc1Vk11GPQCgo7c8nZJpv+BN/31QgqKefY3Iky0aScvVK
         wvijFitmRQCtlhIgF7Du5jv14BiBauUjWpIMNSA/uCMGY8Cz9jVtg29Knnqd9Npykshq
         Ejm5tV4qEm02PaLHG6+Yw6w8Os6cUc9svSB/T5YUN7O+dA3tjT8CjFad9a3kGpo+C8wh
         I0PPiYu7G7gY0l8YJHptqr4ad9VuhAnmSNYhhGsD183gaa++ab/mvX+kNcK+rzD4Ji80
         jrRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764907378; x=1765512178;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=b4YLFHYaO1RuaqL4oQw18x4A8MtrlyjgwaPdq7ZKVVI=;
        b=wtRMRIDR7gpj0WwhRHGdkkWgB3LL00NnJLb8bMdOjz3Lp67uIS2/UqWPJuWtxBFKql
         WGJl4MbmdIXcP9eJxz2BoT85BAOmO8sWXwFoqisydEyzbw6sU4FdHqymPJSkR+lP8NZb
         TDTqD+FaTGF3EOc8INbcTnmMNbOVK2o+8+IrYiBhI8ME3t37ZyQTJ9Gdc56Lg25opT73
         bKl/WavRPNgFsyPkhVDnC+7AEqgpJ+PCByMz26nQR/gGjRCFBBKBS473ppdnB4J9q+XP
         AV7e1NyFGWfWRkKTlCfhShJHHgxAKB+78JWdpn76WE/+BV3OAGvEcRebwvCTJjOrc7rO
         lFgg==
X-Forwarded-Encrypted: i=1; AJvYcCULw7P3IdDA+GYxGvCgIOw1a4eMajN626bIf+Ofva6Y2qk3lwCQiBYuNkT6rOW8wH3X+vjVBDkth4dYcg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0QI7M4l8RsHH5ZW5maBCkypLOat5fxKrMwRc1K18INDBZs3Jm
	lLUoiGvpGdjDOOVB9+yAFahl/XP0LtYU7WnIEV3k3qx7oj+DjyYF72fw
X-Gm-Gg: ASbGnctZ6f4NXEi6INZLuqZ45tLJ2yOrnqZg9JMgFoDpwmRHVeXlxkOM4xJq9s2w+88
	r+eI9eZOm0ZAc7dFgSf/pkrvPwb2LyDSpP1QTfMh2mEkbH74JPAfYCnKvlp7PlknruvAUg2ZmEj
	pXee7u9w+PjdleQyqb/1Dgya3X+BIhvRRibxf2+K083MU1qDHuE76r8FqFv9ftPE+doiebPzHcN
	LIDiaKVJEUZPOP0XGD1/cE490em9aur8ER6OihgRaaC0a2v8PtCVFt/sv3p8BD49ku0Q1yBkiLI
	zKgzc6HM6RGDlFbzKAihIQMUQwx23SBWx2dNeRcMVbwePR0uzcXid/HtvVGIEx37CMKIuRoZv7C
	AJdW/1N/jxrchgj2tGLSjuA3l0qktKZRZ8yfeM2f76SObCYmG917VWLtJ5wtSEn8A/3sDSG6zvq
	LcmvveYbsgOYzVVGQ1MS+LEtRkg/28CfZnMA==
X-Google-Smtp-Source: AGHT+IHXAGXujCRF6rIxwM8aJ1WracKjtS2/TUVdygTygDYAdtAS1Iw877vhq37ZfiJWLSvsiX+qaw==
X-Received: by 2002:a05:6a21:32aa:b0:35b:4f5c:4adf with SMTP id adf61e73a8af0-3640387708dmr6434214637.43.1764907377601;
        Thu, 04 Dec 2025 20:02:57 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7e2ae032627sm3624503b3a.44.2025.12.04.20.02.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Dec 2025 20:02:56 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 4 Dec 2025 20:02:54 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Gui-Dong Han <hanguidong02@gmail.com>
Cc: m.hulsman@tudelft.nl, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] hwmon: (w83791d) Convert macros to functions to avoid
 TOCTOU
Message-ID: <695c582d-308f-4960-84fa-cbf6f08c909b@roeck-us.net>
References: <20251202180105.12842-1-hanguidong02@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251202180105.12842-1-hanguidong02@gmail.com>

On Wed, Dec 03, 2025 at 02:01:05AM +0800, Gui-Dong Han wrote:
> The macro FAN_FROM_REG evaluates its arguments multiple times. When used
> in lockless contexts involving shared driver data, this leads to
> Time-of-Check to Time-of-Use (TOCTOU) race conditions, potentially
> causing divide-by-zero errors.
> 
> Convert the macro to a static function. This guarantees that arguments
> are evaluated only once (pass-by-value), preventing the race
> conditions.
> 
> Additionally, in store_fan_div, move the calculation of the minimum
> limit inside the update lock. This ensures that the read-modify-write
> sequence operates on consistent data.
> 
> Adhere to the principle of minimal changes by only converting macros
> that evaluate arguments multiple times and are used in lockless
> contexts.
> 
> Link: https://lore.kernel.org/all/CALbr=LYJ_ehtp53HXEVkSpYoub+XYSTU8Rg=o1xxMJ8=5z8B-g@mail.gmail.com/
> Fixes: 9873964d6eb2 ("[PATCH] HWMON: w83791d: New hardware monitoring driver for the Winbond W83791D") 
> Cc: stable@vger.kernel.org
> Signed-off-by: Gui-Dong Han <hanguidong02@gmail.com>

Applied.

Thanks,
Guenter

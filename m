Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 941BD474260
	for <linux-hwmon@vger.kernel.org>; Fri, 14 Aug 2026 16:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786723720; cv=none; b=rJhDwVCwFsrckOntTaVEIfYmQivcWD7vXNcRvoU7DH4EuU+OeN47ksDTe/Dw8y7rTK8P0g3ToJARzd6kXnhd7NTpRCwg3EvWS3/zYiOdlqIsWasS4sLHBNCwoRD6QBlJrdhMKAZDioQx0hGWHEAzdmp3mK/OdcLDnMzNh9g0UzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786723720; c=relaxed/simple;
	bh=OvC+uCX22OxiCm/ADZIrl4k/Q2qjrp6B/VU/TsLraGE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tf1fMVKvRNlKMd4JvRkBa47rmNT0732eK9CiRkmKkcxYOKZG9jzKN1MuLNht6j5BU/KDqcIXjYwQ2X/q/iDgngAn3w97GpF+KW5gEBQIhZ9jTJv+4Ier7/rX+DgQDUf2UbIbzUY/NWz/St/hmhJFRY0pyumC4DMwFun/hnObZI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dbuXRXot; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dbuXRXot"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4956242332dso12217375e9.2
        for <linux-hwmon@vger.kernel.org>; Fri, 14 Aug 2026 09:08:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786723708; x=1787328508; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6ZnefS8leD5EpLhfx/2yL2ejpM4dklOoHUq4vSAQtGU=;
        b=dbuXRXot/HKJArG0F0QwksTxblB1A8YetbG+JPqAjp7I8X3WkNNm/Zz9hIbqrF7aw3
         5k+YfjsUtRVCrij8euk+f+9D+59K09JS0El0OmQ47uHZBVtKMuttJezWdNcVig0qstn7
         QECB+TptQBVlTqxkq3/9vA+GHeEZk5EGmCCawDpR5u8/a1YIRvWFNC2wcg2SHk3Ity78
         AisVUaeWcb2CLGcNAwGqEpyFR42QvpyEFwhGorZZfSpKrvmNei0t+3j/ZRKx+ODRuMxc
         5Y+luwdrwyl0h+AF5tX+r1EMN36+6p6AI5VvQdDXGHIpwgE206DpdlInaVoP9sJcub2R
         iKdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786723708; x=1787328508;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6ZnefS8leD5EpLhfx/2yL2ejpM4dklOoHUq4vSAQtGU=;
        b=Nucrc3UMY2wZ/6mkf5TTC+mABHIcE6wJ5dHACW6x4a3CwtJq7TlQB1oLyfJnmp3uoe
         2nJPJoQssqCwsHR6L0053SAj4zZ0/oT3HpPywDnbWWMPLn86kvCWiB5DdU1Kj1cZQbqr
         gGTOPj6CuSJ4jqrcX47mGSgM33ZRoIpS5Lsn/inmB1eXJyBa+5u1h7UEtFujvXTIdKzJ
         /ocxQnBdyzYAeEYiJwlW3mBrHBItyuKxXd1HDzf5byIn9ufcNYePtm3XKMgMPfK5g8nR
         3fH7pH8gRKmWws8h0v792LSqOLfGh2BdsmNC8FLKoBjinqaIuru8ostV9MxUerLUkfJT
         jIzQ==
X-Forwarded-Encrypted: i=1; AHgh+RoFBZuuHWUmiXBVJJSwNZD4C79FWPxj3fkk7A8N0fFCThHtnyhA93OULDmzfWMTKqv2duw8DPhX54wx/Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwJISCpPwURHez6nYcmFpk+zr4l4Nls+DViHRPgA8E4V73Fz06I
	TyMEOiLOa1OcfAlARFcjKaObwnAEpP688dCMsF1KKBTXezWEGrTuQtUk
X-Gm-Gg: AR+sD12heKsFE/bOmvYuH9SiEcIGfbNwhaAcs8KeN9ujD0FW+a1tgCvqwyblTzbtvhP
	+64N1S84cImjdhbY6BcXB4eL4MIDSTskFAZhjcbNilZ2hevrH16lvWHkkF8RpBd6HNhbK6fBYx9
	UJAxZGMWnj9N44B9gTQ6+Afccx4R/9Aj0sAB5IHsjwr+nOyb8fgxSGTbHw2Kk44Oz2ms8i+w2yq
	Qkw+3BMYiFdtwlBw/1FrDgTgPoKCt1bWmSM4pJIJ7MKreZjdvfNNZuzJOM5j+TS6anrS6HZ4cmT
	vZ//GFjrLjeeLF4Se4r2eNfOOr+thWNn/kxkbBMnJVNJZdMEERh+B088aPAOCBuxTXz/eNfRRRI
	e5f01kUpvKoqSXknC2psX4h+U0jx1SxegESmDZVSPChfUQhCmW/DmM/QCMGBuvV7PBcP9S7kEWV
	OTZGcupXnLiaa9R6LT9JCIlbeT/vFTKNRWL2EFM6Hh4lkFw8ysP85muTLz8n7D4X/KF9xZjC2WO
	GQDSfEspG2Qt/bdq8pJYgIshyXFwNWmvU0UndzDDJn6v/jkxHYP+SzV
X-Received: by 2002:a05:600c:138a:b0:499:51cc:4e57 with SMTP id 5b1f17b1804b1-499878cf3b0mr74633095e9.0.1786723707410;
        Fri, 14 Aug 2026 09:08:27 -0700 (PDT)
Received: from [10.128.10.232] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4815f2c18cbsm8127896f8f.29.2026.08.14.09.08.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Aug 2026 09:08:26 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <e0775be9-9773-424e-9109-5b4b6b620e61@gmail.com>
Date: Fri, 14 Aug 2026 17:08:25 +0100
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] rtc: pcf8525: Add watchdog support
To: Shiv Prakash Gupta <shivprakash.gupta@nxp.com>,
 linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-watchdog@vger.kernel.org,
 devicetree@vger.kernel.org
Cc: alexandre.belloni@bootlin.com, krzk+dt@kernel.org, robh@kernel.org,
 conor+dt@kernel.org, linux@roeck-us.net, wim@linux-watchdog.org,
 vikash.bansal@nxp.com, priyanka.jain@nxp.com, lakshay.piplani@nxp.com
References: <20260807082855.3762394-1-shivprakash.gupta@nxp.com>
 <20260807082855.3762394-4-shivprakash.gupta@nxp.com>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <20260807082855.3762394-4-shivprakash.gupta@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Shiv,

On 8/7/26 09:28, Shiv Prakash Gupta wrote:
> Add watchdog support for NXP PCF8525 real time clock(RTC) device
> 
> Signed-off-by: Lakshay Piplani <lakshay.piplani@nxp.com>
> Signed-off-by: Shiv Prakash Gupta <shivprakash.gupta@nxp.com>
> ---
>  drivers/rtc/Kconfig       |   1 +
>  drivers/rtc/rtc-pcf8525.c | 245 +++++++++++++++++++++++++++++++++++++-
>  2 files changed, 244 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
> index 3c22c7253aae..6c1c7b3d27b6 100644
> --- a/drivers/rtc/Kconfig
> +++ b/drivers/rtc/Kconfig
> @@ -516,6 +516,7 @@ config RTC_DRV_PCF8523
>  config RTC_DRV_PCF8525
>          tristate "NXP PCF8525"
>          select REGMAP_I2C
> +	select WATCHDOG_CORE if WATCHDOG
>          help
Nitpick, sorry: this Kconfig file uses spaces for indentation, but your
addition uses a tab.

- Julian Braha

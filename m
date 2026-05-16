Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 797D43E1701
	for <linux-hwmon@vger.kernel.org>; Sat, 16 May 2026 12:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778934575; cv=none; b=TO7cQEx4RbTvm4QzUhZoDb/SPX/rLzVrK5d6GZ8IggFaK5uvnF0qi8etRvcjTmJHlQ8dz6wOQ1ebLwkA9o8kyLjDwlh3pHdx907oMgjm03GmwuJNAgCQs00g19csKDAdKKQMtgLXt95klKx5EqiJ28yIlgpKM91HtDq71caXSrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778934575; c=relaxed/simple;
	bh=1rX+FKhKupeqz5h2OPMmrXiIUNApyN55JDPyZD51/sY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PJTzp4z7SYxS87nTeZuiPjF1HIWIwXlB206sKZWwtY3uHYgeYb9zi52teVmyQaDAicTLvjwppiDb/F1gok7hReryEMmwRvNYu6QBJ4oPo6o3AEfVIj04jm9sxBMJhU1EmLg27CmpFaYFXa5lwmF22gbVnXDuQ2avJsGpwR3BpiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T4iXEQ9l; arc=none smtp.client-ip=74.125.82.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T4iXEQ9l"
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1354403c610so2121475c88.0
        for <linux-hwmon@vger.kernel.org>; Sat, 16 May 2026 05:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778934573; x=1779539373; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=503Th2kxYcv3cJvOPkWJW0XIgs4g5oDkF5q5qp/92ac=;
        b=T4iXEQ9ls+0Ib6Csae8zTFs6wB1r2LuDLGe2OouFl4Syrhxk4rGKTSS0qPQL8dkv4o
         mu78T+mR1U6KKHY//iwbFkJIUFufJBYqpjWuFSW7HZ+H2ocR12hKg5ogcS9TREKzki4k
         gyZaq8PRUNE8ycztWy7wVKpQ5tsx3Klld2o2nuvdBFlak21CGbDQB5D3FRBTSeJ6jc3s
         L8NGrTnHcm43HrNNmnl2s9+WfYo66ZmhFuyoDNnGqyVWcmvHtMjauPO6avxL/9z7fE4+
         X608qDaxVtYSdCLPFfXDbWtgPDMhO0vcWQLgsxed7fkM0ADHS1dZ6Q6MWQ+1pkHebLZZ
         pmIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778934574; x=1779539374;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=503Th2kxYcv3cJvOPkWJW0XIgs4g5oDkF5q5qp/92ac=;
        b=pLwW+P/CrsAuK9NfLdL7KXAoSWhAKa/bbwJQCqSkWXuQqqCyZX1xDArCexv6WXVEeJ
         EcqsvNheNcvgoZ/Td+r3WhCZSxXZn0FfuW8w2fPzCAH17Se9TjS4Yh/rjvGGacI804dm
         MNHdreYl4IUlyk1hgbYZLAe63MJBMJy1TE+3CZ30z4+9EDUNvWtpBCfddgPvQ0BgSZDB
         TS1slYStY77YXfm1nuB/FQ4GnHIXLNEq12RJDtlkQue5ReUpTgp9vLPTk5SFziRztj6O
         7CZ9OGqD2+EXaXv/mgGnt4e0ln91xW2R/C0ogAui7XKUvBun7KwOz2HfbmKYLEdgbTNI
         224Q==
X-Forwarded-Encrypted: i=1; AFNElJ+Zke87+GxRy7dZ/KPQrioP6WvaNdL/Grn85WK6kry+rwls6UTvP2V0WDuaTCzoEoiEDq5SuwneWpJxXg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwTaUOjXiQUmhsUJOurHcFt5djq8IjZ0H1sglbhlLsuqA5q5HQF
	8I+/O6vQ18DLOPJ0L9tLiHEVN+clYBoB6oE0xo95bQw3xOA/4llD+If5
X-Gm-Gg: Acq92OH5pwDxgpB9FBIygjNxGLONbd8AO2URYC1Pco/KU7mHP+9K+278edC8PxXhNW6
	tVlVucBX1JQ4zcctAbZ7Zts8ryjnpwxycxt2SyOueLT8DWobPFBeOGt19ByG1oRom/mJzelXluK
	x2AlWx5jr9WzEFYruAzPY/u9MCAui89hCru96rdJsE1k7bzupjnxtH2qHk9V56h9Ey7rTF/y3nz
	nzTlsZreTDBnz0dfZOnpYHXiLMVk9aMprW4FYKRYqXY0DO2XRDtRKrKPhoOAhiLg6YBipgn3MvT
	OPsc8vHhC7BSIoDgLuK3LIqRkv0ZYixAIUeRvhTqCQoViQ1Bg9gXSrfPX/k5mzW5twe6hNWVGJB
	HnHSbw9SOiTdir1x+oHbTpcFkmTsuuaa4ij9CD48FmJ1jxw6qiG26rT1XS2xt8v/VqSWn41eLT3
	K2qNyJVp42zXmHXbUXXt7ewZ78k7PVDxjkfkEX
X-Received: by 2002:a05:7022:688d:b0:128:d4be:7438 with SMTP id a92af1059eb24-1350552c64cmr3517301c88.30.1778934573614;
        Sat, 16 May 2026 05:29:33 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-134cc2351c3sm14539548c88.11.2026.05.16.05.29.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 05:29:33 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sat, 16 May 2026 05:29:32 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Hassan Maazu <maazudev@proton.me>
Cc: "skhan@linuxfoundation.org" <skhan@linuxfoundation.org>,
	"corbet@lwn.net" <corbet@lwn.net>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH RESEND] Documentation: fix typo in heading for max31730
Message-ID: <ce11a8ba-8ebc-4c09-b6d0-7e98febeae6b@roeck-us.net>
References: <hGgiFItk4iaav9-zfXL4hA_EVmxAaZYRbYviXz8aKKzOVAqduObTpd-PvRy1-9Ksuziam1HIXZNEkXbw3znqWX86Lplbq-Axo3fImYbtNZA=@proton.me>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <hGgiFItk4iaav9-zfXL4hA_EVmxAaZYRbYviXz8aKKzOVAqduObTpd-PvRy1-9Ksuziam1HIXZNEkXbw3znqWX86Lplbq-Axo3fImYbtNZA=@proton.me>

On Sat, May 16, 2026 at 06:00:01AM +0000, Hassan Maazu wrote:
> Wrong device name used in heading.
> 

That is not a proper commit description.

> Signed-off-by: Hassan Maazu <maazudev@proton.me>

... and you dropped an Acked-by:.

Guenter

> ---
>  Documentation/hwmon/max31730.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> --
> 2.54.0
> 
> diff --git a/Documentation/hwmon/max31730.rst b/Documentation/hwmon/max31730.rst
> index 1c5a32b64187..0936ba2eac24 100644
> --- a/Documentation/hwmon/max31730.rst
> +++ b/Documentation/hwmon/max31730.rst
> @@ -1,4 +1,4 @@
> -Kernel driver max31790
> +Kernel driver max31730
>  ======================
> 
>  Supported chips:

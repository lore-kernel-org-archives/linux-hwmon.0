Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57C46257AD1
	for <linux-hwmon@vger.kernel.org>; Thu,  2 Oct 2025 22:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759443259; cv=none; b=e22wxrzsXEdM0dsIofSjF9TSkNJmcmn1HHX8Sc8wruF31Ajpcs5tQPmYvGycSW9f8TbBURfUohm7CGtA4hgNnijwSpooP2viDu7o09sCab9zS9sKCFa1KkiBEoITiZx54MoCyjManfu6IBdOGY6n3aGAyuywcDxttYIVzsUyqlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759443259; c=relaxed/simple;
	bh=bJqxID90rzeZQW6x4VioAiM9HO5SSBRl9HBk2YS5H4U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jep9jkO7NK/MjxtUYwailQlgYgQReNbNrd7hJoAGn+3Wjd+Fls/GPsvCQ8H2Bh5XAebswpJXBwDVeNO6KGlsx3yvRQDqK48V70Igtp5CQiznqq80vZ2VxwmtvqJc7UeNAnaavV1j0gCr0onllhT2rITYiH0mk3qXQowKv7TZ4EE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KRssk/Hh; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KRssk/Hh"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-271067d66fbso14724865ad.3
        for <linux-hwmon@vger.kernel.org>; Thu, 02 Oct 2025 15:14:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759443257; x=1760048057; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=H3afLalH6Ixhx5uorw5x+fuC8TSKfvIs8t48zMbaAbA=;
        b=KRssk/HhYlk35ehaI0gpGlh9LYbeb2RurGBEnSf4DyrH6KZqkDs7PdwhtTiQ2du+eQ
         C4UwFbmMBk7UjEOaxS786ftH0b5GYx9FU1km0nXmfjuXcjs7Gw67WFKsdwDqxXuD3fsF
         FuRY18ILEzo/cYlmwFw34KKKo6buuuhbMm2LsQbW1jXEw/YTza3XsWk3vbssAs/VH1yX
         5/nSXipMMKAoRB0vBs6JcbJHacaYdgx5tb+3KW8LM7uVmdo5qEy0p83Z3l/232YqqkvD
         0WzP4A3GjHNNxBQpcbA8R5orfhwkF3q92akMxSQBSlj6CQQBekFsiCnv85P1oR/BbKKr
         dA5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759443257; x=1760048057;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H3afLalH6Ixhx5uorw5x+fuC8TSKfvIs8t48zMbaAbA=;
        b=ph6NzfgtqPVD9ZDjJW0ykS7zjJXA9ihAFfqYRrVrWEGgRHY9MkX5k1O/Xm/jzuCLUs
         genILUDdP06qMwzSUD99GVil6aNVEkd9YkZIWAu2xH9RYvrhKwPLQG/3reO4MoWbBol9
         uUjRLE0iYl+twD383DExFIReAAIiTpe4GZp+cOiO0eEaXI+dnbgbtVe93bKxA24tt6g+
         yzvT5kMafdEJw5J7emvTKAlEe44oLK5Qy58EtsodpXZDQNwggNx8yzmQfezVxFVjFeJf
         m57lTQ49uDsaJZfp6TfvGAB7iualqXMmAg3YO4c27i1AfsNG57voyEfn577ZR/GZH8l9
         rWdA==
X-Forwarded-Encrypted: i=1; AJvYcCWR80/7vlWWQtW/mB8lDkb8cTO3ml0pbss95zClFbYdKPZh1np7P3xBzLofzEpewOyrjbWImanxY/gJCQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxjuP0HdXEmYsy2zug5BfX3hy2Sh+il9bVxfcgfQ7+zFETV1oAp
	+rOoFFnzYKaHcI5Qmtu1LfWQY41lH8X4T6YstZaIiEBXKz3frcQw8TF/tJWtnOc1
X-Gm-Gg: ASbGncuVaMcvPmBUTTpkiLBFEeje4qNLjxl5rPOZoWbNAbzFp+uzkGk6rSGVsECgS4Z
	g9nZ96c6x/CWz8OYJDdv8dcQFR0FlAxz6371YsSID5orHZuEan/ph1Xo1IsgTX8BsmOFixuzxEg
	3ejo/URGH+t0mLaZMLL2WClZTZxsPilQOHntkD10yptAaQ/6k+D/Nt0eQ2NHknsEsZRtPbvm9y1
	tf7EkuFdN5gOjuniC4EJDjbIPf8B6HQooALUowPxaz5avM3GXR5w4h+1+DEUipxdF1Ygrp5K4nP
	gbOgbRlSIoWxLPiwcdEMUT6KsWvk8FJa79UECqH/addsxJ//dNGC+WWnWCZq232dJNaC1FTJFZr
	k9i8uA7ruO8RtyzkF3GsvdMbWrmkYp7Mvarcuz41l9Yb46lRf4WUC9qs=
X-Google-Smtp-Source: AGHT+IENBul3bFqweSZ0dwqDKMkxMEi9ojWTa2JsfjOjJH/8VekQN37yrh4kPtbRCy3N115vb7fIgw==
X-Received: by 2002:a17:903:1b4f:b0:28d:18d3:46bd with SMTP id d9443c01a7336-28e9a6be1bbmr9153845ad.43.1759443257422;
        Thu, 02 Oct 2025 15:14:17 -0700 (PDT)
Received: from localhost ([2804:30c:b65:6a00:ceaa:2ed0:e81e:8f51])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-28e8d1127a3sm30497785ad.20.2025.10.02.15.14.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 15:14:16 -0700 (PDT)
Date: Thu, 2 Oct 2025 19:15:09 -0300
From: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
To: Kim Seer Paller <kimseer.paller@analog.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: hwmon: pmbus: add max17616
Message-ID: <aN75bfJINa3nV57Y@debian-BULLSEYE-live-builder-AMD64>
References: <20250930-upstream-max17616-v1-0-1525a85f126c@analog.com>
 <20250930-upstream-max17616-v1-1-1525a85f126c@analog.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250930-upstream-max17616-v1-1-1525a85f126c@analog.com>

Hi Kim,

For completeness, the dt doc could also have the SMBALERT interrupt.
Though, I see the patch has been accepted and I don't want to make upstreaming
take longer than needed. Maybe the comment below can be taken as follow up 
patch suggestion. Though, if you end up doing a v2 for any reason, you can add
my review tag.

Reviewed-by: Marcelo Schmitt <marcelo.schmitt@analog.com>

On 09/30, Kim Seer Paller wrote:
> Add device tree documentation for MAX17616/MAX17616A current-limiter
> with overvoltage/surge, undervoltage, reverse polarity, loss of ground
> protection with PMBus interface.
>
> Signed-off-by: Kim Seer Paller <kimseer.paller@analog.com>
> ---
>  .../bindings/hwmon/pmbus/adi,max17616.yaml         | 48 ++++++++++++++++++++++
>  MAINTAINERS                                        |  7 ++++
...
> +properties:
> +  compatible:
> +    const: adi,max17616
> +
> +  reg:
> +    maxItems: 1
> +
> +  vcc-supply: true

  interrupts:
    description: Fault condition signal provided on SMBALERT pin.
    maxItems: 1

> +
> +required:
> +  - compatible
> +  - reg
> +  - vcc-supply
> +

Best regards,
Marcelo

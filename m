Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F86F15ECD7
	for <linux-hwmon@vger.kernel.org>; Sun, 14 Dec 2025 17:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765733615; cv=none; b=hWML+/6qQUugPa2pxHNbcroAaAwzp4W8Rg/wqeWDlqGuAyK0lg16cMCmuLbTlcuMtr5Twtj91zy476iKOJBTsOyNpWqZUiu4BgNuML40B+POuDL18HmpnDAEL4OQeh/0bcWseSRTHrA7rIrlQdWkgugIWoxH2WoPEbes3WjyfJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765733615; c=relaxed/simple;
	bh=Dm37EMpi3Zxb0eVw8+FCp4s49C1jxDhc4SPOMQFVkEw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=miL3eq2CXv4hEOEqAiAB7eDQEnwFpDdFCfNVvDugy7rwcidiTlM+GYJQEpAADaLll6PnDwUcIdX/vxMUb78Z/e1kTYTZDgM00PkwKvYxr1IGxziXmfjjk/nx5SAveXcYcClMHPr7ngVhh663I/E3tr5nDr6F3w8UeqlURORgZFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nXcahwTO; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nXcahwTO"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2a0d67f1877so4717315ad.2
        for <linux-hwmon@vger.kernel.org>; Sun, 14 Dec 2025 09:33:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765733613; x=1766338413; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TXk6TPYk8+ZYFjDKEi/z09ULA57HV2ZM1etIRlJumVk=;
        b=nXcahwTObyGjh2lmK+Q1iL2E5enbaNrkJ5Wyd5hzugEYjSfTsL9Oeq7aH1f306nx2j
         /pRaRUx/NbZgAJ/Qn9al7+S8WfFURS6XGZZFI5sg16KcERu5ET3C+QRXVfkrzOyPBZmx
         VhAWGbyCceLeXI9OkfHg3fH2FF9a5iyVhyFaFNptU5Q+cjfNhJPrB6HY/6gcnuOzt0PV
         OdIPkaZxdL8G7rU3NznF3P0xs7Jg58Vx0K+CLHrD94yRHELKAryMZkHlrPBjf3vgFk9I
         +5EBDfEBxGUuHLEdKD5myWB9IrsHreLiSSqhlW5GT8cLzZOKHDwT4NvZ0MDtkpE+4zJR
         b4ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765733613; x=1766338413;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TXk6TPYk8+ZYFjDKEi/z09ULA57HV2ZM1etIRlJumVk=;
        b=hTMpnX+hUGumpt0TSOA0geByPsUirdg3mW2FOiLWLf8c0ogCIPw+8Jzh7kYXSQtX2S
         WRkEu05gGKbmpsztGwSMKIxq3tsj/plU6+I7RnHeqtlAQzAYGxId2U/v4+5qCNTRm85X
         bHMrCyR0ZAjKGuUaigSe25FsEM3UK5WpRNcFMj3K9vlS2yacnHgzB57wya0+J7Pi0qAZ
         SFSe9Z0KVCRxIscUDyWqynrmhStHtdJKs3ezXifSVTSUNiLUszUkJWWeJ24KdbbjNB0i
         qX551evEA3LeG7bP9gW5yabcA4hgiITwTtL2vnIpByqUvlCvbj6s1Q3mQ4U5d16XO7BX
         GEzQ==
X-Forwarded-Encrypted: i=1; AJvYcCWhCCfFuE79YErLLlpwsMqBVC+jZd9A9pZTgKdUmKdXlmg7CnrtoM4LOpxUqRmSMJiVJ26gZ6bD//yyAA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxTYwxUzyoekPl9ANyzovE5vAESrOdHzWap1VCkanIAS5HrnZk5
	dkeJvgJr2gHRP1IsZwL+bGCjERrvz6Dw7Q5tAtJfhyAz0ns+n7abltDA
X-Gm-Gg: AY/fxX79HhDcRCqumQJoOQnhOFQyRERiZQKzI5H7digSoAxHKgalRUsTgA4FRa9dGce
	bmHQbbVa1PsDsqbxb5RIbH034qoBdJ27cV+SWKCqpW95CLsifG+yDiD79l82NThYwybTOkaIigd
	PHWult8AsXKc+9oEMHkDU/5gqDufYMt/rEbBeQXI9xfi/FyhQPv7+t0rw3NG4JfVcPIV2d8b1pi
	WC1MZTnjwMNbyyJy2uozWgLiyA24xwG+CFqcBB2rEsGrVjX/eVKB8wPwI4V7QMaZG7XRwe9GpJi
	jr559WO3r8fWnztBu3nkzWdJGM9iaBqqKN2mcAqm1lU9gsNx6ql1qPADVPzLYlVIJVqf40MxYtN
	VUSA/k+FK8YVXVIuz5qayZ0mc3JVQWOb0S6lCT86R9dDgtA8ylZZc3m5ONB9+TstT0pAmZVLhd8
	+gILE/Oo/KXZGsRbtZA5RlXsQ=
X-Google-Smtp-Source: AGHT+IE3lyVIQcqBj2s0WnOn6meb7SokjQJ45G1ZA0VAeLEdS+PW6sxa2PN6dpJ6PVHiFJyQsZPYNw==
X-Received: by 2002:a05:7022:2490:b0:11f:1e59:4c2d with SMTP id a92af1059eb24-11f349a4815mr6371803c88.7.1765733613251;
        Sun, 14 Dec 2025 09:33:33 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11f2e304766sm38281264c88.13.2025.12.14.09.33.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Dec 2025 09:33:32 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 14 Dec 2025 09:33:31 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Denis Sergeev <denserg.edu@gmail.com>
Cc: pali@kernel.org, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (dell-smm) Limit fan multiplier to avoid overflow
Message-ID: <8d2e047d-4336-4b6c-b349-a62c78324475@roeck-us.net>
References: <20251209063706.49008-1-denserg.edu@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251209063706.49008-1-denserg.edu@gmail.com>

On Tue, Dec 09, 2025 at 09:37:06AM +0300, Denis Sergeev wrote:
> The fan nominal speed returned by SMM is limited to 16 bits, but the
> driver allows the fan multiplier to be set via a module parameter.
> 
> Clamp the computed fan multiplier so that fan_nominal_speed *
> i8k_fan_mult always fits into a signed 32-bit integer and refuse to
> initialize the driver if the value is too large.
> 
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
> 
> Signed-off-by: Denis Sergeev <denserg.edu@gmail.com>

Applied.

Thanks,
Guenter

Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EED43B6C18
	for <linux-hwmon@vger.kernel.org>; Tue,  7 Apr 2026 13:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775569969; cv=none; b=SdJSFiNoicCrv6sCGarYipQnKr+TTT4wIox4MxTRgqBN+xsH4Ilsq6wqGZpeBitwNXZ/03BEKbFjYQfJz2GwDw/mnwtQrPYHlbviBPYNetjXYCIiQQkw+B2ZNTG4keRwARtIwbWdk9YLbkkeSEmpgG/Eu8ZerQHvnpdu98z6x8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775569969; c=relaxed/simple;
	bh=jFgLrb6d10whalQ8XFPXgXnn6wiGAQpyHMIC7UkCybg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mog1qSM3ZF1UOVygbLVluWnI/Tf8te6aQXjhCcO9JGHQKNLmvn79y8wDmAWfPLN2JDvgLN8vVUbvI4VL9pJC6A87sqfJpTyz1a7SEwI74CXiQLs9KlTmxx0lAafHy0MKRVxGGFiQoZR9XK61U7UO68xKsYPjrDDOLsjAzSG30kI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LkqV5PM0; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LkqV5PM0"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-35da9c0c007so4808472a91.2
        for <linux-hwmon@vger.kernel.org>; Tue, 07 Apr 2026 06:52:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775569967; x=1776174767; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V3u+B1dxGddFJGWsqIxZYs8PEcwoR//wfk2Adfj8h3o=;
        b=LkqV5PM0XKwBYPLDGg+BXoglMsOyVKq9jAIX2JTujOq4GVdp5hL9nsVOptGmYUl2+P
         7+02uqnLYVcfZesqjWxv/gl/CwIHeUF3FYUlO8AUoNWjsIiu+UP2cefMZ46THsnZJjpi
         2PFMiXKxVEqPbQFevClbRMCvagDZDX1fL0YmQf8oqeo8PWEQ2wpI9eCJFyhR+7JrfvpD
         utN69cCdYVFMuRkBnrn9HaMCHj9/2NURMQ7TKf/XuVck22Qy7hGDyIk2LoBVFuBW67TG
         emV4H41QoSntH5zwT8MMV+qvwr5NcAUzlbLkw9yzCcs2Nd1niEUtXQvYi2dFJTeaY1h2
         P1mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775569967; x=1776174767;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=V3u+B1dxGddFJGWsqIxZYs8PEcwoR//wfk2Adfj8h3o=;
        b=O/4gFIHHchfZzL10Y2V3noo2ivQFO/XXnBQK5GUKJh28q3lyy11iBMbfYmMQCcARFR
         4+WJA0ifDTamxwB5d9pzHxUcrpFXH+0uL53wP5wjV0N067x50IWMLJIkk00Fcy4nklaU
         2dbI4KbfyE5vW5AO2dppoNPV1N0BTP3Y0HISyLfhVGkeOjtCMPiEF0fYmd0V4c104XZW
         9lH6vR5jfR8e/xoN+61e5X1JbNGvEY1CA5VnSOzJDVS4lseYD5zcGwUuCAnKOo7uO+Op
         LDri2loOWqRwHUmQt9MRwRn+V94eTSvClwjdv1MPuwMatjLbmz+U0iQM63sXsmuSUGeR
         BpTA==
X-Forwarded-Encrypted: i=1; AJvYcCUdRwn2kGDM4h6pBc+W2Z5/OyVjUnWG3OoICPFiYA2XvWhQbGoMYAoc4i6u5zg5b6I86GZn7Sq8CBeegg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2IxNRuDISv6XWlWf3pCZPVJlrK0wDCIGXWRAd7ezfNe5esVDs
	Vj3DUIeYy3GPrPyWcCr+PxK+bG5UpPVVNjdaFGOu/88xa/rxaBAE5qtb
X-Gm-Gg: AeBDieu6MRlMEiEPu9S6XqdZapIK/FjGpPvLMGqN5Iz7wlgoKnLArkK938JTZWA4SQa
	us/PPKKY8b9Ry/6q4ZzgaQAIl3Cw7JybM9lHe+dnWoEkTf02fYAEEHI4UONAqsvp5BKYjH3ewuc
	ptxqu7kiLhEcgEC05oXGyYpR+qeGOHZ6vB6hKpmYBPO2XRKjPIU/4Lcrh1JzYdlWCJWrQliFH9D
	dYlMm53+yttLW1SEPoh++syh1DItVFvxuR6QIs+nGMfbwKOP3QYAp/MxZKKLTjCDBqu3r7opnoc
	cfOdcd76AEnm4xqGxus4N88acE4tcNvtjkU2I6t3paWfgfFzLZIiHIRR18/Eh51P2jFJZE8rpzs
	RaXuh78K+RzEZ/75jDY0IgABqqZIf8r4rnfAZptBqj7teiYbfIjYbuxxdAbf6YBENb2pHuEAvWE
	rn4D81ad/7wNlhZIZGOJqZwoKU0KUdC1T4w+qF
X-Received: by 2002:a17:90b:58f0:b0:35b:9ab6:1d4b with SMTP id 98e67ed59e1d1-35de68f2cbemr16231788a91.20.1775569967421;
        Tue, 07 Apr 2026 06:52:47 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35de6a2325bsm4959127a91.12.2026.04.07.06.52.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 06:52:46 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 7 Apr 2026 06:52:45 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org, Sergio Melas <sergiomelas@gmail.com>,
	linux-hwmon@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org
Subject: Re: [PATCH] hwmon: (yogafan) various markup improvements
Message-ID: <7752cce3-3362-42c0-becd-96dbc7b17cab@roeck-us.net>
References: <20260407052317.2097791-1-rdunlap@infradead.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260407052317.2097791-1-rdunlap@infradead.org>

On Mon, Apr 06, 2026 at 10:23:17PM -0700, Randy Dunlap wrote:
> There are several places in yogafan.rst where it appears that lines
> are meant to be presented on their own but instead they are strung
> together due to the lack of markups. Fix these issues by:
> 
> - using bullets where needed
> - indenting continuation lines of bulleted items
> - using a table where appropriate
> - using a literal block where appropriate
> 
> Fixes: c67c248ca406 ("hwmon: (yogafan) Add support for Lenovo Yoga/Legion fan monitoring")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>

Applied.

Thanks,
Guenter

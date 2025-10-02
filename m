Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F16DC2D3EF1
	for <linux-hwmon@vger.kernel.org>; Thu,  2 Oct 2025 20:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759438545; cv=none; b=a1OZT82uWlUHXRozf5nziyfjIWE8O+ce+kiasfCzMTwBeozUIbFVFOq0CkILfJIRhmCmwpIs36bYvxXAMcQeCUFw2cD+xOshAp8T0rZ5tFq7ecnwOjnocW6ssXL3mSLjKGKRDedYnwJwHLB3Cqm8hzu4eBnt5httJIfSwSOU/DA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759438545; c=relaxed/simple;
	bh=Z9iSGZ+S2wi6F1tMIvySWX/506OKQt3iTsYD6qsKENo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RB8bS0qkgldDztaE4GGgDLn0tttb9eDUbX3BYuEaNBFX7OGu0wbj0tqsaZ2/N1+6t+ZgNZLi+ODBD2OUvf26DTxs5GyzBpwHLfGNFDqFzRk5xUWFXTcw7VBRTtd5xOQxa8hRrUt8RPGSEKYAfsxBvi2jr12k0vhy6PRwqHJW0gI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b6RroNDL; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b6RroNDL"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-28e7cd34047so14287125ad.2
        for <linux-hwmon@vger.kernel.org>; Thu, 02 Oct 2025 13:55:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759438543; x=1760043343; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6nWNzw5rFvgp5+4E98Z8mggAdalCFOI1DScecBvxjnM=;
        b=b6RroNDLzLznnFNiaz7yXatY0jWMrfUxE6G4oZj97RRKJt3nNA/Uoej1GAKCEFdsvs
         gPcCTpedk+89YT2NI9m+xCepcN9tAzhroUcSOmxnS/KYxwlL1qAppLHLc3Awl7PJlAQu
         WrfubdDKUiNWZWFialB+7jVYioWbMsIH4+hTkvpsdd7M4DRGGe7+bprZkU02ksfZfKFe
         c4zir1AZZzZNGVPAGWfsEr63n8vf1L5A1J1UDHfRVhfNi7toMcZcDsExxz49GLDIZwwo
         uL28sDEuqh+cmU9Xc+9S8ImueUOnzcUscuO/5SG4CtoUKLxojCfbRoXseMj/T/DnTf6K
         E/EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759438543; x=1760043343;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6nWNzw5rFvgp5+4E98Z8mggAdalCFOI1DScecBvxjnM=;
        b=EkTwfg5bnEjHZcKDJqpKLYmNCICR1GyB7g1AqSnTOPMms5J9w4I4Iy6GD4VY+aHCXr
         +UN+oDOhMrUE4y9TArROv6BlUKass1HPf8SczomLtqOfPkTjpV5VdxB93bi/KxpUY9+j
         HR/CwZR5EhfsI8Nn/W44JV77fwo2mzonq4vJhHTxFYf5NHG1TUK3BDBVjPzvI8STR9OD
         Blz+YQn5OU8kfi+KsaIwHb9l3xHqO8ufNdDVVWjmnpySBnmwD3CEwe4w28VTX8q8dIAb
         +p93WKGaxGLW47Y0ZKUMQM/aaabufV2mfFJviXJebdkjR/9R3KjnmeNpmmtrtVwR1uoK
         okGw==
X-Forwarded-Encrypted: i=1; AJvYcCWoYoXdnipgpykVBwvIjeek/6Fjz2CmIn3mmgoae2asimyj44DqvQOxOjZWaVG+7sZW4oakgyrF/wFgKg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwdPMgrkGaepMLOcJBf+xBsaHA1uAXXkpMgDFCwtOwdMdRNVJMU
	03aIJgGLjjsfmUlLfzpcyEmBZHiCl8fMqTLnQ69tfEY9p5SWrIKxHs5Y
X-Gm-Gg: ASbGncthuRCbt2Tj0yO8SIxMjfBA3m7RmjAM8zDym92Wj8lROUkgnmDXcxfQDueh0oU
	8Ky9Isis2rGxzB7bGefelZRwPdCjF1lsfBDQX67n3tw07gDRCdk2r6asGFKR1NYVgxZsF56+wni
	P8zE33FMWGC4HelsQGe843VBp3fioqYzh6u+Rg1QdGj/al+t/qwOuQbjP12Z9A0LF+zuoG3frfF
	XK4RNpTaN1wETdJVKQaXUcGJehUp7BJel6yjMXJdtJ8WLdjtXCxnO0j3XiYbwnucCok9zVI7V3L
	cFnJKxI4Cz6sTQsBqZ7gTmr3+nrDerLxPRKQSQuzQf4f4ZJizWcLrZuPEGdnta2ruN8LpqAYaEF
	nTPDK4qsQKiNHc1rbwr2OJQOFHlPSEysiinCyctrbZsL4HMLZUYPrSiWA2sY=
X-Google-Smtp-Source: AGHT+IGYss5qk3VXhh2R+ZWPGB8ZQYoyyFAiwZWm24n7JZhmlZdFeuaqBerfiJZ6THmQhp0n8lu8ag==
X-Received: by 2002:a17:902:c405:b0:24c:a9c6:d193 with SMTP id d9443c01a7336-28e9a54661cmr8418405ad.18.1759438543174;
        Thu, 02 Oct 2025 13:55:43 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d1d622dsm29757765ad.110.2025.10.02.13.55.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 13:55:42 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 2 Oct 2025 13:55:41 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Kim Seer Paller <kimseer.paller@analog.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH 2/2] hwmon: (pmbus/max17616): add driver for max17616
Message-ID: <2731236d-e3a3-4fba-9938-ca6b10f975d5@roeck-us.net>
References: <20250930-upstream-max17616-v1-0-1525a85f126c@analog.com>
 <20250930-upstream-max17616-v1-2-1525a85f126c@analog.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250930-upstream-max17616-v1-2-1525a85f126c@analog.com>

On Tue, Sep 30, 2025 at 01:02:21PM +0800, Kim Seer Paller wrote:
> Add support for MAX17616/MAX17616A current-limiter with
> overvoltage/surge, undervoltage, reverse polarity, loss of ground
> protection with PMBus interface. The PMBus interface allows monitoring
> of input/output voltages, output current and temperature.
> 
> Signed-off-by: Kim Seer Paller <kimseer.paller@analog.com>

Applied to hwmon-next.

Thanks,
Guenter

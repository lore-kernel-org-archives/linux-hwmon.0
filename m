Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF87146AEC5
	for <linux-hwmon@vger.kernel.org>; Tue, 16 Jun 2026 15:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781625579; cv=none; b=bgTNbiCl2D0jc7R2MlSqohAOot13+tKDIWWhv3aVzpzCCwG1f9gTvEuJOeH91JezHe3yBgUx6bK8lme0K9CyMzB0xkoMydvvENHnujDe+ogj16UUt/CA9cVW4uwzVJxQCdCIap0rkE4j/7VBWkTHcoVAjpPyS8UOueguGDaPJW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781625579; c=relaxed/simple;
	bh=wfos8YW46l2Yhc+nFwbs7u+gPmq7+1EZsokr/nRJRBY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Iaqbv+rPSwi7JHIXS/UQxew99NUmeQdKBQ6uzaG2ODx6FMHjOT3o30gdA+97daRN78tvxWlDrPqqxOWcx0e6/lhib+ikoNCOlH7pVbBQzAjFSudJE+vkCim1TRbc0XBmEFr00Oz04gBZtp13xm0SzCLFKPWFi4pzyn/gJBxPMZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JA+grj0K; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JA+grj0K"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-c858014845aso1406a12.1
        for <linux-hwmon@vger.kernel.org>; Tue, 16 Jun 2026 08:59:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781625577; x=1782230377; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uSWVqVYBFNIaFXIOlsv9h9TEbEq9eBULKt8+LrdjY+M=;
        b=JA+grj0KsFOooI53z4jrpYsay0ElP3YHZbQfnSWlPpPoVCjBkFN/7Q+b3qo2aLrBOh
         bPlokCLdlmDXYdRNEcVLEw7W/cE5s86fR6PRjstY2LB132Zr/dqHEa4e04BwR+2ionsc
         sgwdaH4jX/ZiLaM+kll2CBQSluyIA1bzSMU7By7izMNgTSmfuYENRfP9i9wUsHdvFC8n
         OKvvwIf3asHzIyLl89Q4qW6uGpcU+drdZoZBQ6j4kQwBZNWCZlv8qlrCXg9bNAeTL6AT
         vvsIsrEs7dr4ftuogBgpTg9YXcVoh5vrsUWrJKyGiiwsn/6wc5oJrfA/ek8YePAbZ8Z2
         vNOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781625577; x=1782230377;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uSWVqVYBFNIaFXIOlsv9h9TEbEq9eBULKt8+LrdjY+M=;
        b=TmF1qLUJ5/CuwhDn1TMFRe/wo+IqoJb+nSeQjMg2TH73KTnXWH7uG4VtlVDk8a1Muo
         GCRI/c4+AzCUihb73q2vIb8nPgR+xMEUp4U3+bnIqw5wEpV7SuCWN64FhuNOuidAdGyZ
         cUF62lyccu0pZUArZMJUSBDC+JDvsg/AlH1N6MJVwk2eoBjlRYKXaWvc4K4OcCxf0pm9
         1jaeFcOFUIiXIf4VkXXptmrOPWf0K83O3wiJ/aSZLuPe/T53SVbuc2ccmr7KrF+GvHSU
         vBGQvW4E1BDnuS1gYe/l8U7piwfEQPTJIh6cLZSKoVkv4MeqOXDON7GEQy/vQkt7DDFC
         dblw==
X-Forwarded-Encrypted: i=1; AFNElJ+mt7XDbWJmzyVNpH5wnHN+UJ1F9qYTy5HL5tFTuOFUGgzP8rzT43EZiheCnD8tbf10vZt22EygFwRmHA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyU57CdaNib8H6bG3gh0fY3RuNkuW77R53gmd0ZbSqxmY68M8Zl
	f9exWa1QdpIa55V4kT2RS5G4cUPpRdrYtZIVergJaYm0e9/ohOc5pwKc
X-Gm-Gg: Acq92OHJbM1mM0R5hIbIqXfQFP/SpK9419gN5JFbqlAk1/PuisQfhpODDc5EWPaWkPQ
	JshA8VRAwnWi/BnOx38I/Wu9w4S4IWGmu0c9INlz86Q/xSoozQnTKxmBPu268Xfr9zQsIQA8Nl3
	Qd4TRZS8Id4a5ACZ9Mugn5x8o3JkI7h3mOwmeklz7Av0I51h1QScFgm2PY431yOdyzs9PEVHHIs
	hCzH26NdDPDL9ilbcqxrlF8BvdkZA1HpSeY3sA4bLAOBynoKzH/mxHc0tlaCDTZfnzrFeZnRBce
	cKygKGDzK0W7E0x/0dCaAb7ALCv8etbOlSfbBMBvq2I80W7d5tkWn03tuJKHUno0IwavBDz9ufl
	09WRsXBcKqjDcv8Kl7vRnTYm5oKPB9F5/pEzn2O5on9F+kL6s9tcIEERHZ4HfkEoK8itS2AEL0r
	4baz22mTGHSCjieszcMX7IvJNOZQlXDKA1XzxR
X-Received: by 2002:a05:6a21:490d:b0:3b4:6921:5665 with SMTP id adf61e73a8af0-3b7e2242adamr3765102637.9.1781625577305;
        Tue, 16 Jun 2026 08:59:37 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8665186d98sm11759708a12.16.2026.06.16.08.59.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 08:59:36 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 16 Jun 2026 08:59:36 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Martino Facchin <m.facchin@arduino.cc>
Subject: Re: [PATCH v2 2/3] hwmon: ina2xx: support ina232
Message-ID: <8ca66c86-c8cb-4e92-abcb-c4d68eedf0e1@roeck-us.net>
References: <20260611-monza-ina232-v2-0-e4375ce652d0@oss.qualcomm.com>
 <20260611-monza-ina232-v2-2-e4375ce652d0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260611-monza-ina232-v2-2-e4375ce652d0@oss.qualcomm.com>

On Thu, Jun 11, 2026 at 04:05:25PM +0200, Loic Poulain wrote:
> From: Martino Facchin <m.facchin@arduino.cc>
> 
> The INA232 is a current/power monitor. It shares the same register
> layout as the INA2xx and uses the INA226 default configuration, but
> differs in its electrical characteristics:
> 
> Signed-off-by: Martino Facchin <m.facchin@arduino.cc>
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Applied to hwmon-next.

Thanks,
Guenter

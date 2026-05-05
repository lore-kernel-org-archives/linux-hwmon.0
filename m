Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 428E4343D63
	for <linux-hwmon@vger.kernel.org>; Tue,  5 May 2026 13:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777987467; cv=none; b=kTBAyeXw14S2xAPnos5BlxVixSSqhucATnXGQLuCTnXtelQ03+y7t2f/Y8dQFr1Z5pUVRs4OUdvEJLTNItmn2vtAqtuxVVpJyKqL8qKzdmNL8ccPmPnjw/2BE6LpP9dOau2uD1e8V7BY0s6xUCcg3a4nP5WlLTmqRO0TlWBytQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777987467; c=relaxed/simple;
	bh=BCQQNzv3GON7ruA9Nlhu5qOoDFbRBmprHDZTlG0oWvE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nEc2TBdUdp3AtAhfcxQwbpq8Chcs9SD8HvIV15kTJOItFBui3FoibAAMbOD2hVf4zyIMKLOMjaKHzOayin/8HPgRkXQaBtnhf3W3tfBgkhFlv14cT7fsBO2htJVVI/6p9cY7uy08dIE1VGWhPNTHL6ky8WbUQ8DCk/HELh13rkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nAPhgQ3n; arc=none smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nAPhgQ3n"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-2ee990e8597so5258265eec.1
        for <linux-hwmon@vger.kernel.org>; Tue, 05 May 2026 06:24:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777987464; x=1778592264; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a+EXrgvvQiGT0IERMW/ekjto2TEHKAk+btDJAKmACAg=;
        b=nAPhgQ3naTVbWDaYqPFOuZhF5G65dF8GYeLCX7Xcm3fOI6FVu7l+nma6vXpQdcd9f0
         f1nYbryuiliiEz/26AihqtXuAHs+M4mnfiK9vx7PyXaEjhkWbJAFRRArkW2JceEOyOBQ
         lO5UCErBXKPpv0GNPukYSBpAanciX2E/4Jpfao+cQ2lvHHtK9VDE102fiWhw3CBp+Osi
         fVCWD7Gcir43l4KDm8EwW7Clk4n6+6HZEMJ7DMVmDcG9YLQLiWkuevbymY7JPWdPd3Yh
         6SFkpWEciIp2k+iM+nUcBc67fwitziF/3ThftrFrLPlcGniI7Yh96AhvA3SmIBztLqkB
         cKSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777987464; x=1778592264;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=a+EXrgvvQiGT0IERMW/ekjto2TEHKAk+btDJAKmACAg=;
        b=QCTYm8vdJ8nrpgsgpuD7PuI0y+QrKnyEggmsVKKwTjAWDh+EDDMJg6M2lYOKAfiIVd
         THu7YjCcDK9ncSQfTtfNv4pJ1Dtytl02JgMuGFR6EuuvKeJnJp8otOmNjZNgjNEWOGen
         By2oQtvsKklf6h2hwscOckQBkE9gJnyvS+oUQlQLBigESieA+gl6NQxH92cUHSpqYPqS
         zzPuEd2wsHuZPj5YOlpVLPst/IgGmx8YBYIkXT/QHx7MIruVMYlUGj/BubhmUtzxZQyl
         MQB0Adt2/BmupsmeQWzGhkTXgjeGm4jYt7gqhIbpPUI1bhSLGcEuVldShPvO/zQFJr8O
         b4hg==
X-Forwarded-Encrypted: i=1; AFNElJ9PUGN+GrsSvm/xIvKCSwrVtP8qfYBCpER2Rr7OVLCYNej18GqryLVGDWk1xMOLWU+nMMmlY74YPtcIjg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzbG5VgVLbBuGtRwxxXBIfluaKi49jfq7Hn947E5IL0hXarsgzb
	4zWFmULAtWNCjdIJSnZyyCvXI9zUPhKXM5h4yE2plMLGKl4pz+IXoZvw
X-Gm-Gg: AeBDietUSmZQUhecJ7icS+VEu1p38df1s9o1rQP5kruk+NM7bfwCkVsmC/67qsIWvmk
	104xTlX4rT7ESEK0LWwkzuzilrILVpvFkDPJTSLwvaGpFEnr6JTsq6PiW29oPBpeM0hYGr5HzPl
	JmcfxLv3HBJkUffdkT/ZByVGbSHw4l/3y8mbsU6vfsSHO9QqFygfV8SRbKTMVjOiDxifxPu6p0u
	0Aq18JMOcdTSoY2MJZrsInmZPN54VL+3VXm82Ucl7v5ig59krRjLyMQ9GqwvGJpIUo/9X2aVUF8
	yVqwPPjrk2z/jsH2IJ0obKun5g6e74hA2beM9HQ4TO7/PxonDwnrqXawjGT1xT6WGEcLskcdL41
	xrst5oE+4qkfu3VCebqseigNgoDx+VbFv0edwiL5rbHTVjTGjka3VciaclJ3Q0XTr+RnWq6GJ1F
	7lMT63CLwnTP/v6ZNRHOGR09yT43wdHB9vIcZBeW98sYUqVfRRS4hNj7u095isCitXmE39
X-Received: by 2002:a05:7301:1295:b0:2c1:7b61:8731 with SMTP id 5a478bee46e88-2f407a43f1fmr1223357eec.10.1777987464450;
        Tue, 05 May 2026 06:24:24 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ee3bb63c5fsm19728501eec.25.2026.05.05.06.24.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 06:24:24 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 5 May 2026 06:24:23 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Markus Stockhausen <markus.stockhausen@gmx.de>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	jdelvare@suse.com, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: hwmon: lm75: Add
 ti,alert-polarity-active-high property
Message-ID: <963eb802-0f8e-44a4-9acd-5319cf643db7@roeck-us.net>
References: <20260504151020.462342-1-markus.stockhausen@gmx.de>
 <20260504151020.462342-2-markus.stockhausen@gmx.de>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260504151020.462342-2-markus.stockhausen@gmx.de>

On Mon, May 04, 2026 at 05:10:19PM +0200, Markus Stockhausen wrote:
> The LM75 alert pin is asserted based on the value of alert polarity bit of
> the configuration register. The device/driver default is 0 which means alert
> pin is configured to be active-low. A value of 1 maps to inverted (active-high).
> 
> Add an optional boolean property "ti,alert-polarity-active-high" to
> override the alert pin polarity. When absent, the default active-low
> polarity is kept.
> 
> Signed-off-by: Markus Stockhausen <markus.stockhausen@gmx.de>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Applied, after shortening description line length to 75 columns.

Thanks,
Guenter

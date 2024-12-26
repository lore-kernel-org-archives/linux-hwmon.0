Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CBF585260;
	Thu, 26 Dec 2024 20:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735246472; cv=none; b=XJNbvKmFz85wDJ1+NCT2S79FAQ2zqDQrenaA1AvMbqysG9a8I5dGLNF+bHjkNlg6T4ll2qbZtLtoSdJd22Jl6JlhiPA9NDGACn+chy7Gl/VZWamPLZWZDdLoG1s/GRs8hAk4oW/a7re3dC4Af0G+J+lwodHm4sP8lRCSV6hXtXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735246472; c=relaxed/simple;
	bh=YPiD326lmXzsEMLEcYpmQ8FLbg2G0zF7ReYgzZwXSFY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kx9VQVNk5AYyzZmWoD9/lgviKwlZfbbIvJOGD4PNptxkpJ1nqHaDvYD6mV+Nm4wbbllVzZivozx/jTQ/rTmFETW59w3pMLLMQf33B6VQnaCMuPwR3m3Os9VZdwcCydg3XyB2Z2TwsubGSREeMPGU2EvCZcFlfajjT3roUfrevs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WSgy4ifT; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WSgy4ifT"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-21634338cfdso113766075ad.2;
        Thu, 26 Dec 2024 12:54:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735246469; x=1735851269; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vKHQOiXmHrUT3R7qAC97i9grcX8KfW086TyKBWaHvu4=;
        b=WSgy4ifTu9c9xZtZmHk9B7me7PsZyYojPYo/UT2hn7xPA0WhlXhLwYfwGXlXKEdaGJ
         R73rIVxhHEmR+91FAF/PwaHkm6f0b2j021aTGApNCXUW6fnJMrY1kcrQ4+2IZuipSZRl
         HKX0F8lN7Z7Z5tB2/aV455ZInNNYVgPvfYAeh7ZtxzpGAzuRa+2tOigLZNVtqq0Y6OdO
         cl1rfKzyX332V7+4No9wv0zOp1JHAJ6KDB7fJg7fua2m+eFTtO0dJe9Z9mdy7nNjVeWZ
         ATSPUdS+purOSZrtRvJm+CbWBokoNfQtTSnt6vI81TeMCoyi3ZXaNv7R0I9KMGs/SJL9
         f1mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735246469; x=1735851269;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vKHQOiXmHrUT3R7qAC97i9grcX8KfW086TyKBWaHvu4=;
        b=O7vcsrf0AL8X56k8wQanKa6Y8QdiQ5C7uau9Ii/Qh1DPLXk9xcCQRrygCzOMt0cphf
         jrWUv12qNnDzG4Hd8cnIhs4FUPY45DOgbLpNpLZ35qSykHVTrkNG6pxbgZnm6ApqmeQW
         WhtNUfrUNIHX1drxS+C5/ZL6+TwS0D0cVUko+han9Gh11NQFCZEhk5lKlg5auS407h1w
         OOEeU8lCEFXidYlN6dbUOnlzM3Q2l8rEt1Ij/tdtj3XVnSGoIeqL4jP9ONNMRxpIRtMT
         DGlr3E3pD3ssVfUmmtRAzRzfcTT7l52JAp5Vd2x5sxUwIBettJaixfwF5kM4+4HJUhm4
         quBg==
X-Forwarded-Encrypted: i=1; AJvYcCUsN3uWmgKYYImAmCxPVF08mK96s+uZZiDcCHfrgDqiCOiVzDuwcujRaR+1Y9C6pBX6htRm44JVN2NR6w==@vger.kernel.org, AJvYcCVAz5zQ3f52DZEJvOFzSCAWPpwBmXz0agW1TbGaOrZgL1RpHXTQDwheSE6oJAhu5qDPbCOuFVWkoWmiNNln@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9P4tWgYXYTmReJ5cSe5bycz9f/ZDTq0hxkBVfjsNpXtr616w7
	BWPSX1V1vrWrCLjyAEPS+kpwPeHpPBzrdumehGktSof031ihc+3w
X-Gm-Gg: ASbGncslEMdrpQKA8yxwV53bKZ2r8+l7usM7BIMA6B9u1+EutEJ8CH+mYJoNVJvRFaE
	nHMDPp/m3g2UV7SI2Rg9Ar2v4tt/6/ob4V0oRw5Ois0fOjv9efisGedtey2lfLypewjSOXXy11I
	07XXMdm06OMJo5xhsiwLqR8HFZqmhnFZSGZfWe2kD4DXQe0xuShcFQFEu+hUDnOYYEk8Qz8k3k1
	BX+oCqYMYaCweRodocsirXKcAfM6nSHNTf+J1JCZOcfPnKt7kT+/b5K4wLc3pR1m4+OeQ==
X-Google-Smtp-Source: AGHT+IH0Qxn5umR+KTzlQjYde5sZrgYSQpinQuxEWNC75JPAjTopOQpTnF92+10+0K31fB+tergQmw==
X-Received: by 2002:a05:6a00:410d:b0:727:3c37:d5fb with SMTP id d2e1a72fcca58-72abde8461bmr32672709b3a.16.1735246469324;
        Thu, 26 Dec 2024 12:54:29 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8db3a8sm13787100b3a.100.2024.12.26.12.54.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Dec 2024 12:54:28 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 26 Dec 2024 12:54:27 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: tjakobi@math.uni-bielefeld.de
Cc: Derek John Clark <derekjohn.clark@gmail.com>,
	=?iso-8859-1?Q?Joaqu=EDn_Ignacio_Aramend=EDa?= <samsagax@gmail.com>,
	Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] hwmon: (oxp-sensors) Separate logic from
 device-specific data
Message-ID: <90a41ea2-9a83-4245-88c7-b8dd97f5aabf@roeck-us.net>
References: <cover.1735232354.git.tjakobi@math.uni-bielefeld.de>
 <daa7571b0731e203b5a86e484da8083fd034601e.1735232354.git.tjakobi@math.uni-bielefeld.de>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <daa7571b0731e203b5a86e484da8083fd034601e.1735232354.git.tjakobi@math.uni-bielefeld.de>

On Thu, Dec 26, 2024 at 06:00:16PM +0100, tjakobi@math.uni-bielefeld.de wrote:
> From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
> 
> We currently have large switch-statements in all functions that
> write to EC registers, even though the bulk of the supported
> devices functions more or less the same.
> 
> Factor the device-specific data out into a struct oxp_config. This
> only leaves logic in the corresponding functions and should make
> adding future devices much easier and less error-prone.
> 
> Also introduce struct oxp_data which is going to be used in a
> later commit to cache device state.
> 
> Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
> ---
>  drivers/hwmon/oxp-sensors.c | 517 +++++++++++++++---------------------
>  1 file changed, 215 insertions(+), 302 deletions(-)
> 
...
> +
>  static const struct dmi_system_id dmi_table[] = {
>  	{
>  		.matches = {
>  			DMI_MATCH(DMI_BOARD_VENDOR, "AOKZOE"),
>  			DMI_EXACT_MATCH(DMI_BOARD_NAME, "AOKZOE A1 AR07"),
>  		},
> -		.driver_data = (void *)aok_zoe_a1,
> +		.driver_data = (void *)&config_aok_zoe,

I have not looked at hte rest of the code, but the whole point of
void * is that a tyoe cast to or from it is not necessary.

Guenter

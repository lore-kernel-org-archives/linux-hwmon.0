Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A28FC3BBA1E
	for <linux-hwmon@vger.kernel.org>; Thu, 30 Apr 2026 23:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777591065; cv=none; b=ioPsdey42n3ILcv+sg9pemE7Pc9Bq5WDIcUCzc07yKAi3HiZ3rsFzMkoxy+87wrjVtWUGj/9zTFv2jpl2xIgwZzzAVhkcErU3Qq1jWSV3Xb7YhdaZo6nfyflyKrlixX+6yVfcmZpq8Sig2P1JTz6mRB6eVxUj1sos6FkhK4s6+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777591065; c=relaxed/simple;
	bh=uIyWVp8D7mfhSE21zLSXRVsmni4doJzep5hg6+i9+0U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hjsAoCQDicwxZcVTmzW3CtoGTz0pc3Yv29vdJA8njBYA5KYTI3RslkioEgyK8NTPZ2cACZAGuxs66lf+STFMYzP7y5lxqUSjQ8BEW1VLNSzOQIAdmAdIdFAkQxinhiTH2Lr8iADyflel6UYUsDMS33wEymXqEy9T0iv+9X9Bxpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dtv8oWtN; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dtv8oWtN"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2b9705613ddso9018685ad.1
        for <linux-hwmon@vger.kernel.org>; Thu, 30 Apr 2026 16:17:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777591064; x=1778195864; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wPb32HxMm/+qEq7JGxjS6idVv7iM9pOULTkDilujde0=;
        b=dtv8oWtN33igI5jo76oZYU+erjlCq56x2vEuLEa/H2Ufddwkbygs9GyTZWIH1WyIvP
         bz4tLDyydb6gFN/6r5a5QDOgXPnXnk5sZmXk19FQtVnH1hhmS2eIU1oOrs8m8qEdNWx4
         vkrFWAvDTDiiFiec1i5ECF/Gp/Q9FrrhgsfJF9IfTXJLZIri22P7fTAZDXNSpZK/VldR
         kGFJXDoTWHki2v0e742kTPjRhtZuFZt/pVhpc0KMk42hGz3U0tOiHLpr3DF8I8Tgv9wJ
         x2ik3zIZu4obsUdlqm4qMPxiPM4NA1aRqBCHr516ZwwL5hu6y7QsLAGoIhCMl58DJwKU
         W6zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777591064; x=1778195864;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wPb32HxMm/+qEq7JGxjS6idVv7iM9pOULTkDilujde0=;
        b=gzuAcN7N4ZLasVZgOPeJ/WHxNQ8k8nzMOqlWUwIhyBlufbRJ5/LMtiDQGDM/cZ/Lcp
         0TNQZdmb5dkwMWBwszh9WFZgf3bm/tld3NXZ1oKDjLka3I8arISWEHFGAQohCGzhUQng
         qetzSXzgEjWomY61A/K0pbtA2Rq3xbmjPhXOT+aucMtCpvEBG49o70Kr7ivpJNCn3U6N
         lpyae1i4Cn5Fwnn4AQ5OuX1jBmze39152iv1OtAr8Kcwh+BchHI2nrM9uQssZQcdJjTg
         Ql6yVoxrwbaLV1mlat9JuwtnTyShkps5TpuxIwnRW4PK/DoMjSP/+oHbDo+IEim6DhQp
         TrLQ==
X-Forwarded-Encrypted: i=1; AFNElJ90DpvQ02yEQX3WFcjPO4ZDSlRyiIXfxpvCi5fL9e2OF8KQ37/PYDQ/FrnwGZwWuN0oXfgC327u2QA0wQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzNqZWU9hltE/iLhg4FA0gq9AjxetDB8oRAW8Rjctd20ygcuxk8
	Z8c9H6rBHea8xJNP3GPhUf95UvR9Mp943g3p9zT+8x3//L7/iBKEUd/J
X-Gm-Gg: AeBDievYADicuCIr50q9GdK9Ws4uIN3H+vknccxMi4AxcEeiJh7bRnh7di3Y9m9oYfV
	oZ2aIUYCWd6cEIdeLprGdOdKGtu7syOeH+8LsNo3p26NNhVaa5ynYNZLegagUhdgWzXskkmWP4r
	FP77m3i8cGPfSUI9X/26RgQuIVEXCtNSPcl1jMzd8OTbdGiIiR7cbHF0oIYiUHE02McnqvGEWYH
	7MEnQWUpCjMBzEQyBxMQ79zHM8OSbo/Q5XtmAxKFvlZGPem+wYLtgmpgFximzsnKwYUjebLtCAJ
	i7K5Uu6vhUoGHReo/7mV092WByCMwLC+2+qgqQHEpohTLyEtTexEpq2Fk6W2v4jNn7W67xprVQP
	4OT08KLn3VVn2GqmwEi7nHmtpSj/olE2syFoT3Pf0TYT51nXtTgHchUTagdxfqjL78ZEwn6C+TC
	XkbO1B9mWUdkKPPFiAgUhQnnQwq6tNzb+y5bc7dklkvU2X0s4=
X-Received: by 2002:a17:903:4509:b0:2b7:a350:463f with SMTP id d9443c01a7336-2b9a2316e61mr37002455ad.10.1777591063991;
        Thu, 30 Apr 2026 16:17:43 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b9cae58906sm6249995ad.74.2026.04.30.16.17.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 16:17:43 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 30 Apr 2026 16:17:42 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: florin.leotescu@oss.nxp.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Shych <michaelsh@nvidia.com>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	daniel.baluta@nxp.com, viorel.suman@nxp.com,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	festevam@gmail.com, Florin Leotescu <florin.leotescu@nxp.com>
Subject: Re: [PATCH v7 3/3] hwmon: emc2305: Support configurable fan PWM at
 shutdown
Message-ID: <931b8c3c-8555-4333-a660-e1d78fd67a00@roeck-us.net>
References: <20260429065955.2113012-1-florin.leotescu@oss.nxp.com>
 <20260429065955.2113012-4-florin.leotescu@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260429065955.2113012-4-florin.leotescu@oss.nxp.com>

On Wed, Apr 29, 2026 at 09:59:55AM +0300, florin.leotescu@oss.nxp.com wrote:
> From: Florin Leotescu <florin.leotescu@nxp.com>
> 
> Some systems require fans to enter in a defined safe state during system
> shutdown or reboot handoff.
> 
> Add support for the optional Device Tree property "fan-shutdown-percent"
> to configure the shutdown PWM duty cycle per fan output.
> 
> If the property is present for a fan channel, the driver converts the
> configured percentage value to the corresponding PWM duty cycle and
> applies it during driver shutdown.
> 
> If the property is not present, the fan state remains unchanged.
> 
> Signed-off-by: Florin Leotescu <florin.leotescu@nxp.com>

I don't know if Sashiko's concerns are real; if sysfs accesses are still
possible during shutdown, lots of drivers have problems. With that in mind,
applied.

Thanks,
Guenter

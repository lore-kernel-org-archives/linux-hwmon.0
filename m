Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F7DC382F18
	for <linux-hwmon@vger.kernel.org>; Sat,  2 May 2026 18:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777745887; cv=none; b=RjrSQSwQaGie5P4ydv/Fkgtrxe3ZD9HJGdDvjrDLWwiYq/kdrZEJWX/+rOuv3jgBAt3iz3xJCiE6UsVDy79a7QIBHW9KOhpoTKoMtW+Gp9dUKgWLisoAecUn4YkHr2/owERfyoAFyYdoxhkBUIhZyDBQZC3d4p5F5UOCMXiKQzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777745887; c=relaxed/simple;
	bh=jts4+FJYN6UyWxaro5eVJAAHa7cKOp7aG2a8YzJF8wg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XZCHg5djY6NpXvU87+YinVnlDxAduNx4udvw1Kc+1QAtQeXdndqFivp3YVFrBsZeXwAvC2y5qeoJwxtsRL38UddgNwsU2fHzGfvu3weg5cNrS14LApsIA1cAo9YXMfRDQ2J0PR0N6QmLKsPUmrmFf7NzZHQNo17jPV2dZq03iso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qQejEsH7; arc=none smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qQejEsH7"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-2ba895adfeaso3193069eec.0
        for <linux-hwmon@vger.kernel.org>; Sat, 02 May 2026 11:18:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777745885; x=1778350685; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1rTKLeEzmcOTeOi8iU/w4Bp+3pGJXAWFdcis8mzt4mc=;
        b=qQejEsH7Esa17Od1nvfjpImi8puShPk8STt8n/Gfupn3SS+cRL1kfaKiCLSRBwcVWd
         UV9s+AdmivHfnqmFvOMw9KjBrTunB94G9X4cTAqVsI1TREs9r2aKyZJSnXZzMnaK1x/C
         VHbOf0bJse8XIRbW1MIxM2YbK3dlARwCZFBmJc4DLaYddinATjDlXfZm+/BhncdbVRv6
         DJNb3cClZstephKWznOfr+dYZqxAUVefuB5a6wXOgHMMoHns/ANNBe/ZDo9PAxK/VsQ/
         NhAPVu7C0kzezY6ijFSDVMTTdggLBJ8ozajt8t1EQdNsdmu9/oe0RMc9m7ldU1kkli/R
         AG3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777745885; x=1778350685;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1rTKLeEzmcOTeOi8iU/w4Bp+3pGJXAWFdcis8mzt4mc=;
        b=g+L62LJGlRpuSayrF1/M5bonCfRAlpskMI81P3OjSahW3fUfplfIHnz6F8NglfixhM
         EDyYedzlOUTWsAEie/OZgvz8wHJSyA4wxM42CpxAdHxpn2Ef1VMR54M7NL07uCnzxT3P
         XdW5clokNqFBNsBTm4sDZ2ligk1vssDJFhtVFwWGmCRxocKp7mopWCSVW9PYfwsam9j+
         HG4pUh2V+/mGt2S79yI27uu1ZHkuFcLvEg5vlGWHW/NBz7CGNafkjaeYVgeAoFexZ3oT
         4l7TqQTGEpQfShCbZCAIqFALfINHElRc+Ef8K3UlzqLQ099/Suc5CTOAQXUaqKGLevDE
         BGIQ==
X-Gm-Message-State: AOJu0YzJEOpxWgA0C9kC0GFvFUB2LuPxLzJ5RyXwtXq0R+BGsI+AaEYw
	W9uWQbPyEpiiKk2IMqqxsjQJjnIymef29QvpE4wRWUFmye2hqtDbFYf0
X-Gm-Gg: AeBDietl/3Mm9KXdXd8wqJBTQSBZhTQBUVIjDp7Q/SeZiQqiD74vLTtnZhB+3oU2Ci9
	8K+QtlL9of2D7MgcoxoCCaAd03bPX3WXsklQKmfI3OM2IkAixBN7zd4Ev2htvgH0UcoOZmh+yLT
	2zzeHR9HgEF7hsZJ4G7i7BDhf+SXP6mv4Y2PwtwijnfXYO6h63PaG2HK9elIWH1swIEWIQBnJcL
	nfaq1+NTlG8+0saxTg8NowjNdWBXjyuqDIKvuMrRTyBzwRlAt3ZsTZRnBiikwTxPwt+RdPbVpCL
	ekE+z/t9RJHgwXudKh7d5vBPR+9jDfuh1c1s48dRcevoGml27tgfBebWwiPSV5M0Fv9mqwEJcj+
	0B9kc/GSrMVYc95RwZffgvxBXXYv58ngu9xa7TYg+L2LJWfzLoDGH2zzH3dfgjC1bST0qlhM3Fj
	q9dsZG2aRIhXdzPVhy/Cnh4zaaxUZwQssOzdr3Bs+XdMFvTADkPEtGmxBVNw==
X-Received: by 2002:a05:7300:ec0a:b0:2df:c5bb:3720 with SMTP id 5a478bee46e88-2efb8998ae0mr1737914eec.15.1777745885309;
        Sat, 02 May 2026 11:18:05 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ee3889d611sm11866491eec.1.2026.05.02.11.18.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 May 2026 11:18:04 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sat, 2 May 2026 11:18:03 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Tabrez Ahmed <tabreztalks@gmail.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	david.laight.linux@gmail.com, me@brighamcampbell.com,
	shuah@kernel.org, Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH v6 1/3] hwmon: (ads7871) Fix endianness bug in 16-bit
 register reads
Message-ID: <9eb1bafa-c3a1-4f3f-b210-9257bf347c91@roeck-us.net>
References: <20260502020844.110038-1-tabreztalks@gmail.com>
 <20260502020844.110038-2-tabreztalks@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260502020844.110038-2-tabreztalks@gmail.com>

On Sat, May 02, 2026 at 07:38:42AM +0530, Tabrez Ahmed wrote:
> The ads7871_read_reg16() function relies on spi_w8r16() to read the
> 16-bit sensor output. The ADS7871 device transmits the Least Significant
> Byte (LSB) first.
> 
> On Little-Endian architectures, spi_w8r16() correctly reconstructs the
> 16-bit value. However, on Big-Endian architectures, the byte swapping
> causes the first received byte (LSB) to be placed in the most significant
> byte of the u16, resulting in corrupted voltage readings.
> 
> To fix this, cast the integer result of spi_w8r16() to a restricted
> __le16 type and convert it to the host CPU's native byte order using
> le16_to_cpu(). Negative error codes returned by the SPI core are caught
> and returned prior to the conversion to avoid mangling the error status.
> 
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://sashiko.dev/#/patchset/20260418034601.90226-1-tabreztalks@gmail.com
> Suggested-by: David Laight <david.laight.linux@gmail.com>
> Signed-off-by: Tabrez Ahmed <tabreztalks@gmail.com>

Sorry for the confusion - this is the one I applied.

Thanks,
Guenter

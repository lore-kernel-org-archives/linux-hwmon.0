Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=178.238.236.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793057205;
	b=qGow59nmH4fPDt7JXq3lySbUkBTK0r9UjKE3Veojs68FwZP+tjtYvQXtll5xBWXVarcu
	 Tk6L+RaFNRbR3znaatwGMUUBsqDfGDITiY7SfHjPBaapw3aTy2oRukkFknFsR5wYGa0re
	 EiHsB9+YoyueL/7lqPuI/Vb4HRoTdCxQwFp/KYXtjTy6/SQkCITcR7oajMj4ja1lxtJW9
	 uEQ5FhB6nFyfig9WjBSWA986CN3B9Q3oaP+WYFVIaN3l4+L1Gak79/qH/J3oFyHqnhobX
	 7jUPPJNBEXtp0Tofr7kO88Rgxp57+tRnVHuSCD1g1jxi2Ne1LDKg1X2mdQB3/alJQPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793057205;
	h=DMARC-Filter:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=TuMxpuKm0GqZ9iLgROZ0NfIBSu1Y+sVk0Mx1hT6klxU=;
	b=I5/2ENbTMclJuhTj6JIoAUY5e7uq2r992GID/TlvYQbNFhaAyz50+rxwVQXS2y72vVsp
	 BlDeoYUnExwLBQ9P3NemZDxvb+YsvO2X/s8h8+my/Szrcqh0gho41kZeXFHV6ralmPHCW
	 VtvMPEXQFnBIXpn122cIakHu+CLFsBbGZj4CMtZuTVsIHJFOwm28+bROYuAIETq3GhWyj
	 5DkJWwb+xHSTigtiGkiewAfwr4hmYxeWodDawaAWVT9/SzMqCFnx/3gT5zjqqgZh3gvgg
	 Vney4kkYxII9C5pHycj+etBXhTfJorcthYiHM/AKW7vMtJMdhCNawBq+yP7fDv+AjhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kemnade.info;
	spf=pass smtp.mailfrom=kemnade.info;
	dkim=pass header.d=kemnade.info header.i=@kemnade.info header.a=rsa-sha256 header.s=20220719 header.b=LqOoDYWG;
	arc=none smtp.remote-ip=178.238.236.174
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49D5A606A337;
	Mon, 26 Oct 2026 23:26:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49D5A606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kemnade.info header.i=@kemnade.info header.a=rsa-sha256 header.s=20220719 header.b=LqOoDYWG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description;
	bh=TuMxpuKm0GqZ9iLgROZ0NfIBSu1Y+sVk0Mx1hT6klxU=; t=1793057205; x=1794266805; 
	b=LqOoDYWG6IGZbfmhG25ui5A78fLxB0j2g++tevB9nTK1xRals/+UHVpF44SEbY2zlmSfMfovInb
	9hvqRhNAnI53CBIPF9UXpHmR1TFFlW8T2ItUiUVyLD+VbaOH4EmIEz+u2hyaxVo4aWHVXrUsN6Fbn
	Li0s821gzOAh1+Xd0KPcPVRh3lzQFikHywbsf4ynYrb4ypD2LhL9AKTPO+deWv6CD9kBD6Sij5fNs
	OtQU+rUN1fMNNzfKA2rktfERRff6n2BHRjqm/z4IhSJDBhFMwO1fT7kdqvEuTGqoeXmDBzcMQmdHx
	rfp1x/rH0E60IwXVe9XrxHtwk3KJaPhWTcUA==;
Date: Tue, 27 Oct 2026 00:26:35 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Pablo Mazzini <pmazzini@gmail.com>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Lee Jones <lee@kernel.org>, Alistair
 Francis <alistair@alistair23.me>, linux-hwmon@vger.kernel.org,
 mfd@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/7] regulator: sy7636a: report the temperature
Message-ID: <20261027002635.6b831c0b@kemnade.info>
In-Reply-To: <f68279bc-20f1-41a9-ba5c-92b974785cd8@roeck-us.net>
References: <20261026003918.155321-1-pmazzini@gmail.com>
	<20261026003918.155321-6-pmazzini@gmail.com>
	<f68279bc-20f1-41a9-ba5c-92b974785cd8@roeck-us.net>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; aarch64-unknown-linux-gnu)
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 26 Oct 2026 07:35:24 -0700
Guenter Roeck <linux@roeck-us.net> wrote:

> On Mon, Oct 26, 2026 at 12:39:16AM +0000, Pablo Mazzini wrote:
> > The separate hwmon cell enables VCOM at probe. Report the temperature
> > from here, as the TPS65185 and FP9931 drivers do, and under the chip
> > name as they do: read it while the rails are on and return -ENODATA
> > otherwise. Boards that need the rails on mark VCOM always-on. Drop the
> > hwmon driver.  
> 
> This is going the wrong way. The correct solution would be to convert
> the hwmon driver to an auxiliary driver. I am not going to approve
> this patch. I am not giving an official NACK (yet).
> 

First we need the problem defined, then the solution, and then we can
talk about what is the correct solution. The commit message does not
name a problem.

So what we have:
one bit to turn on a bunch of things,
after one time to sample (< 1ms), fresh values are provided on the ADC
register periodically.
after some more time (max. 50ms), several voltage outputs are ready.
Powering on those things is expensive, so you would not use this as an
ordinary temperature sensor.

The problems I see in the sensor driver this patch might want to solve:
- problems if the regulator driver is registered earlier.
- not having powered on the regulator all the time (that is described
  in the cover letter)

The way the patch handles it does not require any structural change,
availabitily of the regmap is given. So it would be a separate cleanup
patch. 

But it introduces another race condition.
The temperature might be read too early.
1ms delay should suffice.

The  SY7636A_OPERATION_MODE_CRL_ONOFF flag might be reset before 
reading the temperature. If that register does not reset to zero
but just keeps the temperature last read, then we have no problem.

If not, there needs to be some synchronisation between the regulator
part and the sensor part, probably a mutex saved in a common structure.
And in that case, structural change of the drivers is needed which
I see the following possibilities:

a) non-simple mfd driver
b) aux device as a child of the regulator driver.
c) regulator driver containing everything.

No strong personal opinion here.

Regards,
Andreas


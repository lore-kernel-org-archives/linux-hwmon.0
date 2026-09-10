Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0C1839E17C
	for <linux-hwmon@vger.kernel.org>; Thu, 10 Sep 2026 07:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789023672; cv=none; b=qOYFxwPM6EVGiyr6VpzQmnkHabYfw3dASjQSWJlZsqFPq2XyWKmKggmLZo+xMp8dM+E5xZgcnebFZPoShVkB0+v8rYaaG3q5dTdh4xnx1l5c2Mm+35Jp0cwjMQr269K+BEQUh6w0hhim1n2DuFRQkcJAOMmNByt6l+axnT1iJJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789023672; c=relaxed/simple;
	bh=39qjdQpv/Zd/usFOms8XcJOqA2TxHP/SPA42YxXPiEg=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=b4KJwomXa9z4wY1Kcpgq40ic+M8/DBfjAXSFVU83fvaK65PbWvfIuMnQzid/OneGGc7l6w1PIXqvwp3vr1fl+1wVNvPf+/5KVb/IJqg7y1rFyaUV9DcbJChxQIpCFM9gWE0NQOCK87zryjEblh5V2R4s0VlOqn5pmLvftnQeBNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=GMOG0m2S; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="GMOG0m2S"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 5D37F4E415B7;
	Thu, 10 Sep 2026 07:01:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 18C76602B8;
	Thu, 10 Sep 2026 07:01:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 833BC11C7AFA4;
	Thu, 10 Sep 2026 09:00:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789023657; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=moZmuwdhAHffTIXrCepgjiJWqMPrDet/eOSiRWDzc8A=;
	b=GMOG0m2S3u4f2JTgoLH5G8Um2Dql+X3bGcX4wZLmd2yB/M6VdNjGujQw8WT9VfSuEphGbw
	xs3Lm194t8WXcwkIGCx9eHEAIl7iHym8hlAhybFW8kTla7VMD3CGlbWCa6Wn1+HFBkqFYp
	DQu1/SwxjomBCQiu7i1ziTDFyAEQILJ5oSAX6Wd0kST6xrv6xcvA5mrq4iD2KnhwyiPkQy
	Ga+KY2NyJf698F1YRNlLN62/d4tyG5RIpRlzLu5quwctR1Us+E+VtqnuVQUJE9S9fi+HdT
	0FwfXC2q9cBhoVwMM9J9ubpVHuO++dA0wO9jmfTNw3rC2HuNz/89JlMz8yb5yw==
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 10 Sep 2026 09:00:50 +0200
Message-Id: <DLBFYF283RPD.BDAHXD7VCGHQ@bootlin.com>
From: "Paul Louvel" <paul.louvel@bootlin.com>
To: "Guenter Roeck" <linux@roeck-us.net>, "Paul Louvel"
 <paul.louvel@bootlin.com>
Cc: "Jonathan Corbet" <corbet@lwn.net>, "Shuah Khan"
 <skhan@linuxfoundation.org>, "Randy Dunlap" <rdunlap@infradead.org>,
 "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>,
 <linux-hwmon@vger.kernel.org>, <linux-doc@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/3] hwmon: (nct6775) Add support for NCT6126D
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260909-bootlin-hwmon-nct6126-v1-0-4e85615fef10@bootlin.com>
 <20260909-bootlin-hwmon-nct6126-v1-2-4e85615fef10@bootlin.com>
 <be37aafc-6b6b-478e-b01e-9e6f0a932608@roeck-us.net>
In-Reply-To: <be37aafc-6b6b-478e-b01e-9e6f0a932608@roeck-us.net>
X-Last-TLS-Session-Version: TLSv1.3

On Wed Sep 9, 2026 at 10:28 PM CEST, Guenter Roeck wrote:
> On Wed, Sep 09, 2026 at 08:25:55PM +0200, Paul Louvel wrote:
>> Add support for the hardware monitoring functionality of the NCT6126D
>> Super-I/O chip.
>>=20
>> The NCT6126D hardware monitor is nearly identical to the NCT6116D: the
>> fan, PWM, temperature, TSI, alarm.
>>=20
>> The differences are:
>>=20
>> - Device IDs 0xd283 (A version) and 0xd284 (B version), which both fall
>>   into the NCT6116D ID range (0xd280) when masked with SIO_ID_MASK.
>>   Instead, compare the full value to distinguish from NCT6116D.
>>=20
>> - One additional VIN: VHIF scaled at 16 mV/LSB.
>>=20
>> - The fan count limit registers are documented for all five fans.
>>   Also expose fan4_min.
>>=20
>> Assisted-by: opencode:z-ai/glm-5.3-flash
>> Signed-Off: Paul Louvel <paul.louvel@bootlin.com>
>
> Signed-off-by:
>
> I can not change that, so you'll have to resend.
>
> Thanks,
> Guenter

Whoops, sorry.
I guess manually adding this trailer is not a very good idea..

Thanks,
--=20
Paul Louvel, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


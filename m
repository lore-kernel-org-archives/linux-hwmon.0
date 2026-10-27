Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=178.238.236.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793136782;
	b=T2/fSv0PF3BEnf/Q1DN6lzWzHPGIs12V3HVWNL6g0FdO+2HN5rODvN9ecseR0wv9QrQ1
	 pzogPGrY3WcG8JLBws1um5eco0K0LN9cPmeMnTpFdFff2vMKoy02DmGUkiHYJMXrHticR
	 8/y9O7+Jqq2xuAsUAIYyg/p40L6Ud9QdO6Gl0Na5NxKRxeLYQd6h9ErTFJIZxjdN0LuD+
	 vqsY9bCcBjvxMYoM1Gth8w5qZX98OiBXoYEWPX31pwheMrUu8KkIW5rg5t1vcFCOIMbu9
	 O+FI7h2L04inf76cCwfi0LB4AoTkKtPqUh1wNcOApush39SOZ6yQAh6bR7GDBg7mLeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793136782;
	h=DMARC-Filter:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=wllQShmR/JuCZFw5HFfsjOJ/1ZX6yyXsqzheMstswmQ=;
	b=ed24d4fDyLx6vuvl58roVpZlfrERMmd5bVSrUD99rbh9wnE/obFXlNhT8qtctfPBMS5k
	 cLacP8w3KPK5x8Dk9KTudt9T4nvvPl48o3K/EcIpSMHJ72/jBsinGjH2iDWjgYGibcbnM
	 8aGlNG7Bqh30FsA8/zNmn/OSfL/jRy9ePMNcOI5BnbEMmlu089VmoZqfHA8gzBfcS6QuV
	 Chtru08MrpB92gOPqRbTuds5/LTay7basCKUTQtQ/yZ2DItF9ATkZPCQfltU1P8x5SRJW
	 KkijCVegCJpApGUIuZHAPp8P/dzQksQDT4NgGQHjwK8Z0KQ8qgWxUKznEFG8HEeVYsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kemnade.info;
	spf=pass smtp.mailfrom=kemnade.info;
	dkim=pass header.d=kemnade.info header.i=@kemnade.info header.a=rsa-sha256 header.s=20220719 header.b=Ra5YU8uh;
	arc=none smtp.remote-ip=178.238.236.174
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AFF5606A31D;
	Tue, 27 Oct 2026 21:33:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7AFF5606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kemnade.info header.i=@kemnade.info header.a=rsa-sha256 header.s=20220719 header.b=Ra5YU8uh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description;
	bh=wllQShmR/JuCZFw5HFfsjOJ/1ZX6yyXsqzheMstswmQ=; t=1793136782; x=1794346382; 
	b=Ra5YU8uhT5uVyerFM1RFhRwKzJgAyR2o4jW/ms2nedvgAnIo+ObGSZWKoRxo3PblEoIJiDewHGI
	YysKUJogGdZaB3x+sYTP0/e9c78p68UA4S1/V0eFoxryAKkPffXAfCSqHvNWqXW4lB4r2/VFN+nPY
	qUGMhz8xeloZ7kbxIL8Jk05oMnGp+mzwV2g8aHaVVKDsX+OcYMtyP3Da25ht9Wvuwf+tDnZmudz3A
	QWQ/NtxQbA4W0X6qHSzvdhdq8UKuPd84fbLN1RcbDQfVytQvQBJhdvHAoiLPCP1FaoKbYnIajB8aD
	EczlOGWJPwQF/k5kbgg6T7ydcieHXsVIJCxQ==;
Date: Tue, 27 Oct 2026 22:32:52 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: Pablo Mazzini <pmazzini@gmail.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Lee Jones <lee@kernel.org>, Alistair
 Francis <alistair@alistair23.me>, linux-hwmon@vger.kernel.org,
 mfd@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/7] regulator: sy7636a: report the temperature
Message-ID: <20261027223252.044bb5b5@kemnade.info>
In-Reply-To: <20261027101852.39b9031a@kemnade.info>
References: <20261026003918.155321-1-pmazzini@gmail.com>
	<20261026003918.155321-6-pmazzini@gmail.com>
	<f68279bc-20f1-41a9-ba5c-92b974785cd8@roeck-us.net>
	<20261027002635.6b831c0b@kemnade.info>
	<CAAxh=jsKe95EsKnTypXtfTxGhYCMO1E7U=hWb3y6DBpgoiOVUw@mail.gmail.com>
	<20261027101852.39b9031a@kemnade.info>
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

On Tue, 27 Oct 2026 10:18:52 +0100
Andreas Kemnade <andreas@kemnade.info> wrote:

> On Tue, 27 Oct 2026 07:32:14 +0000
> Pablo Mazzini <pmazzini@gmail.com> wrote:
> 
> > Hi Guenter, Andreas,
> > 
> > On Mon, Oct 26, 2026 at 07:35:24AM -0700, Guenter Roeck wrote:  
> > > This is going the wrong way. The correct solution would be to convert
> > > the hwmon driver to an auxiliary driver.    
> > 
> > Understood. In v2 the hwmon driver stays in drivers/hwmon and becomes an
> > auxiliary driver of the regulator, which binds the I2C device directly.
> >   
> But that is a cleanup action, which is at least a separate patch (maybe
> replacing and exending your patch 6). So the other patches can go into
> their separate trees.
> 
looked again, I was wrong here,  vin-supply should be enabled before
i2c transfers, so we need the aux device approach.

Regards,
Andreas

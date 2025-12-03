Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1331A33DEF9;
	Wed,  3 Dec 2025 18:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764784845; cv=none; b=t+Vxd9iyLWGk+yKjM69XVwp5ziBn/C9CWXkILdF01/g7DxQzIXh7Mu31/j3Qj5RuZJKQwrijKaI4JNbgiLKUBBOCXpg7qA9IVMsASf9e6BNGQR6gMjYeomUQOLJX6mQrY3gWXxV7lb53p+C/E3ZXwSkGMZmd8PVP7HtRy23uurk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764784845; c=relaxed/simple;
	bh=vuuVHHtktayUoTEuEFFbdlLun5yme9x2zZaj9iynXFI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=k3NWAlXQCoqTuKyyT2yM2vdfJDzR9+KHsbYgSc0tbjjdXI+xNPTJThyvt85zAFZDTrfDZnHc/3Ro/XyXblYkYCzU2tfm/PNYYdUYgPmQuEEw848P59GHD7645aZ6qzWNbXymUrha1N7xgBgq39f4rUkXyMSQEByTvIsVs3+dsQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=ief1yeFN; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="ief1yeFN"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net D77594040B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1764784843; bh=aAqZc94ZWmMbwhrELeuIBnu8KYCEwPtdhoRA4F38PPg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=ief1yeFNtDWYEXIBgPW7iUD0urciu41mhuXvUPCdSzKbgD8KSvWIVexTYK98lfUUv
	 iXg7B/1Iq1fS1I3wyNwUA2FmAXfJaOWkDpiVUsHo8vtqwwLR9xuAdRn8D/mIbtD7+G
	 49ZaY47Vqo96VIAQrvzD5W3cJiTBGC56hXRudw+/fPshaeJNxk7TiKCo5kpz5vw9xy
	 4l/WITNAMxSSh88JFDOPGANj8Uh3KCZ6koxJr/MwWpEc0yO3p7b7nY9ftJGLVQZHW8
	 ddclS4zlr5neC0/ibFWaQVFcUdnd5+z2iTP3JD61owk65XEcaL4JgYnVXE/YjJEOs1
	 t8qxjG7sljo8Q==
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id D77594040B;
	Wed,  3 Dec 2025 18:00:42 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Soham Metha <sohammetha01@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Cc: shuah@kernel.org, skhan@linuxfoundation.org,
 linux-kernel@vger.kernel.org, Soham Metha <sohammetha01@gmail.com>,
 Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org,
 linux-doc@vger.kernel.org
Subject: Re: [PATCH] Documentation: hwmon: g762: fix deadlink
In-Reply-To: <20251203173019.46928-1-sohammetha01@gmail.com>
References: <20251203173019.46928-1-sohammetha01@gmail.com>
Date: Wed, 03 Dec 2025 11:00:41 -0700
Message-ID: <87qztbmomu.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Soham Metha <sohammetha01@gmail.com> writes:

> The binding file 'g762.txt' has been converted to a YAML schema.
> The current binding is located at:
>
>     Documentation/devicetree/bindings/hwmon/gmt,g762.yaml

So these fixes seem generally fine, but for future ones I'd suggest that
the following:

> This change was made in https://lore.kernel.org/all/20240604164348.542-1-ansuelsmth@gmail.com/
> and merged in 3d8e253724170ae9c8948c36801204fc2aa53682

is better expressed as:

Link: https://lore.kernel.org/all/20240604164348.542-1-ansuelsmth@gmail.com/
Fixes: 3d8e25372417 ("dt-bindings: hwmon: g762: Convert to yaml schema")

> Signed-off-by: Soham Metha <sohammetha01@gmail.com>

Thanks,

jon

Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C47342D750
	for <linux-hwmon@vger.kernel.org>; Fri, 31 Jul 2026 14:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785508123; cv=none; b=alwliu3h/GIfQkcGqFTUjmx5ylTI1/ekMugpJmyW/xDoKD9ggvsCWG2DB0VakjqiBwvZ5n3tgH2mhgbcaPG8JvUE9rbpH2ddOmOw/6FN9ke/6dKxpu01TJ7Ve9BzeA8G3x8UlFoj177slQWSOkJBA4Q3y1iXIFRjFCrvXvXdSXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785508123; c=relaxed/simple;
	bh=bJIYJvKsMNEruxpzrlHOJljkrhHcajYooGadT96u0HQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qYoYsQGHy6VyNfq3QEHXZF1hTliLqcxTVtkEP/yGuUrjLu9pBPaqoXw25JGFC92d1aHCjY98hLs2bopmm7iHppTl20OLFo75EoN6NnZZf4agWbTEz1ElTNBFL3tKY+09Usq+sEgsgCuydsyEqyuNhAn+pV8qeHLXj5MyogTu5ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nbCvswdp; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nbCvswdp"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2ceaf8a1265so11493445ad.2
        for <linux-hwmon@vger.kernel.org>; Fri, 31 Jul 2026 07:28:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785508120; x=1786112920; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=TKJ9iDE/Xqq1g7NWZ7YBtTJP0oKWB5LTOhWSNxoPZsk=;
        b=nbCvswdpTyJKEWkYJFQ5jjfIeBPVCYlw8mSUayTHqnkBhdn7p0jDhydVeNkiOF13jS
         55ZUJAAAU1AvbhwPohXnxu+kQ5saUb9qS2aKbqJ+2hjEUVAsJ6rI8X3/BmBO9Q5XevSI
         /eKwW8/cUyn09LixK0BYo88+GbOY0gT4/wW7S+I60S1pdlekwF0mrGoN2kuF2NTtRl1x
         OFwcr2hC2zZ2I+WJ8Df+mg+/iM2x0GN58/tJ2aaC0QdIKCEJI/k1EFIQhRYnH7JsfbCK
         m9L9PnoUGpU4vCHUjgkv9xMyAKhEm2KKLpYvajFNNesVMUbyqUayQs+LsHyphvaNcFXN
         36QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785508120; x=1786112920;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TKJ9iDE/Xqq1g7NWZ7YBtTJP0oKWB5LTOhWSNxoPZsk=;
        b=ClDKx2JwVe6nh0ZJ4UJWIRCdq0sKxE+QTk0JLJdYRrfPZp06/uZmxVnIHnbR4jr7su
         wa1PfaGNYdB/hQXHQgbdhUvpVUyW86auEYp3RlCCeHCwP34J6rk/vau0pU61z/403zu1
         ER0wPgZQLr6bzXS9YbjJy3n27CYL77hXu2CNg/bFdW192T+GAmrgQJ6UdkA7ydaC4gdW
         nAIJyA9N6PRLDZDp8UW3jZx7enK3jzJBy3yL/7pV/3C7CwtZTi4a9ylXg80co0G/n/3D
         AM1EfKqyxJijZn+gzp7b7fgaOM23qf7l60UWx+sFdMKOVWFW8wiAKIJ0XdtPryvSvLr8
         oLXg==
X-Forwarded-Encrypted: i=1; AHgh+RrOr+v77+ZfOoplKHJLXyqJ7JdUp2/p+8OYB0dF0uBgfKZPwVXWympHDhYrgw3lFwaGFC+JfPZXsE7nzQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwUjyF8rfbzwRQ50Q9Dtr5BvZcbxogcnTmbNgr0yVy8SmEn4xki
	peP93lW/2iPV0mleAtQqeyreO5QI9NZLzT34je5gHsQF23RHQXEMpqXBStzCrQ==
X-Gm-Gg: AR+sD12Cb6oMzxJJfdqxqO+HttVp08XrI2GiQdDrDhnHgt59mpENIj7Z7mVJ/3cBoH0
	Zcq5mNkCy2NWWu8qi/FK/PayPybGkV2yMeaAYjKK/8I3TqOZjQCfcMiF/YV8s7kArxAUKeakVGk
	JEYY37CSmtbg4UhyX2K8EM9oxa2IS2x0V657NfnxSj0mEUxGxQ2KStmAtsIhXtNRNr6zY4HiWdH
	3tPnUUPNTmbDKzCzfpR0RFtL8qrW78Hn+a+dgFyTHYdvxtvihFhr/SxXcqjMu08FA9s7HCerddY
	GI073at0fMqABgmdSLALC0zK9aNjJwtV9XeCVjlBCgl/nL1TAU4TRi1R5Ho/h0QPeaZU/xcqOxP
	CQfr9kv5Z6209kUSLl6t8DOJDASks7XssFxJM6jFzTP9lvsX0ftH4BSu1oSyY+NgOecGdXy4Vat
	rdTeVZtZGh//LRQLunJZqY+iYxyivaMMTvtbEpWmd+a3qw23SwIhjbUfdTltcG7O/41qPNaSp+4
	g==
X-Received: by 2002:a17:902:e849:b0:2d0:3412:a3f0 with SMTP id d9443c01a7336-2d0522340damr2268765ad.19.1785508119517;
        Fri, 31 Jul 2026 07:28:39 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d04b15db1esm5979555ad.81.2026.07.31.07.28.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 07:28:39 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 31 Jul 2026 07:28:38 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Vincent Jardin <vjardin@free.fr>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Charles Hsu <ythsu0511@gmail.com>,
	Markus Elfring <Markus.Elfring@web.de>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v7 2/4] dt-bindings: hwmon: pmbus: add MPS MPQ8646
Message-ID: <8ffd1289-c895-4ce5-ab0f-dad1c9696ddd@roeck-us.net>
References: <20260730-mpq8646_v0-v7-0-e7c7ad768d5d@free.fr>
 <20260730-mpq8646_v0-v7-2-e7c7ad768d5d@free.fr>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260730-mpq8646_v0-v7-2-e7c7ad768d5d@free.fr>

On Thu, Jul 30, 2026 at 05:44:00PM +0200, Vincent Jardin wrote:
> From: Vincent Jardin <vjardin@free.fr>
> 
> The MPS MPQ8646 PMBus step-down converter uses the same
> mps,vout-fb-divider-ratio-permille property with the same constraints
> (maximum 2047, default 706) as the mps,mpq8785, so add its compatible
> to the existing schema.
> 
> Signed-off-by: Vincent Jardin <vjardin@free.fr>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Applied.

Thanks,
Guenter

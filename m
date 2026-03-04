Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C16ED388395
	for <linux-hwmon@vger.kernel.org>; Wed,  4 Mar 2026 21:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772661515; cv=none; b=K9qrxQySMOmrR7+RtzzLMBG90l5oliSvdI7UsesL6uRon1zckZIqXIdvMBw+ibInPrZBvjyYkX9fKqNf0fpmiwRFdep+1XeY2/Rn3jjSsEq806xC075VqhCtbG2l0LN7IYavHxSJzFZq3p03SohrmkMOhZJDZZJUoJgEGGxjAbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772661515; c=relaxed/simple;
	bh=MxjDq8gQjsyN+WxP0d70LaLi462jemmqdXxq11ouqCI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rGsNSYefhz2EVaYoIiFcbQ2g7JcVz6r6pHoHxCqEq34rOj7lPRKwNp3iFU/14T6b+kKmsqqeS2b77PM1IEQjWw6Y8DVuXYoQziQiLyPGUgqgPfA7VZ6VY2UOK8JMm/qJrW08Utk8ABePUwphUWsqbnQFhv9LAf9sKVsFeeV9Pbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hm8EeYqI; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hm8EeYqI"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-82985f42664so3630b3a.0
        for <linux-hwmon@vger.kernel.org>; Wed, 04 Mar 2026 13:58:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772661513; x=1773266313; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SDR4PsYkFmZIckUOryLH4IjXcqpjDOwt0KGqniQjbHs=;
        b=Hm8EeYqIHgoVyAg19HsW8vi6Id2nSWPvijJG8p932wcI3tNAVy8PiylwwqXEFFYTXU
         zTw/7Lz+za+P8DisNBcMnI05NIyz3VKfglSJSPgnCMOMVajUwzxmvWGgTpQJpABz5Ggd
         mejQkZ7GRnNtShcXrlzpWxbTG5ymF4bfj9BDlorRw7FiTEsvlI0ZM9T3ZBOTv4UN9pkp
         vGkGyhmiV8mWSJUQeV0w0CU4BugYcZ1b42KuSDM5KG9ZFYgpDT1NlmvepiWjCY4P2TQA
         y0AMBQwZ/Qt7rsoP9XjDgMce7B04tzf6ejYB/YMgScvq7yc2sj9IBt8jPezcJLiZXA6k
         fzyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772661513; x=1773266313;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SDR4PsYkFmZIckUOryLH4IjXcqpjDOwt0KGqniQjbHs=;
        b=Vce23dMFLYUc1hFSU7WArP9ecSjdH9SITjJ1iKWx87WaiNhi56+fUoO3SY7I/Hsqx0
         /NtMLz8zLdDoqyG2yCEy58/5ZaVBWNTNg2lIcYZ4Z2weLI2mn5DXN49NDmO8EXt8cVrS
         ZOKicS1dCXaaHjFeDSasISo5THfExvi9jRQeDASzETOp3reUBn1Vv5KnQ4uT/xMxs/OK
         pZbnLA0udo9y+BnzsfRklDCFbhaZR4HjMEEG3fpHK/jg/80HTmqqe5j8aT+ldqAOQioW
         +5mPdAXbHCeHVD5ca7t/v+yavO0Cr+7+0Zi15eaP2QEF6xOz3lZqWCEQGPpkaPCCCC+b
         PRLQ==
X-Forwarded-Encrypted: i=1; AJvYcCWWkpG5T3Ax4MKgf0Ak6iKXkgqcXxDJpZ5JRDIwic7fqc2JKJKB1XafHGIk8GG8v6ZrK2qPJQozx0RkCg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyen7oxrfKTCZJDP82TS/lByJQ6PC/bQ3QvPweQFk9z/fWsxRLW
	kgzcVzFtnpG5HkYoaqwO7a+reoGzQaSQ9v2T8DeRa23iaLenVT9OsXWL
X-Gm-Gg: ATEYQzwaaS8ar008Nvj7C8scfzQBv6HqkD0KFiptoDdjmegPVBIAZ8PmJZ1R8Ydjivi
	Rhnr8moFFUX+p8PQ0M9wpgEaZSijeH1rfdNhilvkoeF2ksiWhJ2OpBI+6CH2QFJ1uwvnFlSuw0K
	U1AhWKSB9LHTqXDo004UAJF+pBvVKwh7l/sLMwXrxYXeDG4X3r/mk5XGE8kVVw5Nyt3uNpFzBt9
	7RRB1mOFbwrdRVsjEe+W3uQT1mLiqWUwwodHHfM0qsOjJj/OO/lPl1zheq6r/NxLixYmzUU3xDU
	sG09E6N/KbVYwSfFmR3ctliGlaVwuqNQrL10GE9Sk5Y8rMfO2IUaGZbtYSDhNhNpQYpEAnSEOSw
	84rz5ML8f4xaHpDwRhKxoqdPcQ3gMnAO/qF6mT2KmkXtwgVV2THx/zh0F20ItobzcblHKAJgUJ8
	rrJCR91BQabKkFowhqK9+od4F+gumEBvLEOFqG
X-Received: by 2002:a05:6a00:4288:b0:827:3321:7a23 with SMTP id d2e1a72fcca58-82972b63764mr2746760b3a.24.1772661513098;
        Wed, 04 Mar 2026 13:58:33 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82984a01827sm110603b3a.43.2026.03.04.13.58.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 13:58:32 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 4 Mar 2026 13:58:31 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Alexey Brodkin <abrodkin@synopsys.com>,
	Vineet Gupta <vgupta@kernel.org>, Scott Wood <oss@buserror.net>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Dvorkin Dmitry <dvorkin@tibbo.com>, Wells Lu <wellslutw@gmail.com>,
	Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sebastian Reichel <sre@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-snps-arc@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	netdev@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-amlogic@lists.infradead.org, linux-leds@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-watchdog@vger.kernel.org,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-pm@vger.kernel.org
Subject: Re: [PATCH 09/14] hwmon: drop unneeded dependency on OF_GPIO
Message-ID: <a1ce9ab4-49cc-46f7-8524-1cbc0e6333fa@roeck-us.net>
References: <20260304-gpio-of-kconfig-v1-0-d597916e79e7@oss.qualcomm.com>
 <20260304-gpio-of-kconfig-v1-9-d597916e79e7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260304-gpio-of-kconfig-v1-9-d597916e79e7@oss.qualcomm.com>

On Wed, Mar 04, 2026 at 10:02:30AM +0100, Bartosz Golaszewski wrote:
> OF_GPIO is selected automatically on all OF systems. Any symbols it
> controls also provide stubs so there's really no reason to select it
> explicitly.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Applied.

Thanks,
Guenter

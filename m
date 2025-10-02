Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 178273BB44
	for <linux-hwmon@vger.kernel.org>; Thu,  2 Oct 2025 21:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759441083; cv=none; b=GcyFxFtYD/IeaFJnaG3tll8tai3oY471w89qiLN+DrTx0GrR33nwz2gci5KXUopd9JncEAdEEzcZ/UIIfk8Rrza6hVrC1ltaw8nDQ33RH7uGPUWSvAF127u/ubFYcmUDkcvD9/wNyg4vXhiyWqpvawKEALIXUwKux95ak0RVfVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759441083; c=relaxed/simple;
	bh=Wa3MaIt2OTfDMAacePpuDpp+xPuK/PWuzyclDSFj+t0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RUCBsRVbHlIxhIgdpUkpQQ833zcBSFGw96lIg07SejJHgf6B2XKOrrjtsyIlMOJ6zUQoMUrITIlttL030mfWcfaAyOuFOQZ8/LJxjD7Db8lVN+YrKwdSqHueiJnJ9RDb6tCu54O9N6b0W5HHBgYffGGFf/zpLUm9l0gQokAiz9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CqbNY72q; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CqbNY72q"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-b593def09e3so1113489a12.2
        for <linux-hwmon@vger.kernel.org>; Thu, 02 Oct 2025 14:38:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759441080; x=1760045880; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3UYjs/DjWtPFJ9SkgiQewKjh9UT4jabvAen7EJXFzrU=;
        b=CqbNY72qE2w3zNKipvYfu4gbH+WsSVU0jPrnZ7lPyqJ5sEUbMA+S93FfUSPW/wGrgv
         yHd/PvzWVwexTYq+yTJCcZLyufzOK/3LpjIu3HluIhs9HVn2wLZkleBCIQXsNveaSfhK
         QV9497y9rCsWmZMK3VBIxytH6DnHYYsMq0BHxDl9PIbRCKbuhBI5VJZAXv8BpYh3n705
         LzgYyJp6FQWB3xCehIly9OycrMpd5U+68M0jIn8bJeEG+5HP7sgvdipBem1PLxFf97U4
         LAqCY+mHuUQEoK7dajhok0XHX0882CogkILYiDb6gXlAhkgWeBmqQNcfYGvZv0udvi0t
         +yCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759441080; x=1760045880;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3UYjs/DjWtPFJ9SkgiQewKjh9UT4jabvAen7EJXFzrU=;
        b=nz9PnXSyDvIoApnKoounHiiRBz6D7kL6aqG2dihYeQouAlNxBOcZp0+17cK+d4fKmU
         onot9U2brFaNLjlYcVMUdb5QAGfNJwRXy6/UhXddm/zd1EHYovKxVqNa8CprPEjONp3Y
         RLTYl65L1zp1pU5NiZfWoo0e49dzbSHR0IFVfvTxw7EG5aP76y0erUR/T0x9udJO79bt
         k05OrNt+8zaMo5u+nsgo83ZBba6TyVtI7s4qaUqO+POsN1/QM10ZYNfhjzw0MX51ZPDF
         7eFrzs3BK/hnaQuSqVseEq0utgS2rVvWErxIR7zNzPA9yQy9NdWsyglgOxaZVrY/vA1r
         /Pgw==
X-Gm-Message-State: AOJu0YwFu5BG8XsRYTIqMzuGJErFQl3Mqktqy6MW2cdEAsjwl7cR4fog
	5P9+vdfj0Kn4RxulPvSvZIy4xOGYVaKMkl921/3KBq3QW7NFXfFRY+z6
X-Gm-Gg: ASbGncuufiBwpRJiepAzKlMs0tb03jmXsRuj+VrQddWcOeddPJlmp6gytBO0Nntu0Ko
	r8JI6A+lz/5DZ1D1l1egzq/4Hi+gX4vgcQDnUmdyW0Vl4SgVRCpID/b/T5261brpKzTeZC98Azu
	SlMNm7yy2jsH9ArGxmy3JI42qVJ/sGVyNQ0+Z+8KJNZRk9aPAfdI4gXtFkLkg/ZfLrrCJx0ZvdR
	a/QWJh1uZjFedYgzUpDEnUGJFmDr7yNOPi2aw+xvwFmExaRwcACnzo6CnGDkyhxeGze46pU4/Ut
	Vp72PCU7Flby2qzDb2OEyfaNY8wE+KfMOrQyVL/WDjwWMQaFhli21yCwiSDZv2XZeLOlc2j9EDz
	npaR6WbapWmRJcG7Fy2RUHWDoy7FAtU0vBD207QXJbXznnDBE8t2Fqzw9jJw=
X-Google-Smtp-Source: AGHT+IGfpeSt72PLiRG8302u7jW0eS5cM/tPuBTjoCfYGBR7WBrL3m9GghHnqqRwzstji5FK0/L81g==
X-Received: by 2002:a17:903:2ad0:b0:264:70e9:dcb1 with SMTP id d9443c01a7336-28e9a6fdf1bmr8314995ad.56.1759441080436;
        Thu, 02 Oct 2025 14:38:00 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d122d96sm30394595ad.32.2025.10.02.14.37.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 14:37:59 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 2 Oct 2025 14:37:57 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Eddie James <eajames@linux.ibm.com>
Cc: linux-hwmon@vger.kernel.org, linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-aspeed@lists.ozlabs.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, andrew@codeconstruct.com.au, joel@jms.id.au,
	chanh@os.amperecomputing.com, jic23@kernel.org,
	dlechner@baylibre.com, nuno.sa@analog.com, andy@kernel.org
Subject: Re: [PATCH v7 RESEND 4/7] dt-bindings: hwmon: Move max31785
 compatibles to max31790 document
Message-ID: <4b617318-f76e-47b0-9744-6a79803a149c@roeck-us.net>
References: <20251001144441.310950-1-eajames@linux.ibm.com>
 <20251001144441.310950-5-eajames@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251001144441.310950-5-eajames@linux.ibm.com>

On Wed, Oct 01, 2025 at 09:44:38AM -0500, Eddie James wrote:
> The binding for the max31785 is the same as the max31790, so just add
> some compatible strings for the max31785 chip.
> 
> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

Applied to hwmon-next.

Thanks,
Guenter

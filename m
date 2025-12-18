Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com [209.85.214.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 163E522CBD9
	for <linux-hwmon@vger.kernel.org>; Thu, 18 Dec 2025 17:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766080245; cv=none; b=Cg2TEQQhDF3UqAp/M9w3+pKJdDXAHkNh82dvleMx/I9lpJguC+FG9mm6gEuDEy5gppU+zYGb9aenEECuKH1KzD75iuLTeKq4gQ00Z71AssBYKBmp+vnZwmPINycfl96JlEkgx0x9JI62i8MEFq+Tj8Mh2MZ+DRu0hz9aY6i3hiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766080245; c=relaxed/simple;
	bh=aHyjjtFiuLJz+Tk2dbywtBxpbEC6rOqtXlmGXk+Pd24=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=awzZs1m2U+vknlsQXdF2+OKI0MUBIMNYqxy1YwWJHpVotTXPok+YYccUikySUQZIlXHB7r3wVHCSK0yB7zGgywQs6CmlLAPWoWDVUBgEZoNBFpBQ0e1Ylz7PhnPWoLvfneXCL1Vo/bhu7Tolb3nod2YuT4Jf4A1JRllFe7dwm6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fvcQStuc; arc=none smtp.client-ip=209.85.214.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fvcQStuc"
Received: by mail-pl1-f194.google.com with SMTP id d9443c01a7336-2a0d52768ccso12183225ad.1
        for <linux-hwmon@vger.kernel.org>; Thu, 18 Dec 2025 09:50:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766080243; x=1766685043; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ddQ5E5GMF6Avzka0ZvfzwUtsxi4gaOVkF7bsXtZ9eis=;
        b=fvcQStuccOhdVdPGl4IUeoCS42vQhK8EI6+3vXSAF/J7PsR5t2DjJPlctOQuENVxx+
         LTDrityWmp7H6zycxnniyDadfxbtblwHOre4kRgDZF7s3TDoMdg64OUDye0MmxdbPGmv
         GCMXpG7OJYnDIqNWbReX788RqsIsJNO178s2kyUpy07Bm42DAXNbXsJjFKre5sHQWQ6+
         GZP0sW3DbX76QnHl2oWHou56OGoKYF0aDpXdGpV4DY7fuUHQqCrAglBmmEB8mJJDCkOy
         YWacgaeVfbuBy5kiKOUSYHiXPZBl0sjxVYXTGzyopc+OaboClII3Ep0teXrhC/AOHi5Y
         V9NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766080243; x=1766685043;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ddQ5E5GMF6Avzka0ZvfzwUtsxi4gaOVkF7bsXtZ9eis=;
        b=ppp77Ul9+FDuGyWYZeQfuvDYJ4DupK7h9ZVLNeu02NxFWP6Xs8BqyCg1xzYiOhiQXC
         DUwJm1ta79FspWNvr9s1KClgt8nhwJXXMEkD2ZKJuyZ2pxH//I96vvMNXmVKcjc1pZYZ
         EqhtZwhlUKOS9OopvO/UBMREmqShkgmZMAg4wUFWLWRGfyWtnrzK0KpkYmKMHFCY1Bfi
         aPrcx5wBLqaz6euX+Zf7OQcT5XX3DG7AF/IIcMKedHBcp6H88fhHBT2sD3VlJz2CG6CE
         ki0O3NPRyvG69nU4NBc2uNtqWKKlbcoz5XSmdvOFsBtIlmwOTxmxnNoPBpYTK4vqV6gH
         Lg5A==
X-Forwarded-Encrypted: i=1; AJvYcCVI9Y7+zlN7Q1lV+up4993pNNT4EwsOCxzWbykidJw5YxwGyDiPC8oHmaTlvigAS+pdxayZaldh4G1z+w==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywtx0zSs9Uh6Hge5yX7emnaUxnpn10Sb+Ay93Ki6corRnoVw4p2
	M52TcDImtsLo1yUWD5A1yjGgndWD9rnnsHvFjK/iMElIJekv3JC4j+nrM3voxtec
X-Gm-Gg: AY/fxX7NJA1NEkEuWLKxaFyLLK9NMMTaGjAy42LAiaVM3BwRrnNDV70Xr9nrYXM+wll
	fZLNOMm9E26GAOlZeUUXBX2taOgmlWWO+9wQV92I3lmffXH6yOCWwEA4SyYIcmvKXkBtaYY/XG/
	ZXj3iI7sJCYJQaPimt6Svcxztr00sV+R9G9Y6wcYdPc4l4JJHaUirCYZHBosoHPPhQZ7SLVZVqn
	jx62fQrjDMhx/Yx3tfbR3OsObL8UrzJlBeSAT/LzrNkkrF6knLj9Bij/pj6zww2a1Rh7GbZLWCp
	trGyJcOjIzh3rEnysS1IfWf03h+Co1cL4+ewriAYZLKtMnpCjcTapZx5fQeEUu87ScE+cho9/aL
	HgpM8UZZY5oZsy+yimSI3Ew6cTMpZysYQYlLCVZZWnvkpqw0pMC0t31b9bz/xu/gm3LC47Kf7pK
	3ODuTms2otSuKPyuLAI/44bQBS
X-Google-Smtp-Source: AGHT+IGdqSHdO+D54IUIPzd51Uw0/tPli9hSmW7LLbejRAyhwgD9XQOCvub9597BJ18BANnaYqtQbA==
X-Received: by 2002:a05:7022:a88:b0:11b:7f9a:9f00 with SMTP id a92af1059eb24-121722ac2afmr100974c88.4.1766080243216;
        Thu, 18 Dec 2025 09:50:43 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12061fc5534sm10203427c88.9.2025.12.18.09.50.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 09:50:42 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 18 Dec 2025 09:50:42 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Okan Akyuz <okan.akyuz.linux@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	"open list:HARDWARE MONITORING" <linux-hwmon@vger.kernel.org>,
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] hwmon: (DS620) Update broken Datasheet URL in driver
 documentation
Message-ID: <de60e982-33da-4f28-9789-4b538f7d532a@roeck-us.net>
References: <20251215204423.80242-1-okan.akyuz.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251215204423.80242-1-okan.akyuz.linux@gmail.com>

On Mon, Dec 15, 2025 at 08:44:22PM +0000, Okan Akyuz wrote:
> The URL for the DS620 datasheet has changed. Update it to reflect the
> current location.
> 
> Signed-off-by: Okan Akyuz <okan.akyuz.linux@gmail.com>

Applied.

Thanks,
Guenter

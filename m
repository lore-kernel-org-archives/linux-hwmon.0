Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793821554;
	b=fqMsbZMHRBxnqmCv0T7cWOWvE0Kk+T9wsweMVvZnwS3GX4vJqz6nGNx/T3WnqV7vuDzH
	 D/oXp+ALTfpUDIlawt39AMwjQ2Mayhdo/KBONtzSlIEmrunQSSQZuk6hWQJqnmrsK4wP/
	 aF5uQ0jaA1xtFGHpVk5yMuhn93OsoKoldUv9sBDwgXw7ak6v1SN2HXUDEPRCm045DQndE
	 jn7iwPOYpmjwrMNsXvM7HVeYPjXVrjtr5Nrx7ZZzJR2CaEC0x0SvAcvEeYEQh6RKuH85/
	 5ZXeeilBFfRLjHvh26bYGT58/Gu+1eNRHIGNJ4yvA7OPuj7HzcPW11JIFUJBwaocyZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793821554;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=EhMlWPoz5IUKIlQ1/wDPKCmLchJf0GRtbn42lO+mbmw=;
	b=JoXmdbOxyQlAp0GSxB5iCRpVFT8wU4oC2IAQEsNmI+T5cIH3CbyGVHLBXxn3+JgRSNHH
	 3BakdlsSbfpDk2apqe06ISCIb0c5Kbpj6ACgVpNl1tPQ1Vvh/YTY5OeOhuHIsWgvHzsx5
	 tdaeU+vkZa3YJh4dNzOZbO+0M8/GFTVXobz2p2scj1BYnGXrwlQBjvhMjjRzcdMh9eCmH
	 1W6jdFop6R60OGehBYGF0e2ZTm+t53kKtczWLYnPMl2AFicRZLOnbbr43uGgC9BCjUMf2
	 GVyOOFlcJSWg5HpvfstRo05IRlpsvjQ7LOmYXYHMseTlwZfrGOBx2FelW5MCQwIFCZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PhgChsRR;
	arc=none smtp.remote-ip=74.125.82.45
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C3D66070304
	for <linux-hwmon@vger.kernel.org>; Wed,  4 Nov 2026 19:45:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C3D66070304
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PhgChsRR
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-1adbf62dd31so1554477c88.0
        for <linux-hwmon@vger.kernel.org>; Wed, 04 Nov 2026 11:45:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793821553; x=1794426353; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EhMlWPoz5IUKIlQ1/wDPKCmLchJf0GRtbn42lO+mbmw=;
        b=PhgChsRRxoaFlSlkRP6+eJT4KYEi14DqTMP0leDLu81FxLUk2LAC65QwDPBooqvAsn
         iH6XkP8S1MK/SwZxO3AJkItw8VOGPpqeDmiiYKv7myO0lnlZgnop7KC9K2NAgM6ukplu
         Gjsdpkx1k0Dhr49FqliSxtq+PV7zOW1rF8RqXf/q22186XabS9LOxL3XW958WfiYw+PV
         JBjD6srBvq+hK2XBFDtCmpOIf+gS9iJ5nhxA+IIgHZhp3x3Dcb+TLxzecX64kH4ggJZ8
         fI8gag+0WQBADwjfb6rFBnw2H4YR37v7+5aiBzykie/3yy5MmRaIYgT31jdFJ3lzFtA6
         N3Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793821553; x=1794426353;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EhMlWPoz5IUKIlQ1/wDPKCmLchJf0GRtbn42lO+mbmw=;
        b=LGMKIa3NkN5cV+hjvekqK9hcl1qyAZLsetwZAQbEb9VBHhamuC0D3SMj8WLcra+zlU
         aZDYehiIH/lcMwdLpN8HQGBRenKHTdnIVplsv0icOgFQOqf3Wg7wu8pRoO0wOoPtCZov
         J8w+armlkXKb3iP1zJaWySUZmcYs4SuDFyC3qbYc86qE+b3Croea3lZKfm8MTE4Y5F87
         6hqVaYzB4OzO8sI0c7fmrI6IiMSJ2ITpeb4/0xOtI47kVXVxYzr6m9UuJpZ/XOBOIthj
         m51P8Rdr/7yj0ub4QSsMnBfwgMb6wXWUe8RyIz31UeVAaCPC4gwasF32RPn7XvXB97SR
         ERZg==
X-Forwarded-Encrypted: i=1; AKwUvBxnvsNy6+d1QcYgQRsT7z/4ABUF2gLcgtoQQtI2IheOdYU6dXnB0+fa8qfMDUoAHSloQaH9bUpflP5Jmw==@vger.kernel.org
X-Gm-Message-State: APuU4Z/aab5Ea6u22BefMsOIFIR0t3rHv2rZkRwQg2ZCUppZxSFII/xu
	w1HfiOEgvUN6EB9OlM7xNubQ3j38ViYFDZUcNMbpN+QnSPLKhoR0RgY=
X-Gm-Gg: AYBFou0QcRWyTUw+hEx0pgYd2QOVsKiweeQk6j3PQUgyM5jIywJo7/4UD9E6okG5/X8
	j2XAfWmuFMC/Fr6fA1D0DmSy6O4yUR+Sh8A20U0n2QcB2jfL8hOI0/EZHbYwv9h2JGjV8bnrXmd
	vUMs8DhdK62VcO3FXrwd5mdmLLd+rEnvqKvI53VFLbOGAMrA2x9KCP6AJPOo00jJQ7tC0Dq30uC
	6W7r6UYgBe49vnETo7fiWHgJnuT6bzjyDU0BWnGb0yjA816pD6Y6NT58zdmyKCUl3ULuadtoat2
	F1BNe7SOks8H5k7wBwbv+vfcgIR6Et+uX/RtDer3UnPfJMaN6UQeGiPDrPqbEcHEDQ0hqRpeQo3
	h1LtwnmdgiuWH3w9iSizSdvVfQ9WSiuWntFfbFf9sAeRzWV7CGTUwEzJIa2B1RRYbTFPtCtpz4F
	oeuMUmrhy6yHix7B311N0RE0MtsBogUG6EUm9WAGgZaImnFzRRa8Kp4Q7RhNR/CLNC9rauE4sSe
	hvkbSAUk/5Ds6ixMlFz7GzgfSYtfAThWAvLtbb864TxyyG2mIzIlPhTiPnsSQH9M+jE9N0Ji7aW
	1W6IjiGWZXRDllY5wHzUtZD9vGl7/LbP01/wcAOJ9qgcVpQYRzo0b0lOsidg1g78pg==
X-Received: by 2002:a05:7022:3a02:b0:1ad:e740:e51e with SMTP id a92af1059eb24-1ade740e699mr23857533c88.42.1793821552953;
        Wed, 04 Nov 2026 11:45:52 -0800 (PST)
Received: from at-Standard-PC-Q35-ICH9-2009 ([106.194.66.249])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38a6160sm8652168eec.9.2026.11.04.11.45.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 11:45:52 -0800 (PST)
From: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
To: jic23@kernel.org
Cc: alexandre.belloni@bootlin.com,
	andy@kernel.org,
	asahi@lists.linux.dev,
	atharvatiwarilinuxdev@gmail.com,
	bhelgaas@google.com,
	bp@alien8.de,
	brgl@kernel.org,
	dave.hansen@linux.intel.com,
	dlechner@baylibre.com,
	dmitry.kasatkin@gmail.com,
	eric.snowberg@oracle.com,
	griffin@kroah.com,
	hansg@kernel.org,
	hpa@zytor.com,
	ilpo.jarvinen@linux.intel.com,
	j@jannau.net,
	jarkko@kernel.org,
	jmorris@namei.org,
	keyrings@vger.kernel.org,
	lee@kernel.org,
	lenb@kernel.org,
	linusw@kernel.org,
	linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-integrity@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	linux@roeck-us.net,
	mfd@lists.linux.dev,
	mingo@redhat.com,
	neal@gompa.dev,
	nuno.sa@analog.com,
	paul@paul-moore.com,
	pavel@kernel.org,
	platform-driver-x86@vger.kernel.org,
	rafael@kernel.org,
	roberto.sassu@huawei.com,
	serge@hallyn.com,
	sre@kernel.org,
	sven@kernel.org,
	tglx@kernel.org,
	wim@linux-watchdog.org,
	x86@kernel.org,
	zohar@linux.ibm.com
Subject: [RFC PATCH 00/14] Add macsmc support for Intel Macs, replacing applesmc
Date: Wed,  4 Nov 2026 14:45:32 -0500
Message-ID: <20261104194532.8259-1-atharvatiwarilinuxdev@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261101010737.203951cd@jic23-hlaptop>
References: <20261101010737.203951cd@jic23-hlaptop>
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> Are we looking at ABI changes as a result of this? That
> tends to happen with split ups of unified drivers and mapping
> them to more standard kernel subsystems.
> 
> What is the plan to handle them if so?
> 
> Thanks,
> 
> Jonathan

Most of these changes now expose the stats using standard api's, so this
should not be that big of a problem.

The worst possible thing that can happen is that, the user will have to
change their fan daemon (macfand/t2fanrd to any other standard fan daemon).

And also, sorry for the late reply.

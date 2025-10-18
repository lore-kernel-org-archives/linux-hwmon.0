Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6152A8287E
	for <linux-hwmon@vger.kernel.org>; Sat, 18 Oct 2025 12:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760791819; cv=none; b=DdQ/jX5+n9sIrRESG0cNKiH3I614xymgXt7zu2vi1atANd0LG/0XgtwmC7EixXp9cLeR1xMcabCda2ZHlL1PYQTTeLOvQpVOnkE0vUHK1iyQZ/7HUUjgVEsPS1QZ7PqVLy83AUVVnC6FEdCK94Av9AqtMBe81j2fs2YeKgCiLnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760791819; c=relaxed/simple;
	bh=JOhRgmB3DaDqj/0okhYJAPGij+Zt4PIUmY8n5GbX1DE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RG2i80suKD8N6wIopynaj2I9b4dKTB3ihrEreMdtTr1GJSnC3I88w+hvWeJy775+iHuFeAiUF0xU6Qa9H3o5r5KoCip0f6Sfoh1hQUpnXLH1VCAZPizwRLUid63NDjOwBfsiiOhhwb2FXK4Gvm3+SJ/koLwLRd8hjhxBH/8cBlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fw3zI/Sq; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fw3zI/Sq"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-290ab379d48so26114035ad.2
        for <linux-hwmon@vger.kernel.org>; Sat, 18 Oct 2025 05:50:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760791818; x=1761396618; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sYQhiSmjIKAg9JpgY81CKHBnsaXySUjIdDWp5EpwSqw=;
        b=Fw3zI/SqZl3cgkqNzT+1oKFCWSaZs0qCgrtmcTIf4oFqdwfqkpDA5qE8cQ5UNcsO7G
         JZF9MZZVUCkJtJSVtJs3mNHtVYbww1Mte06xUIRDmKtW7nV6VG+WcY7G9xxYjjlg69RO
         BkAJGIy1q1yrJ3syx6Yh0kFAUFiInDS5jVebibMC4xt8XAXaL8WmF1DjZfyD3Wy4jy6P
         G6Q+5QUHhToUmTxucWJgHbX7Gtt9HdRVugT3naKFELJaE4bl2qLAJgDX6g1cagCsySxw
         fzP/aVWR6UcRy9bRbD5jsutsth027K529KIPb/FYgXZTIC9UBwuh/dz4EsExo7uzM8hE
         fUvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760791818; x=1761396618;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sYQhiSmjIKAg9JpgY81CKHBnsaXySUjIdDWp5EpwSqw=;
        b=dRB6uoXR6YtYv9CtZ8jblqHYzTwZRUmwVH620SEPoQTxB5iaGzwfGqdjcBLgbIC2c/
         GXUggDaNvxkNgDf8h1qD1IYjxl7rQcJu6Pusa28N/kufpU1nPsg3/ee+RnuaJiEUGkhb
         vFZuLfAdoth5EZ9+C0FKX8waZHdkoKsX6Ek1xxk/V+Uw16mYzGEBSr23izODZj/6KLci
         ShlPNfEd1azUHZluESOMh+/6w0XX149oZzqHwFioyPabEHd7LUCLHBD65cmLvPXJQ9I1
         QwoWbqYjX5cNv+dRFFLZcujNxmjYxyiEEZuxaZhB+lyuKXj4R90BPDPXZB3LbfllqMrH
         OWZQ==
X-Forwarded-Encrypted: i=1; AJvYcCXBF76m0jGsHODiSTzvN9o+GuHOuBHGnYMOylvYLoyffnr0Jvvh9Wr5kyt8Bm0aj6lwT/DxiHxY9YHpcg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzl7sfa9aPF7SPJqfmvTO76S+4WW9ovxpv7E861fq8R9W1CZcYw
	0n4m43jrNFyF6l3dgTUJEsf1P7yIXyILcWsUEouiQp5H/tdhf4RTqTIj
X-Gm-Gg: ASbGncv3/O1G7IAKEPYW3B0tbdvcaeuWRg+o+xtti2yGG47UBrWzVNVtxGseWwdstLH
	fFps20xgjlxlinIJ1Rat0oEBj1tLyeeqb4Xq9QftprpwBgqm/xpB5ghBri7nr4tPd6y9N8HLXLV
	jcmrqqQYJHcAeDteqXy3r6/auW6wAMrvq44v4W1c/TEUbsAwsZpNnxFNqIvswBklSHa/Grw3X3I
	bY6HYqlp2iHY+1newh0bra9f2xp6m5VZVCFBbFRGaSuCU68g4UxliEWYEbzpVYcATKuikBbrGBj
	fZT1UNsfME0psheSjrMObdU+f2/TN/qGjN81j1YYavqg8IPHxAyNajkA/SWSD8e44805m0t/Lgq
	SqDH1LhWRBIF4XkNbWphxbUtGrbA1yJCwc9Ni561ifU9NAR0Y5ISZ+x/j++9glydlj/kLJCci39
	TyqEs0ykfx9+KBO2g1r/mPaUEuE6Ox8WDzvQ==
X-Google-Smtp-Source: AGHT+IFp+N9rk211Uet/daZeKCeaXRrs242HKJkWvO8lWmZmRSdRDNcuzgrJxXar0a7TiUsx8ojtlw==
X-Received: by 2002:a17:903:2b06:b0:272:f9c3:31fb with SMTP id d9443c01a7336-290cba4dbb5mr86424535ad.58.1760791817569;
        Sat, 18 Oct 2025 05:50:17 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-292471fdcf9sm25575825ad.91.2025.10.18.05.50.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Oct 2025 05:50:17 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sat, 18 Oct 2025 05:50:15 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Ankan Biswas <spyjetfayed@gmail.com>
Cc: corbet@lwn.net, skhan@linuxfoundation.org, khalid@kernel.org,
	david.hunter.linux@gmail.com, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH v2 2/3] Add missing datasheet links for Maxim chips
Message-ID: <6e12dd80-e02f-42cb-848b-6c79378e25ad@roeck-us.net>
References: <20251017105740.17646-1-spyjetfayed@gmail.com>
 <20251017161422.4404-1-spyjetfayed@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251017161422.4404-1-spyjetfayed@gmail.com>

On Fri, Oct 17, 2025 at 09:38:05PM +0530, Ankan Biswas wrote:
> In 2021, Maxim Integrated was acquired by Analog Devices.
> maxim-ic.com & maximintegrated.com links redirect to analog.com.
> 
> Missing datasheets now available at Analog Devices added.
> 
> Signed-off-by: Ankan Biswas <spyjetfayed@gmail.com>

Applied.

Thanks,
Guenter

Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3909E1E5B7B
	for <linux-hwmon@vger.kernel.org>; Sat,  5 Jul 2025 19:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751743148; cv=none; b=ZrFfNana5mrniegUuzC8SXvOhvkYcH0yy86/QPX6GRsANMpM3suEpL4gLIhccxG8w9muz2twcNYden37t+/bvyiP54YcEKJnwfeEiCwqhJBNMEqKXOxD2JJBfJJxkdBIpuWYMVGnfyiUii4d6A6QJou9X+deBTaRjst4m5vU9ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751743148; c=relaxed/simple;
	bh=2WCGsFdErTgTcgDmVChHaTJAgDU1uS8/THWs7Y1ZfLE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UHkW+PF/2ZGeiJx+B7bgvFbbhzYunbkBpVFtlssyL0gZVyN4QjLbIxdnBAkkSaPtUReAPlkDmGLdtNwztPRoo5b615DLgT9z69Zr9puv5AjTGo/oUIQOeS8dG4hJzUBnUDswWC+DJBeabaz5zpvYG7VHeqQqivWSTXeD8xTYmT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cyy7UDFd; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cyy7UDFd"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-23c8a5053c2so10936905ad.1
        for <linux-hwmon@vger.kernel.org>; Sat, 05 Jul 2025 12:19:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751743146; x=1752347946; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m8gFGjKtKvYJDXK1I1L+c3F/UhjIIlA1zSIf0C39Fmw=;
        b=Cyy7UDFd66WcVVRAsLXmpB/5qFR9mG397NwMDmfjy1DvrAjV9z8q2Ssyyqt57KCl/5
         MltT53GJi2aHBqMZT5WR+QPFSRm32IUizUMVOyUvh1qfPxHh7cV0UkkAH1/x+rMIEMuh
         eM9TD5kqBaLNaqsnWAnsiDx+DioIedf4hX5UcyJeSTDiu1mjMBzDGfvINAUMoerQF2ZE
         n+QzQkItbEpETYxKU3Hy9q4Fm2evqBvO4PSF0pUYX3kqf3EOLBoPQvVVeJXrByw1CRWg
         Nz9GoDb8CeIkMm61RPPioJJ9EPrEvDgloaVfDEz01jandOyfvLrHzGjTiBTDas8AC8WP
         IABw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751743146; x=1752347946;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m8gFGjKtKvYJDXK1I1L+c3F/UhjIIlA1zSIf0C39Fmw=;
        b=WTOKlrHublbFvxu8wJf5htsYlltUKxtESTlPEFMN/DyOXZglWB6uVFO9s8WK/4+RT1
         WMMMOUI2Bqb0IslDfysJv3oU64aM+V2kV1WK8y/gbCNmyXJ4pk9OfKL6Dom/6MK+a3VL
         hH5PHAF1x4moGAKhJEeGbsMB3SSWleNBlU9L74hBnIcMouLi1GTeTWT5sRuLNQ4V9BgM
         Bewr6Myruy1vwChGZN4umYYTOyOwPFkjdyTnWvUmAN2tYzRGZoIWs6X10RoNOEaO48P2
         lwbKtgofsXYIYJop7VGsH/UKdK9JQITfmfvRGY5sLG8fnPJTWMs7B1bMBTqjWL7LNLdg
         Cg2Q==
X-Forwarded-Encrypted: i=1; AJvYcCWQsd4X+rZpmBDPDYANpXXy7UWAGciqkKfcmeaGCM52ClK2Qv8vco5/1bhLNgkYRCOAJ5iWW2P834w/zA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxxXt3NUOhSypMBiTQeyACMETdaU831DB60mg91LMqDZflRNqKQ
	IpqV8n9n7znwjbaE4bPTW9HT0Hq1Ltm7p1tpdGo8nomqxtVyUKL2oRmKYZj/7Q==
X-Gm-Gg: ASbGncvpzf+JWbSQMKMuiiI34Tz/F5+lA6JgVMsXz+JSXx2wOlEcusJAxXpBL6ssBZs
	KIO/ZG+OQMg6Gz7yBc3/XYmjBoWGM2xIcfA3FsK69zfpTokXPB0+4Hpfj/zgWjIzJxreNVsV9zH
	1av2ljwhCRWxgFuOas4gAcp6pHQuOhQd9ShMKJyYrEl09LKDhq1QHbuJilYnndo5S0DrW+Pa8mR
	UXNXYyrFs3nOgvkpAZWHD8deAxJb4PwhrY72xWjCU/U6ue5Q3iwWSE6JkKzQ25xFM0qrDhPHHwA
	vta/NROhw0uEGy1Q0ATTplsMqCb7G00fHs1AbzQey9rowOcNqxfhHrcYl7fTGPzJjxEehqcMhsW
	p0Fn2h/L7eQ==
X-Google-Smtp-Source: AGHT+IHXsdqBoW6f6kwGR6i6X8wKBY1s1pBMbL7m+tJe31x6DHUqNs/Ke+DM6cPHVhks1zwqYjTSUw==
X-Received: by 2002:a17:903:46ce:b0:234:a139:1206 with SMTP id d9443c01a7336-23c9107effbmr49115755ad.40.1751743146492;
        Sat, 05 Jul 2025 12:19:06 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c8457fabcsm50943565ad.168.2025.07.05.12.19.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jul 2025 12:19:06 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sat, 5 Jul 2025 12:19:05 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Wilken Gottwalt <wilken.gottwalt@posteo.net>
Cc: Shantanu Tushar <shantanu@kde.org>, jdelvare@suse.com,
	linux-hwmon@vger.kernel.org
Subject: Re: [PATCH] hwmon: (corsair-psu) add support for HX1200i Series 2025
Message-ID: <1c4b6a07-1bd7-411f-b4a4-db202cb21b46@roeck-us.net>
References: <20250630201444.210420-1-shantanu@kde.org>
 <20250701055337.14e2f5da@posteo.net>
 <CABQ4Km_Ot1097OjNvvKNyYhxjqu5cD4JTZ0NoaQv9SOcWyE8=w@mail.gmail.com>
 <20250704084003.21256f66@posteo.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250704084003.21256f66@posteo.net>

On Fri, Jul 04, 2025 at 06:40:03AM +0000, Wilken Gottwalt wrote:
> Hi Shantanu,
> 
> don't worry. That was only a comment/mental note for me. Looks like Corsair does
> a lot of refreshs of that hardware. Hmm, but Guenter seems to be a bit slow on
> this one.
> 

Please remember I am _not_ getting paid for this job, and once in a while
I need a break.

Guenter

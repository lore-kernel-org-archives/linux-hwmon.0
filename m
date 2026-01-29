Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1EC7385ECF
	for <linux-hwmon@vger.kernel.org>; Thu, 29 Jan 2026 14:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769696050; cv=none; b=T3+NfTnrClxLUChSn8bkZy2XBMAxBMOpR83T968C0zyWxn5fUrrya7XThzcfZAxZPtBO9OHEi1eMpEGqxC0mBfDcCg4+ttBPgd6n+3gUT9ihwdshqexx8hqlFJY5Pwkatsbt2jMHad2CisOIwgfRlurvy8Lwb+cCizG2g/5ajCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769696050; c=relaxed/simple;
	bh=YNZSYKXHZdrx6lbBVL0AeaoKB27UlCZgZytgr0im8rM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BFPltLEsrHyKsxcSR5YexyfhZenO8HHF7Hf5RPLYKZkc3KA3djaWnnYRbBJufyEafePYwntCpNxEFneRUZ+JFUGo8L4bMa5xIZDMj8ejaVz2jRhgA80XEhDzJB6UaStm58smoBzymMqnrgfcFNtdtsXp68/3Lw9pska92pKvdEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z3vO0pc0; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z3vO0pc0"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-c626bd75628so348597a12.3
        for <linux-hwmon@vger.kernel.org>; Thu, 29 Jan 2026 06:14:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769696048; x=1770300848; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gPatX0lBa6B/Z2f7JJnbZz/QEQunw/4SlKLt7srwt8E=;
        b=Z3vO0pc0fdUPzCtNyYly+k0cEjmqreCwPiVZRK+PFR/F/lopHh2JnL83Rnk5DUUPZ8
         p39KtNh+X7cFNUAQSssahfxep5qv8llFWRTMDVF5yTFl0yUQF6raiBhmglihK9qWe97B
         5BLAdx4qPWOGppKLuvS/9AORTjNMxQ4df6+oUfM+gd60RYdzsQPqBseArcqbA9RvtSzM
         k7LK8jEgCMgDrAc1zhmlp40tpVoN6rluOgHBku8O0KaQcYDQPjQt4Z4ytBHP3oHOsvfh
         VtalAC58OwQy0GlA4vioZbfpluRYERHwgf4BKRV0LAcC3gP1vYLEUw9e4Bfri241P4I8
         IE9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769696048; x=1770300848;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gPatX0lBa6B/Z2f7JJnbZz/QEQunw/4SlKLt7srwt8E=;
        b=SnSV9VbPXIb/pPHOjr5awMwbnCZqPIQRdaSr0YMk0MAuuB3Z+xtaulsWHZ96jUHFz6
         llZHsRYnpiHObigf4Swgpc3Bx/MPlycUoUSXd7hvieeE7Qj9WAic924JmginVrCsDTNC
         8U1N8bLwFaJ3c3jfq7MkCEjcFcXs84dxceJHyHaYxBxAkhhwotcw/oE6iNn84vYy5U3S
         rUCgHXjPnqeXdqoec3FoT3/8v2OoCoMH4iOmPLFPXdQMA+SsOoBDTnf3SL6W3BYNw2dJ
         L2n+toqX8G7BIJ56yfR7ETv6tA9HxC90DhQLhC/Hs28bzXwtX4tEVVXShd5rdOzYFMmk
         MJ0w==
X-Forwarded-Encrypted: i=1; AJvYcCX5lGZ2x/zwS+SoMl6oA481BJfzPlIFZrJpyjPooJ00JOcTcE8A27MoEz3s41jYTPc32Mmh6PK8IwiZMw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwEv8iVcdCyc+l6Ff+HYh70LHT0aAIJ2fmGalxMWmM9+xkUX5Qb
	OKgZAR8LGxI53iNhd3JvqreDqdr1PgaLWvMtyCfhORYSU5bh4w0b7aBA
X-Gm-Gg: AZuq6aKD2B7SxslVSXxLLMYzup6bkBZUwxAZJ68g2kudwOxptbaKi2iI/a6VWGxL5UV
	Vr/VE0HPur0YW97zD3rle2cA1ndrwYV6wJY5A5EMHP2qHDLOla6DClBuiv/zYJ4wGSlrieUG0zD
	E3NFxBga6Qbt2KSUGA/4zAwGChw0GdnkF7mrA6h0Ulx6FN0+pQ5KJyJ85OFuPXDDr64pacZVwKo
	mVAhzbMJZJDHanz32cmzgid0g3k4rjEaX3zo4/PgB0d11ZIQE96NygP+Yr5YpkmETvF3ZZjjyBS
	WTLoc4GCWmzzqg6FIMbIKcb/sSTJFV/N8ie7LcUbBmcv+tExosblwAeyk/4BV5/fwNcVg68Ue8h
	5i/ioHJhTMZYLwXsQevryKoRRvymxZKDob4Iql+ylidfKZdN4Xn5aXZaZULacysdI0bqR6rxABo
	ctZX9s8uGN6JhGqQ245PLBC3cm
X-Received: by 2002:a17:902:e548:b0:2a0:d662:7285 with SMTP id d9443c01a7336-2a870c1b0dbmr82171225ad.0.1769696047607;
        Thu, 29 Jan 2026 06:14:07 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82379c22459sm5485051b3a.48.2026.01.29.06.14.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 06:14:06 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 29 Jan 2026 06:14:06 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Charles Hsu <hsu.yungteng@gmail.com>, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	huah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org,
	Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v7 2/2] hwmon: pmbus: add support for STEF48H28
Message-ID: <010c8002-e1d6-4cca-a326-a29bdb3c21f2@roeck-us.net>
References: <20260126063712.1049025-1-hsu.yungteng@gmail.com>
 <20260126063712.1049025-2-hsu.yungteng@gmail.com>
 <46a42764-6cf0-46c8-b764-4c4b394b04d0@roeck-us.net>
 <20260129081743.50ab5a66@foz.lan>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260129081743.50ab5a66@foz.lan>

On Thu, Jan 29, 2026 at 08:17:59AM +0100, Mauro Carvalho Chehab wrote:
> Hi Gunter/Charles,
> 
> On Mon, 26 Jan 2026 16:12:42 -0800
> Guenter Roeck <linux@roeck-us.net> wrote:
> 
> > On Mon, Jan 26, 2026 at 02:37:12PM +0800, Charles Hsu wrote:
> > > Add support for STEF48H28 hot-swap controller.
> > > 
> > > Signed-off-by: Charles Hsu <hsu.yungteng@gmail.com>  
> 
> This patch completely broke docs build, as it is using a markup meant
> to identify section titles to mark the beginning/ending of a table.

Yes, I know. Randy already sent a patch to fix it.

Guenter

Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAADE39AD33
	for <linux-hwmon@vger.kernel.org>; Wed, 19 Aug 2026 21:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787174479; cv=none; b=RXKIc4qsFTSKwvdBUoELapk/LomMO6c2Zw1afssmEU0I3a1gxbfFf/Sy3CLOK9XkgWC/27oapM6LiEq9hXCDtdjj0itrNIO5PLVUXVUiaqZLmj0srrPr+1GGhKywRuwooxg8a06RzEj76W3FXdl711hGGM+/X8M/51bEM03x4U0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787174479; c=relaxed/simple;
	bh=1sm5DJvN9JZq6zFJ3rudO9ha47L7zEKKAdXSC02I0m4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uEYQQoZaUzApa0M1ORGLgv67CzfDD8MOsZX3XbFphnx0eq4Ir7PmpqK1lqsmkIFrIvjuJm3ye7fNsptWsCS5IDRgYLJ0Z/DYT1VPmWYuiIMvJ5Ob7AhADhPvGclxEdac3YSinLI6rYMYgDD1psP9zxZtas7oKFP0c8UaSF6t42k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gNDEQ7Yj; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=hZbf4DBG; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gNDEQ7Yj";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="hZbf4DBG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787174476;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CqgpeVGn0RSIV25AilpufRbxuFATmlWL+zdwTTPB/B0=;
	b=gNDEQ7Yj7uPQ54t5/YSnKU7vgJwKAHpBXumRH1iQZseluqtnzlzCLtu64c6Gi3enIHvEV1
	ymfY+tGbZzsyTrv0CbiJKGboMlUxQUaZbTEsyq3u7M6gcbbT/j4awdTZC5UBoninSuImsy
	Va4d+9j0CYSrGldwqsjkI0+2ULIKTAM=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-580-xUEzoQYHOMyi7Nc6GL2SJA-1; Wed, 19 Aug 2026 17:21:14 -0400
X-MC-Unique: xUEzoQYHOMyi7Nc6GL2SJA-1
X-Mimecast-MFC-AGG-ID: xUEzoQYHOMyi7Nc6GL2SJA_1787174474
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9309af14fd7so176157785a.1
        for <linux-hwmon@vger.kernel.org>; Wed, 19 Aug 2026 14:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1787174474; x=1787779274; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=CqgpeVGn0RSIV25AilpufRbxuFATmlWL+zdwTTPB/B0=;
        b=hZbf4DBGYedr+3yZZYyeMRt3r5Aaohe8avIvv5fmQ/okL4NbmjAzqXyI3UPyiI2CbJ
         v+15mmfBBBPt0fXT1H2uXW1ZtxATaPVt8SznQ6ih7SIPJL7cZWHSyLXCCupwXXTnI1mx
         RZ3NwUlLrDOEgJkjf7BbqC3pG7FFsTFPZ09S1o3vgN3J7EQ6/oCDTPU/HtHPVoVrrHFs
         DMYXx9lThQeDV35VFqOtDtW8jg4FlxB24rcTaPD5/52zESGuVsT9nXNbPmSC0KGk5Njt
         HxbDuWhlNHOd4329n9s70c6AQzjQWq+XPUatwIOT4ydNkZpMRP2OH2Xnfjq8LIVkaP4u
         +wvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787174474; x=1787779274;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CqgpeVGn0RSIV25AilpufRbxuFATmlWL+zdwTTPB/B0=;
        b=l4bch+zDppbVxKSVyAkQLkGKkMdj4KbBjWLNcAsE1p7fOp/+j4ZhJyRxe6i1aA1qXr
         ZTQqjkFdTpyR/78g7978avI6Gt0fbq3Sg7JPocAQeyDeTTSmGqplXcMfJon2Q5zF1bDs
         lNWY3zB8/k/b+JydnWy+UltNzv8eMF8yFo7R5G153NJtq6qPdnEP+FAfQKiCmSGod0Wk
         wKFuFlaIyA25x7ndTyKbBRl/NI0nEoFAnOWQfoD6hOhNUDGQLXbg4bTpodsq+lFWdxbw
         pV/2H/3DD57AgOQZNGWIVP7wRFiaVwDv93uYFIcPfrYObOkhH5rgeMTN36n2lc/PCrVO
         Rfwg==
X-Forwarded-Encrypted: i=1; AHgh+RpqDbga1jAPchiNNMX7rW4qSVC9SCNVNKC4wvb50kQtWVmBNGp5V8VfjLPSLh0/RVkIXa2jYn/kJhJxFQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxeDOwtTwM2MOqxE+pzIsgz2a34+6UKC95RJpCDcQjwAsGoSFsY
	i/6xq4hWwFLCgg8zB7bRWNSN9gC/poCVvyoKNNrIWVdgiYge+DMDcIsnsVGeHDEXXhQTCoZ4n4a
	gmmDuE7FwLjEQK1ZUSxEh0DvHnGyFhuOW9oYWaiaDOvLRYks9TnBrMTXoLsYfkVcc
X-Gm-Gg: AR+sD13vVL75ohstBbuMu+QQGDtzf4whqoY60wDCNSRBWhDcAzMaLI9fyQv9ohSj/z+
	cQKbG5XSG0PZ5L0mOq6UrEx6tHYFI5XA5PMEaMpwMpPN2JYbTK7eGAEP1grOkX/3AUG3xxAh1ML
	bb64KWAoSw+QtPZp04EkyseI2glz2eHIlewNL4/5pOcVLHGz1hDjfzM/DIHA/dxbzcjbvYVhXL2
	qshkyDo6kDk7SAjN4GHmMbeYmm2c8bjQHQcc2aFsi1xbwi6ysv834nCrzO0bbVp6SlpzY+dxdh/
	8TopUs7YNOh7LIjcqHodQt6KHvFbAIz3ED6cO3qAkg74HvrATfHqMzFzdeI9SGSOmTnPQG8b10o
	wfpHshLbsn2UfP+XIrFbdiRqGPkObxYPgMfU=
X-Received: by 2002:a05:620a:6010:b0:937:139d:592c with SMTP id af79cd13be357-9371e67ddfemr822213385a.38.1787174473994;
        Wed, 19 Aug 2026 14:21:13 -0700 (PDT)
X-Received: by 2002:a05:620a:6010:b0:937:139d:592c with SMTP id af79cd13be357-9371e67ddfemr822206085a.38.1787174473413;
        Wed, 19 Aug 2026 14:21:13 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93720582980sm222991885a.33.2026.08.19.14.21.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 14:21:12 -0700 (PDT)
Date: Wed, 19 Aug 2026 17:21:10 -0400
From: Brian Masney <bmasney@redhat.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Tero Kristo <kristo@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
	Nuno Sa <nuno.sa@analog.com>, Guenter Roeck <linux@roeck-us.net>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Antoniu Miclaus <antoniu.miclaus@analog.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Andy Shevchenko <andy@kernel.org>,
	Sunny Luo <sunny.luo@amlogic.com>,
	Xianwei Zhao <xianwei.zhao@amlogic.com>,
	Mark Brown <broonie@kernel.org>, Kees Cook <kees@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-hwmon@vger.kernel.org, linux@analog.com,
	linux-iio@vger.kernel.org, linux-amlogic@lists.infradead.org,
	linux-spi@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH treewide 1/5] clk: ti: Make sure clk_init_data is fully
 initialized
Message-ID: <aoYeRqwY3SSZ2xDX@redhat.com>
References: <cover.1787165329.git.geert+renesas@glider.be>
 <e6f52b34163c8e708c1100107b437af0b3b049a6.1787165329.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e6f52b34163c8e708c1100107b437af0b3b049a6.1787165329.git.geert+renesas@glider.be>
User-Agent: Mutt/2.4.0 (2026-06-19)

On Wed, Aug 19, 2026 at 09:05:15PM +0200, Geert Uytterhoeven wrote:
> The clk_init_data structure contains several mutually-exclusive members
> for different methods to specify the possible parents of a clock,
> prompting drivers to initialize only the members they need.  However,
> not initializing all members may cause subtle issues, which are only
> exposed when CONFIG_INIT_STACK_ALL_PATTERN or CONFIG_INIT_STACK_NONE is
> enabled.
> 
> _register_mux() fills in init.parent_data, and assumes that
> init.parent_names is NULL.  However, the latter in uninitialized, and
> thus may cause a crash.
> 
> Make sure all members are fully initialized, to fix such bugs, and to
> avoid future breakage when converting drivers to a different method for
> specifying the parents.
> 
> Fixes: 667f420c09f1417c ("clk: ti: mux: resolve parent clocks by DT index, not by name")
> Closes: https://lore.kernel.org/CAMuHMdU3yVqoyHC4eNF2NuYo8wy+6ODLoYat4R71X99Mxc_=kw@mail.gmail.com
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Brian Masney <bmasney@redhat.com>


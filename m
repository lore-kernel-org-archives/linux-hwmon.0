Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BE8F3B0596
	for <linux-hwmon@vger.kernel.org>; Wed, 19 Aug 2026 21:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787174546; cv=none; b=heC6yKa4CGGSau5S3gTCQjxrDRQPc7UervsiWEjAB3Scl08hUzpMvM8lxHyRu+3mClKmoVIubDWo3FVmfkuQk7tn2NlXBV5PVoCxh8sm5UdT0J+870fL/YjXuCTkkmK2j+pQqBj1gFmae+lp2DBojvIHEzsrJ7DoVe6nNb7D+3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787174546; c=relaxed/simple;
	bh=ZzdoD++VvHeUKmBu7FDDxPK5u0C7i3uGZGCaEX/ePk8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UtTfwvdDo3ePrXdgsxeuqnoW693HaFgNHAz7WJCeXxFwVS+b50T1rElHWQvDfYVCsSDkL4RA7nt6QAgvSGGqsBAUFozRfeMlcin3xs6Nq9HGx62S08mxBXxgcnSo0j8/r8SXaSF1Rk9mt5vdy//xhnlWarotnVj8WpjzNelm0RE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RE5VTG3K; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=KNeaH5Nw; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RE5VTG3K";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="KNeaH5Nw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787174542;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/BxA7XcUttIdzHWbOyyyGM4mWiq1VkGr6i1wmE/8c1I=;
	b=RE5VTG3KPs1CYT5imkvkp6vZdKRrbnBSpA99awsj15XAUnSTMvSgPjZg2P7e7ei5ndfG1T
	9+diIQLTiSsn5UJjnh890Z6HsNkO6yk3HpJA0OoKcMR4bVKvlKTrQb3tuaROdXv6nQ7YHO
	jc+nS1zS7YC3e87KaxNrFc/BGMwpL80=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-216-6t7-c29sOKCsej8W1xFSkw-1; Wed, 19 Aug 2026 17:22:21 -0400
X-MC-Unique: 6t7-c29sOKCsej8W1xFSkw-1
X-Mimecast-MFC-AGG-ID: 6t7-c29sOKCsej8W1xFSkw_1787174540
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-52d28f8737eso24153421cf.2
        for <linux-hwmon@vger.kernel.org>; Wed, 19 Aug 2026 14:22:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1787174540; x=1787779340; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=/BxA7XcUttIdzHWbOyyyGM4mWiq1VkGr6i1wmE/8c1I=;
        b=KNeaH5NwoTLtvwqOqMMCgUy92YE1e2DS49yaxNI6PWtSO30S50ithGGWkZbZBBS9kV
         crb9/uMkIWqF3hYy9Y4SQyWEimFnYxwdUteEmOZgXIaBaonRP7jamZovvT9GG3EMG6KX
         jE4gkeVYWTYywh99g/bYqOQk5FNRJXAMRYsJ+MgSG60xzePXd/zQp0y2paGQhLKgmdYr
         QM9tpzVQUAcGjLn71bvuK/dml08tlQuGJTJVGPfyYgHuAP9vbidIw402Dnq2VVG1JYLF
         06Zd+LufUJVgntF5pSqH/Qmkg5/nQiv69ynA1iI7aMvQEW5AMkWgojY+IM9KtvDMWkdC
         TBNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787174540; x=1787779340;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/BxA7XcUttIdzHWbOyyyGM4mWiq1VkGr6i1wmE/8c1I=;
        b=IsPUK1TbfvxtV8XUM+1OeNM0Bc+aAejbD8vHNtGGJaFVUWT90LUDs4hKsqqVmKgWJ2
         uXBF+reseLpLR5J/nFqHnfcirqs8s1LToloVXK10+AN0x7Jzm8n53CejLu/eS0vvscfo
         H8AyD5YtYQEfHF6mliEevpNlZ+1SOthiIDF3fMpqICHcNgfg7HS4Cbelm69Yo0deY6cm
         vdUK3RUWUhR1CGvDOCCQiyU5GrX2pbFXBKhkaIoWtOcr8K1YvXEqUTEPZZFTcBKCqos3
         z5/l+PFNeCzXfGJPCciJxiZifRIB+XS9yw7GaZ8hq88obwlNvDq25KodjHkx1o8vYUUI
         reZQ==
X-Forwarded-Encrypted: i=1; AHgh+RokE9xJ7JxOtt2DTvGhRK3DbijcGytBOQTfGstwmcpTOtMWo+pBmPjnwkgCre+kjsbHf5eh6/OtQZZgmA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+11GfoVK7bhnmksBfMuTP8Dojy+mD9zj/SxoLkEB3i5lvXEwi
	XlI84kYzAXoIRLYVswxVoHqLgicUOTTPlZHzXkHCfG2BPPEV01FF9SZivuUJfll3L6jjcV+ATD2
	cHP8+kGQoTuK6QKmmrEGt5n1iy6+wvXAzV4NRLMFAnaZVWEJTqHOu6G18Dn0w2bkt
X-Gm-Gg: AR+sD12e82Vz25zwkR1ynREcHO3YybO/CvXPwbToMZemOXd6YLf7mDF/xb4P4tvq6wi
	YFixqpO6rERA+hSuH9i821ZqLu9duWfZZvQ+Q4mxzlSYkpG3hFgqq67INYFyHenQiXYeYUVCyO5
	NShllNvQZWTqoLQ7c+h5RBdqcwAKuLgrgDLSJO5lqR5TbJSQumWUsRZuxX4W/+/19uE6ClqsoxG
	hVmPFw9kaIhNOy7u4+fAWLEKfqZQpQJjERwHIsI+yjYD2iskGUyShEXQmdHemLVP8ylr1wbgcTZ
	fzYbmjEunY7G5Vbg9OVyW/XOPWpyUBsqrt2FuaczBm071zrLwEazv1/41q17CaN9MXOmRsGSjpz
	BPtHiXPidP1iR9b4bfAQpeUoTaa6Tobmc9TU=
X-Received: by 2002:ac8:5d04:0:b0:516:e249:e30f with SMTP id d75a77b69052e-52dd5e05a70mr71525111cf.42.1787174540417;
        Wed, 19 Aug 2026 14:22:20 -0700 (PDT)
X-Received: by 2002:ac8:5d04:0:b0:516:e249:e30f with SMTP id d75a77b69052e-52dd5e05a70mr71524431cf.42.1787174539914;
        Wed, 19 Aug 2026 14:22:19 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52dd857b36fsm18734791cf.5.2026.08.19.14.22.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 14:22:19 -0700 (PDT)
Date: Wed, 19 Aug 2026 17:22:17 -0400
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
Subject: Re: [PATCH treewide 3/5] hwmon: (ltc4282) Make sure clk_init_data is
 fully initialized
Message-ID: <aoYeifWtRNoksCoR@redhat.com>
References: <cover.1787165329.git.geert+renesas@glider.be>
 <8ec3c5cbd2df675a938f090470f5da5f22008517.1787165329.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8ec3c5cbd2df675a938f090470f5da5f22008517.1787165329.git.geert+renesas@glider.be>
User-Agent: Mutt/2.4.0 (2026-06-19)

On Wed, Aug 19, 2026 at 09:05:17PM +0200, Geert Uytterhoeven wrote:
> The clk_init_data structure contains several mutually-exclusive members
> for different methods to specify the possible parents of a clock,
> prompting drivers to initialize only the members they need.  However,
> not initializing all members may cause subtle issues, which are only
> exposed when CONFIG_INIT_STACK_ALL_PATTERN or CONFIG_INIT_STACK_NONE is
> enabled.
> 
> ltc428_clk_provider_setup() does not fill in any parent clocks, and
> assumes that init.num_parents is NULL.  However, the latter in
> uninitialized, and thus may cause a crash.
> 
> Make sure all members are fully initialized, to fix such bugs, and to
> avoid future breakage when converting drivers to a different method for
> specifying the parents.
> 
> Fixes: cbc29538dbf7d740 ("hwmon: Add driver for LTC4282")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Brian Masney <bmasney@redhat.com>


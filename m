Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E7832C237E
	for <linux-hwmon@vger.kernel.org>; Wed, 19 Aug 2026 21:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787174590; cv=none; b=pFxXVv4XThzfMZJcZg28oW/nsp5+W4koqH4Peju566OFBJkGEtl+1xhvRxyvpFNX6MDambHBmlPH2KGXQhsSSme/c9iwHUmMSpIdp67VTRCPDdwXeCItqPRi9AqbG6T+qcX1mVOY62pfWwfWWI2vt2Ek1nxbdm/JjquEXaeWULg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787174590; c=relaxed/simple;
	bh=e86+tyxRdQKzE4t52ZefcteM0bRE88sbIL68NZYIiAc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZME9cRcqLWTF8wWhm6JJMgOKdrCUjbIQ5B/CMySWaro7Cpgh4f7XyU5qg9iNXvA29iZhvgWdPcHKiOaOrlYu2I4XhFDTAWIR8HChPQmwUe754ADOYi19C1l/eOqSHZXcVZOU9FhX5yRSZpE+rTG36ATNvzNqFZE+PCMFZ0yg7sY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UNzU2lCM; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=JCKAFLrZ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UNzU2lCM";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="JCKAFLrZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787174587;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Y2Nq6oWt/A+GglsE2R04tSZrXRfphvvWNtrnE+gHf8s=;
	b=UNzU2lCM8vGP/ynJu6UYWXGCk6w7dVDtbXs2Ew1fNbDLkeCPOIhcDCATa02P4Lr/I9uPYs
	JYUM4xPAGMT8/QeMWtuONz+/MZ83Pyg4nQUPdIILyPPeqtCkhUNLjXCpQYeKCRx+4tbu/d
	NxY/KmvxMtzjxg6jPMx4fJpI+bNtpyc=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-117-u-W7sCc1Nruje1_uA9_kFQ-1; Wed, 19 Aug 2026 17:23:06 -0400
X-MC-Unique: u-W7sCc1Nruje1_uA9_kFQ-1
X-Mimecast-MFC-AGG-ID: u-W7sCc1Nruje1_uA9_kFQ_1787174586
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-9083b049f73so19732606d6.1
        for <linux-hwmon@vger.kernel.org>; Wed, 19 Aug 2026 14:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1787174586; x=1787779386; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Y2Nq6oWt/A+GglsE2R04tSZrXRfphvvWNtrnE+gHf8s=;
        b=JCKAFLrZWsJlDyDL0n3WLYXT63egpUnZ+e9sB2o8Cu52PYgoPA+qrgX0HMk/lPmuhg
         kcZ+OnAOPFAPoYKI9SfWNtt/wNFfb/l1B6Qdpjt9TXkwa43DK7+RdPkfUnPYcbSp4trw
         Y17ETv81mfJFnM6opMhSYQfXk50NGBWU+qwk2peJLmDw+Ewga6+okxmFUof/ZIMerVvb
         1M+0Hzo+ltWLG+vER+nwoKKVNLyJN8Nnj9uBk8EtwVn/j5vuBSOg0S9tvxz0J4D9NJmo
         mhM/RptbedIlUzfhAEYhLCvT3YX9QmZVBkAYg7TGMhcQn3/sfMzWQIBbnVAkWKY11f4X
         qF+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787174586; x=1787779386;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y2Nq6oWt/A+GglsE2R04tSZrXRfphvvWNtrnE+gHf8s=;
        b=Y2hESgOEcEw97Nq2Mp28pr/T9zkwgdKNUJdWjTB8Qmmj9F9wJXEBcXv6yRFCfQOKoH
         THlNifapeScgIwL5Yozdg9sM+t1UY52CHeq57C16LmBrSfqOKKuPAxqVQYDYCTK3cw42
         YXLEqhgFSnYFxCru2b68ZLKFSKxxqedhStobm+WUK/ZqZLWcoiLRg2kh/vkNxs7cypnk
         2/CLdfZKxMwr5h1OjGg32eYvg1B6gs0WB0qExCckgSHkHZPurU89feDH0dAuWpylFy+d
         pOScj0+OviXTWll8VMErC6u0EQG4BGYTpiJxYHTw9NCJAoj53TUGQu8/rVJig18O2ZWi
         mZ5A==
X-Forwarded-Encrypted: i=1; AHgh+RozmkMEL+kwmNBxnzzRwdfwj822s1yBo7Ra+fMRPQAdfIar+aUeOGreDnD8tA2opuGp3UqhNY72NesN+g==@vger.kernel.org
X-Gm-Message-State: AFuF++n70VhnFMsDoEtWevHtiitmzS3fkDfLnkK9kvYhFFX7j28/VZjl
	0ylizK58s8k1clPVL87KjF2LRWzVnu3lBLb1En0fB3Z1U6kxCl/sP4Jp3mdsbDunvbKdcm0QPFU
	X4D5n5qDEFpxfWiQXxV0vcH1UmUfz12zajSZ3vbkKt324CZoYDtkizVgaVGm9zFxE
X-Gm-Gg: AR+sD11GaMsVYKymsuNG0oRgPehLrLO818kps1r3/gY0Qyse4fMLox9kn1A8tO96J2x
	XJSr2kzop0wwk2W3CSrnRDmCtZ0AnS56wQPIQyIt9CPKoYqY9Lm5yOKFqXYZqm/RFB8kxf3aB3h
	7Ger7o33acrDQ4gIpvyZQWPE/xGVLBcw6+RlFB2eGyVGcvdJ/b0HyVewfztas4OfTMwrK9pk/6K
	l29hEGou63y4ZtO+Eg0rmKZJ5cCg2MBd8wVPbG2tk/MaCbEFPjgwzPdjlAcbRtDLFIZ88g0OmyM
	ke9yxb37gSBVGYGHXNygQ972PlO+cNPwzfTezzJsgLfPfV8SRxInu3PSby4WKRJY2M2Z7m4YNkT
	Uj1dNVS2i7NCoVewDF9pURP6k/dwxBID1/ew=
X-Received: by 2002:a05:6214:260f:b0:90a:804a:968e with SMTP id 6a1803df08f44-90c5eb8132fmr77665616d6.32.1787174585747;
        Wed, 19 Aug 2026 14:23:05 -0700 (PDT)
X-Received: by 2002:a05:6214:260f:b0:90a:804a:968e with SMTP id 6a1803df08f44-90c5eb8132fmr77665056d6.32.1787174585342;
        Wed, 19 Aug 2026 14:23:05 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90c5f2a1139sm23455876d6.34.2026.08.19.14.23.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 14:23:04 -0700 (PDT)
Date: Wed, 19 Aug 2026 17:23:02 -0400
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
Subject: Re: [PATCH treewide 5/5] spi: amlogic-spisg: Make sure clk_init_data
 is fully initialized
Message-ID: <aoYetnpb5fu2M9u6@redhat.com>
References: <cover.1787165329.git.geert+renesas@glider.be>
 <9fb35ae0aedb7a6db0db6c78a8193c7602dd9d44.1787165329.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9fb35ae0aedb7a6db0db6c78a8193c7602dd9d44.1787165329.git.geert+renesas@glider.be>
User-Agent: Mutt/2.4.0 (2026-06-19)

On Wed, Aug 19, 2026 at 09:05:19PM +0200, Geert Uytterhoeven wrote:
> The clk_init_data structure contains several mutually-exclusive members
> for different methods to specify the possible parents of a clock,
> prompting drivers to initialize only the members they need.  However,
> not initializing all members may cause subtle issues, which are only
> exposed when CONFIG_INIT_STACK_ALL_PATTERN or CONFIG_INIT_STACK_NONE is
> enabled.
> 
> aml_spisg_clk_init() fills in init.parent_data, and assumes that
> init.parent_names is NULL.  However, the latter in uninitialized, and
> thus may cause a crash.
> 
> Make sure all members are fully initialized, to fix such bugs, and to
> avoid future breakage when converting drivers to a different method for
> specifying the parents.
> 
> Fixes: cef9991e04aed330 ("spi: Add Amlogic SPISG driver")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Brian Masney <bmasney@redhat.com>


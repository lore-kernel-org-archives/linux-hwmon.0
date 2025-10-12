Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14C342EF664
	for <linux-hwmon@vger.kernel.org>; Sun, 12 Oct 2025 18:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760292718; cv=none; b=pQ8rkzikfhr1I8yR3HoTMo/kMYlYXDhyYr0/HBEbFApvIj2kFWg0yUUR062FWkfQtLk8U/I6T4SdJhQMpfC7ysFnHT09lPL65zvON5ZWOkqnLHus/RqblZhUJjhiBKixSYTTWQBmVWSkhEgKQOIwKeLTew28EmbXlDFHRgzLuys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760292718; c=relaxed/simple;
	bh=/cyhZ/9Hkc7oUmiZm4OS/cSmDuFWOJB6FhmqFyMM3m4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UmGBJLo3UWYsgo2QuWIQj1isagJVTGuJr2Xm5SP3wMtRxW9p6fk5N1uCNzQKcsEnll9/PMrEB6S8xBdv2a4LEVOyT4Zb00JKZQGN1LrnBDHmfSRsWlERkeby9/6Ck+gVSwoQaFwUfEMs+eaL13fO00RhHOvJnsRDbfxLZ3UK6jM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ChPztAan; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ChPztAan"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-271d1305ad7so58788575ad.2
        for <linux-hwmon@vger.kernel.org>; Sun, 12 Oct 2025 11:11:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760292716; x=1760897516; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7Buj0t0IDW+PBuk8/VhMvFLB30ectWj4e/2J77rw3gI=;
        b=ChPztAanfHRIfs/IXcJBQyYD3hqdsyHysvfb0KlnSs1N6dh0OR0goD1+Wk6EoCj73p
         THQp/37Z/WGp3rmOSVSfk7anHCDBGZImuun3oW9OHituNAiTmP0L7pdrNVBtOeABAn94
         7Pc/yYIsZCcKTrh2V1my7jpxeiUKDYt8CfNwSQRRTCfLHmb5hhzkxvtzazmeAowgDhR6
         i8KEtajT/uN1LVdTl1vOvRASiekYIalHsiAeeg3mzZPJgTkhJnKx5ASaDG8UX6e17uFB
         9r5/bcMkkHltRpSDiRdlYUavaz3WS+myzArM/+UuTjJ1OBgWUfgncgytNgYvR+GU5ilM
         2eIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760292716; x=1760897516;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7Buj0t0IDW+PBuk8/VhMvFLB30ectWj4e/2J77rw3gI=;
        b=XAdt+cOLnh9JtyLmh/bW01ZgJMuJc4X41blcYwUcbmnsjfcXLTxQi8yUw4IFWqWt9e
         n8cbgk/xrcVAIafgRQloeyHDNQ7Fk3BsSj07+KbELmFQsgQBqGlP9uSgxoWv5Aii4egw
         8m7Q4qoFlcPA6zp5M9s42c/by6cYfaTc/oMVVq1HVNhne4teWan5LYnFvTRK2ZI+SZqO
         wZdN5woYk+duVedEpH4OT+R0qiXcdeREQM4MWVK+xawmtKtItZP6uxBEn9iWoJfLE3gK
         IvgXFFXv79IKb1jGKZSDdrW9QMrai8DGGQWlmsUC/kR5NIOLvCwsXWmdS9WQFj8/RzJ5
         fmdg==
X-Forwarded-Encrypted: i=1; AJvYcCVOU7VV3HYkbYNaH/FdC+WORadr+YClt7OPkRv57EOSVKsAExD5lBwT1HLdKTb+fcYs7KEWfJ0ihD3Bgg==@vger.kernel.org
X-Gm-Message-State: AOJu0YweRLTtlWY1vxrrYENy7by1i6JRWH95/6OPhxA62hDNWnDfUy1j
	JRPlXL/jL2a3eAb2S5v7GZuvoiSRGQh5xEL0nSy15puRwHMe/CHUjjcR
X-Gm-Gg: ASbGncscxDRfFAUCX1mzoRNpmqsIn/cKzClFkVvgILmFBhybXKtvTNRoOMtyvBKfXu5
	8ugPyfHXTsmFO2HjSrSHw8v7LREiIJX/fPKoNkUewKWknne4koblfhqVbh5uBpfD2YkvF/nXdUH
	bBXlehAp0MkSB/+y1sUxaCdcVIbpQc0KGTjdX8qXyPYvzg+oEWHdEmAjLAD/5OVBhsL/YL2tENF
	rfUcNLMHSIy9RXuJ4U1nqBY0zdw11zSuaRsM72QVzdnGCTjqUVYAvfXDx9ybZBP9R9UVUkFLCHW
	jO+cwuqnLlshzFzFJWRJYJyttdAxxvVulFG4QIWYG2wI3mN4QPyIV6hdHx6iiBnZC+hpuOzW+Ci
	23/AotQoW6nFl5f0+7GnaxY0A7OEK5N7xZ+T+3MRgEzGHlWL+ZN/xexUIcvGKS5TNWIaRejZjeb
	w=
X-Google-Smtp-Source: AGHT+IEcqDTieHsg1AER/qsu+ki9Hdvx/uwZq8AQiPyaTgu9kB1bK40A8LEDTjO5eRccXUF2P/E63w==
X-Received: by 2002:a17:903:247:b0:26a:23c7:68da with SMTP id d9443c01a7336-2902739a818mr222464765ad.25.1760292716317;
        Sun, 12 Oct 2025 11:11:56 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2905571d68asm45307815ad.2.2025.10.12.11.11.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 11:11:55 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 12 Oct 2025 11:11:55 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Ivan Mikhaylov <fr0st61te@gmail.com>
Cc: Iwona Winiarska <iwona.winiarska@intel.com>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org
Subject: Re: [PATCH 1/3] peci: cpu: add Intel Emerald Rapids support
Message-ID: <aea56786-8cf2-401b-bdd3-0f9733853c7b@roeck-us.net>
References: <20251006215321.5036-1-fr0st61te@gmail.com>
 <20251006215321.5036-2-fr0st61te@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251006215321.5036-2-fr0st61te@gmail.com>

On Tue, Oct 07, 2025 at 12:53:19AM +0300, Ivan Mikhaylov wrote:
> Add support for detection of Intel Emerald Rapids processor based on
> CPU model.
> 
> Emerald Rapids Xeon processors with the model set to
> INTEL_EMERALDRAPIDS_X. The data field for this entry is "emr".
> 
> Tested the patch series with AST2600 BMC with 5S Intel Emerald Rapids
> processors & verified by reading cpu & dimm temperature which matches
> host sensor values from lmsensors.
> 
> Signed-off-by: Ivan Mikhaylov <fr0st61te@gmail.com>
> Reviewed-by: Paul Menzel <pmenzel@molgen.mpg.de>

Applied to hwmon-next.

Thanks,
Guenter

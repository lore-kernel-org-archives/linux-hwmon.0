Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B95642580CF
	for <linux-hwmon@vger.kernel.org>; Sun, 19 Jul 2026 14:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784469818; cv=none; b=jdvEBC099jIGU8xxY7G7A22NYCVW+CcSVh4I3XANwdhGLy+eg1E78Zm6wLOw6dzGOSOWkQey9ltsrF8pKIWpGpCdNb9nWD+LIOclKNn6w4jltA9gL/dOB3Ke4AhKzrtGtUNdYvQidLYCX+9CwaH5djZMRYjmWI2hzMvNAeg0Q/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784469818; c=relaxed/simple;
	bh=FScEHsxavf/hfHP5xugNB5AroBDmKKhA6smdM/mG4Gs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fFmPPeI90FF6DlHNm3uBD3G1HV+A1Z2W8RA3PSkljsspANMMPLLi5+dpWdz4L6NKqg77TNxIFvX0xMQLuUysl0ZTlbIHQqxlmeKPU2x276toYNLoOYebAAI3pF8Ex4xBYjv8aTp4wabop18jKYdJSJek8p1KBFxGpC8vtFNC7vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xx37cyEy; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xx37cyEy"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2ce7d2adef4so86309045ad.3
        for <linux-hwmon@vger.kernel.org>; Sun, 19 Jul 2026 07:03:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784469817; x=1785074617; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=It1W0Q96rJ6CzEu2CjysLzF9hh46NyOoFLWaifCozmg=;
        b=Xx37cyEy5V9/lXkoFZaPUjVT58Lvd0ECSV/zgjM5Nyb7KmQOaRkHjghZG9Td0rNHOK
         r9JRzip72SIzCsULNV4cS9vtzUUNdmewWtkqSyDVdodv7rvrr+iy1PmWb07T07txu4hR
         buvVntkw7e1vEVu3jZFL6IA4xY6/z9sZAdJvcD69UuWT8jAVpSmHf82S9JynlwYvkuei
         0iPHdSmEkBMipHBD0tuRGDuGvJ0GTzpJscWmmm3D8kMVjOCoAgY1a3rG+MKL/lOrxoIq
         hu86y7IT1ixLq5A5JFfqMA8jF8Pju6/yCfCsCmGMTHK2MR+KBNdXMK6bw4Y03yWwUeYa
         uwAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784469817; x=1785074617;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=It1W0Q96rJ6CzEu2CjysLzF9hh46NyOoFLWaifCozmg=;
        b=akbmI4AtPvCXvkfIfQViNvbuANtHuguZpif//aZnxdI53sLSOy9wZnyuYpp5z3N0ci
         R5IYBgCpO3nCI6c59l9+oZj4kxnYJiPVfANZtw6Lk20w3qt3goYNSAslCWfOVKEUZ9UB
         c+JzAW0NwoxZnSZMjRdISEFwJxwAWT06dzsoibxyA7AdJeJ1RLTwxSckGuvPzfLj85yR
         sf/mndrcifaJnNfGPMIq0AMedhSLcjZ7WApy6zC6yCv8AOWZqDU8Uxwn+7NBcrWZOznS
         gjjxSOzrYHkOsC41ZoJ0x45k6pa2p3nxbsT+1Pq8DRMbOhpjhT4sgFu6aluvs/7Wdlvs
         zZ7Q==
X-Gm-Message-State: AOJu0YzFJLD0C3ljojKlPyby1AqX7z1uwo3uZokWVepTualNXhsEb6IC
	1LlcLsdbPfOrsdMp3AyMy00xej/KECVbCx3spSB0s/mWBaDh7f7+rlJb
X-Gm-Gg: AfdE7cl/RRqps5WKWPvTJ+JBRrkJrdttAy9yACyu9CeuUPZidco2C+biN/GfSTk/WWh
	Y7AZc4RQY5UVEZDb2AKCnhAgnyQYaSMNoYPSRk//Vp9GxL0N/xveKRJTJORrrzIP3osNmnh0QTx
	H9OASkXQVLkcDBIBTeC0vE/VYz19JloYE2fYsFUipHBXFtEjCVZmWcksoKp2Yi6xF/A4gmJeQUC
	8jJTNr1zcgy2kosFaE5HebFb/NYXL3hrcXzaFl/wLqKc8R93btSZSKdmTmSEuM7vrZp20+k8y2d
	ikQ4nXFRStCuW3WOIM6/XkWluPO4vRnMMiRLJzBUF1NdFp3gk2NbgCb7Ojsi5zWkS0EV1qFr2d1
	OnKMEaE2S+PtFNOFwBpsjpvMZMRELtTS2N5TIs+Z7LW5g4RSSXU7DTOfXpi78r1uYCMMlB3FaFC
	Hp06oewDwSvDIg0U4XsCY1oPEnWQ==
X-Received: by 2002:a17:90b:3d4f:b0:381:bc4c:da74 with SMTP id 98e67ed59e1d1-38e4b594ea6mr10817053a91.32.1784469817021;
        Sun, 19 Jul 2026 07:03:37 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e4aff383dsm4347705a91.8.2026.07.19.07.03.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 07:03:36 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 19 Jul 2026 07:03:35 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Vincent Jardin <vjardin@free.fr>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (tmp401) register with thermal subsystem
Message-ID: <d4daa2f8-704f-405e-9fb9-c8df2f415a2c@roeck-us.net>
References: <20260713-for-upstream-hwmon-tmp401-register-tz-v1-1-47315d8617bc@free.fr>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260713-for-upstream-hwmon-tmp401-register-tz-v1-1-47315d8617bc@free.fr>

On Mon, Jul 13, 2026 at 11:07:54PM +0200, Vincent Jardin wrote:
> From: Vincent Jardin <vjardin@free.fr>
> 
> tmp401 is missing HWMON_C_REGISTER_TZ. So a devicetree thermal
> zone referencing a such sensor ('thermal-sensors = <&tmp411 N>')
> fails to register it. Then its cooling-maps is not set, which means
> that the fans are not managed.
> 
> Same as lm90 or jc42, set HWMON_C_REGISTER_TZ.
> Boards without the property into the DT keep the same behavior.
> 
> Signed-off-by: Vincent Jardin <vjardin@free.fr>

Applied.

Thanks,
Guenter

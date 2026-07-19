Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E22A1DB13A
	for <linux-hwmon@vger.kernel.org>; Sun, 19 Jul 2026 14:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784471376; cv=none; b=fxwQBbaykF+hi4eogkWuX9bL5uOcAvq/O3GGbwfEsH7RQRgC/0FJot6B3ZSB30L2/kBAxPRZIWTzLjNV68mxw9pidkHacmHo+byKapaOSpY0axekHrQePSSCbbx+eZ2V0gzZ6DqcW9J/LHLmminwwYNA4yr3ol6+p0AczCfzclw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784471376; c=relaxed/simple;
	bh=J1SwDtO6RWLeo7EwdiHCifQe9EbJky+5upvJpx6VUXs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mfc/4NzqLBren8/T0qi0FNQvlJh5w7hX+yaao3yjmUq81VjfKvyYT4Vt1/89dpquokGdbWFYFqY675mSIjQ65dfPG5yHs24QHRTPFrOOpl60HYgMsokge+21Uz3sqepbHTbX/KfcjhIqYZH34OFU0KMADjegTWslIelWgmhjQCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eEx17fPT; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eEx17fPT"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2cf27856f9cso35539745ad.2
        for <linux-hwmon@vger.kernel.org>; Sun, 19 Jul 2026 07:29:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784471375; x=1785076175; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=nMmeaSW5m6PreS6W1hc8GycuhQWeKejjr7KZFOTKxEY=;
        b=eEx17fPT9cd4W14v1df6AFC+HIT3b/jsH53ujNLA4I4Dox2yf3eXugX69h4BelabBB
         akCW+jlHZQksbifPUgj4FFq2aP5osTr7ydOp7z833Q1IkfZDmqVwTnnSpafKkZgXEGOf
         v6k4uHV5kht9kyUFh9OkK9q0yTdw8OZSlw4UrlgVoTjXJ8iagSCUvPsazv/LcKzScs+X
         9p0+vJHCRkw4mTxrauE5uwYL1dXZYm8Yd7EmmvPH5rW6q/1A64tom9oS68/TmP5pCmUM
         8iaWFTszfhFLkQGS/GhBdnxOQH08brTvNT2Kg3UmBe3Ndbzv+OmZHBCAzZQwV02IEZAe
         fyPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784471375; x=1785076175;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nMmeaSW5m6PreS6W1hc8GycuhQWeKejjr7KZFOTKxEY=;
        b=W+Q9eAnlsdIx9ZFaoLnc4CGzaxwZGNZPBYHE9lDUSSZq3Dn7D9A6IXg27/Rko/RXRt
         o+yoTi7GvCWvLT/k2mskyhLCGFlRdrFA0hJm8LvMdFWcPJEWpMV6dhp1CfT909DcLl7n
         Zoew/vgU7G55mCdGn6kMHc22nCafi0iEqvd4cn/7n2EJ3Cavs8Al2mWXW3/EsjaOtkLO
         zKdQ9EhGtCgYo82ld+w9lqdXpH4ZBbWSrradlEQ5K0Vl+KCFX/tp2pCYYIl47EdMM3Og
         QOyokEVAnlgEBnBEA0r+EhcHrsm4OPTfqbGuETxsqYuvBTpL11pCOC0p6m/KuNCQthXP
         2P5A==
X-Forwarded-Encrypted: i=1; AHgh+RrTMfOjUE9dGhFhLDpD+BMLranXvVw2BsiHpImm4sFYXLForj0PxvLT4FMVa3wYyIUwL3KyaEIXftdh/g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzueBdJvnZZ1ge6EFqy5TCGZodKNpucWybjTcg3M73HVEwqVfCM
	xDFP7hZ0lTfrmxqQujCI43nFx/JhrVw4HuUGeEi+Jeaog+XQ2MYoifMq
X-Gm-Gg: AfdE7cllw0TB7JYuPWDDDd8I3lJJu/2FwmOViCP2aVZVKF75sIy+FCnKYbNdMKE9HdJ
	TKuKHRbEgSzmD7WsKA46Z5G2nABplj5V7gDcQCm/fyn9wBlPU0t533T0IKPJyC8SQ8vS0oaFfuD
	e71jDld2kSdYc9JrIt46rUr3o+3Zxpnjq+lw9/w8WZbQ/y58b4aj/VFRrNgPOc6I6DfTcH294mF
	VukRejfGy3zsswhHcmN8bkifPkezgIpMbgSudfciHzShAZ63mCPRG041HC7fTwtd1UygTzKFzYJ
	Ab7+JIASvzztL2lmHjpjMZ4eMPxsNJ71rA2SOU3Hw+B1lzyEOz1M4n7MBgy+OMC4jCm/D815QhZ
	EWKVyzMJ4XHMEcuCH64PvZcX5ZeU0MuQn5ghG0dNsVwJIEuQVWE6733O1cY+QG+XYmmbbLJ1sam
	1ZriTAiwDMWaj4pm6mHHZ/tTj/Sw==
X-Received: by 2002:a17:902:ef49:b0:2ce:9b49:d4a0 with SMTP id d9443c01a7336-2cf34994db6mr117887555ad.35.1784471374913;
        Sun, 19 Jul 2026 07:29:34 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf347a6308sm40918175ad.82.2026.07.19.07.29.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 07:29:34 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 19 Jul 2026 07:29:33 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: wenswang@yeah.net
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	corbet@lwn.net, skhan@linuxfoundation.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH 2/2] hwmon: add MPQ82D00 driver
Message-ID: <f1b1f66e-84cc-49bc-a3f7-19a85ce378eb@roeck-us.net>
References: <20260704081810.1701587-1-wenswang@yeah.net>
 <20260704081952.1701914-1-wenswang@yeah.net>
 <20260704081952.1701914-2-wenswang@yeah.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260704081952.1701914-2-wenswang@yeah.net>

On Sat, Jul 04, 2026 at 04:19:52PM +0800, wenswang@yeah.net wrote:
> From: Wensheng Wang <wenswang@yeah.net>
> 
> Add support for MPS mpq82d00 controller. This driver exposes
> telemetry and limit value readings and writtings.
> 
> Signed-off-by: Wensheng Wang <wenswang@yeah.net>

Applied.

Thanks,
Guenter

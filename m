Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794817665;
	b=AJye9TzWD2MmgVjmpXk8dY6NOmYv9TL/6pIOsh9d1vWLUv4ri1ntWl8dGQ+TzD6trdOT
	 Orqp9E3wp5PCkxX3GN8s0Y92VDouNHmOGi5o4w7tg35btjvkMclHC1nWKXSB5eikm46IR
	 7MsSeroZLpdnF/0Uwm084Sl8H/NgqoF8OYm+7OVU5SaOpe0eBUZA5xgw3zEdoh3G96AuB
	 exPebtA3wo45NH6XylDbgg0dgzEdRHVDKamWXeYIZHHzG1FWXpOy26/ecHC86R0sWVoyr
	 QwXy4Tq/W/hTsLy3q8wvl1G7BAus+HGWW7mP9FU43mgychpYrs6S2j9XDau0+gKmMiQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794817665;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=JPKixLqu2J0r2gKaA9vV2FAPWomClf1vD2pVgRpZ7aI=;
	b=miZfHEfuHlbaBjAsVR8ATF4TwQe7nDzB4quL6SlFgca2e3CBOBQYZc4a31/p5XvgKaSR
	 ZGdAWH4UMWQiiI8m35Rx5OCFlXDnmS8xbrpd1Sg4dOe9ZfNxUUeQotwootOAkq7xhuHtn
	 toD7PRxsGRyHwBcnpWbY3eVNw7HB0PI7rgZRnlGaC9vpc2T9SZpXWl3uvguBFzO/cIi1m
	 CF7A9Rd0BctKFrtOc0lxb8USv/83/0MvHqfGw2c7Huv28duAoXLqg+ZXvn8Y09HHNb+XJ
	 7g/KwNQAa6XRUGtN4gNLMYVXAZw9gCG8GMdz1qyAVlrVM4lP/Oz7y24rcLgbxS5INjg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eV4fspfO;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.178
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 435E5606A31C
	for <linux-hwmon@vger.kernel.org>; Mon, 16 Nov 2026 08:27:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 435E5606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eV4fspfO
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2edd50e36f2so14215885ad.3
        for <linux-hwmon@vger.kernel.org>; Mon, 16 Nov 2026 00:27:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794817660; cv=none;
        d=google.com; s=arc-20260327;
        b=lSFdfv1CT2O38IhDwA/2XYgJGGWW06yMKMJAh+uBCvFyLAZshQxWI1s1HjewW41HjT
         hSv3isaagED1y06c7vSWSnDrdPkcROS1re4E0AshZRi6A4Fx4ZKnovwMHe+bBsYX5UaY
         YDGEpVbGxmrqXqZgbrwthhbRxWYtsnA19mkKoxHv9CSAgKJx1CmTOKR7ViJj8ZfjzMT6
         qHBfMtTYV5Yv2uUBFsOpTXTsKdGQ/1y+whbhH6tcYt+9OQRyIXI/Rt6Cf2PTE3yoaCK7
         lTcs00kk226BVdjuxYWR8050jJxdaENvZBSrd35bPMe/SQmwlXMsnEazFgHeQeKUl09G
         5yEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=JPKixLqu2J0r2gKaA9vV2FAPWomClf1vD2pVgRpZ7aI=;
        fh=6lNjJpRNkM5cBgwcWbIV3AxpHvdTeMNEKc3YT7hpXxo=;
        b=iguylNtRI5npvMvDSNmaoa4SDQ+WHbKpwSrZF/xQaqGP4J6adrwPYtHvelIz5w1+LC
         Z06NAl4M2V6fak/FZebZMgR8XM+YQVMUghY7sHcV+1lNu/kyXsp5/YattzQtV/bFr9iT
         ccx55FpyFWiFRVKiTow/vl0oLODnQ4bpdjWnlKAa2iEsB33XY1wn6e/IjW2syGZT5QMP
         bU21yWpE8DZk7SKXoqme3SS+YYHyUUrJKDTepJe5hwT1kYXjDqJouVJFOSKMfWxAXJpv
         kDPoTfupvYSf2bKLHBFA2+usXbgaIbmJWlpKVvQodOJDkPo1rH826abme0XaxpnSaqOx
         dXeg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794817660; x=1795422460; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JPKixLqu2J0r2gKaA9vV2FAPWomClf1vD2pVgRpZ7aI=;
        b=eV4fspfOaP2Tturg+lzdotzqI2Gm0GnlSyvDrPWhQ5MuFzcOcT15MPaLUk+9dY8ZGG
         eg1MBKaEe0/L+9cUmBdW3g7Vs8LwDFGf9f6aTF3LMOSQb1YNO86FlepwJUuwAcJ54q7j
         VSkBykJ9gdeE4FG6JocH1C9zUJB1zYUtldORv/MOdIX+MMgxSDRfOiM88fxkYen69e2k
         +Se5azRHXTBBtMDGpZbyhFGDmHVJP+H55A6osBbP0MLpC6/ABw+PqFOFrLinmeTWZWmg
         sCMMu+GpdOZqC0ROyrX8tECYVcNcJZ7LORkifra47mCFvS/3QOMbziy1RuwXRkggb/gw
         qVAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794817660; x=1795422460;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=JPKixLqu2J0r2gKaA9vV2FAPWomClf1vD2pVgRpZ7aI=;
        b=Ns2B0gyZWtkmGUKKGn+jW7HaKAFeffy/j1PPr5zKQUcauX5NTUnK/f3y+gJVVtdCix
         yFbhg/n+MaleVc2IEyaJzxOh7yt1yObbvBF5g4HrQyiR/f471FtNGOnV3NiMJPgeOrAa
         QhLmJohefKy5yQb08nRuDUrT5hYPw1U+jTT4r1Rcbz1flr4p90pPC+wJjyzuhOQ1cwiB
         Bm2PllW2nm+dGbqavmk6VBy0vHUpyH/LZy2otVEkt2iNa5bIqWB+6kGbrIogqFmg3nnp
         BIqget3euYGE3BMLfiwsmJBSGZVOUmBWFR/kIL2nTnCgWhy0PJgpD4lVynNpTAiR9EzK
         mO7Q==
X-Forwarded-Encrypted: i=1; AL+hErG0vtgl50DAGpCh1H7vA7eCBbGIjIpOQbF7cdYXmegnUXYeuT+Ssm/nrwgJCslAFslrgZONAGM9RtyzQw==@vger.kernel.org
X-Gm-Message-State: APuU4Z/UmRO6kQoT8qB75t93HuvqdlrNGxlDfq1hkIi6RtiZFwdjBB1W
	iQquhylTu/NfTYE6DZpg/fXr4gpPLq2xs2t9qAqbBUN88pkTtRGyNDvlIKhPvxfydFlMC10SCtS
	GK0GH+lTO9fvM06nITnvhDZWrM/o1SCQ=
X-Gm-Gg: AZFdTZfw/Q7lcP+i3UTG6UuuH6L4ttTaJJQ4bRLQ6WK6XF5nrzaAUGWuJpQMjvaaNgl
	N/2rN+mmqfJdgfs/IwtmibBkIVFASMMU081WCkkwtN8v1bloJca58ogHKo5kjs3qRmBJGZYFm0l
	1fhaH2w9eiJ5TrVdYusHGtkYBBXj4hkY+7M7qG2PcwSk12jzeXi7Uyn6wLOpA8p+JDsUqUKnY+6
	44pug/a8XkaXaQcjOe/D92W8HNwDBMivW+D48/3KyXNsVG9mJDRCaQBbDfT34D+ANC/I+eEk5C0
	W1P9Lggu2aTrVUahhI3YYDufC6q0Jhdr1Vc1666d8MuBx+Q2Ds97HijaCnI9/TFnyvTfXIVXcUh
	VcL8Zv7bTKhZQY3kwRc6ZyigVSe9DDxvUc67OELZqh1AvJCzmhh0oTjL/0CN5Mv2hTe4nSHX9Rg
	7L
X-Received: by 2002:a17:902:fc84:b0:2ee:2aac:eceb with SMTP id
 d9443c01a7336-2ee2aad0a49mr55123265ad.58.1794817659577; Mon, 16 Nov 2026
 00:27:39 -0800 (PST)
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261115143708.492883-1-eugene.shalygin@gmail.com> <a0f9b726-d877-42cd-aebe-7cd727a6c98c@roeck-us.net>
In-Reply-To: <a0f9b726-d877-42cd-aebe-7cd727a6c98c@roeck-us.net>
From: Eugene Shalygin <eugene.shalygin@gmail.com>
Date: Mon, 16 Nov 2026 09:27:28 +0100
X-Gm-Features: AclHuK8jSUb0JrTmkDLUkrzHNIZwBcVR0yyCUnDLxAyLPU1aaUOqfBrZCTrwjn8
Message-ID: <CAB95QASOtvS=XMYFn_RK96Kxhh9wydhfAK8Vv=OzBpHvGL92Vw@mail.gmail.com>
Subject: Re: [PATCH 0/3] hwmon: add three more board models
To: Guenter Roeck <linux@roeck-us.net>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, linux-hwmon@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 16 Nov 2026 at 03:46, Guenter Roeck <linux@roeck-us.net> wrote:
> Series applied.

Thank you, Guenter!

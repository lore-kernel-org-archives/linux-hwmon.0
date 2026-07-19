Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB3D43921E9
	for <linux-hwmon@vger.kernel.org>; Sun, 19 Jul 2026 14:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784470734; cv=none; b=J29nagVGJgXhLQnIBT4Pe7c7+9gye0Af30vu+qHSHqzvLrDRb+n0DIpl1HFbz6MQZDYBaUpZpy/Cn+tXuyrzczawKB6rL8mff9UIr17sRTZz1VDabZudsFvD13P9K/AHC0QitMqVHpR+twnH0fZhTlvIOzgK/A593UaGm14I1oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784470734; c=relaxed/simple;
	bh=MH1eckPMZzz2y/yUS5p3C7hdriX8ZbXO14RSpyisvCU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ElydiNa++V2be3XUY7UZulI6iRm+blsKkS7k88GqgaYL8eGI/V4DNvsJ/ODTatPzCPKDydlJv6o9/55DtZ07pXr+JaBjjPm+26ZmyPG33ltbMDSZyGJWIh9ehdLiX+CSt0vYb19phUOUed5N0W52ejw7zKBuZ2MCSXxJiabf+ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KPHNBZp6; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KPHNBZp6"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-384c94c9414so4981740a91.3
        for <linux-hwmon@vger.kernel.org>; Sun, 19 Jul 2026 07:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784470725; x=1785075525; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rlngx4eYA57A6MoNforZqa90xnpEvIJzU2ucYSS4JxA=;
        b=KPHNBZp6Ih+XQDcv6T0tQ0dKpzYkyOffHGyQoUz2SMti4jAPTzPcCuf+S5wViM9myo
         vQz6ij2xJKCzBR/JXSSKc8+WtHvSHJfHnTvUhHC2gFkGis8+6VzNoG2UAMonF2rrFcbD
         G6WRJ7axOed9oTzUEi9Qc4Tw5QZPQcod+tMmSEZO46C5qc6Ky4snyfnNqn3m0IqnDTLw
         LJYapzuU1SCznLM9/uiyW5L3EhDsF/OEA7qIZQ3kosz5f3inPyA9Tb4GVXOQkNaP2p1l
         YOc2D1aChXGMGNjzEFhTwwvNo4Ya3ATs/kP9YAnYt7bdGOt3UDMmugS+JbxI6007PMbG
         ItDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784470725; x=1785075525;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rlngx4eYA57A6MoNforZqa90xnpEvIJzU2ucYSS4JxA=;
        b=K7094hirGS4we7fDXJwNQXo0ugDA9cwyx8+GsznyHGNOJ84FtrvH9F6nVJZMeQHoZZ
         HaDjsy2VeB9MFYm+mTv+u3LgZyciJbALMhTuIOJpRf0uU2F28L7zYSi49KFNk9F/37D4
         NI8jJtd9pzmlHjbTNgbWXbqZeGQbUyEBMowQLVJAg3GBgkZbTlsTftqm0GpMHFlzuITV
         wl0ZJGH16GGpyr/eRMgFg+BT8urSPq22NAVYZDyspMGaaWpGqvP53E9l4xQhXtDMHByD
         hotMjXWD+NWsD2y6xY5Gq58xSgftm22BDBgjPXkSzUCkrf2McAp+KIWBotGh7egv7RpV
         QJEg==
X-Forwarded-Encrypted: i=1; AHgh+RoFXVwFTdkvoO+IMq6nc1n04x2tLZiJWqlTHLvFcsEH8y5K6naiC0A5aVGrfyJiPCZqji1etajNOaIdRg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7rS6FeZnYSiGvVD9P6d5Z2ZoRrxn9oP4pkRdNMDwSguVIwiKw
	dc86FGaNmiVK4KGqPdyHqyli8jj/lpix7sizt9NolL0Ps42E7gnvj+7z
X-Gm-Gg: AfdE7cmZpr7RkN90GxCsubUgg8jY4up0ejzJpFw0XkYUfJyTwJmmG5ncvMWSWVoZFCK
	hDmT8Hcb39Gmb0AZ74DNIr0TG0EVYmntyKqt74GxAXgTjwY3alpFrkx3Q4Kb6+G7qSVgDVyIpxG
	jeMcVu5ag/g1JXUCyOmylOIkhA5dJnDeEpj0lBpzGcWnezCvmvcI5EZ0Z6k8xsyn+c5BicanXRs
	r4RLTX2Y42755ZXcT8kLtvkjuh3dRcGLnrhGPWMzG1fcJmkpqHmsgVhNTXqr5S0o0LugYNKFWxw
	VU78vqeHfXyMUasfRAt80GOGo/Yy6Lk8DsRkxX09PMdVnv/8kxz4cfuOOegQ4xv+/zQ+nn+0Juq
	MG0yIjaMXy4CjKPteoNEMS2QODJJ12ndAIr5fmLZ5IizcmrS8lX5f6tqsFjNL5cRkA6YyD8L826
	WAvZJzLcctGlysKBs=
X-Received: by 2002:a17:90b:1c02:b0:38e:5e2:6dce with SMTP id 98e67ed59e1d1-38e4b57e964mr10388567a91.39.1784470725519;
        Sun, 19 Jul 2026 07:18:45 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e4afcc067sm4147810a91.1.2026.07.19.07.18.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 07:18:44 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 19 Jul 2026 07:18:44 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Zaixiang Xu <zaixiang.xu.dev@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 4/4] hwmon: (sht3x) Document support for GXCAS GXHT30
Message-ID: <eaa54c0b-441d-4fec-a374-5f1d5523f5d2@roeck-us.net>
References: <20260713074559.12196-1-zaixiang.xu.dev@gmail.com>
 <20260713074559.12196-5-zaixiang.xu.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260713074559.12196-5-zaixiang.xu.dev@gmail.com>

On Mon, Jul 13, 2026 at 03:45:59PM +0800, Zaixiang Xu wrote:
> The GXCAS GXHT30 is a humidity and temperature sensor that is a
> drop-in replacement for and fully software compatible with the
> Sensirion SHT30.
> 
> It is handled by the "sensirion,sht30" fallback compatible without
> any driver changes; manual instantiation works with the existing
> sht3x device name. Document the chip as supported.
> 
> Signed-off-by: Zaixiang Xu <zaixiang.xu.dev@gmail.com>

Applied.

Thanks,
Guenter

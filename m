Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793047766;
	b=2cwFktIdnlScce1hQVUCZKZfk+yETZyDvpaWMvR830oyYkVCVHUiCbItDRFBbwhR5nfY
	 /gZjT4ICL74nKlyhHeSykc+OCJjazeBqWvYKTejrg9Wi01qvmDvQl2Cjt6vxBvKHddO5Z
	 Z9sz631y8GDVZ4E9kt9QLFjgsbCOT9XVKiMNgxf43WSf330n+5CvJIY4SbZsVIw5hLUvq
	 KH2CE/CI0p3XQkNFddJeGZWErHs66POwKIZ30l5NX01a5LlvnNEqt/mkjh8TqTsOEWtIu
	 LWcJ2SKGbw1DbfUD+Ot0AVn5Bji0qbSRx5zS54kmc4cmWYKWmEylZbSMuKvFljwvAjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793047766;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=1mOPYnbJYiJzBEoGB61Mg2eQQ3qdqEMSoEGN6FnJHBw=;
	b=LQScO3OmHO2706ULY4nfjsndk3OFPg3yB2bbzWP5E/b34cG0kS2RINXBpe+vL1v3i2HD
	 GAEV9Zsxhyjhlcq1kEa/XB2KJ96vmcXqg8UjelJf9YQsPQqrxBlrQ2P4DQusjpqlNV+Bm
	 sjIJy67NmuG3pAxxtuSa6d8GVV2U5RV2z9GtGddlK5o1RirvZFNoIUi1bjlP6XoPuvzRF
	 NEkPEyzkJCoUXG/5AOliJifT7zRPRiXhP6UEZy2L96ggKXXbWAktmjB7sZDXfDw25rRuW
	 4UR7XGSkhtxmb0Ih4oF/j67VS2NZQhdOZ3RF0gjwN2A28UjnqeseQJgyqrZKUH+dLNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=SOm2J0YD;
	arc=none smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C58FE606A320
	for <linux-hwmon@vger.kernel.org>; Mon, 26 Oct 2026 20:49:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C58FE606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=SOm2J0YD
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-156cbe59524so2712320c88.1
        for <linux-hwmon@vger.kernel.org>; Mon, 26 Oct 2026 13:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793047765; x=1793652565; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1mOPYnbJYiJzBEoGB61Mg2eQQ3qdqEMSoEGN6FnJHBw=;
        b=SOm2J0YDd8dr+H9nWsHno0VM7EdMlOfYVXZInbi4/0JQ1GeROjXQ7SEiGpUM7Z1ZlY
         Fa6i2etjNxG3BrGH8VQ3H5azkFRMcBeIdpXEDFMaNkJ3FzUnVrWCyHBa1N9PKlx087T0
         7OWUSppxowKbI5X1Gv7wYQT4WEXfnKWNrTjHpl2H1I6cNduD0qRzZcktver3FxaM8Oye
         41KC1y1rDmEvduWsQn/rtADwfrdMpg2WD1FCDMdr3olFPgZocnDNTAuEy0QZSwSFE7y+
         RKG/Bc+FUqdgsq+Z2Nd628GL+ZavCStyHCkJAeu1FrnndjBchAN0U9LZUU0RtJCgB1vP
         IXpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793047765; x=1793652565;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1mOPYnbJYiJzBEoGB61Mg2eQQ3qdqEMSoEGN6FnJHBw=;
        b=mdO0LUsdoEBKRjQzv/AfZg3mxCVZ88mYca2xH8fG6whnhttfX/eDFhQ4RWuWXjdFUj
         W1HnDz9k+1kiK/gIgx/JbHZGt8eT2fU/fa9g1VWrhwUmRFcXX/wBI8GXSxF90L55+d0Q
         zHBwxtQmXnBwq1sfOQqwblV+KBXGbTGnsW81cdYIFFojMbHmXgH0xHjDHhKOrix10ERG
         FQHSC+9BgmiAJ/EPXPvfteEAVcL1U3Y3WpPqqd7MboYtlxzuIRFYXxDSrUPPlJGOO8Sy
         Eqzf4nVfUclI3kNhw3S/j19ftuWNVfmzI2uGULEnbP9fe2jvGgpgrpxp0qtgSUuj6L5D
         9x2w==
X-Forwarded-Encrypted: i=1; AKwUvBwj9ITmes0nS2+UjIFd4cjocRis52gPD/bTt/g0i9tS4wbXK+tXTS48XM9gzKrk24C1f+30EBAKcNpd+g==@vger.kernel.org
X-Gm-Message-State: AFq9FYLMG1DnO/nU88TJa3MlnSpMdUz7aJJhMnde5xSkzCK/meLWB4wv
	yJiT/RJxIk53b9e2j/QjQroy+ilraoTVnopYJFWV/KxBXlzmi5VQvqCd
X-Gm-Gg: AYBFou28p/qoYOE+XuBIK0/4Q8Z3G/6qqi9kxwKwaC6y9KNALKMmWHMMWhGdiWNBgjE
	+8Al/F16eSxWyH5SxLFq7d+HCUszOOxesrtX9nXPdAgulspAwdykYp6bh2XSkd9TPvSggm4ucgn
	f8XQuPy8DlmUUlDLP5eh+0Uh5t7pzbGo/58stwZSFyTGYQ81pqa4dLDZ3T15Xh3mPHmVaA2EGT9
	HMrsUvzheW3rh+e9VOZ2FuunPeINUh7ZPMfRhDm66L5WcK8Tbwnwik6H9Oz7SOvN5vdd7b9BU/P
	aWLS6FcEhEep1EWo0+QnDDzhQblyIYBxWzLI8tHf82MeF8JgDXfLCymp6WgsFoRMnuXbsrFWOHA
	HD5DuR9/JHkZXcw3ByDYAG59vbc/+IJhWSB0Eug1HRwZWSdeZzFnNoOGrd4X6WZHGDl5GFKH9bU
	igi9VAWmQdg6mGFqNLx+OtO+mtbM8gm6J8m3FcIKfdb6/lQ7OK8rDz2YrKFMmwXj2aMkMdFhR/P
	7FHK0SdDkTQQTRhRXyrIjXWIiFevuuvEjMupIT77kfnV+gc+54e5Mt+TMAgp67flztCCA==
X-Received: by 2002:a05:7022:5f0c:b0:14d:c53a:f6a0 with SMTP id a92af1059eb24-1993580f7fcmr11112099c88.13.1793047764607;
        Mon, 26 Oct 2026 13:49:24 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a2a5a515sm24328463c88.19.2026.10.26.13.49.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 13:49:24 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 26 Oct 2026 13:49:23 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Vas Zayarskiy <contact@vasily.cc>
Cc: Aleksa Savic <savicaleksa83@gmail.com>, Jack Doan <me@jackdoan.com>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v5 5/5] hwmon: (aquacomputer_d5next) Add AMPINEL
 telemetry support
Message-ID: <d1a1928b-5a30-4612-badb-4a7db7b4f991@roeck-us.net>
References: <20260927191316.4137752-1-contact@vasily.cc>
 <20260927191316.4137752-6-contact@vasily.cc>
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260927191316.4137752-6-contact@vasily.cc>

On Sun, Sep 27, 2026 at 10:13:16PM +0300, Vas Zayarskiy wrote:
> Add read-only total power, total current, input voltage, hotspot
> temperature and six channel currents for the Aquacomputer AMPINEL.
> 
> Decode its 544-byte input report through the existing serial-number,
> temperature and update path, with power, current and voltage handled in
> the device-specific switch. Store all readings in hwmon units.
> 
> Select the telemetry interface in probe by its vendor collection and
> input report layout, following the existing Aquaero and Leakshield
> probe filtering. No match callback or HID core change is required.
> 
> The separate keyboard interface is not supported. The driver rejects
> it in probe, and stock hid-generic yields to this driver's product ID
> entry, leaving it unbound. This intentionally limits support to telemetry;
> keyboard support can be addressed separately. Channel labels follow
> report order; configuration and alarms are not supported.
> 
> Assisted-by: LLM sparse
> Signed-off-by: Vas Zayarskiy <contact@vasily.cc>

Applied.

Thanks,
Guenter

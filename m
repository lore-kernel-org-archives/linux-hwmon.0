Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 120A3416CF5
	for <linux-hwmon@vger.kernel.org>; Wed,  8 Jul 2026 09:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783502335; cv=none; b=OUXyYUQ4lUVAORMZXa0hN+IMDenIEL+Ie+firr2L1+JVJ9Pa/L6QSgdptPGbxczaJFAK52+ehNo5ug457Bv04cr3XR7pRQawwJ6ThyRnfsb3ZbkKrTgu1X3BHQjGlnWwiZ3e3VavkLdqVnRdgNY8hO5YRr4Y1tdic98TET/9XEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783502335; c=relaxed/simple;
	bh=eDH2tYdoi0b0ofvijaNMD2HtX1hICdbEb+w0OEWQndg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H/PFIq3xkQPkVzB5gHLRYaqYyS39/Ydhf9wI6+u/osLfoYSkaiS/ULKB6JxKBCyVY4CG3kwYS5fnzU5GMdvlsrqzucaM64ZiPo35vQRURVNPWpZBQjuPjCgE1zK2nnISBZWWdnCHjnGbKI2nSDKjZsVoD4rUJOIbGY7oEZQ0cdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k+bNX10K; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k+bNX10K"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-493b7612475so3266005e9.3
        for <linux-hwmon@vger.kernel.org>; Wed, 08 Jul 2026 02:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783502332; x=1784107132; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hgts3cXxi3OIQen+lK5BRu5vo0eVsiVEbfqLXX+In5o=;
        b=k+bNX10KjZ/1dgKXum247MaFfweyajH+w9g3kTaBKJ3xL4ZYaApM86CMGuUa8RSYx9
         AuNpbtIhdVfnESR1O8cGUxlcxYxgXqbie/YXsMyVdNwk207dtUy2GGelMizr+e98Uvt8
         QUmXIF3ChFqDbS/bf1OxXpRqsjQZABWARZmN6EzEYCS1XTFHZS9Ck6zd/oUhliyS3kPH
         fWRrtBXcWK2HIJ322ZKk8oJrY8+lKaUW5hobvg17qDs/bGZErEo+PcJXlB7XYLncWl/1
         kDnLVaXTDweMTlIQTUb6/69sAjO9ZEfjh3K5fV5FDxjPJ804AmqWhzLZRf5uhaK1Df9k
         xorg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783502332; x=1784107132;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hgts3cXxi3OIQen+lK5BRu5vo0eVsiVEbfqLXX+In5o=;
        b=Et02Fi36bA0oK3+TJXAaWtbWvLs7bISIwfa/0C4p72j9LW4GDm03xk5uahpJdLHG0m
         H9F1WWNz1d/TSkhcZCkLzT8PrgVmedXxX0c8yBIzyEi5tmx5TgvIwUoQMpokZwU8PTej
         0l9a+eGnfdHM4R4jcq7OKlOgRyqmMJd3JgzN8WI/64vKw3/kf8kdtHXPchbQ5RUJUv0a
         yTgD93QqybEzQqhO7ytMT3nq4KOkM3c3x9+R3k+25XODHspG/ZtZgWFXmq+1Bk8zE71y
         iwAkHWvGYmojQPiB0Lutgriv/QG6/Qs94vuYfA0RBra1NiNVLosHVcZux+/DvzhucGIF
         vaYw==
X-Forwarded-Encrypted: i=1; AHgh+RpboXXZ9BVa1zKNyAIFLkU2yeCmcNXM8aKjipoW2/HxVQTjR8EVGjQrN86s2GWpNMLOgnYSSTBlkm/k/g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0SjLExChL6bWhjSF1Zw3CUsf8135Mk3UNCjHMV6r7pFKaExfE
	ca0Hh72RfDEWUUovKTFx3I+shxyPfn/d3s8bDT/qIAm/1XPlO7jVFx0k
X-Gm-Gg: AfdE7cnVh+fN7XQu9P4SJSQYkcuGn/7jSl3AxTn2ydVCXjHVI+Q347EneM8jVa8ay0S
	4CC6Oq2AkTcOIbr1ChhHtNnE73JEUQQfw/11mEToj2K1pn68CFGOci/XSv+upeuuaIG6+CdVCr3
	1jRV3vtyPEPwXh+IoHLcfS4PWuZwv5n10kqgo7k8hD9Zx1LV40ZlnIFmuD01MMgmowd77LsVzox
	cdmMRbaxn7mkmPOlBfTdlg0ms53sW+t/xKWECF55MKL5ED0cWqzCK2mstvjxMNdOwDj0uzhXW51
	sxAK0/mujyRh/GuxTgkD/jkA1yzjZx0ysgLLSuUQEsjA10zGM9KXy8Cr16LfR2zfcJA1AJidQRO
	Qrgne2xlVIEm8dv+OihWji2AbZ5tTuM5XKjfttTL8RY1BfBGJ0jt6W+PLQL44XpcAzKr1aGHF0U
	+8QZXC
X-Received: by 2002:a05:600c:8b54:b0:493:bc4a:9547 with SMTP id 5b1f17b1804b1-493e68815bemr16151505e9.39.1783502332232;
        Wed, 08 Jul 2026 02:18:52 -0700 (PDT)
Received: from nsa ([148.63.225.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0f40912sm118117685e9.4.2026.07.08.02.18.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 02:18:51 -0700 (PDT)
Date: Wed, 8 Jul 2026 10:19:56 +0100
From: Nuno =?utf-8?B?U8Oh?= <noname.nuno@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Fred Chen <fredchen.openbmc@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Jonathan Cameron <Jonathan.Cameron@huawei.com>, Wensheng Wang <wenswang@yeah.net>, Frank Li <Frank.Li@nxp.com>, 
	Brian Chiang <chiang.brian@inventec.com>, Cosmo Chou <chou.cosmo@gmail.com>, 
	Dixit Parmar <dixitparmar19@gmail.com>, Eddie James <eajames@linux.ibm.com>, 
	Antoni Pokusinski <apokusinski01@gmail.com>, Thorsten Blum <thorsten.blum@linux.dev>, 
	Ashish Yadav <ashish.yadav@infineon.com>, Alexis Czezar Torreno <alexisczezar.torreno@analog.com>, 
	Syed Arif <arif.syed@hpe.com>, ChiShih Tsai <tomtsai764@gmail.com>, 
	Abdurrahman Hussain <abdurrahman@nexthop.ai>, Kim Seer Paller <kimseer.paller@analog.com>, 
	Colin Huang <u8813345@gmail.com>, Yuxi Wang <Yuxi.Wang@monolithicpower.com>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-doc@vger.kernel.org
Subject: Re: [PATCH 2/2] hwmon: (pmbus) Add driver for Analog Devices
 MAX20912 and MAX20916
Message-ID: <ak4QO9uhKOt68dl1@nsa>
References: <20260707122701.751878-1-fredchen.openbmc@gmail.com>
 <20260707122701.751878-3-fredchen.openbmc@gmail.com>
 <f9e32dd1-7c2c-4055-83fa-94683777e30b@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f9e32dd1-7c2c-4055-83fa-94683777e30b@roeck-us.net>

On Tue, Jul 07, 2026 at 06:52:48AM -0700, Guenter Roeck wrote:
> On 7/7/26 05:26, Fred Chen wrote:
> > Add support for the Analog Devices MAX20912 and MAX20916 dual-output
> > multiphase voltage regulators with PMBus interfaces.
> > 
> > Signed-off-by: Fred Chen <fredchen.openbmc@gmail.com>
> 
> Please provide evidence that those chips actually exist.
> Internet search comes up blank. I'll need confirmation
> from someone at Analog.

Hi Guenter,

Well, in fact I'm in the middle of preparing a series that adds support
for:

"max20826"
"max20855b"
"max20908"
"max20912"
"max20916"

All the above parts have the datasheet under NDA. But before we had a
one page "datasheet" in analog.com but I guess that is gone! For context
I mainly did the base (core) driver for max20826 and then Alexis added
the other ones.

Not sure how to proceed... I can wait and then work on top of what Fred
has but this patch is very minimal when compared with what we have.
Like:

* No regulator support;
* No direct mode. The chip has two ways to access registers (paging and
* direct mode).
* No way to count how many phases we have or if RAIL_B (func[1]) is being used at
all.


Some other things more intriguing is that these chips, as far as I'm
aware (at least for max20826), always have bit 2 set in ON_OFF_CONFIG so
a gpio vout. Also we needed some special handling to read phase current
which I'm not seeing in the driver. So I would like to understand how
the chip was tested?

Anyways, if Fred is ok with it I can just finish what I'm doing and send
the patches. It would make sense to have something more complete on
submission but I don't want to just "steal" the work already done.

- Nuno Sá

> 
> Thanks,
> Guenter
> 

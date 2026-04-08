Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 962C536EAA4
	for <linux-hwmon@vger.kernel.org>; Wed,  8 Apr 2026 08:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775637745; cv=none; b=eyIzlDuWSkM8A5f1MStv+KaSfaB82hfpojpx6bRM6Zn/KOkll0NQzNhT6EjpDEpq4cZWJIbAQzguwPkgrmiHRg0F+msATEwPNVErG/MmD22NhrDMGUnYS69Gsv8RSDvdPiy91CApuCJZoHflYT5Y3+u9j8SX28zLX84u8Ee9X5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775637745; c=relaxed/simple;
	bh=P1mwUTP9+C5XapO7898GCG4IFtJ3Gc52hrbBGXsJznc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uNXHksmV9vTURkSi49XFMmvK0SFZD2VS72j/znZzbV4LdSC9N6QL9MjDS9G9ZG6Xp6HJ/0U4hGfbNp58A2KuIXddqDtnkeBsKswdWcMS7XlvrOwngeaGq+AnLw+Y4d7xTx9rcgXOZhV76x6c1U6lOr3hKVbJdudTQz9gffjvT+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hfVqHMZF; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hfVqHMZF"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-48334ee0aeaso55737555e9.1
        for <linux-hwmon@vger.kernel.org>; Wed, 08 Apr 2026 01:42:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775637743; x=1776242543; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sjb/JRkzLAit1h6AHpe5PnGhOOOcnvsE/48DReCWjxA=;
        b=hfVqHMZFAg69GFcWs6BY5ZLVreFJVTrMi3jocKIBJjoMqNIOinSL9OPVgZ0eywy/k6
         Df6L3HQEBSm2KS/z6bRsBTVbTUrvXc81D7TVVj/u0PhIDCCbVQh871yoFM4C4Ft/IlbF
         UCzak25bIfbrMeEnZ+VPJbgoXFo8DIm4Ji0tcLZOkYkOs9fOB7rTm1Mh5SYEgmIcpPJU
         kId2lrq6c9Lf5zBP8JChc88tFJ/fhMp1fYgHdn8nABr9xSiVoz+BZ7y9LmophrmQRebs
         549qWbazzMNKXskJWuOE21PGTvuN5fkSTfynO/5jhMXz3IereBfS8SZBjwkzqn9bEwa9
         sjJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775637743; x=1776242543;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sjb/JRkzLAit1h6AHpe5PnGhOOOcnvsE/48DReCWjxA=;
        b=bROGtYbSL0/jTJR2NAtASt9QwqXpXQVjznQkGiQDl8x3axcU6e12KyQInTEDUNVwoE
         MtNVQMpKLWKJQGzbb9JX1uKziE2qeKGjQ2pkPKK8qKDt/IzXtbDysvWyBju+nyC01NRC
         IhWIYv9oxREWQFkWim1pWU8xyXTBLOh/qCdqNK29FQepB/GwjTrw2oDUof4SS1AwC+b6
         L9vcMON4cV+AsxKCLLrduTOMN46Z6JBImpYHxUqyf/XLXv1zJrxs7gtJQr//+ROxNnZp
         byi356u3t4YXs3/8aKPlITO++tjBkiZsxjMxTQTJ+eL8YFjClMMRtd2VgtWbjMrQZQbc
         5M1g==
X-Gm-Message-State: AOJu0YyAmtHNkj4j1DHsL+r/TE5sz0Xpf8+GsxpQ4pqdgDsta/MhRHBN
	j4TMWRixJrSB8H82zrk6lQAdHb3KcRH0LQRfJuIQCE/lVDWab9WVbQs1
X-Gm-Gg: AeBDieu8UZLQh5N3/WoQ9LYeVC5m6zn77S6QTlPbrqv+xie5MtSEcZViVlfTgjTr3d9
	KxNpjBAgPxWy2uSUIROdvhRm09UMt+qfJD4S+fd+n7nDJXSuMI36QNYFblNXcSXppIe3FJaLBnM
	dbSki1o6nl7xpjfGpMmEa1JDkFgnbjffkfhsy+GvkWcnC4SG0W+zGpQBT/KmOqf0DnPLkz949J2
	quTA5n3z5mOKMTgAPcCJJpgCUQaYA0q3iOckfANn26t8zweUILsI0+zTGRVlZvUIaf04tifM/Xs
	xmXWKrVzoBfNg7o2KhdCjf6mALSzMxFZBZFJ8pGAc/HEj0YoA41IDYlKJAMjYZ3jHhDcrhHFTIO
	CMAFk7sCH4ilV+FynhNKBloOnMEh/DkiPW3+Y2cG+0Myn085ZyppKuxltZ4+afKKFAZTbNbeNEB
	V70TNnvPlmEo04pKCtEEmFkjv/u0dgodCcYXS7gAyUoe3fKbXdMDdRLwHAW/Vau+M8wdf+GNtFO
	rY=
X-Received: by 2002:a05:600c:3549:b0:483:64b4:79da with SMTP id 5b1f17b1804b1-488997d5e84mr260217805e9.26.1775637742788;
        Wed, 08 Apr 2026 01:42:22 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488c5d854ebsm13286165e9.19.2026.04.08.01.42.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 01:42:20 -0700 (PDT)
Date: Wed, 8 Apr 2026 09:42:19 +0100
From: David Laight <david.laight.linux@gmail.com>
To: "Pradhan, Sanman" <sanman.pradhan@hpe.com>
Cc: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
 "linux@roeck-us.net" <linux@roeck-us.net>, "linux@weissschuh.net"
 <linux@weissschuh.net>, "cosmo.chou@quantatw.com"
 <cosmo.chou@quantatw.com>, "mail@carsten-spiess.de"
 <mail@carsten-spiess.de>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "stable@vger.kernel.org"
 <stable@vger.kernel.org>, Sanman Pradhan <psanman@juniper.net>
Subject: Re: [PATCH v2 2/3] hwmon: (isl28022) Fix integer overflow in power
 calculation on 32-bit
Message-ID: <20260408094219.3aaa4ad2@pumpkin>
In-Reply-To: <20260407212122.278824-1-sanman.pradhan@hpe.com>
References: <20260407173624.247803-1-sanman.pradhan@hpe.com>
	<20260407173624.247803-3-sanman.pradhan@hpe.com>
	<20260407202146.59b1476f@pumpkin>
	<20260407212122.278824-1-sanman.pradhan@hpe.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 7 Apr 2026 21:21:31 +0000
"Pradhan, Sanman" <sanman.pradhan@hpe.com> wrote:

> From: Sanman Pradhan <psanman@juniper.net>
> 
> Thanks for the review.
> 
> Yes, I checked this.
> 
> In this driver, gain is limited to {1, 2, 4, 8} by
> isl28022_read_properties(), and regval is a 16-bit register value
> (max 65535). The worst-case numerator is:
> 
>   51200000 * 8 * 65535 = 26843136000000
> 
> which is well below U64_MAX, so the multiply cannot overflow.
> 
> I'll switch to min_t(u64, ...) here to make the type handling explicit
> for the u64 result of div_u64(), if that's ok, and send a v3.

No, use min() not min_t().

min_t() doesn't make the type handling 'explicit', it just casts both
values to the specified type and lets you live with any consequences.
min() attempts to stop you doing 'really silly thing' (mostly trying
to stop negative signed values becoming very large signed values).

Even if the compiler generates a signedness warning from min()
replacing it with min_t() really ought to be a last resort.
Not the least of the problems is that people have a habit of using
the type they want for the result, so you'll find:
	x = clamp_t(u8, y, 0, 255);
That is just:
	x = clamp((u8)y, (u8)0, (u8)255);
which just masks the high bits instead of the intended saturation.

	David

> 
> Thank you.
> 
> Regards,
> Sanman Pradhan


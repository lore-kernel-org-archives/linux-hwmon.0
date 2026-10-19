Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 664FC4E1C89
	for <linux-hwmon@vger.kernel.org>; Mon, 19 Oct 2026 12:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792413929; cv=none; b=p8HJfY6o6ZoYmF4QMJlRliFvKXsMldu49KdGCkktT/nJqkW3wKQnqL5v9uH9cFwe3l1CqT6uWhgzKcu4EIELeXciWZ6SlpVDPJ7t9xV1YXLHX7n+cOpPCySfhtiWN+S2l2snup8prLNBr1xzPZaZ69MRqGDG9cbCWyews2n7CLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792413929; c=relaxed/simple;
	bh=CxFwB3NB1ukGlnP0K4LvgyQtIKLtXdStrK1ZRzGD03M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PjRR66LgH9Pk65+1aExKTxHCoE2/o9zucPn2dNZFSDV+gP/RUznnuQwOS9UiA4c7aeX1vSlyJIqG2LJTgF4d/0PeImFWVd8q7z9L8rpMrRX9zV51TuZEzRjXUrJf/5UbpuR4Op/4MAmI6x52B1BUGG9vMKsGBkqtIOFC4yLvczQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FPht6Xb6; arc=none smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FPht6Xb6"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso6008937eec.0
        for <linux-hwmon@vger.kernel.org>; Mon, 19 Oct 2026 05:45:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792413926; x=1793018726; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Oo5b+mGdxcUtc+pXMAzRoUpMwm26Steg70hnsQp65WY=;
        b=FPht6Xb6VGL80aGbNPAdBRfg/sudz7zEXFdn/maPQyhp1O+KKMxdmAQbjJwcqeLNZg
         o4mALJTQy8LB1Dz1FO0sQ4Cx0RadQfRWF+Jgv7KpUQMQ3aPyvpmVSKz85GbQEuguxWSb
         2J/v1VHU4AXTGFy+9XBJqqCGZagvOpfxPtSyyFRfArrkvgALgeZTCi4IowJ20HA5Md67
         4Okr4Amtr1U24fm+cN5HpP2o1B2c82coZ1luUpQzeFZ1vadFoXjHSy5qW7R/EGHJKcqH
         Y/Mywd5+EKryOLUh9ji0lgVjI6FywcLU6/NIThxrngY0zd0bbzQkH+R1qlZMVsJha9Uq
         NY0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792413926; x=1793018726;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Oo5b+mGdxcUtc+pXMAzRoUpMwm26Steg70hnsQp65WY=;
        b=rVbcJfJBzpgyA0Zu3tvM6bMQh+vkW7VllzvVt6HmhpdEP5snt/bwYNT7isDGpvA1UD
         dE/PqiikAGisAD5ixdXB1Bfco2ehhmxB3g4kG6fAiguYeNUr7KZwmk77S/V/IEzP51Xs
         vX7iQqPc5BZvSuEGQgirFXvk45iEeXWsCJ0qzrduljm+evX3xS+5XspuB7kC5i1z1dSU
         ljSZyMJAJiOZUXgFseI1CpxyWKgVUhbsXkc+cxgQEIBJkXQf8CgE+816SD1K8M35x9Y8
         hJXD8AJr6aHfhLdc3hnaOcq6ec5i6x0Bs05N4pvBdj0kDdZA+WJg5Vujy2RR7kUXHErG
         G1NQ==
X-Gm-Message-State: AFq9FYIj/5xhgmy5qgv2b1w4SlO25lWV8Qj0La9pGtel2sm1kF7OkGWX
	5Hlp5co8jV0YF1HHoGMRxsKo93qirxmu3pvUsXrah6DPtCOXat7elTpqAPApNA==
X-Gm-Gg: AYBFou0pgfiniXJdSI0UDFn9N5GWKqu8s7wm864iiP0e8I4cPrVwhYHHmC98dRGrsqZ
	in63sH7MSqyebA8f1T/et/lzv+v/E7nLwSM1C6owZ1unYAH6GmZIbobvoDy8IBuWAWg3FyFFZQH
	AtTrfXYbCqJ5HoYGhbIwofJ4LjFoTeb4DN7KjM7iAyabEBmjiyhBNazowT0g+krGwdlsU7UUd5Q
	m9VaTc+d9PKzbfyj15GhEvYwZ1C3cY8rgOC+o8MNJXzLBRLyvXzyTtM4y+iKZl8LsNxyC117f0Q
	HaebX01gyjsCBt+4Y3qlzLx9/AX4QsjDVP4aEyF+ni+FX2dFNldOdY0tJn+uxV210LTHDZNi5WD
	HkWLT9zHSKCfgU7C6rHrfJaH2bCAGOmUhhwrkUaDmy28XawMOX1fvQnuvp9Wk+Mf+gnO8y/JpDv
	+zVmZdDHoPilXV6D2eQLMkJOvDjvHagcijk4OjXaqEEwQTtkmRUqS44TldFuxz5yjCetK0Qgc1R
	+aJLDRHNGua
X-Received: by 2002:a05:693c:8107:b0:358:1f59:48c9 with SMTP id 5a478bee46e88-361a1f4a9bcmr12517584eec.24.1792413926068;
        Mon, 19 Oct 2026 05:45:26 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36082a7b33bsm59496695eec.24.2026.10.19.05.45.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 05:45:25 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 19 Oct 2026 05:45:24 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Asaf Nuri =?utf-8?Q?Bertizlio=C4=9Flu?= <ycistak@gmail.com>
Cc: linux-hwmon@vger.kernel.org, corbet@lwn.net, skhan@linuxfoundation.org,
	rdunlap@infradead.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (coretemp) Document sysfs numbering and label
 meaning
Message-ID: <57ef30df-052a-4189-9000-deccaba6c117@roeck-us.net>
References: <20261015171759.704526-1-ycistak@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261015171759.704526-1-ycistak@gmail.com>

On Thu, Oct 15, 2026 at 08:17:59PM +0300, Asaf Nuri Bertizlioğlu wrote:
> The documentation says that all sysfs entries are named with their
> core_id, and that the "Core X" label contains the processor number.
> Neither is accurate. create_core_attrs() numbers the per-core
> attributes core_id + 2 and always uses temp1 for the package sensor,
> and show_label() prints topology_core_id(), not the logical CPU
> number.
> 
> The difference is easy to see on hybrid CPUs. On an i7-14700F, the
> "Core 4" label is on temp6 and belongs to CPUs 2 and 3, and the
> E-cores report core IDs 32 to 43.
> 
> Describe the actual numbering.
> 
> The mismatch was found by an LLM comparing the documentation with the
> code, and verified on the i7-14700F above.
> 
> Assisted-by: LLM
> Signed-off-by: Asaf Nuri Bertizlioğlu <ycistak@gmail.com>
> Tested-by: Ximing Zhang <xzhangjr@gmail.com>
> Reviewed-by: Ximing Zhang <xzhangjr@gmail.com>

Applied.

Thanks,
Guenter

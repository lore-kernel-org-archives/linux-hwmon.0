Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F7463F076D
	for <linux-hwmon@vger.kernel.org>; Mon, 18 May 2026 11:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779102029; cv=none; b=UN4x0+VZQSDZ1E1CtQu4/hgYpI4wOHMQqgzGhI2hH3BQORmx48dNrWnxjRsBSssh+ndFrGsJoHQUBdaWLOgMorLIZwz0qOVnXdWDczKjkW44OPGCSTErlBgRO+8bvAFL1CVT2qFnqsBnleJY3aYthQCau4Eh3EzpSf+ry4Yw0DE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779102029; c=relaxed/simple;
	bh=uzFKz5SfHmlhmA+O5WNsqMj6ivx+dwJ8a8soVnwe6Mc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V1OeeRmUDF/0/aG3hWSfZH1ose4o8yS/A0CDehJ4iBLdJ54HLBKZs+J+sNNg/gatvkIjOv15lnm34uprdMMA/CDhmmoPZ6teXhfdqhoBuAGKld8pqHmb0DnNOtmpxCZA3w44wHWCPmO6fH4tWJsw5lKECjxTC4n2p9Z2rqnbb4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kcIWjNPk; arc=none smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kcIWjNPk"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-2f03d6cf77bso2062036eec.0
        for <linux-hwmon@vger.kernel.org>; Mon, 18 May 2026 04:00:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779102024; x=1779706824; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eOeJHZKltlSb65u24B59FCmdWeWGl6DT9x22zsfC5FU=;
        b=kcIWjNPk4HwCfW5bv0ZkBZ3gZfH6Q/zxz8jLLMUHqf5yaipUexe9IjSZVTgscgoIm4
         wbRi/et/hk8hsEz/x4cZ+NcuuhJu3kIh3PTJnEQIjOVUMblrBdaR0Aivc5GGMI5f5/u7
         T4GvHeksaIAnrwDCboy+0LIfCmG9ERKbZHbYDGafLASscV+fP9JKPFcwFat/OZFzMJ8Y
         6FHkndNbpbN2vxli1GhtlQ22FmgiyvbtJ0cTC+NwHy4NJ7Psw4B+exYRhmp/XzvXZ50Z
         +MMncOvgDer3xM4apqh2zbHkJ/A+mLLMO3oikPNMsDgiSCa1uSbZXBUSI0gkZd6IQYRN
         s5Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779102024; x=1779706824;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eOeJHZKltlSb65u24B59FCmdWeWGl6DT9x22zsfC5FU=;
        b=DPoZbmfQqSM08/XpTKWBtKDr+IUITEXPdZVNDC24wy98ZdaPI35uyn47jp67IiYBmX
         jVNMfCYqO7QyPG2FD7DzMoZdXr4wGGiIb7Jtqm6kHIusyNz0L3H0gfAbMiFJq3k/P89J
         fLw55dJ4b+y2TYUHdZLbGv0OS0QEg0KyFM4rHAQ6PRN1uNkrZF6sAdQblWleHNJHyjuF
         16g7Q9fTkjHuY6xSB6RBLCYdKs0Fc2Je92WPyUtNv6XfANCGjwa3Zv1RsMcdCKAA2dld
         tG4Gewgrve7CoeEwnMUD09WC+/RzZYbYpKZ5+72y95dxL3awygfYJbAZAvQxsyuV7s7f
         jrNg==
X-Gm-Message-State: AOJu0Yy/5rwJWXz859qtSpHh1NkR13M7G4TEKX79n0OV1Ahpy9nt0YIv
	IZ7xym1lmrviDK9Dkws5aJYKgt2k1oIagTwhSYFlkN+WVf3UH0W6rtfU
X-Gm-Gg: Acq92OFpixRpN3bHlAGL6+K1NRr3Sp6W6ka3zxFZxLb/xEXJOSROshtFBh+jlbf1jmr
	VYdhOgJHxVatWhrmuFjaYjLaWhTI2RjGJhvn0+u/bqjfW+11DyUAxkXGY+vmY0yWOxL3xFDZ2uE
	v7tm6qp//OBCII/lid95G5lngRQtPODYaNQyJsI6GwWqwQb/3kdG6P1r9+7brIsqkaDevnQdkNd
	JPGs9gn1+Zrf9Ulc3mZDJo73/v8GGOW+uLL8WCVSDzZY1ytGFVBOv1p+2iO8iELVFmvc0d/iFZA
	TP8t/jjGs/cmuxX71ADYyMlN2Rw8bpq3YizXFTXMcingyIB+XsNPYrG/KJQFMat2MiNW4UF4FKK
	VRG1Zg+cQ5PqIOFiZ+gbego639KGV+FL+h2jv9g1PHOgz1tJcrh7G3OKzWxMTWtSy6A3Ww2Vhgq
	bWuRZV0HyYGtrAHAdqj6Ycthq3+aafBwgIUUnv
X-Received: by 2002:a05:693c:2b0e:b0:2dd:2ad3:f799 with SMTP id 5a478bee46e88-303982ac821mr5192774eec.9.1779102022084;
        Mon, 18 May 2026 04:00:22 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30290c4a699sm13671657eec.0.2026.05.18.04.00.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 04:00:21 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 18 May 2026 04:00:20 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Flaviu Nistor <flaviu.nistor@gmail.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] hwmon: (lm75) Add explicit header include
Message-ID: <3dd8073c-9552-4a16-8365-83c9a6987432@roeck-us.net>
References: <20260518072337.4918-1-flaviu.nistor@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260518072337.4918-1-flaviu.nistor@gmail.com>

On Mon, May 18, 2026 at 10:23:37AM +0300, Flaviu Nistor wrote:
> Since device_property_read_string() is used in the probe function add
> explicit include for linux/mod_devicetable.h and linux/property.h rather
> than having implicit inclusions. Header linux/of.h can be removed and
> also of_match_ptr() improving non-Device Tree compatibility of the driver.
> Remove __maybe_unuse because it is not needed anymore.
> 
> Signed-off-by: Flaviu Nistor <flaviu.nistor@gmail.com>

Applied.

Thanks,
Guenter

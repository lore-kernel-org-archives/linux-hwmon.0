Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E608340D86
	for <linux-hwmon@vger.kernel.org>; Mon, 12 Jan 2026 21:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768253298; cv=none; b=s0M3t5RSsE/IaS6EwgXeNb4+AcmxsddW1Dm/L6uToN0PL5t3+5SFDMYTbN8XbeRAAw0BNqEqYd7ifNlhezLShljXPVA3e4+aB5BJt4DZSzNfvIkIt7hwUtkJzT5XENbg9CdOIS2y18jlSN5dMS0kqIbymN1155eKPuwWGaHJbSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768253298; c=relaxed/simple;
	bh=Xq9hYDjvnqFChmH5Qra6is5UqyXaSFypcntqbDyH5ks=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mBzs8AfJiQbRGGmywVzNEQcioJgO3M/ADD2kv9LhMi6kipl965yKZBJQ+Yr36z7GVayUuoCAg/BRWtsJPNTHoKJEVqKQSsAUycXSiWu0pKIXLkrOW6uNb6nvhhrKY44GT87kkvNmsIyK2oqm5f4fGBS3hZ4PuO8umCSB9iRRFIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=edStnFbv; arc=none smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="edStnFbv"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-2b04fb5c7a7so6290547eec.1
        for <linux-hwmon@vger.kernel.org>; Mon, 12 Jan 2026 13:28:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768253297; x=1768858097; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uGzL9PY9B2npci6+F2iBWwrtXwHg2nUDD3+/s13cTb0=;
        b=edStnFbvNemBzTjowftNA5lcoJGYMHmcOWiYqBScN4RH+0a4Gg8D/sdHSOz/sMYPe3
         dkBT6xjO8ijho4qlTwKpD8aZ+ED2ahJVizSEc+vIy/P39R+U6PmMOZxDP+om+nsAwcS0
         IjzpF7elbtwjOtuHmYObT3ffQQDhHpdoLNTsMORqJX4TXAVxEeUfScUKyAJj4Pd+7cEe
         wbXIhSu2rVIaAk1TXW5rdJ8ygXsgwSqAh7HKzDlAFYK036INkD5ydNO+iqiWxJMWa+XM
         zkfLsU6RHAtsvRjtcilE35Dq8sczR8hGoat+Nvlw3xKPSfi3Cr0BhGSNAeq0tRzVAAoD
         93dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768253297; x=1768858097;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uGzL9PY9B2npci6+F2iBWwrtXwHg2nUDD3+/s13cTb0=;
        b=J61RMXmYg+Hx3ZvYN2zyJAAxG+8f/uUkMQl1MmA3oi8eHxvROzdPu2bTJNI64jnTi/
         wpXvG03NoN4mIeQ+RblHwkg5+656N2nsOZpBQVk9FrJ8x3JU8C+LScBCAUmf3yNrBdkW
         h51zmxda8mGGiibuym7pMt+QS4F1/kfmZtlOwxhl4Avo/cYo5Wg6ZYbjJ3efZ7jbLPUz
         RJJ9/3CCUh+NJYyNzqtYIXtJTIpxVQohr5SdlH+KN6JGNZOzI4QpK+tRm678/ywIeTyR
         NEBYmoW3g6vRqA5detx/+zHhwgLXNutG4i7Dv8UxmLx8JIcrP5fBK4RGUNla4FozZErq
         Dc4g==
X-Forwarded-Encrypted: i=1; AJvYcCXjz+7TlKsuidZw9W2j5Q82JBiheFcXz9+AlMOZZX+yg7Rb8y+QKgA/MuMTn/hIAkzGL5ZSZzBcgvS5Mg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyPExOgcBkO/Vun2f5gJJe7UzLOZgbDApKuICg7m4zmZoEnq9O2
	jV4Z1YFVS6numnEfLXJeQZEq7x1IpNFl9+0yYRtxorbVxkrljwzEZWDI
X-Gm-Gg: AY/fxX7G+KgHXZWXkbRxMg8jGBPlavjrS4PGetYaNmvhS7AKD/PFQ988uLlu8ZywTN9
	R8erhvtMGVkc3rZmSwNvIKNEKKP9NWutTiF7jDvI86LHHMlp9ANijnESRF36I0BQsEB55vmP4VN
	K6cT+6zrX+wNuxKJ5tCV7mtwC4+QqhBQZqTbsZYL+yOu2z0XVpwN2ddZJY2vRNVbha9Py677Hor
	vxQ/bPBR9I6wgvl8AFWhU0EekoF9VdkOKOH4smWHbnSDbwVEp2Zj/Vl11klPMmC//YzV+kGHR4Q
	kdqbw4CZn+ZtX5a1kTP+SPAGwaEYyb9HyQqtYThFvcLSb+RbKfpw0p5ZqgHf4qCEzH705AqNha3
	bnqGJaarIvzP8+Ob+nv59tH2UxsjpI9wHxWaebzjGWP9aOI9O+HbqlJlBpJfapHAvYI9rZWmCHI
	k9LWv2ZKtnTIU1/cp6IK8x3TDR
X-Google-Smtp-Source: AGHT+IFxGslrLNNC1UTvaCqvzO9T3kSVh9TqTTTlGQ49Vu+kvrrTXqfLoxyaIgnaqL5Cf84QoTbD8Q==
X-Received: by 2002:a05:7300:aa8d:b0:2b0:5bce:2f38 with SMTP id 5a478bee46e88-2b17d2511d2mr17214273eec.13.1768253296690;
        Mon, 12 Jan 2026 13:28:16 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b170673b2esm16960563eec.6.2026.01.12.13.28.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 13:28:16 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 12 Jan 2026 13:28:15 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Ban Feng <kcfeng0@nuvoton.com>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] hwmon: (emc2305) Simplify with scoped for each OF
 child loop
Message-ID: <3b22e413-6ca6-474e-8bc8-0def9f8f162f@roeck-us.net>
References: <20251224110702.61746-4-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251224110702.61746-4-krzysztof.kozlowski@oss.qualcomm.com>

On Wed, Dec 24, 2025 at 12:07:03PM +0100, Krzysztof Kozlowski wrote:
> Use scoped for-each loop when iterating over device nodes to make code a
> bit simpler.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Applied.

Thanks,
Guenter

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 120B81C2BD
	for <linux-hwmon@vger.kernel.org>; Fri,  2 Aug 2024 05:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722575553; cv=none; b=LF8S4V61B67o4JsFG2Xv5ygMald666Jgm5DrfAnLIUBruKn6cQ7dthMpLGIywZuRhgoigaJDF7DH3ut5wLgth+QkTh+n21SX9hIRPkZbGtZtD9RVQqUh7c5OvR1Rlex3A0kG42d9kgfKnEUA1OSvdVHM6XBpLUGTrufgHijjvK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722575553; c=relaxed/simple;
	bh=SH8y/2MTDSeVZvtF5jH8XbWka0kA6HB0rsYjr1n7GGk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EhtBuy3g1sUfcQh1P/k/WUH2TGhHslsTvREqx058/NIqXTV1sAmMEX4nisMnoY5rXpwcgeGzlV40738JEWMFqPQCaH2poY2Y8kkhPSC8/B8pZQRKbEtUJQZcZOQWsr59GBiDgrPLBcQFaC/Q/X1MKVu5By0gcbjTotrtUkXjfXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U2n6u02R; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U2n6u02R"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1944EC32782;
	Fri,  2 Aug 2024 05:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722575552;
	bh=SH8y/2MTDSeVZvtF5jH8XbWka0kA6HB0rsYjr1n7GGk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U2n6u02Rax+mVOx5+FUDCeRDs+GqdPO4l3QQBoRD6D19zOmXvrHYGj8WZ9rQoABlj
	 XhLj/wrq3bJ9E9z/iuliUARv6o6ltciMLl6UHW5M2pa45F7NWVKLgCY+XSFNJhYE+R
	 aycnCl0+UgtKIgCNUX7r1pIUXw7HSEZs8GXy4kl9g/iQ8X9zBLFnF/pFonA+Sy05q4
	 qvIGWRPp1Wvs40XH941XUXjVoFrlwXDMr8tenNaKwkJbIKcaPgiiy5Gcr+1We37CEx
	 yTrWhrf/uzk7UYw+KsWLbVofjz91bgnXAUCZSWykA0STaOQj5LrbRiGsv+qiCsdVck
	 C+xMjGeoSSjNg==
Date: Fri, 2 Aug 2024 05:12:30 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH 5/6] hwmon: (lm92) Convert to with_info hwmon API
Message-ID: <Zqxqvl0rSjpuRaoF@google.com>
References: <20240801144918.6156-1-linux@roeck-us.net>
 <20240801144918.6156-6-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240801144918.6156-6-linux@roeck-us.net>

On Thu, Aug 01, 2024 at 07:49:17AM -0700, Guenter Roeck wrote:
> Convert driver to with_info hwmon API to simplify the code and
> to reduce its size.
> 
> No functional change.
> 
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>

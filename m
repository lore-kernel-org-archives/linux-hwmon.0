Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6BA71CA84
	for <linux-hwmon@vger.kernel.org>; Mon, 10 Feb 2025 02:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739154120; cv=none; b=YhbeoO6tUKqzjcafxbJqnxnFqSn2Hi8Il8UUCGEsDVQTPe0oCdqeShpyPpDzXPZ9y9/9sPtGv01uzPU6LsTKmsaISwWmc9WTj6SbuALDQo2oTbt5xOxhc7qocgtnF8EcI6htOjfyFjFAJX9kINK3f6m+HeH2B9pZVDj3CVmZ1zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739154120; c=relaxed/simple;
	bh=l5rDA7U8TWKrA4N4bjUKbOEFjUnjkAziynqB4FLMLwo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uaD4VuVACv/mwRrqf6tWPRClVsxRBf2x3ngxNV4BJfGMonw/3qmGshJ/SZcTouDb4DmHuqkc9T0lykHzEKbIgnzTBkF+h+YHmhITjLW8s7xi6ijS+4wh06ElXuSyuZtu55JhEioZgfD7A+yvd5yNRQ5e11N2ncjvvV1Vyd1uqbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FzH/7tXR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FzH/7tXR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAB99C4CEDD;
	Mon, 10 Feb 2025 02:21:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739154120;
	bh=l5rDA7U8TWKrA4N4bjUKbOEFjUnjkAziynqB4FLMLwo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FzH/7tXRnf9FKKtHG8TgCWxKNY5JfWOXpRjTOl0/2qGSE/+c+MyrSFNzvDNVpqdF9
	 WhVILLFCXUn3+fnqCJT8VsXUc8kTxsTQTKqP9W9Tbus6N8nWPsHwsbYuOtgPqgoM5c
	 ymgBPdrpJzXkbmPrSElTJ75K7K/ckxBrwwrIA8qBhEzXWJqavcM/gjt43PwOrj39TE
	 AS26vOCqaKdNJNc4CFF6Z4SSBX8/VC0E9vHEMw0dz75qhUp/KDhmTVUIkmj0KxJ7L5
	 sCtnd7V78cY3warixb2Y/XV/nQKMrF+q0FHWDE0ZKuGIr8Ei01/t4H4HIakXuSkphS
	 Me+qNrS2LCbmA==
Date: Mon, 10 Feb 2025 02:21:57 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH 3/8] hwmon: (pmbus/core) Use the new i2c_client debugfs
 directory
Message-ID: <Z6lixfv6jRfifqmj@google.com>
References: <20250209012617.944499-1-linux@roeck-us.net>
 <20250209012617.944499-4-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250209012617.944499-4-linux@roeck-us.net>

On Sat, Feb 08, 2025 at 05:26:12PM -0800, Guenter Roeck wrote:
> The I2C core now manages a debugfs directory per I2C client. PMBus has
> its own debugfs hierarchy. Link the two, so a user will be pointed to
> the I2C domain from the PMBus domain.
> 
> Suggested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>

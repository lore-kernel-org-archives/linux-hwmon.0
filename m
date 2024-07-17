Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC3D91802D2
	for <linux-hwmon@vger.kernel.org>; Wed, 17 Jul 2024 13:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721223378; cv=none; b=NQYVC0LTwimLxguc/1bbDzpAAng/Fxnv20IqiuOWg6zeE5k2VDoopH19Vd8A/WFLu025v59a0F0C7rRGK4wWqUQ2LNwN/aa0D9aKS2wW7XUHrt7tO5YGpufyaiV27XAvL+S0tlj46ws48JSP/cTEjl/h7wROZfzA6exMDmQ5KrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721223378; c=relaxed/simple;
	bh=shjqYAAP5BBiCowl+SV6f7PhR9Tk7Z9Go22uqL88sz4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Iy4U0og2ssDZVDTuXORCNOGDEQaz0SYDo2IPhOoWI6ZGpwaj2v2gDbWmKO1HZdvT8IbUmfmWAda12Cin7eu/YWhF4Cgjah9SGPWv4OgmEl8tI3fItUnCDQPiJDs4SGnvUWYD50bmhBKYipuvg3/5nZ+D2aMU23A9WqsVwl9DbqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e/OIT+KG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e/OIT+KG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3502C32782;
	Wed, 17 Jul 2024 13:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721223377;
	bh=shjqYAAP5BBiCowl+SV6f7PhR9Tk7Z9Go22uqL88sz4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=e/OIT+KGWy8iGCf5C06lwbiCWZoUvhqY6FzTxk9gKsB0ZkaMD8j3e1N1W33lGjXdF
	 SwH9KAGQWtkDW2N+gltY2+E0OfKhaYDLMXQnUXT8DpKm93WqhThs3rYAPihamM2vsb
	 ib/3wSD3Yq5Q4HStkd0Dcw9Ox710ZmPI7bP+bzXrWKTOWHh11J6YCMlZ3+r9lPNDfp
	 H0+yUwh0p/GCPgy+qwdnyeL5vn4RP/z1r9EKLg2l6cCi00Frl1sdzVUhHKkVk87LF5
	 moKqIB8GzkvhRXuxt7WXgwYBw09JdNqt61hbnUmoqx/Qw5p9J04vy5Treah/KaSCOp
	 umBN+39kIL8zw==
Date: Wed, 17 Jul 2024 21:36:14 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH 6/6] hwmon: (amc6821) Use multi-byte regmap operations
Message-ID: <ZpfIznBotlItv8cE@tzungbi-laptop>
References: <20240716230050.2049534-1-linux@roeck-us.net>
 <20240716230050.2049534-7-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240716230050.2049534-7-linux@roeck-us.net>

On Tue, Jul 16, 2024 at 04:00:50PM -0700, Guenter Roeck wrote:
> Use multi-byte regmap operations where possible to reduce code size.
> 
> No functional changes.
> 
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>

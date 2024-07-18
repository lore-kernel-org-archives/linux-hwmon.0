Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1934F7407A
	for <linux-hwmon@vger.kernel.org>; Thu, 18 Jul 2024 16:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721320848; cv=none; b=Ef4uZk/osCc+KGXnt9UcwNW2h7+tQ/VO/DJHVgWfqPKWs8gM7kb8rtJFxK5Nlr7wHVsdjCE7mxcSkm9HKKAZD5+ZFZK8NlLnX6ND3m6mzsvsP22OsRKKXaqezB6mywXy8+Jhf51QJgeich5MXkwP1XGlsgD2GX390FLrnrocVcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721320848; c=relaxed/simple;
	bh=HcEmN9tzvkQ/glz+FXDVpny0YAf4jL8ESK8xDNErJpE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cLAWR9d80uIJZi64mZFKDj6/VhaTkYNaeVlGIhjI4Ay2eWgPoRoG0yQcG4zFM46E7x06vZALI26QAVWLofPv/2713ND/NJcjCag1/eXxLIu9EHYWrik9ydyEQib1iB5jkFn6E3wpWoRmxgNZrLiFlRHP5Bqp3Qj8ItexeZRt65s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UnYd8yar; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UnYd8yar"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC9B8C116B1;
	Thu, 18 Jul 2024 16:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721320847;
	bh=HcEmN9tzvkQ/glz+FXDVpny0YAf4jL8ESK8xDNErJpE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UnYd8yard/ri/UE9rulPIghLb/Hj+67t+nKFSciBJnYsq2koctPrsd51t0Y4esSCl
	 ojbk08gT9k+vr63Am6h8VECZ1OkPzKPZweI6MH7RCLKnKughOK/SB27bq28MLJxIfL
	 xCeKGDr3B/yEson5wHqhsDEogeNjj6le+/f3TfNKeVeD3DGmN+AOxnPbVESE0+jJck
	 Bw6mO8LcxYkC+xdWso8SxLfxKyewdWh+NhxS96ccmL1eG6JIC/oTUqTf8b3spIcIWf
	 AQI77AInriSs4oUAxdq+Lu4UreTwnWjYwpsszHbukjkeesJ81idITgBxqsYjTqqLMo
	 U+CeO1AvS5uyg==
Date: Fri, 19 Jul 2024 00:40:44 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH 6/6] hwmon: (lm95234) Use multi-byte regmap operations
Message-ID: <ZplFjI6xfShXkIYd@tzungbi-laptop>
References: <20240718033935.205185-1-linux@roeck-us.net>
 <20240718033935.205185-7-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240718033935.205185-7-linux@roeck-us.net>

On Wed, Jul 17, 2024 at 08:39:35PM -0700, Guenter Roeck wrote:
> Use  multi-byte regmap operations to simplify the code
> and to reduce dependency on locking.
> 
> No functional change.
> 
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>

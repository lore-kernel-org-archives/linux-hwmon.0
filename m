Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3C6515AD95
	for <linux-hwmon@vger.kernel.org>; Wed, 24 Jul 2024 13:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721826146; cv=none; b=RMcSmnW2I/C4kTvNT7F5tBTc6fY1jhhgzUHJjirOmsJQdgC4kxAR7S8VZQrfEtLXBB8c9rRtJ/BDe8EnF2iy5hkDVv9AMcYJlqsAsnwFhieO2RI743piffESo9lu7MUaWQSGmZEbav184gbwwr7GY9XPU/+XMefeEA4XmpjF8Ww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721826146; c=relaxed/simple;
	bh=vOT6C7Nyo5ok2/04vqK8vpKTNL4nwHYlyX3rcxJVgbE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YSszD8SvnxxP91/8hKocKQvPeh62fqeQk2QDHhIhwoJFM94wDIb+i84uTU6PeiW9rna7PVDzdo4Lj/03OQ5xAzW+Nh8rphTNbeX74Im7MR8FBMC43Jh9QOv58kWcu9uYLtJKm5HS8xunL1XeRjkb5UOAz+D72stKszrPW4U/N9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fx17NRzE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fx17NRzE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93A35C4AF10;
	Wed, 24 Jul 2024 13:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721826145;
	bh=vOT6C7Nyo5ok2/04vqK8vpKTNL4nwHYlyX3rcxJVgbE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Fx17NRzEYZrtyByS6qHWpvdYd99O8UFrjLQnmYKskzaHGDTbjo+yEZECEvxcHXilP
	 w/K5dDYqOnaFUKld3udAAJW9qXt3V5aF1Q+n3QxWKpKyPj3/k3jufirj8+dMNVWA3n
	 Y4FqPNxWjDSmlJHvLn+yND8bIzkxeHw4r//HVnw4x5LSPdgHSISEJXcmD1wS0JtHwv
	 I7GS6qOHW3kh663xiyaLRLzVodRcGrGxk8qwg7ZhBBcNxPt1AmTCl+k1OyF/svEtjS
	 TVvPW19tjoY2gO8lX0CLwF2Yw5Tl4oFqcu9p52Yu54F9inKGG9TdSXeHtmc68sq5lZ
	 nvwFpatDrUDIw==
Date: Wed, 24 Jul 2024 21:02:21 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH v2 3/6] hwmon: (max6697) Use bit operations where possible
Message-ID: <ZqD7XaeoD7Dru495@tzungbi-laptop>
References: <20240723154447.2669995-1-linux@roeck-us.net>
 <20240723154447.2669995-4-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240723154447.2669995-4-linux@roeck-us.net>

On Tue, Jul 23, 2024 at 08:44:44AM -0700, Guenter Roeck wrote:
> Use bit operations to improve code maintainability.
> 
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>

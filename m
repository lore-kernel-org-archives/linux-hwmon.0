Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04BC0158D89
	for <linux-hwmon@vger.kernel.org>; Wed, 24 Jul 2024 13:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721826111; cv=none; b=Sh0viQxj1Ux4rNV8BDR1VH4ks3dADj/Q7Raak2vBKwTpILNkWhZSR+2tiKFyAud6PthU1WGMYrhNaJrXChxY0gMybXzZoYN3xHoo867b/BlTttGiMA1BcwOKdett+J0C2hYcKLa9jT23IA9SSxLR2Ry4Qyg/s1iOdjfcKmuBV+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721826111; c=relaxed/simple;
	bh=ZoMgPLJe9lcv2RQmhSdv/EUfcIy9QeT/MJgwTnPFj5E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EriAWu1ZDij8X95Adl1qIsVNBKORGFz9IFWW2OXjk98SSDdaPZLXbwgQHpRnA4U4PX5J9Gd8+Z8hR+31BskxIIrtL8Av822kOd5nftUshhAuoX4tNPBGHYKjN02NUDOnlHoaAeOgm+a2YBpQqZWv2lQ63aBClbKLijaFxctwIR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LCHgOQZM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LCHgOQZM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9D10C4AF09;
	Wed, 24 Jul 2024 13:01:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721826110;
	bh=ZoMgPLJe9lcv2RQmhSdv/EUfcIy9QeT/MJgwTnPFj5E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LCHgOQZM+GMYDvwQNALJk9v51cMlTygSdq7amD7G/Yc+HpzrXzKt9nseaHxNWStIh
	 R6zhCAcQe3Hg2CX9idUSQXo79xmoBuO4ThIQGuBuGmmVq7dSABxKY74qVqMKOgaBDS
	 N+Ijqn90m3gpIzFEVlIlVD7kHcdmIwQY9VNtvZcdNvmZopjgGNT+24kXA0i5cuI/5I
	 z3UXOvYISWeA/jdZIUCuV9xvvT5n+xEIHDvJ4hugrTbVL7u8wKGT+to8oTIYmXkqhF
	 q1vDESg+yUux8YptwXgRAczRjy1SZU5vEieHx5WZYb2pUQ9MnYX1VaPhgtn82o2HfR
	 ujb66ood9jIWw==
Date: Wed, 24 Jul 2024 21:01:47 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH v2 1/6] hwmon: (max6697) Reorder include files
Message-ID: <ZqD7O9dk7ZKQ_zHl@tzungbi-laptop>
References: <20240723154447.2669995-1-linux@roeck-us.net>
 <20240723154447.2669995-2-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240723154447.2669995-2-linux@roeck-us.net>

On Tue, Jul 23, 2024 at 08:44:42AM -0700, Guenter Roeck wrote:
> Reorder include files to alphabetic order to improve maintainability.
> 
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>

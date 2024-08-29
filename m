Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C595C18C331
	for <linux-hwmon@vger.kernel.org>; Thu, 29 Aug 2024 14:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724943210; cv=none; b=hItzzTzu0CS1/vgjm+hWpaObSMaejmhgX3+JnnhoqbCq44l0/AZwy0sEdcwaqCOjAERtY3d6Vuy/pUJ+hb0OoevFJNS0mid9+BIRPgcUqEtxFPZIwjj2QfGECSqNrODGO8Jgl6q02UDdvCqkxLS25kyClHnXmopeCmhiaBpV/Bg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724943210; c=relaxed/simple;
	bh=2l3OERYuorbZddve9Mr8DBUKE7N6rhoP8Eg2hgxFCas=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aPUTSBmyJqizK29ARuIZNxapqHG3j4xucUXEY5nakvw6f26xzU/DTmCFtnpg23c/XRzJAspQtjRuTQIc1ZZ9UdSO+UPVkR7iOoguH4dbXrdReRnx3yQjZDJA6whd2+SFxPeemomAqfZCUsJQFzrp+VDls1K8tQN7xI5ePo5gosg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A6HR8/z/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A6HR8/z/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B317BC4CEC1;
	Thu, 29 Aug 2024 14:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724943210;
	bh=2l3OERYuorbZddve9Mr8DBUKE7N6rhoP8Eg2hgxFCas=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A6HR8/z/2H88fnAni8FGyr6BWo6xbiuiUulkRpNHsCMiguNddxT7baHauaN1vWrKn
	 RvfosdG63gcyqouaw0XfuUEzcOpFCE6iaBxyWyUhBTITjiZNTSL/IH3z+2gMXEKTmf
	 OQQQ3TweKyqt3X+l3EcWvvG3NX03upCWJEwk2WcMgbFH6cb2QzYbdgmuECXIlPG7Gs
	 +qozNwK5RBlyF212ScmYfomGQxSxEBTfyF4xtGwhkZVb01d1BCHqzfX5b0sNtRZQqS
	 GNEDWwLSGfQhkm1qXmCZ44gy4wafb1bcS/NihukyLHUjqESYyVaN22uMUHvsRDoqKW
	 MvWyRDMuyCx9g==
Date: Thu, 29 Aug 2024 22:53:27 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH 01/11] hwmon: (ina2xx) Reorder include files to
 alphabetic order
Message-ID: <ZtCLZ8JMGoInJFrJ@tzungbi-laptop>
References: <20240827153455.1344529-1-linux@roeck-us.net>
 <20240827153455.1344529-2-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240827153455.1344529-2-linux@roeck-us.net>

On Tue, Aug 27, 2024 at 08:34:45AM -0700, Guenter Roeck wrote:
> Simplify driver maintenance by reordering include files to alphabetic
> order.
> 
> Whule at it, drop unnecessary / unused jiffies.h.
> 
> No functional change.
> 
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>

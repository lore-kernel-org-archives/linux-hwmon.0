Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CD07178CC5
	for <linux-hwmon@vger.kernel.org>; Fri, 26 Jul 2024 15:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722007220; cv=none; b=nzmESxcIfnQ2fvRwyjeMv4bizXKvRySrgazr09g2/9jqgRs+UM9nOXNlnfAUJPfzn9mjZwBZwaPRnbE6doXpeio6dk2j6pj3dMOk3ROq/COPLfA8FEkxW8ussieLUbveXR6lLbSyi4c+U5A9bacVu52hH0ZG6q8334UBPPicPYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722007220; c=relaxed/simple;
	bh=t5MYS4GBUH5pVLPk103bN2kFBi8f+yAanN8Qv8tuWuA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YmFGBwNgHvIwakDDuT4We4EUt0TgSvQArNM80C+VPMGCjwjgcdlX4kdvEqRb00uYJRvQwUTcxglLNis+6kAbyEASndAdZ8ESJ3w1VGY6PsbW8qpzS4KazOOO7MXY+DaiG6E25nJTGXjkEwPD4K9qWY9AwRSWmGYmftlRs0sgmnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SAUlQ3HP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SAUlQ3HP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F10FC4AF0B;
	Fri, 26 Jul 2024 15:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722007219;
	bh=t5MYS4GBUH5pVLPk103bN2kFBi8f+yAanN8Qv8tuWuA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SAUlQ3HPd9GOMfzRgqAO2X9myYvU/okHu6W8XwbO2uDoqkM0TXatLF9Z0mZaVwn5S
	 Lyj5E2hJYSEX7aROY7giQ6ogPNOLgyqshNorf1C3cj6yIjw3rQRNaydk4Hl4qWU7Tr
	 +OUQ9U2IgayDLzan9ZfMiGoPLs81Rvo630SwouQrPWvubVuKK7QML28hyXARCklFOH
	 yiqt96LvTVYqcsOSSHnuYjYgqMllihHmucPcRB8C4qmSDhvmS71wOp2fOI1fIE1q0K
	 o4qCGrufIw5jIxrYgetqvKyBhE5kasgQLS6Xl4hMCUA2jf50NCI0B2aNcbdnV8hTGw
	 I1LBoqXD9dRqQ==
Date: Fri, 26 Jul 2024 23:20:16 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH 1/5] hwmon: (max1668) Reorder include files to alphabetic
 order
Message-ID: <ZqO-sEd6bmuejw5c@tzungbi-laptop>
References: <20240726004329.934763-1-linux@roeck-us.net>
 <20240726004329.934763-2-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240726004329.934763-2-linux@roeck-us.net>

On Thu, Jul 25, 2024 at 05:43:25PM -0700, Guenter Roeck wrote:
> Reorder include files to alphabetic order to simplify driver maintenance.
> 
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>

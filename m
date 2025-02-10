Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E3801CA84
	for <linux-hwmon@vger.kernel.org>; Mon, 10 Feb 2025 02:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739154153; cv=none; b=h1B6AXs3PbU86WA3dx7G7fA2LaXVQmpCPnMWDJPrrXNUrQnG8utT6XL7n5ZzisCjSEN/Krk2wlnKO4eTokcaUONSbiOdJoQ2L9QqcyXvWe2q8cV8M1wo1PHmDhHt0YynOjV15INrNkc7M7dmRafUBzlkHUR+0bbAUf7IZnhD7do=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739154153; c=relaxed/simple;
	bh=HtGgjN6eJuef4H+kR7jfxjVOIreNM170GCHih2Jq0E4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z9kE317EjnOelnoUs/47WjDp3lS12fIaCsccZly3iY44Qk2zOWCZQtOCVUqVv7GWqh+QBrZwfuTQrfpGcsTMsO1pDPRXIf4VQ+/Pq2GDJRd/jmPtrLBS2+q3k/5K4U4M+y5ewdGrcNUZnsA8DoFX+LXfT5shwQgqG2VbvFBus8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b1nCfWDD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b1nCfWDD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E694C4CEDD;
	Mon, 10 Feb 2025 02:22:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739154153;
	bh=HtGgjN6eJuef4H+kR7jfxjVOIreNM170GCHih2Jq0E4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b1nCfWDDtzyFfITMcwQPMoinHObT5XkrZI8giW8gRH51EMhwJtML5NONfwtH4hnxf
	 s0JrCN87mYElAVU2b0SKISOfwubGcRFnp3G4vJD9snt0d82H/uhC/sBCbvEsFayv7b
	 pEQaAayAKbpWXnCY2fzrA+/gCL57Ea0ldGhO07cV4amhP/mfKo+4Ak9p4ot7v8PKdU
	 oeV/ArE7X1aY9jCMaQ5OLLqRWg1JGxSn4FzphDyIY0Qz/ePFxAUuZECDeLy844zOB3
	 PVjlQ3GdhaM9baYMSHzmwqy9tcQZVs90K5M2wY5Xwxgd2lqjQQY+dk9yuUCSkplNEi
	 ZTgF1S4FoFO1w==
Date: Mon, 10 Feb 2025 02:22:30 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH 6/8] hwmon: (pmbus/core) Optimize debugfs block data
 attribute initialization
Message-ID: <Z6li5g_eUE-PFY1y@google.com>
References: <20250209012617.944499-1-linux@roeck-us.net>
 <20250209012617.944499-7-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250209012617.944499-7-linux@roeck-us.net>

On Sat, Feb 08, 2025 at 05:26:15PM -0800, Guenter Roeck wrote:
> Define debugfs attributes which need block data access in a data
> structure and loop through it instead of creating debugfs files
> one by one. This reduces code size and simplifies adding additional
> attributes if needed.
> 
> While this is currently only used for manufacturer specific attributes,
> the access code is generic and also works for other block attributes,
> so rename operation functions from _mfg to _block.
> 
> While at it, rename the "revison" file to "pmbus_revision" to make its
> meaning more obvious and to create a clear distinction against the
> "mfg_revision" file.
> 
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>

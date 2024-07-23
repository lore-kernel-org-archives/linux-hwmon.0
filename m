Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06EA9134B6
	for <linux-hwmon@vger.kernel.org>; Tue, 23 Jul 2024 05:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721713057; cv=none; b=ERs/kmBq9J/Q0R6Y3Wxq8wmMmhOVkWcMVsC1NKtByxh+R4Pdq9p9++l5FDd0j7O0rfpFeidCZZ08Ar8mDBjOCJ6CDFG97scXcpDKLAkeXLXB6BXzNeIiny6e7lF5YnHazxOpybrMEZ3hH6cQkPMh635qpPtReU9o8ZKccXu//FE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721713057; c=relaxed/simple;
	bh=Clv1sM1msxqzQUPI493X4WBjXBHtJIkroubN4Qoioh8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ssq0f86tLdsAZQP2iWbCpAHrneeBfy4U8gBgHUlKNgMzgwMrY4DNJzAqS/Ecq983ov6W7R/13JnmeKYBpAPXYwjkw5j/HxcC55peZob7KqwZ5C7WVl2M1XwTRopHIGAJ90Q/vlnmS+x2gtp8zcnnOzjmYXQIY88LrZeazqa4pLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mwg1UTkR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mwg1UTkR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F352CC4AF0B;
	Tue, 23 Jul 2024 05:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721713056;
	bh=Clv1sM1msxqzQUPI493X4WBjXBHtJIkroubN4Qoioh8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Mwg1UTkRydVvEaEpY331sr0X/xi0gfEuTAks7RCbh2eZAvvildKDy7gW2YTrhw3Rh
	 6UGu0UhFGwqfVHba4+r8b5L1chsplGQJaDBpWf07q7kh6SVNFhhKVBKb2G9ItOv1I/
	 bpsByT81Xep5Jv7iHAHV4QnHCMca9kuaabxqlUyyBlNRb0L4Yg9VskBccAWuRClCAK
	 ScRFH67CCV91jNuRANwGaGffGm31RQERamFuXWgCqoVGG3CtNWcEQxNkPKCwPz5at9
	 2UvXhAXuywX0ncK66IQ/SiXFvjr7DH3Ns4EwTbyD8C+ACKpAbDMcXBWfFO2+OhxsoM
	 /6g1ixpUCo+wA==
Date: Tue, 23 Jul 2024 05:37:34 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH 4/6] hwmon: (max6697) Convert to use regmap
Message-ID: <Zp9BnseS2nhVqVzY@google.com>
References: <20240723005204.1356501-1-linux@roeck-us.net>
 <20240723005204.1356501-5-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240723005204.1356501-5-linux@roeck-us.net>

On Mon, Jul 22, 2024 at 05:52:02PM -0700, Guenter Roeck wrote:
> Use regmap for register caching, and use regmap API for bit operations
> to simplify the code.
> 
> This patch reduces object file size by approximately 10%.
> 
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7E931CA84
	for <linux-hwmon@vger.kernel.org>; Mon, 10 Feb 2025 02:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739154078; cv=none; b=ZPUJkd0wyTCj+lA8Ae+czYlBAI3spcK88y1kkP2+W5tjL4B0uS+npyza3jf0qnRFje6xzXcN2Pg4cGUwZEzyP3scs6bNdWNP0f6A3x0ReV6UUHf3aNpX75wpbL17xsThlO1RPJb9VI79RNzV+kc9jaquRMoc6VTmRCclCvp4xf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739154078; c=relaxed/simple;
	bh=7bMMc9dOo64REMEoIrmf1zHS4eh2DFlCt+5IJWj+z+8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mt+ZVnTdmrOhFsoW3RCF0BRZTElWCJwmX9Zx4htsvEToWDxN4S+iUtXZVakkllbp3pi60tXLewdeWCSOE28btKwU6qOS5MYMuQnHRXSTkmtpb8v2heJRNFKd3mK0ULGHdCY7sHuh9dRMbrmaGhn5f2gue3yaeXU2gmsh9NVMZpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZaBxOPWQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZaBxOPWQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E9F1C4CEDD;
	Mon, 10 Feb 2025 02:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739154077;
	bh=7bMMc9dOo64REMEoIrmf1zHS4eh2DFlCt+5IJWj+z+8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZaBxOPWQnsi97tFqzh4I2SfhMKRHaSkyEZcnq8XgWyAuHpxMH4VUgyRke68EHGlAy
	 DOfOuXEhlU2HKs8f9bnwsPLoCipPRvdCGQzQU+/9dT50BIW3mthS1CBGnwQGPSnRhm
	 kk+ri6j+mD5ZptQ6wTwGJRp1nxWeZvBJGk42nsR9bBh2GHcLAhczmJ4LIAMTsxquYU
	 C3wzNzdnqr4btaNRuX71llhXZ5ebFzvDnoGKS9GRw6k4xpxFevvYMRXty6sftAxhbF
	 zkVkbPrYSEKyDlwT/1Wk/VDHsJgtztKb3lYd/TPtId+aDla3WP/g3lEWUt3vaijFxT
	 qOUDJ6PiwZU6w==
Date: Mon, 10 Feb 2025 02:21:14 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH 0/8] hwmon: (pmbus/core) Various fixes and improvements
Message-ID: <Z6limkNWqXP0Nq6x@google.com>
References: <20250209012617.944499-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250209012617.944499-1-linux@roeck-us.net>

On Sat, Feb 08, 2025 at 05:26:09PM -0800, Guenter Roeck wrote:
>       hwmon: (pmbus/core) Optimize debugfs status attribute initialization
>       hwmon: (pmbus/core) Report content of CAPABILITY register in debugfs

It looks like the last 2 patches aren't in the mailing list.

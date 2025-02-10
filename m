Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 586571CA84
	for <linux-hwmon@vger.kernel.org>; Mon, 10 Feb 2025 02:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739154108; cv=none; b=fG2MDtNd6JSHX+/UdMhnk8TkY4YP+G/cNo8O3fFc9Q5tk9dlYG5NS1W7P4/qkjsc9KJxt1UR6C2nnzdryOdDmIubwmkaVkwcjeMWS80Fh6bJgiX+RwZoljvJ8tHbXxxLiO+I8sl6RTPtX7kBfZ0r+T4Bp6zDSfigfztgAeGLz4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739154108; c=relaxed/simple;
	bh=HIQxZEiHKeFLaC58yJfbP3qAoPGVu2HcL7KiFSXSs8o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CafYOn71ejobEEAqGzrDZdItHfQIV3uoxmJ7U4l8tBLNJSXnF6VtaN7MzQzcWO/rhWSXfGgn61Hn+lyX/cCfHh9yg7s+y3vTssDwtmyr1Z0mjDUONuigu05hRFbd8hOh2wiTbNCP2WQw6RhkOXylTrv9c4sFkIfXejvWrpe85a0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XA3pBP4Y; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XA3pBP4Y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2E3BC4CEDD;
	Mon, 10 Feb 2025 02:21:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739154107;
	bh=HIQxZEiHKeFLaC58yJfbP3qAoPGVu2HcL7KiFSXSs8o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XA3pBP4YbcSRa6sw/OxcYrrqfDevhduEypoq8YAPeVUf/6o6E11TwHsa2FRZmYASd
	 KtyUe8hUS+XSHN3GfpIaBJtNLMrvCZ2gGsRfUT0WZ8sLCvsjS/7FsU0Z4iL7B2T3wm
	 MKVcvff839ghaw9r0exTSq58Vucy5LYOifFglUZZK8Oc+hGnPBXZcohQggRbzeGiwr
	 Kcbye6DLcmW9/u766fKtaTUwm9wv/0DdsYa2KkTgpF0OondPMlkPg0OLUefpiYJ3aO
	 XRzq7j5SxCPp3ewkF8WeApDItHz0cO1ucFvtJQ8gF/mjjniHk/m8viloqKl+Boq89v
	 zR4LM8A2UIoow==
Date: Mon, 10 Feb 2025 02:21:44 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH 2/8] hwmon: (pmbus/core) Use local debugfs variable in
 debugfs initialization
Message-ID: <Z6liuOOiCDJ2Jjmx@google.com>
References: <20250209012617.944499-1-linux@roeck-us.net>
 <20250209012617.944499-3-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250209012617.944499-3-linux@roeck-us.net>

On Sat, Feb 08, 2025 at 05:26:11PM -0800, Guenter Roeck wrote:
> In preparation for the next patch in the series, use a local debugfs
> variable during debugfs initialization.
> 
> No functional change intended.
> 
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB6EA184D
	for <linux-hwmon@vger.kernel.org>; Sun, 28 Jul 2024 04:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722140753; cv=none; b=Ljjt2Sj5n0ymFVS8OYhIUrZ+P8BPfbnHcI6TCJjN1bOrRi4HfFDfqcY2490STv9/e35jmKTEN+N22BRV24vkfcFLN8MXlhJT5gyns7UhWoyv6y+uVZg2+9BBxsdrqVGGBsYIkzS4T5nPoQR8josE6s8ooJoIgqGnC/84oHqT+cY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722140753; c=relaxed/simple;
	bh=AfnhvhNDRbSSE2xiCBsK3S5GPjC5MzhtG/HL/H8Z9co=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pelPhBGmLHABbjC2R8DJWCf/EjYKlElJey8xkx0Y5auGX9Frr/kgGAu44/lyrxH5U7nt4ZfUoouPaW8jIyw8ZV3rcOAwXjagUHA6Rvn9QtPXrtbuo+avrDuN4FMMoHZfX8cZtKGT1vnbaEDqxm44ojgiGRPbsL4rEhZ/sXV0V8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dTn3vlo4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dTn3vlo4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B63BAC116B1;
	Sun, 28 Jul 2024 04:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722140753;
	bh=AfnhvhNDRbSSE2xiCBsK3S5GPjC5MzhtG/HL/H8Z9co=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dTn3vlo4peSb4uYVJ44khE9J6twSfQqfZBESQgsVw3bYgKySNijz8cqulvWZhG2Lv
	 dv6HQMgdxUUHulSYGGkmoFGMWxmmiloG7+hGBJwm4e5b3QpS9Uqkcr1RWHSPVQU0Bg
	 G0ZR5SNnslDOzo/d74jsfFa6comdSvUHkVfjZJNYiSd83rkR913pyH3LHp0U8GzMMs
	 SRnk2Pt9mrKB+VgK5Bsw4H4SA++Z7y4EbwttJEYhYnxVKw0I5WLhA5VDf1AkwJejki
	 R0CBamIZ+6p+vL6VFrprjTxta93dByGZTwQrL5JAZY6Oxr40ckWX6qOOu5RYWzaxTo
	 lnsdjdJ7ZSE/A==
Date: Sun, 28 Jul 2024 12:25:50 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH 2/6] hwmon: (max1619) Reorder include files to alphabetic
 order
Message-ID: <ZqXITnn6aWTNz28o@tzungbi-laptop>
References: <20240727143820.1358225-1-linux@roeck-us.net>
 <20240727143820.1358225-3-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240727143820.1358225-3-linux@roeck-us.net>

On Sat, Jul 27, 2024 at 07:38:16AM -0700, Guenter Roeck wrote:
> Simplify maintenance by reordering include files to alphabetic order.
> 
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>

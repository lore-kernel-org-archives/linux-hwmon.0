Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FDCF1370
	for <linux-hwmon@vger.kernel.org>; Mon, 22 Jul 2024 03:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721619058; cv=none; b=WydVcfjupRSVCzypwFEulPZ06GM3zcO6BgllCyInsFnQ8dl8xSTqmrNat53GpL/tg3TcmmW5KEEDggEdeNWAx/akiK+UHlPfl0vv6PubeqqbcTCykI2pTv6kKP4FURxeCJ+SlHdJfxU0ZJ4m6Lh0GefzjNV9elY9P3bAp0fTRbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721619058; c=relaxed/simple;
	bh=TkKk79gAh40VKSQtRaqWMEP9ncD1yJBiD/saCFDVQH0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l3CAhpLqjw6p6XMf5vyp8T9g3CNAAcCXs1vZ6/F79ylC6jMVP1jruGqAJ4EKdu2E50kbNxz0d1i7QiGJcrF8UaegMIJYZZFCdGfzVpQMcK43XTXq8PV1bri0LMUyyyF9ViurNkUtUURw9gDoAYjYjGlQPhCw480GDlL7lEC/Mn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YDR0PxSO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YDR0PxSO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01970C116B1;
	Mon, 22 Jul 2024 03:30:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721619058;
	bh=TkKk79gAh40VKSQtRaqWMEP9ncD1yJBiD/saCFDVQH0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YDR0PxSOtKzCTmH25/ASiBMSQ57PTd4/ddGFoNHpaimuRmB04v8QmX2+zOC9Mwbph
	 BaRHOj4QuP3sOVevvpjpkcpMVuZMbRA5kUHxYUzgP6NrbYe2DkOLrNfbQqv7RLkZkw
	 fFqmAEmFeCt8hDvRN/4HIyzu+Qk5RSJvvz9Bd76aNj8aWO7Jz/TfgflsOvivTbW+vQ
	 7yXG1lQwjL/ypmpxV8cliekqw+ge6jlsBQgVORJI0gJeXyHAiLmMCoo9Q/TgxanXNH
	 IvxmdL1WMoV++906ZxU/441VUPUnfW3QIqJUYtUufTHykqHgbqCg1dqcUDdGHpIf/p
	 VrLn+ol37N1jg==
Date: Mon, 22 Jul 2024 03:30:56 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH 2/2] hwmon: (max16065) Fix alarm attributes
Message-ID: <Zp3ScBZOJQixuFN9@google.com>
References: <20240721193506.2330006-1-linux@roeck-us.net>
 <20240721193506.2330006-2-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240721193506.2330006-2-linux@roeck-us.net>

On Sun, Jul 21, 2024 at 12:35:06PM -0700, Guenter Roeck wrote:
> Chips reporting overcurrent alarms report it in the second alarm register.

I can't understand the sentence.  Not sure whether it needs to be rephrased or
not.  s/overcurrent/overvoltage/.

> That means the second alarm register has to be read, even if the chip only
> supports 8 or fewer ADC channels.
> 
> MAX16067 and MAX16068 report undervoltage and overvoltage alarms in
> separate registers. Fold register contents together to report both with
> the existing alarm attribute. This requires actually storing the chip type
> in struct max16065_data. Rename the variable 'chip' to match the variable
> name used in the probe function.
> 
> Fixes: f5bae2642e3d ("hwmon: Driver for MAX16065 System Manager and compatibles")
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>

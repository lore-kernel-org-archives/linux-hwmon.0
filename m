Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 262F22581
	for <linux-hwmon@vger.kernel.org>; Mon, 22 Jul 2024 03:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721619049; cv=none; b=hbo1afUQMbVq9pKMVJl+XRaYOwYHIqXMM/xgtzArTcxXGvpX9Efp33ESfoYR6hpYowxvqVBL6WqawS30eNomPBvZd218m6VqDw+S5s23t6dG0Q4votB0WL/tHrr+NEPzEMzXa9wTKqoXfOKHM3hUkms6AX8dq4WmfFoXBQOfwys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721619049; c=relaxed/simple;
	bh=veaBhajOjRi4GUb5iwT3fX2sSnrbbA0a+fg3UwUYSHI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LlRvdaQI75lEecYCgguE2xEmFxR7UiOJ5xqWATSaS+Zw+cw7toFxNzwLu4V6JwDjO2zxLuKuMnf2jfLqp0DwtKPbK1rmSYN5qaiTGJTkMUx1lgcALmkcp7js37owB7+bH/KLvUmYMJa6dwnKQmCB4x/jG+8PpJ7REpElBL9wux0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nlBsBoOP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nlBsBoOP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30F55C116B1;
	Mon, 22 Jul 2024 03:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721619048;
	bh=veaBhajOjRi4GUb5iwT3fX2sSnrbbA0a+fg3UwUYSHI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nlBsBoOPUh4ZrfZMBvA6CvX/5Vq9DsNRnupg5trhBO35fmzQLuRz6A1txtAQwk05+
	 JC1pEBQt3tBYVAp9BTqH6NkSjWka2YWSkk4YPqlWEpMZ8fj61d4g1Y6CP+o8Alw1dh
	 n+LDYf1L0tDAXOc7MqtuQgGOOJ2RfxGlcWijmzof+6q2hKdSjhCXlthPRaXv9UEXIL
	 BzKuBF7QSz6Zq5R+oez61ziTZZP6CA/gZMYKVwsaOHcSKZSbo/iwN1cRNupPxcpJyu
	 K2t+cVBT+T80UCWULhJSZ5BT1o6c/NnT+YJPsEwpRAoY7Jy8TcyovMxnNAhUhMQOhj
	 rBuO1fqz/xing==
Date: Mon, 22 Jul 2024 03:30:46 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH 1/2] hwmon: (max16065) Fix overflows seen when writing
 limits
Message-ID: <Zp3SZsfEM52iTajB@google.com>
References: <20240721193506.2330006-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240721193506.2330006-1-linux@roeck-us.net>

On Sun, Jul 21, 2024 at 12:35:05PM -0700, Guenter Roeck wrote:
> Writing large limits resulted in overflows as reported by module tests.
> 
> in0_lcrit: Suspected overflow: [max=5538, read 0, written 2147483647]
> in0_crit: Suspected overflow: [max=5538, read 0, written 2147483647]
> in0_min: Suspected overflow: [max=5538, read 0, written 2147483647]
> 
> Fix the problem by clamping prior to multiplications and the use of
> DIV_ROUND_CLOSEST, and by using consistent variable types.
> 
> Fixes: f5bae2642e3d ("hwmon: Driver for MAX16065 System Manager and compatibles")
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>

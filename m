Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91BD71B86D6
	for <linux-hwmon@vger.kernel.org>; Mon, 29 Jul 2024 02:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722219507; cv=none; b=lxIH31z3DY2tlOsLyNWRgTcg0ikQXwLBMcA53fhLy+Kk9Q+LA8e2LkzlnPTrZ4bG+T9QQ6rspNZkVXKV1Pqbu6Cgz7so+pPnagsqbQIOOxVuN0G3Igx2P50QVOmIBJyH1GUcp69rUQ/1q5DcKTi65KGHRtGsCXWV11PY5JEVGYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722219507; c=relaxed/simple;
	bh=PlzXhkWBD6BBEu3ESg68RL5Zv+hcaKjzbR1tW9BK3pk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eD491A+l60gAem0laHT/XPkHiy/rrp8xIRqqT9HJ5XyE6+3tmE//qpZ+bLK4/aeUgQf3Dz5auWDM3M6+xJ61KdETuK7I6UYIZVn0vvvzGQytKmhFEYKvex1jZn9Y+po7FbSeczWJd9q/xCzAVj3ZL+oClSHDwQcfnI/8Gy/Xosg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M/A8ZnUs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M/A8ZnUs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90804C116B1;
	Mon, 29 Jul 2024 02:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722219507;
	bh=PlzXhkWBD6BBEu3ESg68RL5Zv+hcaKjzbR1tW9BK3pk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M/A8ZnUsTR3cA+sfy541tvL6jnpGn8xDQ4jL8FaRgaojZmebVdgPNYiSJf20gvCJE
	 8SwPbv54hcHxRiYrwYR00DvhE0levBSQyUEtIPA/lCuJOPnQKDiUe9AvJCRXmP9j6V
	 icgnGs27p/Usoto9huD6RO8LFemLFsZtP/306Fq4y3lAW9lPeyfbncoq2wdYi7L8aO
	 55TAlVkkqxZTU8Clnlehuxg1h+mdWTTgeJMoc6JCbBfrVHk7BL5pdHu4172TEmkMG/
	 qmaapwooljeYatKW7r0BumM+eS2kLCEGwmZNZAIWFVLdsQhV5LZXSNNXxtAedOe8fP
	 YTwp5eFGpx9Hg==
Date: Mon, 29 Jul 2024 02:18:24 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH v2 3/7] hwmon: (max1619) Mask valid alarm bits
Message-ID: <Zqb78N7V8bZIcyiF@google.com>
References: <20240728143715.1585816-1-linux@roeck-us.net>
 <20240728143715.1585816-4-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240728143715.1585816-4-linux@roeck-us.net>

On Sun, Jul 28, 2024 at 07:37:11AM -0700, Guenter Roeck wrote:
> Bit 0, 5, and 6 in the status register are reserved and, if set, do not
> indicate an alarm. Bit 7 is the 'busy' bit and also does not indicate
> an alarm. Mask the non-alarm bits to avoid reporting them to userspace.
> 
> Cc: Tzung-Bi Shih <tzungbi@kernel.org>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>

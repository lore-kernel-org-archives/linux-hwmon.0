Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 949271CEADB;
	Tue, 10 Feb 2026 00:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770681621; cv=none; b=AHcrGANydhgq6923ETBbgM6f6II3qro866J4kSdgKKdMbqR1n9KpKJgbnnEytiw9kSQa4DzEQqJhiw2ah4wwWNnCfqHlsN9ze863V6+V1DaRdD6eO52S8EuwA3frAom1qYYNXJClMPGTLJmAx+SWI8LkD4N85+KvSCJIm09iR98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770681621; c=relaxed/simple;
	bh=uMgpi+a8Ehx2IQNF4rOY7mPLVQjEiDq/6CJvkzuLMhE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pWxpJIX30qg9x5hUKK8bcNy5cP7gVZpvb1Zp28sEE6yzQMRfx3wyse731ezlVPg6ZRFy0M82SQaAxFb9GN9yvmEuqDIwtAN9J/IgIPEN2ED8xLWU0Y8prlF7+JBJ6CCGtl/Cf7hG5q3vXn3glT64x1zK+DS5OEqHwdEnJinnBVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hH0JF4jU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hH0JF4jU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2107C116C6;
	Tue, 10 Feb 2026 00:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770681621;
	bh=uMgpi+a8Ehx2IQNF4rOY7mPLVQjEiDq/6CJvkzuLMhE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hH0JF4jUTLWIcSHwtceFVr9ogwlQk+9wHdTHyocO2W4y6J4SPtt4c6Lg1uQdiE/hs
	 bHltNiRoWkYUlgyGQRAffaKjcwXFEvgv5JCPaesWm/Oe4x5zXgGoQo5BnZZNbvkBxT
	 IgiQu0hgP6LHgoangHZxKQoiTI/WE+FLErZ1ur1muXb1WYenv9aiD3UWTI6S7tYDqq
	 uUdyFWgpDKy+WDPKxfiplNQztAjXwlFQmMPxHiWwdbAMZ2shvSqg/KHRxBZOGN8P2A
	 JvEwr/7WrUtnMcyxLZ+kmmx8vnseLZY/jgBc+JBu6ENradUgBoaDMstbW9BJKHo/W7
	 xzKCIFEOZAjig==
Date: Mon, 9 Feb 2026 18:00:20 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: ASHISH YADAV <ashishyadav78@gmail.com>
Cc: Ashish Yadav <ashish.yadav@infineon.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: trivial-devices: Add support for
 XDPE1A2G5B/7B
Message-ID: <177068161948.2149314.17475588662985513176.robh@kernel.org>
References: <20260202080355.53061-1-Ashish.Yadav@infineon.com>
 <20260202080355.53061-2-Ashish.Yadav@infineon.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260202080355.53061-2-Ashish.Yadav@infineon.com>


On Mon, 02 Feb 2026 13:33:54 +0530, ASHISH YADAV wrote:
> From: Ashish Yadav <ashish.yadav@infineon.com>
> 
> Add Infineon Digital Multi-phase XDPE1A2G5B and XDPE1A2G7B
> Controllers to trivial devices.
> 
> Signed-off-by: Ashish Yadav <ashish.yadav@infineon.com>
> ---
>  Documentation/devicetree/bindings/trivial-devices.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


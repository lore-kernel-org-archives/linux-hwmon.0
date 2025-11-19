Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1C532D4811;
	Wed, 19 Nov 2025 07:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763536961; cv=none; b=TVYHqZPkvNYsgIjs79lJ2uaNDGCJA+ErMSKvu1v4YYHB/8+KXa/xFrEDpOvINwff+GvJjGHRP7fg2XquTEiZ+/WIbMU1l5YdcAT8Rpr46nKN1zYl0hJMOG/IgasuyMKrIKhHDIzmOaKyTUXPuRukE9riPOtbHj32p/lkkrjd8PU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763536961; c=relaxed/simple;
	bh=qBozNRd3ovk5rM83ifkWIqdEq0X2Y89EOk99LYOeLA4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c0/iQxgtXimbOp5Lags1WbjiDgkt5hzCzJzfggN7JVmfjtgcjZknKbfe5cu2M9BIjcSjxgFFvmJ1DTRt6U5tFkDZf9YuMESOMvLoDlFisH4Q4VdrgzVCIBupxvzR7d07g8En99PLNoPkOiyje8M5tTt4ZycVW5VfJlFI30rf+0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jduJh66k; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jduJh66k"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B748C4CEF5;
	Wed, 19 Nov 2025 07:22:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763536961;
	bh=qBozNRd3ovk5rM83ifkWIqdEq0X2Y89EOk99LYOeLA4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jduJh66kIDKo/8yv4xe5iTVIQDCYQKTg3+kw9R23EG88h960dLmm3FzAhozP9oSxE
	 ohpyRXgQuz4OlkmCa4qzwCWo3xvlXgSwLGSTCHLmcBCjBNp+l81bwJPpbc6xlOX+4e
	 4FQ7Da9NxciTHhfty2C7217J4N8yF4yj3Pjv0uZKLiRrHbtaVKoNwypWEduqE+HdcK
	 L744078ff28jDESPfZ9phoRV1/sIWgZ/UlAYul+05s3v1ccxWeLl4QOR54retokBve
	 czMSCj1JEOJqGpBfOjQp6q9g4yHzlbQGkLsYDdzqWfWkmO/WNTU1LZc1a0suDrhR7+
	 4IqJwnd3FSaQA==
Date: Wed, 19 Nov 2025 08:22:38 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Wenliang Yan <wenliang202407@163.com>
Cc: linux@roeck-us.net, Jean Delvare <jdelvare@suse.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/8] dt-bindings: hwmon: ti,ina3221: Add SQ52210
Message-ID: <20251119-tremendous-skunk-of-science-aab7fb@kuoka>
References: <20251118125148.95603-1-wenliang202407@163.com>
 <20251118125148.95603-2-wenliang202407@163.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251118125148.95603-2-wenliang202407@163.com>

On Tue, Nov 18, 2025 at 07:51:41AM -0500, Wenliang Yan wrote:
> Add a compatible string for sq52210. The sq52210 is forward compatible

forward?

> with INA3221 and incorporates alert registers to implement four

But this suggests opposite.

Your driver changes confirm that even more - it is not forward
compatible. And in other way why wouldn't compatibility be expressed in
the bindings?

Best regards,
Krzysztof


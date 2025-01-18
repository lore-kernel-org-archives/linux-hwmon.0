Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA3B4184;
	Sat, 18 Jan 2025 14:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737211024; cv=none; b=R/ocnjbHyWXRIIj6fQTcs5wGT7q4GcAQ7vlDubqmPqhJ/jqKTlGBySSsZ2k7w21P5yogFkTAZk14gBLMaFIqLWaNfpagk9zD+oGo5D5IBkvqnybWVRO79mPnWiv4y8tJDvTU//LQ3VMIFf/PgGbggi5Dl+lhHqDiy/rv1mbm8oA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737211024; c=relaxed/simple;
	bh=GBc2u0YKf1JZiBfg6Qhrs216BcHR0037QaX16eH5yrA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bwO+t1beYwrwNeovUvh0UMhW8EASk9J3OFIwsctcLiK023yEYpstj5qWeOa6kaVCxLLkWR3nLH5A3l/OE1QmBLZ+9IGY9rNuOniCIq0g1iyMe4bZTzKul3eU0mt6xfeg6IasrYOSVseeGgIt+TnTxzZ7R9/Wum1eND+Fx+Fg/wQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r10ZU+wt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r10ZU+wt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B4D5C4CED1;
	Sat, 18 Jan 2025 14:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737211024;
	bh=GBc2u0YKf1JZiBfg6Qhrs216BcHR0037QaX16eH5yrA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r10ZU+wtBXUjXeKdN4hOERu7siMqAM6lVwEElpFG328GF+YvYt7/nb8pjOEx3vaU+
	 S7Q3DaKAvVdy0Dvnbz3fN6JHvvzQkhCpHazoIo9TaKEsXBYlgc0qz4bxg9XYklw6ZH
	 8jGjd5AIdyjsn9Pjqkn77CLl/rpeTnwt+X2M2IPQOMeP11X8+lm1yFZzdM1O6E4OEa
	 BzaxYkfb1e8TxxAWTfakdGcvI05tTo97qGYJdH6nB5nUOKIKdcO1urv8J6rXNAMQHp
	 89nJnaVpXuD6A3sbJOXVPFHzEo/FpDKf4b8Hg2b93KOhZMwyb4gbc4GN31d/Tr39O4
	 kQ5ZtiySe98fg==
Date: Sat, 18 Jan 2025 15:37:00 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Wenliang Yan <wenliang202407@163.com>
Cc: linux@roeck-us.net, Jean Delvare <jdelvare@suse.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings:Add SQ52206 to ina2xx devicetree
 bindings
Message-ID: <20250118-sparkling-spectral-mosquito-a5bc01@krzk-bin>
References: <20250117082017.688212-1-wenliang202407@163.com>
 <20250117082017.688212-2-wenliang202407@163.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250117082017.688212-2-wenliang202407@163.com>

On Fri, Jan 17, 2025 at 04:20:16PM +0800, Wenliang Yan wrote:
> Add the sq52206 compatible to the ina2xx.yaml
> 
> Signed-off-by: Wenliang Yan <wenliang202407@163.com>
> ---
> 
> Add the meaning of 'shunt-gain' in SQ52206.
> 

Didn't you got an Ack from Conor already?

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


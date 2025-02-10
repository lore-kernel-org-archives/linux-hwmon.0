Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 359C21CA84
	for <linux-hwmon@vger.kernel.org>; Mon, 10 Feb 2025 02:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739154094; cv=none; b=cLlmD528+8sB6+3UjVIM8I5/ZfFFaO7BSRyo+b3En7MdDuQwSpGw9HAOKgMSGb4AzaDA9maJXngltEqKlozwx7lqC+/HIC6lOumWD/DkE34v8qiXp7k0Q1ZTVNVNW3Tl7u4L2e8QOa4mgD9kuIJ48RoW+YLDKPpJlsweZIGf1PA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739154094; c=relaxed/simple;
	bh=M2go495jDJYmtzWqBzFqzyf+85rLp2GObszJQPHj8bg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bXx/cciDDdpxXO9riTopXVEOk8YJLJLT8+Rx8sKUkjzFD+JYla6OCg2k3I4LfGojDP35TG3kF+aLWxz0vel6WcFvl/Gq7r1Ll722kHxC2EU9tGvorPhWXRTNn+mBiJfllNwskSpDbHlFa0/joteSsq4f2GWjXzs486p9GCPElTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mhfvpz4F; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mhfvpz4F"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4920EC4CEDD;
	Mon, 10 Feb 2025 02:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739154094;
	bh=M2go495jDJYmtzWqBzFqzyf+85rLp2GObszJQPHj8bg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Mhfvpz4FHSNxBzzLbkaVpl6+7Idx3FlfcMIJFtd4RdFv0MbOQn9wlnjCnEAA9mqRw
	 xKr1tmRgUCVVBapOjSM2gFQ2OlyvB0oVJsUGl1HKissqQQiEty79emgNrWQ538XTXr
	 j+kwSRP0RNv9JrEVmpODVUfpLbm6q3t2Je4WWmhvZ3q1lmziXPUGxQwcv9p9Dj9NCx
	 RACmSfBlQPOuuaPqzTW6v8VwZFXI6HoxHECNjLw6AMj8Ra5QhxBziWFFS1XmFixTaA
	 bzsxy94y7XVYnQgogiLOaag6FY/dg2celiU/exp5HvI6AtTEe4g8WNTLrl1IO6n37N
	 Yy03ErqOF+Mzw==
Date: Mon, 10 Feb 2025 02:21:31 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH 1/8] hwmon: (pmbus/core) Fix various coding style issues
Message-ID: <Z6liqwDHD2MnV7Y8@google.com>
References: <20250209012617.944499-1-linux@roeck-us.net>
 <20250209012617.944499-2-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250209012617.944499-2-linux@roeck-us.net>

On Sat, Feb 08, 2025 at 05:26:10PM -0800, Guenter Roeck wrote:
> Checkpatch reports bad multi-line comments, bad multi-line alignments,
> missing blank lines after variable declarations, unnecessary empty lines,
> unnecessary spaces, and unnecessary braces. Fix most of the reported
> problems except for some multi-line alignment problems.
> 
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>

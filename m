Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97E611D6DDC
	for <linux-hwmon@vger.kernel.org>; Wed, 12 Feb 2025 03:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739332429; cv=none; b=EnAskaz0OjLUez2ThdEjS0J8d6nKMNyNKA2EPo7Djuk+Bt7QFCUimNc2tqulEFiIjQL2cWhHuH6+j4cNrzNzjs3gWp/bbs07mzGzllNoywmetN3O0C3qNc189RqqhDzlhTUOBqAZ8NCOCzmMQZ9Iqv9grC5ge8A5Muqnk55/PCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739332429; c=relaxed/simple;
	bh=ZrzcZ4JduAo9VXgj4f0xV8Lb8OWJfRunT+VMaEcz3as=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZuSB+Vrvi5jx/SF65nboMPeZRxhLVcsUE31Q85bFXSFNI6H0cz+oUCJVCYzkBIc3MVU7Ou87hwaeRQ00d1xkI7PVSM9auvdnbmNIzUTszkLj6+ikqOKLH3oqyXaqSfBA/VowIGAe4in7ZtT+YNiK3dy+qyQOtoMiPZgfWGUp9W0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MAfrjMJJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MAfrjMJJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 530A3C4CEDF;
	Wed, 12 Feb 2025 03:53:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739332429;
	bh=ZrzcZ4JduAo9VXgj4f0xV8Lb8OWJfRunT+VMaEcz3as=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MAfrjMJJ2/hftXZ5io15+vgAIvSd5EIanFhumWZKExjtS1NV0ghQJb8mTQ3tdrfb+
	 7bQ8zJlSudkYDV11TOTL2zGSrRgjppYbbwl+7OlO0tdS2ILo8KyXLUT85uYAAwldqF
	 TEhv4pU+TMZq/IEDkeSRaoQF7zd+ygKC6SDwvxWlyZ6aycB62FrtcwEfaX1CD0+zFu
	 bZCZe84CY3F7UebC493tzcs+VhVfKWzGqoyGUrbVhEMuAbU+1irU0094bDJImtcF+V
	 nwIoYxQWeVAb7EHz0ZRhG7QOCDwvk3ePbcHa9k4BcgumV9JxWWGh9lny6MzhEZyFMk
	 CaV2myp4lw+ug==
Date: Wed, 12 Feb 2025 03:53:46 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH v2 6/8] hwmon: (pmbus/core) Optimize debugfs block data
 attribute initialization
Message-ID: <Z6wbSon4kP68tJ6r@google.com>
References: <20250211155240.2077464-1-linux@roeck-us.net>
 <20250211155240.2077464-7-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250211155240.2077464-7-linux@roeck-us.net>

On Tue, Feb 11, 2025 at 07:52:38AM -0800, Guenter Roeck wrote:
> Define debugfs attributes which need block data access in a data
> structure and loop through it instead of creating debugfs files
> one by one. This reduces code size and simplifies adding additional
> attributes if needed.
> 
> While this is currently only used for manufacturer specific attributes,
> the access code is generic and also works for other block attributes,
> so rename operation functions from _mfg to _block.
> 
> While at it, rename the "revison" file to "pmbus_revision" to make its
> meaning more obvious and to create a clear distinction against the
> "mfg_revision" file.
> 
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>

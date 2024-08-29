Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7114C1B1411
	for <linux-hwmon@vger.kernel.org>; Thu, 29 Aug 2024 14:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724943272; cv=none; b=POKQqKh8zRurZgItsilfz5dtfK9T/tKQyxTPaBSRnEGnAfhB/PyUn+XE6sIB2ef0dPbvdKYady6Nt785mUnneig04AeK2ECXM4s7/OmIx26xIHYm2N2vy8fZm7yg8UT0kZ7NrtaP0IsDsmai+ovSxaknLRIx6Gp6RZifWi2npxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724943272; c=relaxed/simple;
	bh=WbDeAgfnbSmOl/WA4OeiMHlrxSNtcqNhvhfTyZHImX8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YVqZOZ106La+eFf9gxZOn1mzz+jpCK1iyhs8DtIR/pCsgyci+JYZY2I0rCqSmCmKUpbqvsWavdxZT8OG+jqHrzI7EHm2LZvSbcRTPI2TO2BJlZhaL3A1+DJDg23uj+iWwxxjDSBjZEU5oyzTSY2MAhzTRoLR9f4JThziclAgk58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aqJyTUyh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aqJyTUyh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50F17C4CEC5;
	Thu, 29 Aug 2024 14:54:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724943272;
	bh=WbDeAgfnbSmOl/WA4OeiMHlrxSNtcqNhvhfTyZHImX8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aqJyTUyhSY7odM6CXDN3SOFH5kAm64xz4f8LsKRr5crnYCaiOH9vcsW30fQNyjyU2
	 oGBTBr8JVpT9jVHvDThfHsQe9D0QnoVG+x2sZB4ta50eEVVjkwrViz5MO4KtBLGFI+
	 bDDx3HOfACi9YX8Lc4slJgWQLVUSIhfoeUdDnnGLDCSodZ0VjQ8sQ5NBPCC/it1zJv
	 4nylYmJUun1UdJ6xy6RHGC9b2vUcmTGqncK03C7QRY4W6i04jItQh8zMm+AsXbXXnG
	 8C+YuF9I3TWhxbalphwYpo6D1VehCmgtQlMLm/va5JgKXQUfrY5opRTfR7e0BYsfXg
	 xntMuTZGwkPYQ==
Date: Thu, 29 Aug 2024 22:54:29 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH 06/11] hwmon: (ina2xx) Re-initialize chip using regmap
 functions
Message-ID: <ZtCLpWh-o_n82dpq@tzungbi-laptop>
References: <20240827153455.1344529-1-linux@roeck-us.net>
 <20240827153455.1344529-7-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240827153455.1344529-7-linux@roeck-us.net>

On Tue, Aug 27, 2024 at 08:34:50AM -0700, Guenter Roeck wrote:
> [...]
> except for bit 4 which reports if an alert has ben observed.
                                                  ^
With fixing the typo,
Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>

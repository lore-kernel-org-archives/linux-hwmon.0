Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 241487407A
	for <linux-hwmon@vger.kernel.org>; Thu, 18 Jul 2024 16:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721320766; cv=none; b=unRtPbfyuZ7ZgcIT+/IazV0oBk4LntsWXvIvvjQ/5Zcwt7gv3n5pHQ9aoiJnHDLXyd1NFpEjVCm6Wspz3Fo6DrOJ8CL/ykrqok4jL32nAmk8iPMUMOAGsVclp3wZDFN7usmdnDYg7jqtnubBEmyPFuzlTBLYO9w7vwEAEOvHVas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721320766; c=relaxed/simple;
	bh=dgoDdkU9QqmFQQGcq+JKn45VWSHUD30rvZkSQe1nowM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V7HD7dYtAHWIBl4F1RV+8GVvgisf3JY8fYxPUX4wwNPVjm918eXxFiBdUE5SIy5FwsMCOLjru9juEfQqYJn8UoNyEuVyVwHejJveeyt90oddQDtrROEWATlt+0ksq9mysR28oU8UAoqgKtg9+HSu+zSLn2vOi1OlMOO/BrcBofQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LO8oz/aP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LO8oz/aP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC240C116B1;
	Thu, 18 Jul 2024 16:39:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721320765;
	bh=dgoDdkU9QqmFQQGcq+JKn45VWSHUD30rvZkSQe1nowM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LO8oz/aPYA+54eBfytJw10hPWbglOteJ0h1uUt7XH314xBMlJMUJfrk1T2Q/0CHt9
	 +iO9sWanhzTXUfPiViAvElBnJQzzr2dW2CMpWul8YXjW3mQMzRWW0ED//U5kgzC1yI
	 VAvDxQCGBKnF4oqAxicE3ispbjDWv752ndLCXm7OdJYvs+6fA1PaXnjsIlYk2rVOBm
	 OJzBLaPOrYU4ABPe1UMySPTFNxsLGgRuHUUkLV4ZlziTZnTdN28Auut8TXEKxZNZkv
	 Ck9Twy7kQdl9VRAQ4FkFYYxUGNH00Wb3qaemNkP5XrYdODsPb4GubXe891XlouRS3k
	 TfRtil7n5ZjRQ==
Date: Fri, 19 Jul 2024 00:39:21 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH 1/6] hwmon: (lm95234) Reorder include files to be in
 alphabetic order
Message-ID: <ZplFOU3kFsmTis9W@tzungbi-laptop>
References: <20240718033935.205185-1-linux@roeck-us.net>
 <20240718033935.205185-2-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240718033935.205185-2-linux@roeck-us.net>

On Wed, Jul 17, 2024 at 08:39:30PM -0700, Guenter Roeck wrote:
> Alphabetic include file order simplifies maintenance and makes it easier
> to add or remove files.
> 
> No functional change.
> 
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>

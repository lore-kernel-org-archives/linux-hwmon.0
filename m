Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 541B92D73AE;
	Fri, 27 Mar 2026 07:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774596354; cv=none; b=jdJX1U+NsiZ8ylwG997TauReXfZQpcADf3mPoY5mtcCQr1i0GWn68JTLXJ0MNFhFU777ocQoebSh7EGUCVVT+jZwar8udgJ/oKcJgrsCBQsl+jO5DgJUJV3EHjdSyXUXK+rzfgILvMbIiCQWvNohhedfNxgqMkgbO2aFcA/Y+3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774596354; c=relaxed/simple;
	bh=kIljHwCO0D6OabejnM34Cc6IM1ZWc7qp0yrXe2+x4L4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aX+qToOqQ9k/9VmMFqtgiXGyeCsZ2IZRiDjSpnM5hMzyC8iWPtP6LtnY2f78kqVxuf5WOMEtIqjUhQAOrQaUgv8q6hbOr5a0Xh7IyjG/RM+YGRAtc+uwUDcELAa8/OWY7NCRs7dwUYmXu4mnlEcwR0sDFP8FkzScFGJv2NtIGow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=yv/QnOj3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="yv/QnOj3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49DDBC19423;
	Fri, 27 Mar 2026 07:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1774596353;
	bh=kIljHwCO0D6OabejnM34Cc6IM1ZWc7qp0yrXe2+x4L4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=yv/QnOj3LJRln+4mf9S0tkLeVvyJp4lgOWOWPMOzsoPKXKoj3eIQ9K/47ZL+e5mcP
	 YjxWKHrgsOQaE5sY+HWKvW63wJyepjBdYZIZg2aBAi8THMYgnuUiz7fJ+S1rwSAdFu
	 sPV66C867NdlPVicOGyl34XfNuhjQ0GGl+eYH5EY=
Date: Fri, 27 Mar 2026 08:25:29 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Akshay Gupta <Akshay.Gupta@amd.com>
Cc: linux-kernel@vger.kernel.org, corbet@lwn.net, skhan@linuxfoundation.org,
	linux@roeck-us.net, arnd@arndb.de, Prathima.Lk@amd.com,
	naveenkrishna.chatradhi@amd.com, Anand.Umarji@amd.com,
	linux-doc@vger.kernel.org, linux-hwmon@vger.kernel.org,
	kunyi@google.com
Subject: Re: [PATCH v1 6/6] docs: misc: amd-sbi: Document SBTSI userspace
 interface
Message-ID: <2026032753-contently-overfeed-5872@gregkh>
References: <20260323110811.2898997-1-Akshay.Gupta@amd.com>
 <20260323110811.2898997-7-Akshay.Gupta@amd.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260323110811.2898997-7-Akshay.Gupta@amd.com>

On Mon, Mar 23, 2026 at 04:38:11PM +0530, Akshay Gupta wrote:
> From: Prathima <Prathima.Lk@amd.com>
> 
> - Document AMD sideband IOCTL description defined
>   for SBTSI and its usage.
>   User space C-APIs are made available by esmi_oob_library [1],
>   which is provided by the E-SMS project [2].
> 
>   Link: https://github.com/amd/esmi_oob_library [1]
>   Link: https://www.amd.com/en/developer/e-sms.html [2]

Ok, nevermind, here's the documentation :)

But it's very tiny, it's not saying what the api actually is.

thanks,

greg k-h

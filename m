Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BECB884D29
	for <linux-hwmon@vger.kernel.org>; Sun, 13 Oct 2024 15:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728832773; cv=none; b=OWIuB5RjI5xFKiqZkNOEKO7vXCH9wIt/lYJFV/SKnbInePHs5s4Z0GoXWDbR3btmqD3qO/VOXywG+ge2qx+KGwTUuBMiafx+zCw5noziHBkyJRVFZjdJWP0rMZGpEPcCBhNUbwjxJGJmZ1iiW8xH6hhLuSqQyy1l/2q+R3V9oww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728832773; c=relaxed/simple;
	bh=m4dR0CdeERty6XwDjFr3sJ1qBzO1y6SJETeHXNAm4b4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FqiFQLsL1Yy1E4JQLPZYwOehyoSpMMaBPGx7hNv0JoVhal8K6DV34RTkMOgLYKXExOkt6HpR1kDbneEgmefh0JgXXtRxNmEI5DhX7SU21Wgbph00NZo++Dq3BvNj0JBzUL4phWe/v1KHPP7Ld5WmJfjO89DrPtPuhBVEZ00xqtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=sN0UhwT1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="sN0UhwT1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E30CDC4CEC5;
	Sun, 13 Oct 2024 15:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1728832773;
	bh=m4dR0CdeERty6XwDjFr3sJ1qBzO1y6SJETeHXNAm4b4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sN0UhwT15tzMpdAF0Y6D+IxYnQR4ijHK5iso9y9h+EX/UNrnRImCTjaYjoAW4lf3r
	 e7pPbLaynREfUoYcx7tglYIGIklEXytqf1qNCv+MNpRhf807joZ6F5XpN6VbUHURYn
	 LIm5PjjBvb7lisxIet90neMeILtUbvBdDGk+E7d8=
Date: Sun, 13 Oct 2024 17:19:29 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Akshay Gupta <akshay.gupta@amd.com>
Cc: linux-hwmon@vger.kernel.org, inux-kernel@vger.kernel.org,
	linux@roeck-us.net, arnd@arndb.de, naveenkrishna.chatradhi@amd.com
Subject: Re: [PATCH v4 5/9] misc: amd-sbi: Add support for mailbox error codes
Message-ID: <2024101351-hash-deflate-b339@gregkh>
References: <20240912070810.1644621-1-akshay.gupta@amd.com>
 <20240912070810.1644621-6-akshay.gupta@amd.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240912070810.1644621-6-akshay.gupta@amd.com>

On Thu, Sep 12, 2024 at 07:08:06AM +0000, Akshay Gupta wrote:
> --- a/include/uapi/misc/amd-apml.h
> +++ b/include/uapi/misc/amd-apml.h
> @@ -38,6 +38,10 @@ struct apml_message {
>  		__u32 mb_in[2];
>  		__u8 reg_in[8];
>  	} data_in;
> +	/*
> +	 * Error code is returned in case of soft mailbox
> +	 */
> +	__u32 fw_ret_code;
>  } __attribute__((packed));

You can not just randomly change the size of a user/kernel structure
like this, what just broke because of this?

confused,

greg k-h

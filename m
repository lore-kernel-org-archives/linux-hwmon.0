Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2BD91DFFC
	for <linux-hwmon@vger.kernel.org>; Sun, 13 Oct 2024 15:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728832729; cv=none; b=E2p7m9Oy7RgAp4WtNPrHiu1LYrvRwS6zERnm/Xys4sz5nXIVwlTlkSPpe35RljHomhgX/SxBCQyhSkMxgBlgbEqG6VZI0RQsH3P8vtP3qvRymxquhOkPEig5cAqK2vzf59SlqHCcyNpTt9jDx95tOtgmywu4oID9RCGclq9+y3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728832729; c=relaxed/simple;
	bh=9esitoE6aksSYXxf+dSkWKitgJzJWwN+gJNRWiY460A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VJjvQaldz8VVkoXRsAV5nyT/PdFyWV1iLo4eFM23eWuavfW+x96HkjLiah+7ENTwH4uEq7fn6VZd+ESyt/rABlYTVIEbEVGk7SHHtzgaP46bny5q0dWGpPeSShoutqb6I+ogbr37RE2GCyULg3hnPwYfsB2JZCAamikO3hVyFfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=W/6OnmD4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="W/6OnmD4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D814EC4CEC5;
	Sun, 13 Oct 2024 15:18:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1728832729;
	bh=9esitoE6aksSYXxf+dSkWKitgJzJWwN+gJNRWiY460A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W/6OnmD42ACErx6PA8lrfaQWy9ShRCf7TTHfKP3M4MFhmf6g+/k7k4avxbCox+e4r
	 JqtudTJQShOL7zZdDikdqCPH0Xvlz1QshAowbdNpkUmC4hjj/IFZjOOL7iRFFUobG3
	 LtNqHw7zW9EtHFSW9aaSXAiX3J6CZfoBdPhDGadk=
Date: Sun, 13 Oct 2024 17:18:45 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Akshay Gupta <akshay.gupta@amd.com>
Cc: linux-hwmon@vger.kernel.org, inux-kernel@vger.kernel.org,
	linux@roeck-us.net, arnd@arndb.de, naveenkrishna.chatradhi@amd.com
Subject: Re: [PATCH v4 4/9] misc: amd-sbi: Add support for AMD_SBI IOCTL
Message-ID: <2024101327-dropper-ethanol-6d1b@gregkh>
References: <20240912070810.1644621-1-akshay.gupta@amd.com>
 <20240912070810.1644621-5-akshay.gupta@amd.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240912070810.1644621-5-akshay.gupta@amd.com>

On Thu, Sep 12, 2024 at 07:08:05AM +0000, Akshay Gupta wrote:
> +	dev_info(dev, "register %s device\n", data->sbrmi_misc_dev.name);

When drivers work properly, they are quiet.  Please remove this line.
